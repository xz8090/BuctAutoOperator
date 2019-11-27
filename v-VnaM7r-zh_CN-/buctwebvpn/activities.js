define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};
	
	// 图片路径转换
	Model.prototype.toUrl = function(url){
			return url ? require.toUrl(url) : "";	
		};


	Model.prototype.activitiesDataCustomRefresh = function(event){
		
		var newsData = event.source;
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "getNewActivities",
			"async" : true,
			"params" : {},
			"success" : function(data) {
				if(data.status=="1"){
					newsData.loadData(data.activityList);//将返回的数据加载到data组件
					$("#yzmimg2").attr("src",data.base64);
				}else{
					alert(data.msg);
					justep.Shell.showPage("main");
				}
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("main");
			}
		});
		
		
	};            

	Model.prototype.cBtnClick = function(event){
		var newsData = this.comp("activitiesData");
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "getNewActivities",
			"async" : false,
			"params" : {},
			"success" : function(data) {
				if(data.status=="1"){
					newsData.loadData(data.activityList);//将返回的数据加载到data组件
					$("#yzmimg2").attr("src",data.base64);
				}else{
					alert(data.msg);
					justep.Shell.showPage("main");
				}
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("main");
			}
		});
	};            
          

	Model.prototype.data1CustomRefresh = function(event){
		var newsData = event.source;
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "getMyActivities",
			"async" : false,
			"params" : {},
			"success" : function(data) {
				if(data.status=="1"){
					newsData.loadData(data.activityList);//将返回的数据加载到data组件
				}else{
					alert(data.msg);
					justep.Shell.showPage("main");
				}
				
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("main");
			}
		});
	};            
          

	Model.prototype.SignUpBtnClick = function(event){
		var row = event.bindingContext.$object;
		var yzm=this.comp("input2");
		var activity={
			"index":row.val('id'),
			"yzm":yzm.val()
		};
		var obj1=this.comp("popOver1");
		var newsData = this.comp("activitiesData");
		var data1 = this.comp("data1");
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "signUpActivity",
			"async" : true,
			"params" : activity,
			"success" : function(data) {
				$("#span28").text(data.msg);
				obj1.show();
				newsData.refreshData();
				data1.refreshData();
				yzm.val('');
				setTimeout(function(){
				    obj1.hide();
				},2000);
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("activities");
			}
		});
	};            
             
	Model.prototype.nextBtnClick2 = function(event){
		var obj2=this.comp("popOver2");
		var row = event.bindingContext.$object;
		var activity={
			"id":row.val('id')
		};
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "getMyHdList",
			"async" : true,
			"params" : activity,
			"success" : function(data) {
				$("#textarea1").val(data.text);
				obj2.show();
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("activities");
			}
		});
	};            
           
                        

	Model.prototype.button1Click = function(event){
		this.comp("popOver2").hide();
	};            
           
                        

	Model.prototype.button3Click = function(event){
		var obj2=this.comp("popOver2");
		var activity={
			"text":$("#textarea1").val()
		};
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "setMyHd",
			"async" : true,
			"params" : activity,
			"success" : function(data) {
				alert(data.msg);
				obj2.hide();
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("activities");
			}
		});
	};            
           
                        

	Model.prototype.button4Click = function(event){
		this.comp("textarea1").clear();
	};            
           
                        

	Model.prototype.exitBtnClick = function(event){
		justep.Baas.sendRequest({
			"url" : "/buctwebvpn/student",
			"action" : "loginOut",
			"async" : false,
			"params" : {},
			"success" : function(data) {
				localStorage.clear();
				alert(data.msg);
				justep.Shell.showPage("main");
				
			},
			"error":function(msg, xhr){
				alert("网站内部错误！");
				justep.Shell.showPage("main");
			}
		});
	};            
           
                        

	return Model;
});