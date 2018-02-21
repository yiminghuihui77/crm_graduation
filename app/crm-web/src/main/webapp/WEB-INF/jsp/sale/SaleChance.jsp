<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售机会</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>


<script type="text/javascript">
	$(function(){
     $(".delLink").click(function(event){
       var message=window.confirm("您确认删除该用户信息吗?");
       if(!message)
       {
           event.preventDefault();
       }
     });
  });

    function queryChanceByCusName(){
        // alert("hello");
        document.changeForm.action="${pageContext.request.contextPath}/MarketingController/queryChanceByCusName.action";
        document.changeForm.submit();
    }
</script>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="${pageContext.request.contextPath}/img/coin02.png" />
				<span>
					<a href="${pageContext.request.contextPath}/component/main.jsp">首页</a>&nbsp;-&nbsp;
				    <a href="#">销售管理</a>&nbsp;-
				</span>&nbsp;销售机会
			</div>
		</div>


		<div class="page">
			<!-- topic页面样式 -->


			<div class="topic">
				<div class="conform">
					<form name="changeForm" action="${pageContext.request.contextPath}/MarketingController/queryChanceByCusName.action" method="post">
						<div class="cfD">
						    <input name="cusName" placeHolder="客户名称" style="height: 35px; width: 240px"/>
							<input class="addA addA1" type="button" value="查询" onclick="queryChanceByCusName()"/>
						</div>
					</form>
					<!-- topic表格 显示 -->
					<%--<div class="conShow">--%>
						<div class="add">
							<a class="addA addA1" href="${pageContext.request.contextPath }/MarketingController/addChancePage.action">添加销售机会</a>
						</div>
					<%--</div>--%>
					</br>

					<table border="1" width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td class="tdColor tdC">编号</td>
							<td class="tdColor">机会来源</td>
							<td class="tdColor">客户名称</td>
							<td class="tdColor">客户电话</td>
							<td class="tdColor">成功几率(%)</td>
							<td class="tdColor">机会描述</td>
							<td class="tdColor">创建主管</td>
							<td class="tdColor">指派经理</td>
							<td class="tdColor">状态</td>
							<td class="tdColor">相关操作</td>
						</tr>

						<c:forEach items="${chanceList}" var="chance">
							<tr>
								<td>${chance.id}</td>
								<td>${chance.source}</td>
								<td>${chance.cusName}</td>
								<td>${chance.phone}</td>
								<td>${chance.successRate}</td>
								<td>${chance.chanceDesc}</td>
								<td>${chance.createName}</td>
								<td>${chance.dueName}</td>
								<!--状态-->
								<td>
									<c:if test="${chance.status == 0}">未指派</c:if>
									<c:if test="${chance.status == 1}">已指派</c:if>
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/MarketingController/editChancePage.action?id=${chance.id}">
										<img class="operation" src="${pageContext.request.contextPath}/img/update.png">
								    </a>
									<a class="delLink" href="${pageContext.request.contextPath }/MarketingController/removeChance.action?id=${chance.id}">
										<img class="operation delban" src="${pageContext.request.contextPath}/img/delete.png">
									</a>
								</td>
							</tr>
						</c:forEach>

					</table>

				</div>
				<!-- topic 表格 显示 end-->
			</div>
			<!-- topic页面样式end -->
		</div>

	</div>
</body>
</html>