<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/19
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改管理员密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>

<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="${pageContext.request.contextPath}/img/coin02.png" />
            <span>
				<a href="${pageContext.request.contextPath}/component/main.jsp">首页</a>&nbsp;-&nbsp;
				<a href="#">密码修改</a>&nbsp;
            </span>
        </div>
    </div>
    <div class="page ">
        <div class="banneradd bor" align="center">
            <div class="baTopNo">
                <span>用户密码修改</span>
            </div>

            <!-- 校验失败信息提示  -->
            <div style="color: red">
                <c:if test="${userErrors!=null}">
                    <c:forEach var="error" items="${userErrors}">
                        ${error.defaultMessage }<br/>
                    </c:forEach>
                </c:if>
                <c:if test="${oldpwderror!=null}">
                    ${oldpwderror}<br/>
                </c:if>
            </div>

            <form name="form" action="${pageContext.request.contextPath }/SystemController/editPwd.action" method="post">
                <div class="baBody">
                    <div class="bbD">
                        <input type="hidden" class="input3" name="id" value="${userId}"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：<input type="text" class="input3" name="name"
                                                                       value="${userName}" disabled/>
                    </div>
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;旧密码：<input type="password" class="input3" name="oldPassword" />
                    </div>
                    <p style="color: red">
                        <!--密码校验错误信息-->
                        ${editPwdErr}
                    </p>
                    <div class="bbD">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：<input type="password" class="input3" name="newPassword" />
                    </div>
                    <div class="bbD">
                        <p class="bbDP">
                            <button class="btn_ok btn_yes" type="submit" >修改</button>
                            <button class="btn_ok btn_no" type="reset">重置</button>
                        </p>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>

