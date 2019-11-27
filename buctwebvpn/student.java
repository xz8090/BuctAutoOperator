package buctwebvpn;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Rectangle;
import org.openqa.selenium.WebElement;

import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSONObject;
import com.justep.baas.action.ActionContext;
import com.machinepublishers.jbrowserdriver.JBrowserDriver;
import com.machinepublishers.jbrowserdriver.Settings;
import com.machinepublishers.jbrowserdriver.Timezone;

public class student {
	public static int index=0;
	public static student[] stuList=new student[10];
	public String user_login="";
	public String status="";
	public JBrowserDriver driver = null;
	public boolean schoolOut=true;//校外通道是否开启
	
	//用户当前用户索引
	public static int getStuIndex(String user_login){
		for(int i=0;i<stuList.length;i++){
			if(stuList[i]==null) return index;
			else{
				if(stuList[i].user_login.equals(user_login)) return i;
				
			}
		}
		return -1;//在线用户已满
	}
	//初始化并登录webvpn
	public static JSONObject loginWebVpn(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj = new JSONObject();
		try{
			String user_login = params.getString("user_login");
			String user_password = params.getString("user_password");
			index=getStuIndex(user_login);
			stuList[index]=new student();
			stuList[index].user_login=user_login;
			stuList[index].driver = new JBrowserDriver(Settings.builder().javascript(true).screen(new Dimension(1000, 2000)).//screen(new Dimension(1000, 800)).
		            timezone(Timezone.AMERICA_NEWYORK).ajaxWait(200).quickRender(false).headless(true).ignoreDialogs(false).build());
			
			System.out.println(user_login+","+user_password);
			//登录webvpn
			stuList[index].driver.get("https://w.buct.edu.cn/users/sign_in");
			stuList[index].driver.findElementByXPath("//*[@id=\"user_login\"]").sendKeys(user_login);
			stuList[index].driver.findElementByXPath("//*[@id=\"user_password\"]").sendKeys(user_password);
			stuList[index].driver.findElementByXPath("//*[@id=\"login-form\"]/div[4]/input").click();
			boolean flag=stuList[index].driver.findElementsByXPath("/html/body/nav/div/ul/li/a").size()>0;
			if(flag) {
				obj.put("status", 1);
				obj.put("msg", "登录成功！");
			}else{
				obj.put("status", 0);
				obj.put("msg", "登录失败！");
			}
		} catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "登录异常！");
		}
		return obj;
		
	}
	//获得研究生后台登录页面的验证码
	public static JSONObject getyzm(JSONObject params, ActionContext context) throws Exception{
        JSONObject obj = new JSONObject();
		boolean flag=true;
		try {
			stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/login.aspx");//校外通道
			stuList[index].driver.findElementByXPath("//*[@id=\"aspnetForm\"]/table/tbody/tr[3]/td[2]/img");
			
		} catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "校外通道异常！");
			stuList[index].schoolOut=false;
			try {
				stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/login.aspx");//校内通道
				stuList[index].driver.findElementByXPath("//*[@id=\"aspnetForm\"]/table/tbody/tr[3]/td[2]/img");				
			} catch (Exception e2) {
				flag=false;
				obj.put("status", 0);
				obj.put("msg", "校内通道异常！");
				loginOut(params, context);
			}
		}finally{
			if(flag){
				WebElement webElement = stuList[index].driver.findElementByXPath("//*[@id=\"aspnetForm\"]/table/tbody/tr[3]/td[2]/img");
				Rectangle s=webElement.getRect();
		        File f = stuList[index].driver.getScreenshotAs(OutputType.FILE);
		        BufferedImage img = ImageIO.read(f).getSubimage(s.x+1, s.y+1, s.width-3, s.height-3);
		        //转base64
		        BASE64Encoder encoder = new BASE64Encoder();
		        ByteArrayOutputStream baos = new ByteArrayOutputStream();//io流
		        ImageIO.write(img, "png", baos);//写入流中
		        byte[] bytes = baos.toByteArray();//转换成字节
		        String png_base64 =  encoder.encodeBuffer(bytes).trim();//转换成base64串
		        //删除 \r\n
		        png_base64 = png_base64.replaceAll("\n", "").replaceAll("\r", "");
		        obj.put("base64","data:image/png;base64,"+ png_base64);
		        obj.put("status", 1);
				obj.put("msg", "获取验证码成功！");
			}
		}
		return obj;
	}
	//登录研究生院后台
	public static JSONObject loginyjsy(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj = new JSONObject();
		try{
			String user_login = params.getString("user_login");
			String user_password = params.getString("user_password");
			String yzm = params.getString("yzm");
			System.out.println(user_login+","+user_password+","+yzm);
			//登录webvpn
			stuList[index].driver.findElementByXPath("//*[@id=\"_ctl0_txtusername\"]").sendKeys(user_login);
			stuList[index].driver.findElementByXPath("//*[@id=\"_ctl0_txtpassword\"]").sendKeys(user_password);
			stuList[index].driver.findElementByXPath("//*[@id=\"_ctl0_txtyzm\"]").sendKeys(yzm);
			stuList[index].driver.findElementByXPath("//*[@id=\"_ctl0_ImageButton1\"]").click();
			stuList[index].user_login=user_login;
			boolean flag=stuList[index].driver.findElementsByXPath("//*[@id=\"upFrame\"]").size()>0;
			if(flag) {
				obj.put("status", 1);
				obj.put("msg", "登录成功！");
			}else{
				obj.put("status", 0);
				obj.put("msg", "登录失败！");
			}
		} catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "登录异常！");
			loginOut(params, context);
		}
		return obj;
	}
	//点击报名活动
	public static JSONObject signUpActivity(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj=new JSONObject();
		try{
			String indexStr = params.getString("index");
			String txtyzmCode = params.getString("yzm");
			System.out.println(indexStr+","+txtyzmCode);
			WebElement opeBtn=stuList[index].driver.findElementByXPath("//*[@id=\"dgData00__ctl"+indexStr+"_Linkbutton3\"]");
			WebElement txtyzm=stuList[index].driver.findElementByXPath("//*[@id=\"txtyzm\"]");//验证码输入框
			txtyzm.clear();
			txtyzm.sendKeys(txtyzmCode);
			opeBtn.click();
			stuList[index].driver.switchTo().alert().accept();
			obj.put("msg",stuList[index].driver.switchTo().alert().getText());
			stuList[index].driver.switchTo().alert().accept();
			obj.put("status", 1);
		}catch (Exception e) {
		}
		return obj;
	}
	//获得最新活动列表
	public static JSONObject getNewActivities(JSONObject params, ActionContext context) throws Exception {
		int n=0;
		JSONObject obj=new JSONObject();
		try{
			if(stuList[index].schoolOut) stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
			else stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
	    	WebElement ele = stuList[index].driver.findElementByXPath("//*[@id=\"dgData00\"]/tbody");
	    	List<WebElement> webElementList = ele.findElements(By.xpath("//*[@id=\"dgData00\"]/tbody/tr"));
	    	n=webElementList.size()-1;
	    	System.out.println("====================活动数："+n+"=====================");
	    	List<Activity> activityList=new ArrayList<Activity>();
	    	if(n>0) {
	    		String str = ele.getText();
	    		String s[] = str.split("\n");
	    		for (int i=1;i<s.length;i++) {
	    			String activities[]=s[i].split("	");
	    			int capacity=Integer.parseInt(activities[6]);
	    			int nowcount=Integer.parseInt(activities[7]);
	    			Activity activity=new Activity((i+1)+"",activities[0],activities[1],activities[2],activities[3],activities[4],activities[5],
	    					capacity,nowcount,activities[8],activities[10],activities[11],"");
	    			activityList.add(activity);
	    			if(capacity>nowcount) {
	    				//后续开发自动报名模块
	    			}
	    			
	    		}
	    	}
			obj.put("activityList", activityList);
			WebElement webElement = stuList[index].driver.findElementByXPath("//*[@id=\"Table2\"]/tbody/tr[2]/td/p/img");
	        Rectangle s=webElement.getRect();
	        //获取报名成功的验证码
	        File f = stuList[index].driver.getScreenshotAs(OutputType.FILE);
	        BufferedImage img = ImageIO.read(f).getSubimage(s.x+1, s.y+1, s.width-3, s.height-3);
	        //转base64
	        BASE64Encoder encoder = new BASE64Encoder();
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();//io流
	        ImageIO.write(img, "png", baos);//写入流中
	        byte[] bytes = baos.toByteArray();//转换成字节
	        String png_base64 =  encoder.encodeBuffer(bytes).trim();//转换成base64串
	        //删除 \r\n
	        png_base64 = png_base64.replaceAll("\n", "").replaceAll("\r", "");
	        obj.put("base64","data:image/png;base64,"+ png_base64);
	        obj.put("status", 1);
	        obj.put("msg", "获取最新活动成功！");
		}catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "后台异常！");
			loginOut(params, context);
		}
		return obj;
	}
	//获取我已报名成功的活动
	public static JSONObject getMyActivities(JSONObject params, ActionContext context) throws Exception {
		int n=0;
		JSONObject obj=new JSONObject();
		try{
			if(stuList[index].schoolOut) stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
			else stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
	    	WebElement ele = stuList[index].driver.findElementByXPath("//*[@id=\"dgData\"]/tbody");
	    	List<WebElement> webElementList = ele.findElements(By.xpath("//*[@id=\"dgData\"]/tbody/tr"));
	    	n=webElementList.size()-1;
	    	System.out.println("====================已报名活动数："+n+"=====================");
	    	List<Activity> activityList=new ArrayList<Activity>();
	    	if(n>0) {
	    		String str = ele.getText();
	    		String s[] = str.split("\n");
	    		for (int i=1;i<s.length;i++) {
	    			String activities[]=s[i].split("	");
	    			int capacity=Integer.parseInt(activities[6]);
	    			String status=activities[12].contains("未审")?"未审":(activities[12].contains("未通过")?"未通过":"通过");
	    			stuList[index].status=status;
	    			Activity activity=new Activity((i+1)+"",activities[0],activities[1],activities[2],activities[3],activities[4],activities[5],
	    					capacity,0,activities[7],activities[9],activities[10],status);
	    			activityList.add(activity);
	    			if(status.equals("未审")) {
	    				//
	    			}
	    			
	    		}
	    	}
			obj.put("activityList", activityList);
			obj.put("status", 1);
	        obj.put("msg", "获取我的活动成功！");
		}catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "后台异常！");
			loginOut(params, context);
		}
		return obj;
	}
	//获取我的心得
	public static JSONObject getMyHdList(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj=new JSONObject();
		try{
			if(stuList[index].schoolOut) stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
			else stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/txhdgl/hdlist.aspx?xh="+stuList[index].user_login);
			String id=params.getString("id");
			stuList[index].driver.findElementByXPath("//*[@id=\"dgData__ctl"+id+"_LinkButton2\"]").click();
			String text=stuList[index].driver.findElementByXPath("//*[@id=\"txtxd\"]").getText();
			obj.put("text", text);
			obj.put("status", 1);
			obj.put("msg", "获得内容成功！");
		}catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "后台异常！");
			loginOut(params, context);
		}
		return obj;
	}
	//提交我的心得
	public static JSONObject setMyHd(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj=new JSONObject();
		try{
			if(stuList[index].schoolOut) stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/txhdgl/hdxxdetail.aspx");
			else stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/txhdgl/hdxxdetail.aspx");
			String text=params.getString("text");
			stuList[index].driver.findElementByXPath("//*[@id=\"txtxd\"]").clear();
			stuList[index].driver.findElementByXPath("//*[@id=\"txtxd\"]").sendKeys(text);
			WebElement ele = stuList[index].driver.findElementByXPath("//*[@id=\"lbsq1\"]");
			if(ele.getAttribute("disabled")==null) {
				ele.click();//提交保存
				String msg=stuList[index].driver.switchTo().alert().getText();
				stuList[index].driver.switchTo().alert().accept();
				obj.put("status", 1);
				obj.put("msg", msg);
				
			} else {
				obj.put("status", 0);
				obj.put("msg", "审核已结束！");
			}
		}catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "后台异常！");
			loginOut(params, context);
		}
		return obj;
	}
	//退出登录
	public static JSONObject loginOut(JSONObject params, ActionContext context) throws Exception {
		JSONObject obj=new JSONObject();
		try{
			if(stuList[index].schoolOut) {
				//注销后台
				stuList[index].driver.get("https://yjsy-8080.w.buct.edu.cn/pyxx/topbanner.aspx");
				stuList[index].driver.findElementByXPath("/html/body/div/div[2]/a[2]").click();
				stuList[index].driver.switchTo().alert().accept();
				//注销VPN登录
				stuList[index].driver.get("https://w.buct.edu.cn/");
				stuList[index].driver.findElementByXPath("/html/body/nav/div/ul/li/a").click();
				stuList[index].driver.findElementByXPath("/html/body/nav/div/ul/li/ul/li[2]/a").click();
			}
			else {
				//注销后台
				stuList[index].driver.get("http://yjsy.buct.edu.cn:8080/pyxx/topbanner.aspx");
				stuList[index].driver.findElementByXPath("/html/body/div/div[2]/a[2]").click();
				stuList[index].driver.switchTo().alert().accept();		
			}
			obj.put("status", 1);
			obj.put("msg", "注销成功！");
		}catch (Exception e) {
			obj.put("status", 0);
			obj.put("msg", "后台异常！");
		}
		return obj;
	}

	//测试用
	public static void main(String[] args) {
		System.out.println();
	}

}
