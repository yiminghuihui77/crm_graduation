<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/20
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>销售机会</title>
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
                <a href="${pageContext.request.contextPath}/MarketingController/chanceList.action">销售管理</a>&nbsp;-
            </span>&nbsp;销售机会
        </div>
    </div>

    <div class="page">
        <!-- topic页面样式 -->
        <div class="topic">
            <div class="conform">
                <form name="eidtChangeForm" action="${pageContext.request.contextPath}/MarketingController//editChance.action" method="post">
                    <!-- topic表格 显示 -->
                    <div class="conShow" align="center">
                        <table border="1" width="80%" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td class="tdColor">序号</td>
                                <td class="tdColor">机会来源</td>
                                <td class="tdColor">客户名称</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="id" value="${chance.id}"/>
                                    <input type="text" name="id" value="${chance.id}" disabled/>
                                </td>
                                <td>
                                    <input type="text" name="source" value="${chance.source}" />
                                </td>
                                <td>
                                    <input type="text" name="cusName" value="${chance.cusName}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdColor">客户电话</td>
                                <td class="tdColor">成功几率(%)</td>
                                <td class="tdColor">机会描述</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" name="phone" value="${chance.phone}" />
                                </td>
                                <td>
                                    <input type="text" name="successRate" value="${chance.successRate}" />
                                </td>
                                <td>
                                    <input type="text" name="chanceDesc" value="${chance.chanceDesc}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdColor">创建主管</td>
                                <td class="tdColor">指派经理</td>
                                <td class="tdColor">状态</td>
                            </tr>
                            <tr>
                                <td>
                                    <select name="createId">
                                        <option value="0" >-请选择创建主管-</option>
                                        <c:forEach var="saleMan" items="${saleMans}">
                                            <option value="${saleMan.id}" <c:if test="${saleMan.id == chance.createId}">selected</c:if>>${saleMan.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select name="dueId">
                                        <option value="0" >-请选择指派经理-</option>
                                        <c:forEach var="cusMan" items="${cusMans}">
                                            <option value="${cusMan.id}" <c:if test="${cusMan.id == chance.dueId}">selected</c:if>>${cusMan.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select name="status">
                                        <option value="0" <c:if test="${chance.status==0}">selected</c:if>>未指派</option>
                                        <option value="1"<c:if test="${chance.status==1}">selected</c:if>>已指派</option>
                                    </select>
                                </td>

                            </tr>

                        </table>
                        <input class="addA addA1" type="submit" value="保存" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>


