<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>主页面</title>
  </head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>

  <body>

  	<div id="pageAll">
		<div class="page">
			<!-- main页面样式 -->
			<div class="indexL">
				<img class="indexBn" src="${pageContext.request.contextPath}/img/indexBanner.png" /><br>
			</div>
			<!-- main页面样式end -->
		</div>
	</div>
	
	<div class="banDel" id="exit">
		<div class="delete">
			<div class="close">
				<a><img src="${pageContext.request.contextPath}/img/shanchu.png" /></a>
			</div>
			<p class="delP1">确定退出当前用户？</p>
			<p class="delP2">
				<a href="${pageContext.request.contextPath}/SystemController/exit.action" target="_top"  class="ok yes">确定</a>
				<a class="ok no">取消</a>
			</p>
		</div>
	</div>
	
	<div class="banDel" id="updatepwd">
		<div class="delete">
			<div class="close">
				<a href="${pageContext.request.contextPath}/SystemController/home.action" target="_top" >
				<img src="${pageContext.request.contextPath}/img/shanchu.png" /></a>
			</div>
			<p class="delP1">修改密码成功 O(∩_∩)O</p>
			<p class="delP2">
				<a href="${pageContext.request.contextPath}/SystemController/home.action" target="_top" class="ok no">确定</a>
			</p>
		</div>
	</div>

  </body>
  
  <script type="text/javascript">
	$(function(){
		if(${message=="exit"}){
			$("#exit").show();
		}else if(${message=="updatepwd"}){
			$("#updatepwd").show();
		}
	});
	$(".close").click(function(){
  		$(".banDel").hide();
	});
	$(".no").click(function(){
 		$(".banDel").hide();
	});
</script>
</html>
