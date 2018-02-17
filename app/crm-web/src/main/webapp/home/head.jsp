<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>头部</title>
  </head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
	$(function exitCheck(){
		var id = $("#exitid").val();
	    var params = {userid:id};
		$.post("/CRM_SAN/UserAjax",params,function(data){
			if(data==1){
				alert("此用户名已退出，请重新登录！");
				$("#exitBtn").trigger("click");
			} 
			if(data==2){
				alert("您的用户名在其他设备上登录，被迫下线！");
				$("#exitBtn").trigger("click");
			} 
			if(data==3){
				alert("您的用户名状态已改变，请重新登录！");
				$("#exitBtn").trigger("click");
			} 
		    if(data==4){
				alert("您的角色状态已改变，请重新登录！");
				$("#exitBtn").trigger("click");
			} 
			
		},"text");
		setTimeout(exitCheck,5000);	
	});
	

	
</script>

  <body>
  	<form name="form" style="visibility: hidden;" method="post">
  		<input type="hidden" id="exitid" name="userid"  value="${userid}">
  	</form>
  	<!-- 头部 -->
	<div class="head">
		<div class="headL">
		    <img id="biaoti" class="headLogo" src="${pageContext.request.contextPath}/img/biaoti1.png" />
			<%-- <img class="headLogo" src="${pageContext.request.contextPath}/img/headLogo.png" />  --%>
		</div>
		<div class="headR">
			<p class="p1">
				您好，${username}
			</p>
			<p class="p2">
			   <%--  <p>上次登录IP：${crmlogin.loginIp} 本次登录IP：${loginip} </p> --%>
			    <p>上次登录时间：<fmt:formatDate value="${crmlogin.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p> 
				<p id="show">
			</p>
		</div>
		        <a class="yyq" id="exit" href="${pageContext.request.contextPath}/SystemController/exitJsp.action" target="main">退出</a>
				<a href="${pageContext.request.contextPath}/SystemController/login0.action" target="_top" >
				<button style="visibility: hidden;" id="exitBtn"></button></a> 
	</div>
	
  </body>
  <script type="text/javascript">
  		$(function showTime(){
  			var objDate = new Date();
			var year = objDate.getFullYear();
			var month = objDate.getMonth()+1;
			var date = objDate.getDate();
			var hours = objDate.getHours();
			var minutes = objDate.getMinutes();
			var seconds = objDate.getSeconds();
			var day = objDate.getDay();
			
			if(month<10){ month="0"+month;}
			if(date<10){ date="0"+date;}
			if(hours<10){ hours="0"+hours;}
			if(minutes<10){ minutes="0"+minutes;}
			if(seconds<10){ seconds="0"+seconds;}
			
			switch(day){
				case 1:day="一";break;
				case 2:day="二";break;
				case 3:day="三";break;
				case 4:day="四";break;
				case 5:day="五";break;
				case 6:day="六";break;
				case 0:day="日";break;
				default:day="error";break;
			}
			
			document.all.show.innerHTML=year+"年"+month+"月"+date+"日"+" "+hours+":"+minutes+":"+seconds+" "+"星期"+day;
			//每隔一秒刷新一次
			var timeId = setTimeout(showTime,1000);
  		
  		});
  
  </script>
</html>

