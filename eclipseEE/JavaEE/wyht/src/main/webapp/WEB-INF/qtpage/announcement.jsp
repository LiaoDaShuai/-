<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>启源物业管理系统</title>
</head>
<body>
<div id="content">
    <div id="banner">
        <div style="background:url(/wyht/img/qtimg/c4.jpg)"></div>
    </div>

   <div class="nav">
            <div class="wrap">
                <div class="crumbs">
                    <a href="index.html">首页</a>
                    <a class="on">公告汇总</a>
                </div>
            </div>
        </div>
	<div class="col-sm-7 col-sm-offset-5" style="font-size: 30px;">公告汇总</div>
       <div id="main" class="clearfix g-wrap col-sm-10 col-sm-offset-1">
            <div class="link-block">
            <c:choose>
			<c:when test="${!empty annall }">
            	<c:forEach items="${annall }" var="ann">
            	<a href="/wyht/qt/showann/${ann.annId }">
                	<div class="date-block">
                    	<span class="day">${ann.annDate.date }</span>
                        <span class="month" >${ann.annDate.month+1  }</span><br/>${ann.addyear }
                    </div>
                    <div class="summary">
                    	<h1>${ann.annName }
                    		<c:if test="${ann.annZhiding==1 }">
                    		<font style="color:red;padding:0 0 0 80px;">置顶</c:if>
                    		</font></h1>
                       <h3>发布者: 启源物业 
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览次数: ${ann.annCount }</h3>
                       <p>${ann.annContext }</p>
                    </div>
                </a>
                </c:forEach>
                </c:when>
				<c:otherwise>
						<div style="text-align: center;font-size:26px;font-weight:600px;margin:20px auto;color: #746969;">
							暂无公告信息
						</div>
				</c:otherwise>
		</c:choose>
                <input title="点击查看更多" onclick="javascript:window.location.href='/wyht/qt/ggallload'" class="more" style="margin-bottom:20px;" type="button">
                <!--<div class="load">加载更多</div>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>