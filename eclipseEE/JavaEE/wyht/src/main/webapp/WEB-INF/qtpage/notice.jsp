<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业管理系统</title>
</head>
<body>
	<div id="content">
		<div id="banner">
			<div style="background: url(/wyht/img/qtimg/c4.jpg)"></div>
		</div>

		<div class="nav">
			<div class="wrap">
				<div class="crumbs">
					<a href="index.html">首页</a> <a class="on">通知汇总</a>
				</div>
			</div>
		</div>
		<div id="main" class="clearfix g-wrap col-sm-10 col-sm-offset-1">
			<div class="link-block">
				<c:choose>
					<c:when test="${!empty messlist }">
						<c:forEach items="${messlist }" var="mess">
							<a href="${mess.mesId }">
								<div class="date-block">
									<span class="day">${mess.mesAdate.date }</span> <span
										class="month">${mess.mesAdate.month+1 }</span><br />${mess.mesyear }
								</div>
								<div class="summary">
									<h1>${mess.mesName }回馈</h1>
									<h3>发送者: 启源物业
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:${mess.mesStatus==0?'未读':'已读' }</h3>
									<p>${mess.mesContext }</p>
								</div>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="text-align: center;font-size:26px;font-weight:600px;margin:20px auto;color: #746969;">
							暂无通知信息
						</div>
					</c:otherwise>
				</c:choose>
				<input title="点击查看更多" class="more" type="button" style="margin-bottom:20px;">
				<!--<div class="load">加载更多</div>-->
			</div>
		</div>
	</div>
</body>
</html>
