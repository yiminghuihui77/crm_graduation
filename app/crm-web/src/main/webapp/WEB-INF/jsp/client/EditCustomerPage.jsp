<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/22
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/19
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>编辑客户信息</title>
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
                <a href="${pageContext.request.contextPath}/SystemController/userList.action">客户管理</a>&nbsp;-
				  </span>&nbsp;编辑客户信息
        </div>
    </div>
    <div class="page ">
        <!-- 上传广告页面样式 -->
        <div class="banneradd bor">
            <div class="baTop">
                <span>编辑客户信息</span>
            </div>
            <!-- 校验失败信息提示  -->
            <div style="color: red">
                <c:if test="${customerErrors!=null}">
                    <c:forEach var="error" items="${customerErrors}">
                        ${error.defaultMessage }<br/>
                    </c:forEach>
                </c:if>
            </div>
            <form action="${pageContext.request.contextPath}/ClientController/editCustomer.action" method="post">
                <table width="100%">
                    <tr>
                        <td>
                            <!-- 由于设置了文本框禁止编辑，导致数据无法传递   解决办法：添加隐藏域 -->
                            <input type="hidden" name="id" value="${customer.id}"/>
                            编号:<input type="text" name="id" value="${customer.id}" disabled="disabled"/>
                        </td>
                        <td>
                            姓名:<input type="text" name="cusName" value="${customer.cusName}"/>
                        </td>
                        <td>
                            性别:
                            <select name="sex">
                                <option value="男" <c:if test="${customer.sex == '男'}">selected</c:if>>男</option>
                                <option value="女" <c:if test="${customer.sex == '女'}">selected</c:if>>女</option>
                            </select>
                        </td>
                        <td>
                            等级:
                            <select name="cusLevel">
                                <option value="0" >-请选择用户状态-</option>
                                <option value="普通客户" <c:if test="${customer.cusLevel=='普通客户'}">selected</c:if>>普通客户</option>
                                <option value="高级客户" <c:if test="${customer.cusLevel=='高级客户'}">selected</c:if>>高级客户</option>
                                <option value="VIP客户" <c:if test="${customer.cusLevel=='VIP客户'}">selected</c:if>>VIP客户<option>
                            </select>
                        </td>
                        <td>
                            信用度:<input type="text" name="credit" value="${customer.credit}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            电话:<input type="text" name="phone" value="${customer.phone}"/>
                        </td>
                        <td>
                            地区:<input type="text" name="region" value="${customer.region}"/>
                        </td>
                        <td>
                            地址:<input type="text" name="addr" value="${customer.addr}"/>
                        </td>
                        <td>
                            备注:<input type="text" name="memo" value="${customer.memo}"/>
                        </td>
                        <td>
                            <input type="submit" value="提交修改"/>
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


