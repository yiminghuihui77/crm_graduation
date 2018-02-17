<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/15
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>CrmUser列表</title>
</head>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="img/coin02.png" />
            <span>
				<a href="#">首页</a>&nbsp;-&nbsp;
				<a href="#">用户管理</a>&nbsp;-
				</span>&nbsp;用户信息查询
        </div>
    </div>
    <div class="page">
        <!-- banner页面样式 -->
        <div class="banner">
            <div class="add">
                <a class="addA" href="${pageContext.request.contextPath }/forwardToAddJSP.action">添加用户信息&nbsp;&nbsp;+</a>
            </div>
            <!-- banner 表格 显示 -->
            <div class="banShow">
                <table border="1" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td  class="tdColor tdC">用户编号</td>
                        <td  class="tdColor">用户姓名</td>
                        <td  class="tdColor">用户密码</td>
                        <td  class="tdColor">角色编号</td>
                        <td  class="tdColor">标志</td>
                    </tr>
                    <!-- 迭代客户集合 -->
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.password}</td>
                            <td>${user.roleId}</td>
                            <td>${user.flag}</td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <!-- banner 表格 显示 end-->
        </div>
        <!-- banner页面样式end -->
    </div>

</div>
</body>
</html>
