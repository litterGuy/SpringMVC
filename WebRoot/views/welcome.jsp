<!DOCTYPE HTML>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="sctx" value="${pageContext.request.contextPath}" />
<html>
  <head>
    <title>orderCount &gt;&gt; 首页</title>
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="stylesheet" type="text/css" href="${sctx }/common/css/style.css">
	<script src="${sctx}/common/js/jquery-1.7.2.min.js"></script>
	<script src="${sctx}/common/js/jquery.cookie.min.js"></script>
  </head>
  <body>
  	<!-- 头部固定导航栏 -->
  	<jsp:include page="header.jsp"></jsp:include>
    <div id="wrapper">
    	<b id="u_username"></b>
    	<p>
	    	welcome to this place!
	    	Here is a temporary building, please waiting.......
    	</p>
    </div>
  </body>
  <script type="text/javascript">
  	$(function(){
  		$(".locate_div ul li:last").find("a").html("退出").attr("href","").bind("click",function(){
  			event.preventDefault();
  			$.cookie("uname",null,{path:'/'});
			$.cookie("ud",null,{path:'/'});
			window.location.href="${ctx }/account/loginOut";
  		});
  		$(".locate_div ul li:last").prev().hide();
  		$("#u_username").text($.cookie("uname")).css({"font-size":20,"padding-bottom":10});
  	});
  </script>
</html>
