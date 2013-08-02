<!DOCTYPE HTML>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="sctx" value="${pageContext.request.contextPath}" />
<html>
	<head>
    	<title>OrderCount | 登录</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Pragma" content="no-cache">
		<link rel="stylesheet" href="${sctx}/common/css/login.css" />
		<script src="${sctx}/common/js/jquery-1.7.2.min.js"></script>
		<script src="${sctx}/common/js/jquery.md5.js"></script>
		<script src="${sctx}/common/js/jquery.cookie.min.js"></script>
    </head>
	<body>
		<!-- 头部固定导航栏 -->
  		<jsp:include page="header.jsp"></jsp:include>
	
		<div class="login_wrap">
	        <header>
	        <nav>
	        	<ul>	
	                <li><a href="#">找回密码</a></li>
	                <li><a href="#">新用户注册</a></li>
	            </ul>
	        </nav>
	        </header>
        	<hr class="header_line"/>
        	<div id="login_page">
	        	<header></header>
	        	<section>
	        		<form class="login_form" action="#" method="post">
	                    <span id="input_icon"></span>
	                    <div id="login_input">
	                        <input id="username" type="text" name="username" value="" autofocus required placeholder="用户名/邮箱/手机号" autocomplete="off"/>
	                    </div>
	                    <span id="input_icon"></span>
	                    <div id="login_input">
	                        <input id="password" type="password" name="password" value="" required placeholder="密码" autocomplete="off"/>
	                    </div>
						<div id="setCookie">
							<input id="cookie" type="checkbox" name="cookie">
							<label for="cookie">下次自动登录(建议公共网络不要勾选此项)</label>
						</div>
	                    <div class="login_error hide">
	                    	<div>用户名和密码错误，请重新输入！</div>
	                    </div>
	                    <button>登&nbsp;&nbsp;录</button>
	                </form>
	            </section>
	        </div>
	    </div>
    </body>
    <script>
    	var cookieChecked = false;
    	//cookie checkbox选中事件
		$("#setCookie input").bind("click touchstart",function(){
			if($("#setCookie input").attr("checked")=="checked"){
				cookieChecked = true;
			}else{
				cookieChecked = false;
			}
		});
    	//input事件
		$("#login_input input").focus(function(e) {
			$(this).parent().css('opacity','1');
		}).blur(function(e) {
			$(this).parent().css('opacity','0.6');
		}).mouseenter(function(e) {
			$(this).parent().css('opacity','1');
		}).mouseleave(function(e){
			$(this).parent().css('opacity','0.6');
		});
		
		$(".login_form button").bind("click",function(){
			var username = $("input#username").val();
			var password = $("input#password").val();
			if(username==""){
				$(".login_error div").html("请输入用户名");
				$(".login_error").slideDown();
				$("input#username").focus();
			}else if(password == ""){
				$(".login_error div").html("请输入密码");
				$(".login_error").slideDown();
				$("input#password").focus();
			}else{
				$(".login_form button").disabled;
				$(".login_form button").text("登录中...");
				$.ajax({
					type:"POST",
					contentType: "application/json",
					url: "${ctx}/account/login",
					dataType: "json",
					data:"{\"loginName\":\""+username+"\",\"passWord\":\""+$.md5(password)+"\"}"
				}).success(function(data) {
					var result = jQuery.parseJSON(data);
					if(result.status == "true"){
						$(".login_error").slideUp("fast");
						if(cookieChecked){
							//$.cookie('cookie_name', 'cookie_value', { expires: 2, path: '/', domain: 'yourwebsite.com', secure: true });
							$.cookie("ud", result.userID,{expires:30,path:'/'});
							$.cookie("uname",result.userName,{expires:30,path:'/'});
						}else{
							$.cookie("ud", result.userID,{expires:null,path:'/'});
							$.cookie("uname", result.userName,{expires:null,path:'/'});
						}
						//公共机房
						localStorage.clear();
						window.location.href="${ctx}/ordercount/welcome";
					}else{
						$(".login_form button").removeClass("button_click").text("登 录");
						$(".login_error div").html(result.error_msg);
						$(".login_error").slideDown();
					}
				}).error(function(result) {
					$(".login_form button").removeClass("button_click").text("登 录");
					$(".login_error div").html("页面脚本错误，请刷新后重新登录");
					$(".login_error").slideDown();
				});
				
			}
			return false;
		});
		//隐藏部分信息
		$(function(){
	  		$(".locate_div ul li:last").prev().hide();
	  		$(".locate_div ul li:last").hide();
  		});
	</script>
</html>
