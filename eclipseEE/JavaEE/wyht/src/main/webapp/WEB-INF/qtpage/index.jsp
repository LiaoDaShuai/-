<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>启源物业管理系统</title>
    <style>
    a:hover{
    	text-decoration: none;
    	color:#000;
    }
    </style>
</head>
<body>
<div id="content">
    <div class="box">
        <ul class="banner"></ul>
        <ul class="ctrl-banner"></ul>
        <!--<div class="btn">
            <a class="prev"></a>
            <a class="next"></a>
        </div>-->
        <span class="span-right">></span>
        <span class="span-left"><</span>
    </div>

    <div id="top-nav">
        <div class="left">
            <a href="news.html">
                <img id="aa" src="/wyht/img/qtimg/y1.jpg" alt="" >
            </a>
            <a href="announcement.html">
                <img src="/wyht/img/qtimg/y2.jpg" alt="">
            </a>
        </div>
        <div class="right">
            <a href="Payment.html">
                <img id="aa" src="/wyht/img/qtimg/y3.jpg" alt="" >
            </a>
            <a href="##">
                <img src="/wyht/img/qtimg/y4.jpg" alt="">
            </a>
        </div>
    </div>

    <div class="redian">
        <div class="wrap">

            <div class="notices">
                <div class="text">
                    公告
                </div>
                <ul>
                	<c:forEach items="${annlist }" var="ann">
                		<a href="/wyht/qt/showann/${ann.annId }"><li>[${ann.adddate}]  ${ann.annName }</li></a>
                	</c:forEach>
                </ul>
                <div class="up-down">
                    <a class="up"></a>
                    <a class="down"></a>
                </div>
            </div>

            <div class="box-nav">

            </div>
            <div class="box-brand">
                <img src="/wyht/img/qtimg/y0.jpg" alt="">
            </div>

            <div class="box-nav">
            </div>

        </div>
    </div>
    <div id="bottom-nav">
        <div class="left">
            <a href="standing.html">
                <img id="aa" src="/wyht/img/qtimg/y5.jpg" alt="" >
            </a>
            <a href="##">
                <img src="/wyht/img/qtimg/y6.jpg" alt="">
            </a>
        </div>
        <div class="right">
            <a href="##">
                <img id="aa" src="/wyht/img/qtimg/y7.jpg" alt="" >
            </a>
            <a href="xiaoyuan.html">
                <img src="/wyht/img/qtimg/y8.jpg" alt="">
            </a>
        </div>
    </div>
</div>
<img id="topcontrol" src="/wyht/img/qtimg/topback.png" alt="" style="position: fixed;bottom: 80px;right: 30px;opacity:1;cursor: pointer;display:none;">
</body>
</html>