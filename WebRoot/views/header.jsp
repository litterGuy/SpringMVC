<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="sctx" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" type="text/css" href="${sctx }/common/css/top.css">
<div class="nav top">
	<div class="locate_div">
		<ul>
			<li>
				<a href="${ctx }/views/index.jsp">首页</a>
			</li>
			<li>
				<a href="#">聚焦</a>
			</li>
			<li>
				<a href="#">人气</a>
			</li>
			<li>
				<a href="${ctx}/ordercount/welcome">我的</a>
			</li>
			<li>
				<a href="#">RSS</a>
			</li>
			<li style="float:right;">
				<a href="${ctx }/views/register.jsp">注册</a>
			</li>
			<li style="float:right;">
				<a href="${ctx }/account/triggerLogin">登录</a>
			</li>
		</ul>
	</div>
</div>
