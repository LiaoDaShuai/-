<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业系统</title>
</head>
<body>
<section id="main">
	<!-- 侧边栏 -->
    <aside id="sidebar" class="toggled">
                <ul class="main-menu">
                	<c:forEach items="${sessionScope.menulist}" var="menu">
                		<li class="sub-menu">
                        <a href="#">
                            <i class="${menu.menuIcon }"></i>
                            <span class="menu-title">${menu.menuName }</span>
                            <i class="fa fa-angle-left pull-right"></i>
                        </a>
                        <ul style="display:none">
                        	<c:forEach items="${menu.permlist }" var="perm">
                        		 <li><a href="/wyht${perm.permUrl }">${perm.permName }</a></li>
                        	</c:forEach>
                        </ul>
                    	</li>
					</c:forEach>
                </ul>
    </aside>
</section>
</body>
</html>