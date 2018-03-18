<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<div id="content">
	<div id="banner">
		<div style='background-image: url(/wyht/img/qtimg/c4.jpg);'></div>
	</div>
	<div class="nav">
		<div class="wrap">
			<div class="crumbs">
				<a href="/">首页</a> <a class="on">通知汇总</a> <a class="on">通知详情</a>
			</div>
		</div>
	</div>
	<div id="news-1">
		<div id="main" class="clearfix g-wrap col-sm-10 col-sm-offset-1">
			<div id="left">
				<!-- <div class="headline"
					style="background: url(/wyht/img/qtimg/showann.jpg) no-repeat 0 0;">
				</div> -->
				<div class="news-editor">
					<div class="date-block">
						<span class="day">${mess.mesAdd.date }</span>${mess.mesAdd.month+1 }<br />${ann.mesyear }
					</div>
					<h1>${mess.mesName }</h1>
					<h3>发布者:启源物业&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:&nbsp;${mess.mesStatus==0?'未读':'已读' }</h3>
					<div class="bshare-custom"></div>
					${mess.mesContext  }
					<a href="javascript:history.go(-1);" class="back" style="color:#fff!important;">返回</a>
				</div>
			</div>
			<div id="right">
				<a href="/news/"> <img width="300px"
					src="/wyht/img/qtimg/showann.jpg" alt="物业通知" /></a>
			</div>
		</div>
	</div>
	</div>
</body>
</html>