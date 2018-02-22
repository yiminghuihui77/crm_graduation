<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/22
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加交往记录</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manhuaDate.1.0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/manhuaDate.1.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $(function (){
        $("input.mh_date").manhuaDate({
            Event : "click",//可选
            Left : 0,//弹出时间停靠的左边位置
            Top : -16,//弹出时间停靠的顶部边位置
            fuhao : "-",//日期连接符默认为-
            isTime : false,//是否开启时间值默认为false
            beginY : 1949,//年份的开始默认为1949
            endY :2100//年份的结束默认为2049
        });

    });
</script>
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="${pageContext.request.contextPath}/img/coin02.png" />
            <span>
                <a href="${pageContext.request.contextPath}/component/main.jsp">首页</a>&nbsp;-&nbsp;
                <a href="#">客户管理</a>&nbsp;-
            </span>&nbsp;添加交往记录
        </div>
    </div>

    <div class="page">
        <!-- topic页面样式 -->
        <div class="topic">
            <div class="conform">
                <form name="eidtChangeForm" action="${pageContext.request.contextPath}/ClientController/addActivity.action" method="post">
                    <!-- topic表格 显示 -->
                    <div class="conShow" align="center">
                        <table border="1" width="80%" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td class="tdColor">交往日期</td>
                                <td class="tdColor">交往地点</td>
                                <td class="tdColor">详细描述</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="cfD">
                                        <input class="vinput mh_date" type="text" readonly="readonly" name="date" />
                                    </div>
                                </td>
                                <td>
                                    <input type="text" name="place"/>
                                </td>
                                <td>
                                    <input type="text" name="activityDesc"/>
                                </td>
                            </tr>
                        </table>
                        <input class="addA addA1" type="submit" value="添加" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>



