<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/19
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>新增用户</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- 自定义CSS样式 -->
<style type="text/css">
    tr{height: 40px;text-align: center;}

</style>

<body>

<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="${pageContext.request.contextPath}/img/coin02.png" />
            <span>
                <a href="${pageContext.request.contextPath}/component/main.jsp" target="main">首页</a>&nbsp;-&nbsp;
                <a href="${pageContext.request.contextPath}/SystemController/userList.action">用户管理</a>&nbsp;-
				  </span>&nbsp;添加用户
        </div>
    </div>
    <div class="page ">
        <!-- 上传广告页面样式 -->
        <div class="banneradd bor">
            <div class="baTop">
                <span>添加客户信息</span>
            </div>

            <!-- 校验失败信息提示  -->
            <div style="color: red">
                <c:if test="${customerErrors!=null}">
                    <c:forEach var="error" items="${customerErrors}">
                        ${error.defaultMessage }<br/>
                    </c:forEach>
                </c:if>
            </div>

            <form action="${pageContext.request.contextPath}/SystemController/addUser.action" method="post">
                <table width="80%">
                    <tr>
                        <td>
                            用户姓名:<input type="text" name="name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            用户密码:<input type="password" name="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            确认密码:<input type="password" name="passwordConfirm"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            角色:
                            <select name="roleId">
                                <option value="0">-请选择用户角色-</option>
                                <option value="2">销售主管</option>
                                <option value="3">客户经理</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            状态:
                            <select name="status">
                                <option value="0">-请选择用户状态-</option>
                                <option value="ENABLE">正常</option>
                                <option value="DISABLE">禁止</option>
                            </select>
                        </td>
                    </tr>
                    <tr>

                        <td colspan="2">
                            <input type="submit" value="添加客户"/>
                            <input type="reset" value="重置"/>
                        </td>

                    </tr>
                </table>
            </form>

        </div>

        <!-- 上传广告页面样式end -->
    </div>
</div>

</body>
</html>

