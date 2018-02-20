<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>首页左侧导航</title>
  </head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

    /* 按照权限登录时，隐藏树的模块  */
	$(function(){
		var arr0 = $("#parentCode").val();
		// alert(arr0);
		var arr=arr0.split(",");
		for(var i=0;i < arr.length;i++){
			var v=document.getElementById(arr[i]);
			v.style.visibility="hidden";
			v.style.height="0";
		}
	});

	
</script>

  <body id="bg">
  	<!-- 先放入jsp中，在通过id在js中获取 -->
    <input type="hidden" id="parentCode" value="${rightUrl}">
    <input type="hidden" id="exitid" value="${userId}">
    	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="${pageContext.request.contextPath}/component/main.jsp" target="main">
			<div class="line" >
					<img src="${pageContext.request.contextPath}/img/coin01.png" />&nbsp;&nbsp;首页
			</div>
			</a>
			<dl class="system_log" id="1">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/img/coin03.png" />
					<img class="icon2" src="${pageContext.request.contextPath}/img/coin04.png" /> 营销管理
					<img class="icon3" src="${pageContext.request.contextPath}/img/coin19.png" />
					<img class="icon4" src="${pageContext.request.contextPath}/img/coin20.png" />
				</dt>
				<dd  id="11">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a class="cks" href="${pageContext.request.contextPath}/MarketingController/chanceList.action" target="main">销售机会</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
				<dd id="12"><!-- ${pageContext.request.contextPath}/planList.action -->
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a class="cks" href="${pageContext.request.contextPath}/planList.action" target="main">客户开发</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log" id="2">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/img/coin05.png" />
					<img class="icon2" src="${pageContext.request.contextPath}/img/coin06.png" /> 客户管理
					<img class="icon3" src="${pageContext.request.contextPath}/img/coin19.png" />
					<img class="icon4" src="${pageContext.request.contextPath}/img/coin20.png" />
				</dt>
				<dd id="21">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a class="cks" href="${pageContext.request.contextPath}/listAllCustomers.action" target="main">客户信息管理</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
				<dd id="22">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a class="cks" href="${pageContext.request.contextPath}/listAllActivity.action" target="main">交往记录管理</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log" id="3">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/img/coin10.png" />
					<img class="icon2" src="${pageContext.request.contextPath}/img/coin09.png" /> 统计报表
					<img class="icon3" src="${pageContext.request.contextPath}/img/coin19.png" />
					<img class="icon4" src="${pageContext.request.contextPath}/img/coin20.png" />
				</dt>
				<dd id="41">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a href="${pageContext.request.contextPath }/findCustomerAndOrderDetail.action" target="main" class="cks">客户贡献统计</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
				<dd id="42">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a href="${pageContext.request.contextPath }/findAllCustomersForExport.action" target="main" class="cks">客户信息统计</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
				<dd id="43">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a href="${pageContext.request.contextPath }/findAllServiceForExport.action" target="main" class="cks">客户服务统计</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log" id="4">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/img/coin14.png" />
					<img class="icon2" src="${pageContext.request.contextPath}/img/coin13.png" /> 系统管理
					<img class="icon3" src="${pageContext.request.contextPath}/img/coin19.png" />
					<img class="icon4" src="${pageContext.request.contextPath}/img/coin20.png" />
				</dt>
				<dd id="61">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a href="${pageContext.request.contextPath}/SystemController/userList.action" target="main" class="cks">用户管理</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
				<dd id="62">
					<img class="coin11" src="${pageContext.request.contextPath}/img/coin111.png" />
					<img class="coin22" src="${pageContext.request.contextPath}/img/coin222.png" />
					<a href="${pageContext.request.contextPath}/SystemController/editPwdPage.action" target="main" class="cks">密码修改</a>
					<img class="icon5" src="${pageContext.request.contextPath}/img/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
    
  </body>
</html>
