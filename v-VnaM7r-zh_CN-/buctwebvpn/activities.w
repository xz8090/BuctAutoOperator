<!DOCTYPE HTML>
<html style="width:100%;height:100%" class="no-js">
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="format-detection" content="telephone=no">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,viewport-fit=cover">
        <script src="../system/lib/base/modernizr-2.8.3.min.js"></script>
		<script id="__varReplace">
    	
    	    	window.__justep = window.__justep || {};
				window.__justep.isDebug = false;
				window.__justep.__packageMode = "1";
				window.__justep.__isPackage = true;;
				window.__justep.url = location.href;
				window.__justep.versionInfo = {};
		 
    	</script>
        <script id="__updateVersion">
        
				(function(url, mode){
					if (("@"+"mode@") === mode) mode = "3";
					if (("@"+"versionUrl@") === url) url = "system/service/common/app.j";
					if ((mode!=="1" && (mode!="2") && (mode!="3"))) return;
					var async = (mode=="1");
					var x5Version = "noApp";
					var x5AppAgents = /x5app\/([0-9.]*)/.exec(navigator.userAgent);
					if(x5AppAgents && x5AppAgents.length > 1){
					   	x5Version = x5AppAgents[1] || "";
					} 
					function createXhr(){
						try {	
							return new XMLHttpRequest();
						}catch (tryMS) {	
							var version = ["MSXML2.XMLHttp.6.0",
							               "MSXML2.XMLHttp.3.0",
							               "MSXML2.XMLHttp",
							               "Miscrosoft.XMLHTTP"];
							for(var i = 0; i < version.length; i++){
								try{
							    	return new ActiveXObject(version[i]);
								}catch(e){}
							}
						}
						throw new Error("您的系统或浏览器不支持XHR对象！");
					}
					
					function createGuid(){	
						var guid = '';	
						for (var i = 1; i <= 32; i++){		
							var n = Math.floor(Math.random()*16.0).toString(16);		
							guid += n;		
							if((i==8)||(i==12)||(i==16)||(i==20))			
								guid += '-';	
						}	
						return guid;
					}
					
					function parseUrl(href){
						href = href.split("#")[0];
						var items = href.split("?");
						href = items[0];
						var query = items[1] || "";
						items = href.split("/");
						var baseItems = [];
						var pathItems = [];
						var isPath = false;
						for (var i=0; i<items.length; i++){
							if (mode == "3"){
								if (items[i] && (items[i].indexOf("v_") === 0) 
										&& (items[i].indexOf("l_") !== -1)
										&& (items[i].indexOf("s_") !== -1)
										&& (items[i].indexOf("d_") !== -1)
										|| (items[i]=="v_")){
									isPath = true;
									continue;
								}
							}else{
								if (items[i] && (items[i].indexOf("v-")===0) && (items[i].charAt(items[i].length-1)=="-") ){
									isPath = true;
									continue;
								}
							}
							if (isPath){
								pathItems.push(items[i]);
							}else{
								baseItems.push(items[i]);	
							}
							
						}
						var base = baseItems.join("/");
						if (base.charAt(base.length-1)!=="/") base += "/";
						
						var path = pathItems.join("/");
						if (path.charAt(0) !== "/") path = "/" + path;
						return [base, path, query];
					}
					
					
					var items = parseUrl(window.location.href);
					var base = items[0];
					var path = items[1];
					var query = items[2];
					var xhr = createXhr();
					url += ((url.indexOf("?")!=-1) ? "&" : "?") +"_=" + createGuid();
					if (mode === "3"){
						url += "&url=" + path;
						if (query)
							url += "&" + query;
					}
					xhr.open('GET', base + url, async);
					
					if (async){
						xhr.onreadystatechange=function(){
							if((xhr.readyState == 4) && (xhr.status == 200) && xhr.responseText){
								var versionInfo = JSON.parse(xhr.responseText);
								window.__justep.versionInfo = versionInfo;
								window.__justep.versionInfo.baseUrl = base;
								if (query){
									path = path + "?" + query;
								}
								path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
								var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
								versionInfo.resourceInfo.indexPageURL = indexUrl;
								if(versionInfo.resourceInfo.resourceUpdateMode != "md5"){
									if (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1){
										versionInfo.resourceInfo.isNewVersion = true;
									};
								}
							}
						}
					}
					
					try{
						xhr.send(null);
						if (!async && (xhr.status == 200) && xhr.responseText){
							var versionInfo = JSON.parse(xhr.responseText);
							window.__justep.versionInfo = versionInfo;
							window.__justep.versionInfo.baseUrl = base;
							if ((mode==="3") && window.__justep.isDebug){
								/* 模式3且是调试模式不重定向 */
							}else{
								if (query){
									path = path + "?" + query;
								}
								if(versionInfo.resourceInfo.resourceUpdateMode == "md5"){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									versionInfo.resourceInfo.indexPageURL = indexUrl; 
								}else if (versionInfo.resourceInfo && versionInfo.resourceInfo.version && (window.__justep.url.indexOf(versionInfo.resourceInfo.version) == -1)){
									path = versionInfo.resourceInfo.indexURL || path; /* 如果返回indexPath则使用indexPath，否则使用当前的path */
									var indexUrl = versionInfo.baseUrl + versionInfo.resourceInfo.version + path;
									window.location.href = indexUrl;
								}
							}
						}
					}catch(e2){}
				}("appMetadata_in_server.json", "1"));
                 
        </script>
    <link rel="stylesheet" href="../system/components/bootstrap.min.css" include="$model/UI2/system/components/bootstrap/lib/css/bootstrap,$model/UI2/system/components/bootstrap/lib/css/bootstrap-theme"><link rel="stylesheet" href="../system/components/comp.min.css" include="$model/UI2/system/components/justep/lib/css2/dataControl,$model/UI2/system/components/justep/input/css/datePickerPC,$model/UI2/system/components/justep/messageDialog/css/messageDialog,$model/UI2/system/components/justep/lib/css3/round,$model/UI2/system/components/justep/input/css/datePicker,$model/UI2/system/components/justep/row/css/row,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/attachment/css/attachment,$model/UI2/system/components/justep/barcode/css/barcodeImage,$model/UI2/system/components/bootstrap/dropdown/css/dropdown,$model/UI2/system/components/justep/contents/css/contents,$model/UI2/system/components/justep/common/css/forms,$model/UI2/system/components/justep/dataTables/css/responsive,$model/UI2/system/components/justep/locker/css/locker,$model/UI2/system/components/justep/menu/css/menu,$model/UI2/system/components/justep/scrollView/css/scrollView,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/dialog/css/dialog,$model/UI2/system/components/justep/bar/css/bar,$model/UI2/system/components/justep/popMenu/css/popMenu,$model/UI2/system/components/justep/lib/css/icons,$model/UI2/system/components/justep/lib/css4/e-commerce,$model/UI2/system/components/justep/toolBar/css/toolBar,$model/UI2/system/components/justep/popOver/css/popOver,$model/UI2/system/components/justep/panel/css/panel,$model/UI2/system/components/bootstrap/carousel/css/carousel,$model/UI2/system/components/justep/wing/css/wing,$model/UI2/system/components/bootstrap/scrollSpy/css/scrollSpy,$model/UI2/system/components/justep/titleBar/css/titleBar,$model/UI2/system/components/justep/lib/css1/linear,$model/UI2/system/components/justep/numberSelect/css/numberList,$model/UI2/system/components/justep/list/css/list,$model/UI2/system/components/justep/dataTables/css/dataTables"></head>
	
    <body style="width:100%;height:100%;margin: 0;">
        <script intro="none"></script>
    	<div id="applicationHost" class="applicationHost" style="width:100%;height:100%;" __component-context__="block"><div xid="window" class="window cMvEnIf" component="$model/UI2/system/components/justep/window/window" design="device:m;" data-bind="component:{name:'$model/UI2/system/components/justep/window/window'}" __cid="cMvEnIf" components="$model/UI2/system/components/justep/model/model,$model/UI2/system/components/justep/loadingBar/loadingBar,$model/UI2/system/components/justep/button/button,$model/UI2/system/components/justep/input/input,$model/UI2/system/components/justep/scrollView/scrollView,$model/UI2/system/components/justep/list/list,$model/UI2/system/components/justep/panel/child,$model/UI2/system/components/justep/textarea/textarea,$model/UI2/system/components/justep/panel/panel,$model/UI2/system/components/justep/popOver/popOver,$model/UI2/system/components/justep/contents/content,$model/UI2/system/components/justep/row/row,$model/UI2/system/components/justep/titleBar/titleBar,$model/UI2/system/components/justep/contents/contents,$model/UI2/system/components/justep/data/data,$model/UI2/system/components/justep/window/window,$model/UI2/system/components/justep/button/buttonGroup,">
  <style>.tb-text-del.cMvEnIf{text-decoration: line-through}</style>  
  <div component="$model/UI2/system/components/justep/model/model" xid="model" style="display:none" data-bind="component:{name:'$model/UI2/system/components/justep/model/model'}" __cid="cMvEnIf" class="cMvEnIf"></div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver center-block cMvEnIf" xid="popOver1" style="display:none;" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;opacity&#34;:0.8,&#34;position&#34;:&#34;center&#34;}" __cid="cMvEnIf"> 
    <div class="x-popOver-overlay cMvEnIf" xid="div18" style="position:absolute;background-color:#000000;left:30%;width:40%;top:45%;height:10%;border-radius: 10px;" __cid="cMvEnIf"></div>  
    <div class="x-popOver-content cMvEnIf" xid="div19" __cid="cMvEnIf">
      <span xid="span28" id="span28" style="font-family:楷体;font-size:x-small;color:#FFFFFF;" __cid="cMvEnIf" class="cMvEnIf"></span>
    </div>
  </div>  
  <div component="$model/UI2/system/components/justep/popOver/popOver" class="x-popOver pull-left text-info bg-danger clearfix center-block cMvEnIf" xid="popOver2" style="display:none;" data-bind="component:{name:'$model/UI2/system/components/justep/popOver/popOver'}" data-config="{&#34;direction&#34;:&#34;auto&#34;,&#34;dismissible&#34;:false,&#34;opacity&#34;:0.8}" __cid="cMvEnIf"> 
    <div class="x-popOver-overlay cMvEnIf" xid="div20" style="background-color:#000000;" __cid="cMvEnIf"></div>  
    <div class="x-popOver-content cMvEnIf" xid="div21" __cid="cMvEnIf">
      <textarea component="$model/UI2/system/components/justep/textarea/textarea" class="form-control cMvEnIf" xid="textarea1" id="textarea1" style="width:100%;height:250px;" data-bind="component:{name:'$model/UI2/system/components/justep/textarea/textarea'}" __cid="cMvEnIf"></textarea>  
      <a component="$model/UI2/system/components/justep/button/button" class="btn btn-warning cMvEnIf" xid="button4" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button4Click" data-config="{&#34;label&#34;:&#34;重置&#34;}" __cid="cMvEnIf"> 
        <i xid="i15" __cid="cMvEnIf" class="cMvEnIf"></i>  
        <span xid="span31" __cid="cMvEnIf" class="cMvEnIf">重置</span>
      </a>
      <a component="$model/UI2/system/components/justep/button/button" class="btn btn-danger cMvEnIf" xid="button1" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button1Click" data-config="{&#34;label&#34;:&#34;取消&#34;}" __cid="cMvEnIf"> 
        <i xid="i12" __cid="cMvEnIf" class="cMvEnIf"></i>  
        <span xid="span21" __cid="cMvEnIf" class="cMvEnIf">取消</span>
      </a>  
      <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cMvEnIf" xid="button3" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:button3Click" data-config="{&#34;label&#34;:&#34;确认&#34;}" __cid="cMvEnIf"> 
        <i xid="i14" __cid="cMvEnIf" class="cMvEnIf"></i>  
        <span xid="span30" __cid="cMvEnIf" class="cMvEnIf">确认</span>
      </a> 
    </div>
  </div>
  <div component="$model/UI2/system/components/justep/panel/panel" class="x-panel x-full pcQJzqEf-iosstatusbar cMvEnIf" xid="panel2" data-bind="component:{name:'$model/UI2/system/components/justep/panel/panel'}" __cid="cMvEnIf"> 
    <div class="x-panel-top cMvEnIf" xid="top1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cMvEnIf"> 
      <div component="$model/UI2/system/components/justep/titleBar/titleBar" class="x-titlebar cMvEnIf" xid="titleBar1" data-bind="component:{name:'$model/UI2/system/components/justep/titleBar/titleBar'}" data-config="{&#34;title&#34;:&#34;我的活动报告&#34;}" __cid="cMvEnIf"> 
        <div class="x-titlebar-left cMvEnIf" xid="left1" __cid="cMvEnIf">
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cMvEnIf" xid="exitBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:exitBtnClick" data-config="{&#34;icon&#34;:&#34;e-commerce e-commerce-jinru1&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cMvEnIf"> 
            <i xid="i16" class="e-commerce e-commerce-jinru1 cMvEnIf" __cid="cMvEnIf"></i>  
            <span xid="span32" __cid="cMvEnIf" class="cMvEnIf"></span>
          </a>
        </div>  
        <div class="x-titlebar-title cMvEnIf" xid="title1" __cid="cMvEnIf">我的活动报告</div>  
        <div class="x-titlebar-right  cMvEnIf" xid="right1" __cid="cMvEnIf">
          <div class="empty cMvEnIf" __cid="cMvEnIf"></div>
          <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link btn-only-icon cMvEnIf" xid="cBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:cBtnClick" data-config="{&#34;icon&#34;:&#34;glyphicon glyphicon-refresh&#34;,&#34;label&#34;:&#34;button&#34;}" __cid="cMvEnIf"> 
            <i xid="i4" class="glyphicon glyphicon-refresh cMvEnIf" __cid="cMvEnIf"></i>  
            <span xid="span4" __cid="cMvEnIf" class="cMvEnIf"></span> 
          </a>
        </div> 
      </div>  
      <div xid="div4" __cid="cMvEnIf" class="cMvEnIf"> 
        <div component="$model/UI2/system/components/justep/row/row" class="x-row cMvEnIf" xid="row1" data-bind="component:{name:'$model/UI2/system/components/justep/row/row'}" __cid="cMvEnIf"> 
          <div class="x-col x-col-50 cMvEnIf" xid="col1" __cid="cMvEnIf"> 
            <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified cMvEnIf" xid="buttonGroup3" style="height:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;tabbed&#34;:true}" __cid="cMvEnIf"> 
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cMvEnIf" xid="addBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;最新活动&#34;,&#34;target&#34;:&#34;newActivityContent&#34;}" __cid="cMvEnIf"> 
                <i xid="i8" __cid="cMvEnIf" class="cMvEnIf"></i>  
                <span xid="span11" __cid="cMvEnIf" class="cMvEnIf">最新活动</span> 
              </a>  
              <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default cMvEnIf" xid="collectionBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;label&#34;:&#34;已报名&#34;,&#34;target&#34;:&#34;hasSignContent&#34;}" __cid="cMvEnIf"> 
                <i xid="i10" __cid="cMvEnIf" class="cMvEnIf"></i>  
                <span xid="span12" __cid="cMvEnIf" class="cMvEnIf">已报名</span> 
              </a> 
            </div> 
          </div>  
          <div class="x-col x-col-15 cMvEnIf" xid="col3" __cid="cMvEnIf"> 
            <img src="" alt="" xid="yzmimg2" id="yzmimg2" style="position:relative;top:7px;width:64px;" height="28px" __cid="cMvEnIf" class="cMvEnIf"> 
          </div>  
          <div class="x-col x-col-15 cMvEnIf" xid="col2" __cid="cMvEnIf">
            <input component="$model/UI2/system/components/justep/input/input" class="form-control cMvEnIf" xid="input2" style="position:relative;float:left" data-bind="component:{name:'$model/UI2/system/components/justep/input/input'}" data-config="{&#34;placeHolder&#34;:&#34;验证码&#34;}" __cid="cMvEnIf">
          </div>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content  x-scroll-view cMvEnIf" xid="content1" _xid="C6F5A9AD87B000014B2C1F702F301BBF" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cMvEnIf"> 
      <div component="$model/UI2/system/components/justep/contents/contents" class="x-contents x-full cMvEnIf" xid="contents1" data-bind="component:{name:'$model/UI2/system/components/justep/contents/contents'}" data-config="{&#34;active&#34;:0}" __cid="cMvEnIf"> 
        <div class="x-contents-content active cMvEnIf" xid="newActivityContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cMvEnIf"> 
          <div class="x-scroll cMvEnIf" component="$model/UI2/system/components/justep/scrollView/scrollView" xid="scrollView1" data-bind="component:{name:'$model/UI2/system/components/justep/scrollView/scrollView'}" __cid="cMvEnIf"> 
            <div class="x-content-center x-pull-down container cMvEnIf" xid="div1" __cid="cMvEnIf"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down cMvEnIf" xid="i5" __cid="cMvEnIf"></i>  
              <span class="x-pull-down-label cMvEnIf" xid="span5" __cid="cMvEnIf">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content cMvEnIf" xid="div2" __cid="cMvEnIf"> 
              <div component="$model/UI2/system/components/justep/list/list" class="x-list cMvEnIf" xid="activityList" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;activitiesData&#34;,&#34;disablePullToRefresh&#34;:false}" __cid="cMvEnIf"> 
                <ul class="x-list-template list-group hide cMvEnIf" xid="listTemplateUl1" __cid="cMvEnIf" data-bind="foreach:{data:$model.foreach_activityList($element),afterRender:$model.foreach_afterRender_activityList.bind($model,$element)}"> 
                  <li xid="li1" class="list-group-item cMvEnIf" __cid="cMvEnIf"> 
                    <div xid="div25" class="media cMvEnIf" __cid="cMvEnIf"> 
                      <div xid="div5" class="media-left cMvEnIf" __cid="cMvEnIf"> 
                        <i xid="i6" class="glyphicon glyphicon-education cMvEnIf" __cid="cMvEnIf"></i>  
                        <span xid="span26" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:ref(&#34;typeName&#34;)"></span>
                      </div>  
                      <div xid="div6" class="media-body cMvEnIf" __cid="cMvEnIf"> 
                        <h5 xid="h51" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:medium;" __cid="cMvEnIf" data-bind="text:ref('fName')"></h5>  
                        <div xid="div7" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span9" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;活动开始:&#34;+val('fActivityStart')"></span>  
                          <span xid="span10" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;活动结束:&#34;+val('fActivityEnd')"></span> 
                        </div>  
                        <div xid="div11" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span11" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;报名开始:&#34;+val('fSignStart')"></span>  
                          <span xid="span12" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;报名结束:&#34;+val('fSignEnd')"></span> 
                        </div>  
                        <div xid="div12" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span13" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;地点:&#34;+val('fActivityPlace')"></span>  
                          <span xid="span14" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;主办方:&#34;+val('fPushDW')"></span> 
                        </div>  
                        <div xid="div13" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="h52" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:&#34;容量：&#34;+ val(&#34;fCount&#34;)"></span>  
                          <span xid="h53" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:&#34;已报：&#34;+val('fNowCount')"></span> 
                        </div> 
                      </div>  
                      <div xid="nextDiv" class="media-right cMvEnIf" __cid="cMvEnIf"> 
                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link cMvEnIf" xid="SignUpBtn" style="position:absolute;bottom:10px;right:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:SignUpBtnClick" data-config="{&#34;icon&#34;:&#34;glyphicon glyphicon-heart&#34;,&#34;label&#34;:&#34;报名&#34;}" __cid="cMvEnIf"> 
                          <i xid="i9" class="glyphicon glyphicon-heart cMvEnIf" style="color:#FF0033;" __cid="cMvEnIf"></i>  
                          <span xid="spanright" __cid="cMvEnIf" class="cMvEnIf">报名</span> 
                        </a> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up cMvEnIf" xid="div3" __cid="cMvEnIf"> 
              <span class="x-pull-up-label cMvEnIf" xid="span6" __cid="cMvEnIf">加载更多...</span> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content cMvEnIf" xid="content3" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cMvEnIf">
          <span xid="span7" __cid="cMvEnIf" class="cMvEnIf">还在开发中...</span> 
        </div>  
        <div class="x-contents-content cMvEnIf" xid="content2" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cMvEnIf">
          <span xid="span8" __cid="cMvEnIf" class="cMvEnIf">还在开发中...</span>
        </div>
        <div class="x-contents-content cMvEnIf" xid="hasSignContent" component="$model/UI2/system/components/justep/contents/content" data-bind="component:{name:'$model/UI2/system/components/justep/contents/content'}" __cid="cMvEnIf"> 
          <div class="x-scroll cMvEnIf" component="$model/UI2/system/components/justep/scrollView/scrollView" xid="scrollView2" data-bind="component:{name:'$model/UI2/system/components/justep/scrollView/scrollView'}" __cid="cMvEnIf"> 
            <div class="x-content-center x-pull-down container cMvEnIf" xid="div17" __cid="cMvEnIf"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down cMvEnIf" xid="i7" __cid="cMvEnIf"></i>  
              <span class="x-pull-down-label cMvEnIf" xid="span17" __cid="cMvEnIf">下拉刷新...</span>
            </div>  
            <div class="x-scroll-content cMvEnIf" xid="div16" __cid="cMvEnIf"> 
              <div component="$model/UI2/system/components/justep/list/list" class="x-list cMvEnIf" xid="list1" data-bind="component:{name:'$model/UI2/system/components/justep/list/list'}" data-config="{&#34;data&#34;:&#34;data1&#34;,&#34;disablePullToRefresh&#34;:false}" __cid="cMvEnIf"> 
                <ul class="x-list-template list-group hide cMvEnIf" xid="listTemplateUl2" __cid="cMvEnIf" data-bind="foreach:{data:$model.foreach_list1($element),afterRender:$model.foreach_afterRender_list1.bind($model,$element)}"> 
                  <li xid="li2" class="list-group-item cMvEnIf" __cid="cMvEnIf"> 
                    <div xid="media1" class="media cMvEnIf" __cid="cMvEnIf"> 
                      <div xid="mediaLeft1" class="media-left cMvEnIf" __cid="cMvEnIf"> 
                        <i xid="i11" class="dataControl dataControl-pencill cMvEnIf" __cid="cMvEnIf"></i>  
                        <span xid="span27" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:ref(&#34;status&#34;),style:{&#34;color&#34;:val(&#34;status&#34;)==&#34;通过&#34;?&#34;#00CC00&#34;:(val(&#34;status&#34;)==&#34;未通过&#34;?&#34;#FF0000&#34;:&#34;#33CCFF&#34;)}"></span>
                      </div>  
                      <div xid="mediaBody1" class="media-body cMvEnIf" __cid="cMvEnIf"> 
                        <h5 xid="h54" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:medium;" __cid="cMvEnIf" data-bind="text:ref('fName')"></h5>  
                        <div xid="div14" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span19" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;活动开始:&#34;+val('fActivityStart')"></span>  
                          <span xid="span23" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;活动结束:&#34;+val('fActivityEnd')"></span>
                        </div>  
                        <div xid="div10" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span25" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;报名开始:&#34;+val('fSignStart')"></span>  
                          <span xid="span24" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;报名结束:&#34;+val('fSignEnd')"></span>
                        </div>  
                        <div xid="div8" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span22" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;地点:&#34;+val('fActivityPlace')"></span>  
                          <span xid="span20" style="font-size:xx-small;" __cid="cMvEnIf" class="cMvEnIf" data-bind="text:&#34;主办方:&#34;+val('fPushDW')"></span>
                        </div>  
                        <div xid="div9" __cid="cMvEnIf" class="cMvEnIf"> 
                          <span xid="span15" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:&#34;容量：&#34;+ val(&#34;fCount&#34;)"></span>  
                          <span xid="span16" class="media-heading lead text-black cMvEnIf" style="color:#000000;font-size:xx-small;" __cid="cMvEnIf" data-bind="text:&#34;类型：&#34;+val('typeName')"></span>
                        </div> 
                      </div>  
                      <div xid="mediaRight1" class="media-right cMvEnIf" __cid="cMvEnIf"> 
                        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-link cMvEnIf" xid="button2" style="position:absolute;bottom:10px;right:10px;" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-events="onClick:nextBtnClick2" data-config="{&#34;icon&#34;:&#34;glyphicon glyphicon-edit&#34;,&#34;label&#34;:&#34;提交心得&#34;}" __cid="cMvEnIf"> 
                          <i xid="i13" class="glyphicon glyphicon-edit cMvEnIf" style="color:#00D0D0;" __cid="cMvEnIf"></i>  
                          <span xid="span29" __cid="cMvEnIf" class="cMvEnIf">提交心得</span>
                        </a>
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="x-content-center x-pull-up cMvEnIf" xid="div15" __cid="cMvEnIf"> 
              <span class="x-pull-up-label cMvEnIf" xid="span18" __cid="cMvEnIf">加载更多...</span>
            </div> 
          </div> 
        </div>
      </div> 
    </div>  
    <div class="x-panel-bottom cMvEnIf" xid="bottom1" component="$model/UI2/system/components/justep/panel/child" data-bind="component:{name:'$model/UI2/system/components/justep/panel/child'}" __cid="cMvEnIf"> 
      <div component="$model/UI2/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified cMvEnIf" xid="buttonGroup1" data-bind="component:{name:'$model/UI2/system/components/justep/button/buttonGroup'}" data-config="{&#34;selected&#34;:&#34;newActivityBtn&#34;,&#34;tabbed&#34;:true}" __cid="cMvEnIf"> 
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cMvEnIf" xid="newActivityBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-android-note&#34;,&#34;label&#34;:&#34;活动报告&#34;,&#34;target&#34;:&#34;newActivityContent&#34;}" __cid="cMvEnIf"> 
          <i xid="i1" class="icon-android-note cMvEnIf" __cid="cMvEnIf"></i>  
          <span xid="span1" __cid="cMvEnIf" class="cMvEnIf">活动报告</span> 
        </a>  
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cMvEnIf" xid="bookcityBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-stats-bars&#34;,&#34;label&#34;:&#34;选课系统&#34;,&#34;target&#34;:&#34;content3&#34;}" __cid="cMvEnIf"> 
          <i xid="i2" class="icon-stats-bars cMvEnIf" __cid="cMvEnIf"></i>  
          <span xid="span2" __cid="cMvEnIf" class="cMvEnIf">选课系统</span> 
        </a>  
        <a component="$model/UI2/system/components/justep/button/button" class="btn btn-default btn-icon-top cMvEnIf" xid="ownBtn" data-bind="component:{name:'$model/UI2/system/components/justep/button/button'}" data-config="{&#34;icon&#34;:&#34;icon-android-contact&#34;,&#34;label&#34;:&#34;成绩查询&#34;,&#34;target&#34;:&#34;content2&#34;}" __cid="cMvEnIf"> 
          <i xid="i3" class="icon-android-contact cMvEnIf" __cid="cMvEnIf"></i>  
          <span xid="span3" __cid="cMvEnIf" class="cMvEnIf">成绩查询</span> 
        </a> 
      </div> 
    </div>  
    <style __cid="cMvEnIf" class="cMvEnIf">.x-panel.pcQJzqEf-iosstatusbar >.x-panel-top {height: 100px;}.x-panel.pcQJzqEf-iosstatusbar >.x-panel-content { top: 100px;bottom: nullpx;}.x-panel.pcQJzqEf-iosstatusbar >.x-panel-bottom {height: nullpx;}.iosstatusbar .x-panel.pcQJzqEf-iosstatusbar >.x-panel-top,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcQJzqEf-iosstatusbar >.x-panel-top {height: 120px;}.iosstatusbar .x-panel.pcQJzqEf-iosstatusbar >.x-panel-content,.iosstatusbar .x-panel .x-panel-content .x-has-iosstatusbar.x-panel.pcQJzqEf-iosstatusbar >.x-panel-content { top: 120px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcQJzqEf-iosstatusbar >.x-panel-top {height: 100px;}.iosstatusbar .x-panel .x-panel-content .x-panel.pcQJzqEf-iosstatusbar >.x-panel-content {top: 100px;}</style>
  </div> 
</div></div>
        
        <div id="downloadGCF" style="display:none;padding:50px;">
        	<span>您使用的浏览器需要下载插件才能使用, </span>
        	<a id="downloadGCFLink" href="#">下载地址</a>
        	<p>(安装后请重新打开浏览器)</p>
        </div>
    	<script>
    	
    	            //判断浏览器, 判断GCF
    	 			var browser = {
    			        isIe: function () {
    			            return navigator.appVersion.indexOf("MSIE") != -1;
    			        },
    			        navigator: navigator.appVersion,
    			        getVersion: function() {
    			            var version = 999; // we assume a sane browser
    			            if (navigator.appVersion.indexOf("MSIE") != -1)
    			                // bah, IE again, lets downgrade version number
    			                version = parseFloat(navigator.appVersion.split("MSIE")[1]);
    			            return version;
    			        }
    			    };
    				function isGCFInstalled(){
    			      try{
    			        var i = new ActiveXObject('ChromeTab.ChromeFrame');
    			        if (i) {
    			          return true;
    			        }
    			      }catch(e){}
    			      return false;
    				}
    	            //判断浏览器, 判断GCF
    	            var __continueRun = true;
    				if (browser.isIe() && (browser.getVersion() < 10) && !isGCFInstalled()) {
    					document.getElementById("applicationHost").style.display = 'none';
    					document.getElementById("downloadGCF").style.display = 'block';
    					var downloadLink = "/" + location.pathname.match(/[^\/]+/)[0] + "/v8.msi";
    					document.getElementById("downloadGCFLink").href = downloadLink; 
    					__continueRun = false;
    	            }
		 	
    	</script>
        
        <script id="_requireJS" src="../system/lib/require/require.2.1.10.js"> </script>
        <script src="../system/core.min.js"></script><script src="../system/common.min.js"></script><script src="../system/components/comp.min.js"></script><script id="_mainScript">
        
			if (__continueRun) {
                window.__justep.cssReady = function(fn){
                	var promises = [];
                	for (var p in window.__justep.__ResourceEngine.__loadingCss){
                		if(window.__justep.__ResourceEngine.__loadingCss.hasOwnProperty(p))
                			promises.push(window.__justep.__ResourceEngine.__loadingCss[p].promise());
                	}
                	$.when.apply($, promises).done(fn);
                };
                
            	window.__justep.__ResourceEngine = {
            		readyRegExp : navigator.platform === 'PLAYSTATION 3' ? /^complete$/ : /^(complete|loaded)$/,
            		url: window.location.href,	
            		/*contextPath: 不包括语言 */
            		contextPath: "",
            		serverPath: "",
            		__loadedJS: [],
            		__loadingCss: {},
            		onLoadCss: function(url, node){
            			if (!this.__loadingCss[url]){
            				this.__loadingCss[url] = $.Deferred();	
                			if (node.attachEvent &&
                                    !(node.attachEvent.toString && node.attachEvent.toString().indexOf('[native code') < 0) &&
                                    !(typeof opera !== 'undefined' && opera.toString() === '[object Opera]')) {
                                node.attachEvent('onreadystatechange', this.onLinkLoad.bind(this));
                            } else {
                                node.addEventListener('load', this.onLinkLoad.bind(this), false);
                                node.addEventListener('error', this.onLinkError.bind(this), false);
                            }
            			}
            		},
            		
            		onLinkLoad: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
            	        if (evt.type === 'load' ||
                                (this.readyRegExp.test(target.readyState))) {
            	        	var url = target.getAttribute("href");
            	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
            	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
            	        	}
                        }
            		},
            		
            		onLinkError: function(evt){
            	        var target = (evt.currentTarget || evt.srcElement);
        	        	var url = target.getAttribute("href");
        	        	if (url && window.__justep.__ResourceEngine.__loadingCss[url]){
        	        		window.__justep.__ResourceEngine.__loadingCss[url].resolve(url);
        	        	}
            		},
            		
            		initContextPath: function(){
            			var baseURL = document.getElementById("_requireJS").src;
            			var before = location.protocol + "//" + location.host;
            			var after = "/system/lib/require/require.2.1.10";
            			var i = baseURL.indexOf(after);
            			if (i !== -1){
    	        			var middle = baseURL.substring(before.length, i);
    						var items = middle.split("/");
    						
    						
    						if ((items[items.length-1].indexOf("v_") === 0) 
    								&& (items[items.length-1].indexOf("l_") !== -1)
    								&& (items[items.length-1].indexOf("s_") !== -1)
    								&& (items[items.length-1].indexOf("d_") !== -1)
    								|| (items[items.length-1]=="v_")){
    							items.splice(items.length-1, 1);
    						}
    						
    						
    						if (items.length !== 1){
    							window.__justep.__ResourceEngine.contextPath = items.join("/");
    						}else{
    							window.__justep.__ResourceEngine.contextPath = before;
    						}
    						var index = window.__justep.__ResourceEngine.contextPath.lastIndexOf("/");
    						if (index != -1){
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath.substr(0, index);
    						}else{
    							window.__justep.__ResourceEngine.serverPath = window.__justep.__ResourceEngine.contextPath;
    						}
            			}else{
            				throw new Error(baseURL + " hasn't  " + after);
            			}
            		},
            	
            		loadJs: function(urls){
            			if (urls && urls.length>0){
            				var loadeds = this._getResources("script", "src").concat(this.__loadedJS);
    	       				for (var i=0; i<urls.length; i++){
								var url = urls[i];
    	        				if(!this._isLoaded(url, loadeds)){
    	        					this.__loadedJS[this.__loadedJS.length] = url;
    	        					/*
    	        					var script = document.createElement("script");
    	        					script.src = url;
    	        					document.head.appendChild(script);
    	        					*/
    	        					//$("head").append("<script  src='" + url + "'/>");
									var url = require.toUrl("$UI" + url);
    	        					$.ajax({
    	        						url: url,
    	        						dataType: "script",
    	        						cache: true,
    	        						async: false,
    	        						success: function(){}
    	        						});
    	        				} 
    	       				}
            			}
            		},
            		
            		loadCss: function(styles){
           				var loadeds = this._getResources("link", "href");
            			if (styles && styles.length>0){
            				for (var i=0; i<styles.length; i++){
    	       					var url = window.__justep.__ResourceEngine.contextPath + styles[i].url.replace("/UI2/", "/");
    	        				if(!this._isLoaded(url, loadeds)){
    	        					var include = styles[i].include || "";
    	        					var link = $("<link type='text/css' rel='stylesheet' href='" + url + "' include='" + include + "'/>");
    	        					this.onLoadCss(url, link[0]);
    	        					$("head").append(link);
    	        				} 
            				}
            			}
            			
            		},
            		
            		
            		_isLoaded: function(url, loadeds){
            			if (url){
            				var newUrl = "";
            				var items = url.split("/");
            				var isVls = false;
            				for (var i=0; i<items.length; i++){
            					if (isVls){
                					newUrl += "/" + items[i];
            					}else{
                					if (items[i] && (items[i].indexOf("v_")===0)
            								&& (items[i].indexOf("l_")!==-1)
            								&& (items[i].indexOf("s_")!==-1)
            								&& (items[i].indexOf("d_")!==-1)
            								|| (items[i]=="v_")){
                						isVls = true;
                					}
            					}
            				}
            				if (!newUrl)
            					newUrl = url;
            				
            				for (var i=0; i<loadeds.length; i++){
								var originUrl = this._getOriginUrl(loadeds[i]);
								if (originUrl && (originUrl.indexOf(newUrl)!==-1)){
									return true;
								}
    						}
            			}
    					return false;
            		},

					_getOriginUrl: function(url){
						var result = "";
						if (url && (url.indexOf(".md5_")!==-1)){
							url = url.split("#")[0];
							url = url.split("?")[0];
							var items = url.split(".");
							for (var i=0; i<items.length; i++){
								if ((i===items.length-2) && (items[i].indexOf("md5_")!==-1)){
									continue;
								}else{
									if (i>0) result += ".";
									result += items[i];
								}
							}
						}else{
							result = url;
						}
						return result;
					},
            		
            		_getResources: function(tag, attr){
    					var result = [];
    					var scripts = $(tag);
    					for (var i=0; i<scripts.length; i++){
    						var v = scripts[i][attr];
    						if (v){
    							result[result.length] = v;
    						}
    					}
    					return result;
            		}
            	};
            	
            	window.__justep.__ResourceEngine.initContextPath();
    			requirejs.config({
    				baseUrl: window.__justep.__ResourceEngine.contextPath + '/buctwebvpn',
    			    paths: {
    			    	/* 解决require.normalizeName与require.toUrl嵌套后不一致的bug   */
    			    	'$model/UI2/v_': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model/UI2': window.__justep.__ResourceEngine.contextPath + '',
    			    	'$model': window.__justep.__ResourceEngine.serverPath,
    			        'text': window.__justep.__ResourceEngine.contextPath + '/system/lib/require/text.2.0.10',
    			        'bind': window.__justep.__ResourceEngine.contextPath + '/system/lib/bind/bind',
    			        'jquery': window.__justep.__ResourceEngine.contextPath + '/system/lib/jquery/jquery-1.11.1.min'
    			    },
    			    map: {
    				        '*': {
    				            res: '$model/UI2/system/lib/require/res',
    				            service: '$model/UI2/system/lib/require/service',
    				            cordova: '$model/UI2/system/lib/require/cordova',
    				            w: '$model/UI2/system/lib/require/w',
    				            css: '$model/UI2/system/lib/require/css'
    				        }
    				},
    				waitSeconds: 300
    			});
    			
    			requirejs(['require', 'jquery', '$model/UI2/system/lib/base/composition', '$model/UI2/system/lib/base/url', '$model/UI2/system/lib/route/hashbangParser', '$model/UI2/system/components/justep/versionChecker/versionChecker', '$model/UI2/system/components/justep/loadingBar/loadingBar', '$model/UI2/system/lib/jquery/domEvent',  '$model/UI2/system/lib/cordova/cordova'],  function (require, $, composition, URL, HashbangParser,versionChecker) { 
    				document.addEventListener('deviceready', function() {
    	                if (navigator && navigator.splashscreen && navigator.splashscreen.hide) {
    	                	/*延迟隐藏，视觉效果更理想*/
    	                	setTimeout(function() {navigator.splashscreen.hide();}, 800);
    	                }
    	            }, false);
					setTimeout(function(){
						versionChecker.check();
					},2000);
    				var context = {};
    				context.model = '$model/UI2/buctwebvpn/activities.w' + (document.location.search || "");
    				context.view = $('#applicationHost').children()[0];
    				var element = document.getElementById('applicationHost');

					    				
    				
    				var ownerid = new URL(window.__justep.__ResourceEngine.url).getParam("$ownerid");
    				var pwindow = opener;
    				if (!pwindow && window.parent && window.parent.window){
    					pwindow = window.parent.window;
    				}
    				if(ownerid && pwindow 
    						&& pwindow.__justep && pwindow.__justep.windowOpeners
    						&& pwindow.__justep.windowOpeners[ownerid]
    						&& $.isFunction(pwindow.__justep.windowOpeners[ownerid].sendToWindow)){
    					window.__justep.setParams = function(params){
    						/* 给windowOpener提供再次传参数的接口  */
    						params = params || {};
    						composition.setParams(document.getElementById('applicationHost'), params);
    					};
    					var winOpener = pwindow.__justep.windowOpeners[ownerid];
    					if(winOpener) winOpener.window = window;
    					$(window).unload(function(event){
    						if(winOpener && winOpener.dispatchCloseEvent) winOpener.dispatchCloseEvent();
    					});
    					var params = winOpener.sendToWindow();
						context.owner = winOpener;
						context.params = params || {};
	        			composition.compose(element, context);
    				}else{
        				var params =  {};
    					var state = new HashbangParser(window.location.hash).parse().__state;
    					if (state){
    						params = state.get("");
    						try{
    							params = JSON.parse(params);
    							if (params.hasOwnProperty("__singleValue__")){
    								params = params.__singleValue__;
    							}
    						}catch(e1){}
    					}
    					context.noUpdateState = true;
        				context.params = params;
        				composition.compose(element, context);
    				}
    			});    
            }
		 	
        </script>
    </body>
</html>