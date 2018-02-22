<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/21
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客户列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>


<script type="text/javascript">
    $(function(){
        $(".delLink").click(function(event){
            var message=window.confirm("您确认删除该客户信息吗?");
            if(!message)
            {
                event.preventDefault();
            }
        });
    });

    function queryByCusName(){
        document.changeForm.action="${pageContext.request.contextPath}/ClientController/queryByCusName.action";
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
				    <a href="#">客户管理</a>&nbsp;-
				</span>&nbsp;客户信息查询
        </div>
    </div>


    <div class="page">
        <!-- topic页面样式 -->


        <div class="topic">
            <div class="conform">
                <form name="changeForm" action="${pageContext.request.contextPath}/ClientController/queryByCusName.action" method="post">
                    <div class="cfD">
                        <input name="cusName" placeHolder="客户名称" style="height: 35px; width: 240px"/>
                        <input class="addA addA1" type="button" value="查询" onclick="queryByCusName()"/>
                    </div>
                </form>
                <!-- topic表格 显示 -->
                </br>

                <table border="1" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="tdColor tdC">编号</td>
                        <td class="tdColor">姓名</td>
                        <td class="tdColor">性别</td>
                        <td class="tdColor">等级</td>
                        <td class="tdColor">信用度</td>
                        <td class="tdColor">电话</td>
                        <td class="tdColor">地区</td>
                        <td class="tdColor">地址</td>
                        <td class="tdColor">备注</td>
                        <td class="tdColor">交往记录</td>
                        <td class="tdColor">相关操作</td>
                    </tr>

                    <c:forEach items="${customerList}" var="customer">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.cusName}</td>
                            <td>${customer.sex}</td>
                            <td>${customer.cusLevel}</td>
                            <td>${customer.credit}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.region}</td>
                            <td>${customer.addr}</td>
                            <td>${customer.memo}</td>
                            <td>
                                <a href="${pageContext.request.contextPath }/ClientController/activityDetail.action?id=${customer.id}">
                                    <img class="operation delban" src="${pageContext.request.contextPath}/img/order.gif" height="25px" width="25px">
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath }/ClientController/editCustomerPage.action?id=${customer.id}">
                                    <img class="operation" src="${pageContext.request.contextPath}/img/update.png">
                                </a>
                                <a class="delLink" href="${pageContext.request.contextPath }/ClientController/removeCustomer.action?id=${customer.id}">
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
