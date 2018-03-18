<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" href="/wyht/img/logo-ss-p.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/wyht/img/logo-ss-p.ico" type="image/x-icon" />
<title>启源后台管理系统</title>
	<!-- 图标样式    -->
    <link rel="stylesheet" href="/wyht/css/font-awesome.min.css">
    <!-- bootrstrap样式 -->
    <link rel="stylesheet" href="/wyht/css/bootstrap.min.css">
    <!--首页样式-->
    <link rel="stylesheet" href="/wyht/css/index.css">
    <!--模块集合样式-->
    <link rel="stylesheet" href="/wyht/css/list.css">
    <!--弹出框的插件-->
    <link rel="stylesheet" href="/wyht/css/sweetalert2.min.css" />

    <!--3.2.1的jq-->
    <script src="/wyht/js/jquery-3.2.1.min.js"></script>
    <!--全部用到的js代码-->
    <script src="/wyht/js/index.js"></script>
    <!--bootstrap插件-->
    <script src="/wyht/js/bootstrap.min.js"></script>
    <!-- jq 滚动条插件 -->
    <script src="/wyht/js/jquery.slimscroll.min.js"></script>
    <!--弹出框插件js-->
    <script src="/wyht/js/sweetalert2.min.js"></script>
	<script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/autoController.js"></script>
    <script src="/wyht/js/index/login.js"></script>
    <!-- 滚动条插件 -->
	<script type="text/javascript" src="/wyht/js/qtjs/jquery.nicescroll.min.js"></script>
    <style type="text/css">
    	.noradius{
    	border-radius:0;}
    	.m-21{
    		margin:12px;
    	}
    </style>
    <script type="text/javascript">
	$(function(){
		$("body").bind('keyup',function(event) { 
			  if(event.keyCode==13){ 
				  isubmit(document.loginform);
			  }   
		});
		$("body").niceScroll({
			 scrollspeed: 70,// 滚动速度
		        mousescrollstep: 38,// 鼠标滚轮的滚动速度
		        cursorwidth: '8px',//宽度
		        cursorborder: 0,// CSS方式定义滚动条边框
		        cursorcolor: '#CFCFCF',//滚动条颜色
		        cursorborderradius: 0,
		        autohidemode: false,//不隐藏滚动条
		        background:"#999999",
		        horizrailenabled: false// nicescroll可以管理水平滚动，false不可以
		});
	});
</script>
</head>
<body>
<header id="header">
        <ul class="header-inner">
          <li class="logo">
                <a href="#"><img src="${pageContext.request.contextPath }/img/logo.jpg" alt=""></a>
            </li>
            <li class="pull-right">
                <h2 style="padding:10px 30px;color:#fff;font:华文彩云">启源物业后台管理系统</h2>
            </li>
        </ul>
    </header>
<div class="login-bg"></div>
<div class="login-register">
    <div class="login-form login">
        <div class="login-tab">
            <a href="#" class="active">电脑版</a>
            <a href="#">移动版</a>
        </div>
        <div class="pwd-login">
       	 	<form action="/wyht/auth/logins" name="loginform" method="post">
            <div class="input-group msg-error m-b-10" >
                    <div class="">
                        <i class="fa fa-minus-circle"></i>
                        <span>请输入账户名和密码</span>
                    </div>
            </div>
            <div class="input-group m-20">
                    <span class="input-group-addon noradius"><i class="fa fa-user "></i></span>
                    <input type="text" name="userName" class="form-control noradius" id="user" placeholder="用户名/手机号码/邮箱">
            </div>
            <div class="input-group m-20">
                    <span class="input-group-addon noradius"><i class="fa fa-lock"></i></span>
                    <input type="password" name="userPass" class="form-control noradius" id="pwd" placeholder="密码">
            </div>
            <div class="input-group m-20" >
                    <input type="text" name="yzm" class="form-control" style="width:50%;padding-right:0;" id="yzm" placeholder="验证码">
                    <img src="" id="getYzm" style="margin:10px 0 0 10px;" title="点击刷新">
            </div>
            <div class="login-nav">
                <div class="pull-left">
                    <a href="#">忘记密码？</a>
                </div>
                <div class="pull-right">
                    <a href="#" id="register">我要注册</a>
                </div>
            </div>
            <div>
                <button type="button" onclick="isubmit(this.form)" class="btn btn-success" style="width: 100%" id="dl">登陆</button>
            </div>
            </form>
            <div class="three-login m-t-20">
                <h4></h4>                 
            </div>
            <div class="qq-weixin">
            <ul>
                    <li>
                        <a href="#" class="qq"><i class="fa fa-qq"></i></a>
                    </li>
                    <li>
                        <a href="#" class="weixin"><i class="fa fa-weixin"></i></a>
                    </li>
                </ul>
            </div>       
        </div>
    </div>
    <div class="login-form register" >
        <div class="fh"><i class="fa fa-angle-left pull-right"></i></div>
        <form action="/wyht/auth/register" method="post">
        <div class="lc-block toggled pwd-login">
            <div class="input-group msg-error m-b-10" >
                    <div class="">
                        <i class="fa fa-minus-circle"></i>
                        <span>请输入账户名和密码</span>
                    </div>
            </div>
            <div class="input-group m-21">
                <span class="input-group-addon noradius"><i class="fa fa-user"></i></span>
                <input type="text" name="userName" class="form-control noradius" placeholder="用户名(测试)">
            </div>
            <div class="input-group m-21">
                <span class="input-group-addon noradius"><i class="fa fa-user"></i></span>
                <input type="text" name="userMail" class="form-control noradius" placeholder="邮箱(测试)">
            </div>
            <div class="input-group m-21">
                <span class="input-group-addon noradius"><i class="fa fa-user"></i></span>
                <input type="text" name="userPhone" class="form-control noradius" placeholder="手机号(测试)">
            </div>
            <div class="input-group m-21">
                <span class="input-group-addon noradius"><i class="fa fa-lock"></i></span>
                <input type="password" name="userPass" class="form-control" placeholder="设置密码(测试)">
            </div>
            <div class="input-group m-21">
                <span class="input-group-addon noradius"><i class="fa fa-unlock-alt"></i></span>
                <input type="password" class="form-control" id="qued" placeholder="确认密码(测试)">
            </div>
<!--             <div class="input-group m-20"> -->
<!--                 <span class="input-group-addon"><i class="fa fa-comment-o"></i></span> -->
<!--                 <input type="text" class="form-control" placeholder="发送验证码" style="width: 60%;"> -->
<!--                 <button class="btn btn-primary" style="margin:5px 10px;">发送验证码</button> -->
<!--             </div> -->
            <div class="checkbox">
                <label>
                    <input type="checkbox" checked >
                </label>
                <i class="input-helper"></i>
                我同意《 <a href="#">启源服务协议</a> 》。
            </div>
            <div class="m-t-20">
                <input type="button" onclick="iregin(this.form)" value="立即注册" class="btn btn-block btn-lg btn-success waves-effect">
            </div>
        </div>
        </form>
    </div>
  </div>
</body>
</html>