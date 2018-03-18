<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>页面找不到</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/404.css">
</head>
<body>
<div class="container">
	<h1 id="error">
		<span id="error-code">出错了</span>
		<span id="error-text">NOT<br>FOUND</span>
	</h1>
	<div id="message">
		<p class="ultrabold">${error }</p>
		<p class="error-btn">
            <a class="btnn" href="${pageContext.request.contextPath }/">
		        回到首页
		    </a>
		    <a class="btnn" href="javascript:history.go(-1)">
		        返回上一页
		    </a>
        </p>		
	</div>

</div>
</body>
</html>