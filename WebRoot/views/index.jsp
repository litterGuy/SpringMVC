<!DOCTYPE HTML>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="sctx" value="${pageContext.request.contextPath}" />
<html>
  <head>
    <title>ordercount</title>
	<meta http-equiv="pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="${sctx }/common/css/style.css">
	<link rel="stylesheet" type="text/css" href="${sctx }/common/css/lightbox.css" media="screen">
	<script type="text/javascript" src="${sctx }/common/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${sctx }/common/js/jquery.js"></script>
	<script type="text/javascript" src="${sctx }/common/js/cufon-yui.js"></script>
	<script type="text/javascript" src="${sctx }/common/js/Harabara_700.js"></script>

	<!-- Cufon font replacement -->
	<script type="text/javascript">
	    Cufon.replace('ul#navigation li a', { textShadow: '0 2px rgba(0, 0, 0, 0.2)' });
	</script>
	<script type="text/javascript">
	    Cufon.replace('#social ul li a', {hover:true});
	</script>
	
	<!-- Lightbox implementation -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#work ul li a').lightBox();
		});
	</script>
	
	<!-- Navigation and Content sliding effects -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('#navigation a.about').css('opacity','0.6');
			$('ul#navigation li').hover(function(){
				$(this).stop().animate({marginRight:6}, 250);
				}, function(){
					$(this).stop().animate({marginRight:0}, 250)
			});
			$('#navigation a.about').click(function(){
				$('#content').animate({'top':'0'},700);
				$('#navigation a').css('opacity','1');
				$(this).css('opacity','0.6');
			});
			$('#navigation a.work').click(function(){
				$('#content').animate({'top':'-560'},700);
				$('#navigation a').css('opacity','1');
				$(this).css('opacity','0.6');
			});
			$('#navigation a.social').click(function(){
				$('#content').animate({'top':'-1120'},700);
				$('#navigation a').css('opacity','1');
				$(this).css('opacity','0.6');
			});
			$('#navigation a.contact').click(function(){
				$('#content').animate({'top':'-1680'},700);
				$('#navigation a').css('opacity','1');
				$(this).css('opacity','0.6');
			});
	
			// contact form validation
			var hasChecked = false;
			$(".standard #submit").click(function () { 
				hasChecked = true;
				return checkForm();
			});
			$(".standard #name,.standard #email,.standard #message").live('change click', function(){
				if(hasChecked == true)
				{
					return checkForm();
				}
			});
			function checkForm()
			{
				var hasError = false;
				var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	
				if($(".standard #name").val() == '') {
					$(".standard #error-name").fadeIn();
					hasError = true;
				}else{
					$(".standard #error-name").fadeOut();
				}
				if($(".standard #email").val() == '') {
					$(".standard #error-email").fadeIn();
					hasError = true;
				}else if(!emailReg.test( $(".standard #email").val() )) {
					$(".standard #error-email").fadeIn();
					hasError = true;
				}else{
					$(".standard #error-email").fadeOut();
				}
				if($(".standard #message").val() == '') {
					$(".standard #error-message").fadeIn();
					hasError = true;
				}else{
					$(".standard #error-message").fadeOut();
				}
				if(hasError == true)
				{
					return false;
				}else{
					return true;
				}
			}
			// end contact form validation
		});
	</script>
	<!-- END JAVASCRIPT -->
  </head>
  <body>
  	<!-- 头部固定导航栏 -->
  	<jsp:include page="header.jsp"></jsp:include>
  	<div id="wrapper">

	<!-- Site navigation -->
	<div id="left">
	    <ul id="navigation">
	        <li><a class="about" href="#">about me</a></li>
	        <li><a class="work" href="#">my work</a></li>
	        <li><a class="social" href="#">my social</a></li>
	        <li><a class="contact" href="#">contact me</a></li>
	    </ul>
	</div>
	
	<!-- Site content -->
	<div id="right">
	    <div id="container">
	        <ul id="content">
	            <li id="about" class="content-block">
	                <img src="${sctx }/common/images/photo.gif" alt="photo">
	                <h2 class="name"><small>Hi! I'm</small>litterGuy</h2>
	                <p>I make easy-to-use, cross-browser websites with clean layouts for an enhanced user experience.I craft them using W3C web standards XHTML and CSS, which are clean, flexible and naturally SEO oriented.</p>
	                <h3>Services I provide:</h3>
	                <ul>
	                    <li>Web design &nbsp; development</li>
	                    <li>Wordpress</li>
	                </ul>
	            </li>
	            <li id="work">
	                
	                <h3>Web Design:</h3>
	                <ul>
	                    <li><a href="${sctx }/common/images/season1.jpg"><img src="${sctx }/common/images/web01.jpg" alt="web01"></a></li>
	                    <li><a href="${sctx }/common/images/season2.jpg"><img src="${sctx }/common/images/web02.jpg" alt="web02"></a></li>
	                    <li><a href="${sctx }/common/images/snswork.jpg"><img src="${sctx }/common/images/web03.jpg" alt="web03"></a></li>
	                </ul>
	                <h3>Graphic Design:</h3>
	                <ul>
	                    <li><a href="${sctx }/common/images/cataclysm.jpg"><img src="${sctx }/common/images/ui01.jpg" alt="ui01"></a></li>
	                    <li><a href="${sctx }/common/images/tabimado.jpg"><img src="${sctx }/common/images/ui02.jpg" alt="ui02"></a></li>
	                    <li><a href="${sctx }/common/images/business_20111102.jpg"><img src="${sctx }/common/images/ui03.jpg" alt="ui03"></a></li>
	                </ul>
	            </li>
	            <li id="social">
	                <ul>
	                    <li class="sina"><a href="#">sina micro-blog</a></li>
	                    <li class="linkedin"><a href="#">linked-in</a></li>
	                    <li class="flickr"><a href="#">flickr</a></li>
	                    <li class="lastfm"><a href="#">last.fm</a></li>
	                </ul>
	            </li>
	            <li id="contact">
	                <h3>Mail me a note</h3>
	                <form class="standard" method="post" action="sendmail.php">
	                    <ul>
	                        <li class="msgname">
	                            <label>Name: <span id="error-name" class="error hidden rounded"><small>Enter your name</small></span></label>
	                            <input name="cf_name" id="name" type="text">
	                        </li>
	                        <li>
	                            <label>E-mail: <span id="error-email" class="error hidden rounded"><small>Enter a valid e-mail ID</small></span></label>
	                            <input name="cf_email" id="email" type="text">
	                        </li>
	                        <li>
	                            <label>Message: <span id="error-message" class="error hidden rounded"><small>Enter your message</small></span></label>
	                            <textarea name="cf_message" id="message" rows="4" cols="35"></textarea>
	                        </li>
	                        <li>
	                            <input class="send" value="Send" name="submit" id="submit" type="submit">
	                        </li>
	                    </ul>
	                </form>
	                <div id="contactinfo">
	                    <h3>Information</h3>
	                    <p>Address line 1, line 2, City, CH, 000123</p>
	                    <p class="phone">18610847758</p>
	                    <p class="email"><a href="mailto:yiluoAK_47@163.com">yiluoAK_47@163.com</a></p>
	                </div>
	            </li>
	        </ul>
	    </div>
	</div>
	    
	</div>
  </body>
</html>
