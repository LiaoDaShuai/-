<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/autoController.js"></script>
<style>
.maindiv{
overflow:hidden;
}
.menu{
	min-height:40px;
	font-size:18px!important;
	padding:8px 0 0 10px; 
	border:1px solid #e6e6e6;
	cursor: pointer;
}	
.submenu{
	min-height:40px;
	max-width:98.5%!important;
	padding:10px 0 0 10px;
	margin:0 0 20px 20px;
	background-color: #ebebeb;
}
.permname{
	float:left;
	margin:0 20px 20px 40px;
}
.spanname{
	margin-left:22px;
}
.main-icon{
float:right;
margin-right:30px;
}
</style>
<script src="/wyht/js/index/auth.js"></script>
</head>
<body>
<div class="container col-sm-11 container-bianju" style="margin-bottom: 20px;">
		<div class="row header">
            <div class="col-sm-12">管理员<span class="c-red">${user.userName }</span>的权限设置</div>
        </div>
        <div class="hr-solid"></div>
		<c:forEach items="${menuAll }" var="menu">
			<div class="layui-form maindiv" >
				<div class="col-sm-12">
				<div class="menu col-sm-12"><i class="${menu.menuIcon }" style="margin-right:10px"></i>${menu.menuName }<span class="main-icon"><i class="fa fa-chevron-circle-down">
				</i></span></div>
 				<ul>
 					<c:forEach items="${menu.permlist }" var="perm"> 
						<c:choose>
						<c:when test="${perm.permIsshow==1 }">
							<li><div class="col-sm-8 submenu layui-input">
							<c:choose>
							<c:when test="${fn:contains(myperm,perm.permName) }">
							<input type="checkbox" checked="checked" class="sb${perm.permMenuId }${perm.permOrder}" value="${perm.permId }" lay-filter="subMenu">
							</c:when><c:otherwise>
							<input type="checkbox" lay-filter="subMenu" class="sb${perm.permMenuId }${perm.permOrder}" value="${perm.permId }">
							</c:otherwise>
							</c:choose>
							<span class="spanname">${perm.permName }</span></div></li>
						</c:when>
						<c:otherwise>
							<li><div class="permname">
							<c:choose>
							<c:when test="${fn:contains(myperm,perm.permName) }">
								<input type="checkbox" checked="checked" class="pm${perm.permMenuId }${perm.permOrder}" lay-filter="permName" value="${perm.permId }">
							</c:when><c:otherwise>
								<input type="checkbox" lay-filter="permName" class="pm${perm.permMenuId }${perm.permOrder}" value="${perm.permId }">
							</c:otherwise>
							</c:choose>
								<span class="spanname">${perm.permName }</span>
							</div></li>
						</c:otherwise>
							</c:choose>
					</c:forEach>
 				</ul>	
				</div>
 				</div>		  
		</c:forEach>
	<input type="hidden" name="userId" value="${user.userId }">
	</div>
</body>
</html>