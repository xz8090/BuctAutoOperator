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

	Model.prototype.modelParamsReceive = function(event){
		var user_password2=localStorage.getItem('user_password2');
		if(user_password2!=null && user_password2!='') this.comp("passwordInput").val(user_password2);
		var user_login = event.params.user_login;
		this.comp("nameInput").val(user_login);
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "getCode",
			"async" : false,
			"params" : {},
			"success" : function(data) {
				if(data.status=="1"){
					$("#yzmimg").attr("src",data.base64);
				}else{
					alert(data.msg);
					justep.Shell.showPage("main");
				}
				
			}
		});
	};

	Model.prototype.loginBtnClick = function(event){
		var user={
			"user_login":this.comp("nameInput").val(),
			"user_password":this.comp("passwordInput").val(),
			"yzm":this.comp("yzmInput").val()
		};
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "loginyjsy",
			"async" : false,
			"params" : user,
			"success" : function(data) {
				if(data.status=="1"){
					localStorage.setItem('user_password2', user.user_password);
					justep.Shell.showPage("activities",{
						"user_login":user.user_login
					});
				}else{
					alert(data.msg);
					justep.Shell.showPage("loginyjsy",{
						"user_login":user.user_login
					});
				}
				
			},
			"error":function(msg, xhr){
				alert("账号或密码或验证码错误！");
				justep.Shell.showPage("loginyjsy",{
					"user_login":user.user_login
				});
			}
			
		});
		
	};

	return Model;
});