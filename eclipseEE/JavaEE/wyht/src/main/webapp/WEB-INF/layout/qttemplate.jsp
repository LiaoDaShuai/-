<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" href="/wyht/img/logo-ss-p.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/wyht/img/logo-ss-p.ico"
	type="image/x-icon" />
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" href="/wyht/css/qtcss/bootstrap.min.css">
<link rel="stylesheet" href="/wyht/css/list.css" />
<link rel="stylesheet" href="/wyht/css/qtcss/basic.css">
<link rel="stylesheet" href="/wyht/css/qtcss/index.css">
<!--弹出框的插件-->
<link rel="stylesheet" href="/wyht/css/sweetalert2.min.css" />
<!-- layui样式 -->
<link rel="stylesheet" href="/wyht/layui/css/layui.css">

<script src="/wyht/js/jquery-3.2.1.min.js"></script>
<script src="/wyht/js/qtjs/bootstrap.min.js"></script>
<script src="/wyht/js/qtjs/basic.js"></script>
<script src="/wyht/js/qtjs/index.js"></script>
<script type="text/javascript" src="/wyht/js/sweetalert2.min.js"></script>
<script type="text/javascript" src="/wyht/dwr/engine.js"></script>
<script type="text/javascript" src="/wyht/dwr/util.js"></script>
<script type="text/javascript" src="/wyht/dwr/interface/industryController.js"></script>
<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
<script type="text/javascript" src="/wyht/dwr/interface/qtController.js"></script>
<!-- 滚动条插件 -->
<script type="text/javascript" src="/wyht/js/qtjs/jquery.nicescroll.min.js"></script>
<!--layui插件-->
<script type="text/javascript" src="/wyht/layui/layui.js"></script>
<style>
/*加载动画*/
.loader {
    position: fixed;
    left: 50%;
    top: 50%;
    margin: -0.2em 0 0 -0.2em;
    text-indent: -9999em;
    border-top: 0.3em solid rgba(0, 0, 0, 0.1);
    border-right: 0.3em solid rgba(0, 0, 0, 0.1);
    border-bottom: 0.3em solid rgba(0, 0, 0, 0.1);
    border-left: 0.3em solid #555;
    -moz-transform: translateZ(0);
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    -moz-animation: loader 300ms infinite linear;
    -webkit-animation: loader 300ms infinite linear;
    animation: loader 300ms infinite linear;
    -moz-transition: all 500ms ease;
    -o-transition: all 500ms ease;
    -webkit-transition: all 500ms ease;
    transition: all 500ms ease;
}

.loader,
.loader:after {
    border-radius: 50%;
    width: 2em;
    height: 2em;
}

.curtain {
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    background-color: white;
    -moz-transition: all 600ms ease;
    -o-transition: all 600ms ease;
    -webkit-transition: all 600ms ease;
    transition: all 600ms ease;
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    z-index: 0;
    overflow: hidden;
}

@-webkit-keyframes loader {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

@-moz-keyframes loader {
    0% {
        -moz-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100% {
        -moz-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

@keyframes loader {
    0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}

.is-loading {
    overflow: hidden;
}

.is-loading .curtain {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    z-index: 99;
}

.is-loading .loader {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
} /*加载动画结束*/
</style>
<script>
window.onload=function(){
	  
    $('body').removeClass('is-loading');  
}
</script>
</head>
<body class="is-loading">
	<div class="curtain">
	    <div class="loader">
	        loading...
	    </div>
	</div>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="floor" />
	<script src="/wyht/js/classie.js"></script>
	<script src="/wyht/js/modalEffects.js"></script>
</body>
</html>