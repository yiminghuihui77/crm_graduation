<%--
  Created by IntelliJ IDEA.
  User: minghui.y
  Date: 2018/2/15
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CRM系统-登录</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/public.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/page.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>

<body>

<!-- 登录页面头部 -->
<div class="logHead">
    <img src="${pageContext.request.contextPath}/img/logLOGO.png" />
</div>
<!-- 登录页面头部结束 -->

<!-- 登录body -->
<div class="logDiv">
    <img class="logBanner" src="${pageContext.request.contextPath}/img/logBanner.png" />
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登录界面</p>
            <p class="p2">CRM系统用户登录</p>
        </div>
        <!-- 校验失败信息提示  -->
        <div style="color: red">
            <c:if test="${userErrors!=null}">
                <c:forEach var="error" items="${userErrors}">
                    ${error.defaultMessage }&nbsp;&nbsp;
                </c:forEach>
            </c:if>
            <c:if test="${loginerror!=null}">
                ${loginerror}<br/>
            </c:if>
        </div>

        <!-- 输入框 -->
        <form name="form" action="${pageContext.request.contextPath }/SystemController/login.action" method="post">
            <div class="lgD">
                <img class="img1" src="${pageContext.request.contextPath}/img/logName.png" />
                <input type="text" name="name" id="username" value="请输入用户名"/>
            </div>
            <div class="lgD">
                <img class="img1" src="${pageContext.request.contextPath}/img/logPwd.png" />
                <input type="text" name="password" id="password" value="请输入密码" />
                <img id="eye" class="img2" src="${pageContext.request.contextPath}/img/logEye1.png" />
            </div>
            <div class="lgD logD2">
                <input class="getYZM" type="text" id="yzm" name="yzm" value="请输入验证码" />
                <div class="logYZM">
                    <img  src="${pageContext.request.contextPath}/YZM" id="yzmImge" onload="rehref()">
                </div>
                <a href="#" onclick="changeImge()" id="change">换一张</a>
            </div>
            <div class="loginbtn" >
                <input  class="login_btn1" type="button" value="登录" onclick="login()"/>
                <input  class="login_btn1" type="reset" value="重置" />
            </div>
        </form>
    </div>
</div>
<!-- 登录body  end -->

<!-- 登录页面底部 -->
<div class="logFoot">
    <p class="p1">版权所有：crm客户关系管理系统 created by minghui.y on 2018.02.17</p>
</div>
<!-- 登录页面底部end -->

</body>
<script type="text/javascript">
    function changeImge(){
        $("#change").removeAttr("href");
        $("#yzmImge").attr("src","${pageContext.request.contextPath}/YZM?="+new Date().getTime());
    }
    function rehref(){
        $("#change").attr("href","#");
    }

    //1.获得焦点
    $("#username").focus(function(){
        //获得文本的值
        var curVal =$(this).val();
        //如果当前文本的值和默认值值相等则置空
        if(curVal==this.defaultValue){
            $(this).val("");
        }
    });

    //2.失去焦点
    $("#username").blur(function(){
        //获得文本的值
        var curVal =$(this).val();
        //如果文本为空 则显示默认的值
        if($.trim(curVal)==""){
            //设置当前文本为默认值
            $(this).val(this.defaultValue);
        }
    });



    $("#password").focus(function(){
        $("#password").attr("type", "password");
        var curVal =$(this).val();
        if(curVal==this.defaultValue){
            $(this).val("");
        }
    });

    $("#password").blur(function(){
        var curVal =$(this).val();
        if($.trim(curVal)==""){
            $("#password").attr("type", "text");
            $(this).val(this.defaultValue);
        }
    });

    $("#yzm").focus(function(){
        var curVal =$(this).val();
        if(curVal==this.defaultValue){
            $(this).val("");
        }
    });

    $("#yzm").blur(function(){
        var curVal =$(this).val();
        if($.trim(curVal)==""){
            $(this).val(this.defaultValue);
        }
    });

    //显示密码
    $("#eye").mousedown(function(){
        if($("#password").val() != $("#password").defaultValue){
            $("#password").attr("type", "text");
        }
    });
    $("#eye").mouseup(function(){
        if($("#password").val() != $("#password").defaultValue){
            $("#password").attr("type", "password");
        }
    });

    //去除默认值
    function login(){
        var uname = $("#username").val();
        var pwd = $("#password").val();
        var yzmno = $("#yzm").val();
        if(uname=="请输入用户名"){
            $("#username").val("")
        }
        if(pwd=="请输入密码"){
            $("#password").val("");
        }
        if(pwd=="请输入验证码"){
            $("#yzm").val("");
        }
        //提交表单
        document.form.action = "${pageContext.request.contextPath }/SystemController/login.action";
        document.form.submit();
    }

</script>

</html>
