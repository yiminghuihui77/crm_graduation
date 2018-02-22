<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/22
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
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
    <title>交往记录列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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

        //删除交往记录提示框
        $(".delLink").click(function(event){
            var message=window.confirm("您确认删除该交往记录吗?");
            if(!message)
            {
                event.preventDefault();
            }
        });

    });

    function queryByDate(){
        document.changeForm.action="${pageContext.request.contextPath}/ClientController/queryByDate.action";
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
				</span>&nbsp;交往记录管理
        </div>
    </div>


    <div class="page">
        <!-- topic页面样式 -->


        <div class="topic">
            <div class="conform">
                <form name="changeForm" action="${pageContext.request.contextPath}/ClientController/queryByDate.action" method="post">
                    <div class="cfD">
                            时间段：<input class="vinput mh_date" type="text" readonly="readonly" name="startDate"/>
                            &nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                            <input class="vinput mh_date" type="text" readonly="readonly" name="endDate"/>
                        <input class="addA addA1" type="button" value="查询" onclick="queryByDate()"/>
                    </div>
                </form>
                <!--添加交往记录-->
                <div class="add">
                    <a class="addA addA1" href="${pageContext.request.contextPath }/ClientController/addActivityPage.action">添加交往记录</a>
                </div>
                <!-- topic表格 显示 -->
                </br>

                <table border="1" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="tdColor tdC">编号</td>
                        <td class="tdColor">交往日期</td>
                        <td class="tdColor">交往地点</td>
                        <td class="tdColor">详细描述</td>
                        <td class="tdColor">相关操作</td>
                    </tr>

                    <c:forEach items="${activityList}" var="activity">
                        <tr>
                            <td>${activity.id}</td>
                            <td><fmt:formatDate value="${activity.date}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                            <td>${activity.place}</td>
                            <td>${activity.activityDesc}</td>
                            <td>
                                <a href="${pageContext.request.contextPath }/ClientController/editActivityPage.action?id=${activity.id}">
                                    <img class="operation" src="${pageContext.request.contextPath}/img/update.png">
                                </a>
                                <a class="delLink" href="${pageContext.request.contextPath }/ClientController/removeActivity.action?id=${activity.id}">
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

