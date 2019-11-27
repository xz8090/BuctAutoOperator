define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.toUrl = function(url){
		return url ? require.toUrl(url) : "";
	};
	var flag=false;
	Model.prototype.loginBtnClick = function(event){
		var user={
			"user_login":this.comp("nameInput").val(),
			"user_password":this.comp("passwordInput").val()
		};
		
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "loginWebVpn",
			"async" : false,
			"params" : user,
			"success" : function(data) {
				if(data.status=="1"){
					if(flag){
						localStorage.setItem('user_login', user.user_login);
						localStorage.setItem('user_password', user.user_password);
					}else{
						localStorage.setItem('user_login', '');
						localStorage.setItem('user_password', '');
					}
					justep.Shell.showPage("loginyjsy",{
						"user_login":user.user_login
					});
				}else{
					alert(data.msg);
					justep.Shell.showPage("main");
				}
				
			},
			"error":function(msg, xhr){
				alert("账号或密码错误！");
				justep.Shell.showPage("main");
			}
		});
		
		
	};

	Model.prototype.toggle2Change = function(event){
		flag=event.checked;
	};

	Model.prototype.modelLoad = function(event){
		var user_login=localStorage.getItem('user_login');
		var user_password=localStorage.getItem('user_password');
		if(user_login!=null && user_login!=''){
			this.comp("toggle2").set({"checked":"true"});
			this.comp("nameInput").val(user_login);
			this.comp("passwordInput").val(user_password);
		}
	};

	return Model;
});