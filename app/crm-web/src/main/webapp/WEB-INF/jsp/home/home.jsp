<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  		<title>首页-客户关系管理系统</title>
  </head>
  <frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0"> 
  <frame src="${pageContext.request.contextPath}/jsp/home/head.jsp" name="headmenu" id="mainFrame" title="mainFrame"><!-- 引用头部 -->
  <!-- 引用左边和主体部分 --> 
  <frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" frameborder="no" border="0"> 

	<frame src="${pageContext.request.contextPath}/jsp/home/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
	<frame src="${pageContext.request.contextPath}/jsp/home/main.jsp" name="main" scrolling="yes" noresize="noresize"id="rightFrame" title="rightFrame">
	</frameset>
</frameset>
  
</html>
