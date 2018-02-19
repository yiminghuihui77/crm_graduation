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
    <title>用户列表</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="${pageContext.request.contextPath}/img/coin02.png" />
            <span>
				<a href="${pageContext.request.contextPath}/component/main.jsp" target="main">首页</a>&nbsp;-&nbsp;
                <a href="${pageContext.request.contextPath}/SystemController/userList.action">用户管理</a>&nbsp;-
				</span>&nbsp;用户信息查询
        </div>
    </div>
    <div class="page">
        <!-- banner页面样式 -->
        <div class="banner">
            <div class="add">
                <a class="addA" href="${pageContext.request.contextPath }/SystemController/addUserPage.action">添加用户&nbsp;&nbsp;+</a>
            </div>
            <!-- banner 表格 显示 -->
            <div class="banShow">
                <table border="1" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td  class="tdColor tdC">用户编号</td>
                        <td  class="tdColor">用户姓名</td>
                        <td  class="tdColor">用户密码</td>
                        <td  class="tdColor">用户状态</td>
                        <td  class="tdColor">角色名称</td>
                        <td  class="tdColor">职位权限</td>
                        <td class="tdColor">相关操作</td>
                    </tr>
                    <!-- 迭代客户集合 -->
                    <c:forEach var="user" items="${normalUsers}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.password}</td>
                            <td>${user.status}</td>
                            <td>${user.roleName}</td>
                            <td>${user.rightUrl}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/SystemController/editUserPage.action?id=${user.id}" target="main">
                                    <img class="operation" src="${pageContext.request.contextPath }/img/update.png">
                                </a>
                                <a href="${pageContext.request.contextPath}/SystemController/removeUser.action?id=${user.id}" target="main">
                                    <img class="operation delban" src="${pageContext.request.contextPath }/img/delete.png">
                                </a>
                            </td>
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
