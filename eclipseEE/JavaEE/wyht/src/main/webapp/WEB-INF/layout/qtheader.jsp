<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<script>
		$(function(){
			$(".yanzhenlogin").click(function(e){
	    		if("${sessionScope.owners}"==''){
	    			swal({
	    		        text: "您还未登录！请先登录!",
	    		        type: "info",
	    		        confirmButtonText: '确认',
	    		        confirmButtonColor: '#3fc3ee',
	    		        reverseButtons:true,
	    		        focusCancel:true,
	    		        showCancelButton:true,
	    		        cancelButtonText:'取消',
	    		    }).then(function(){
	    		    	$("#myModal").addClass("md-show")
	    		    });
	    			stopDefault(e);
	    		}
	    	})
	    	$(document).keypress(function (e) {
	    	    // 回车键事件  
	    	    if (e.which == 13) {
	    	        $('.qtlogin"]').click();
	    	    }
	    	});
		});
		//拦截超链接
		function stopDefault( e ) { 
		    if ( e && e.preventDefault ) 
		       e.preventDefault(); 
		   else 
		       window.event.returnValue = false; 
		       
		   return false; 
		}
		function updatepwds(form) {
		    if($("#pass").val()==""||$("#pass").val().length==0){
		 	   sweetAlert({text:'新密码不能为空',type:'warning',timer:1500,showConfirmButton:false});
				   return false;
		    }else if($("#pass").val().length<6){
		    	sweetAlert({text:'新密码必须大于6位',type:'warning',timer:1500,showConfirmButton:false});
				return false;
		    }else if($("#queds").val()==""||$("#queds").val().length==0){
		 	   sweetAlert({text:'确认密码不能为空',type:'warning',timer:1500,showConfirmButton:false});
		 	   return false;
		    }else if($("#pass").val()!=$("#queds").val()){
		 	   sweetAlert({text:'确认密码与密码不相同',type:'warning',timer:1500,showConfirmButton:false});
		 	   return false;
		    }else{
		    	 sweetAlert({
				        text: "密码修改成功，请重新登陆",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				  });
		    	 window.setTimeout(function(){
		 	   		qtController.updatepwd($("#pass").val(),function(){
		 		 	 window.location.reload(); 		 
		 	  		})
		 		},2000);
		    }
		}
    </script>
</head>
<body>
	<div id="header">
		<div class="center">
			<div class="logo">
				<h2>
					<a href="index.html"><img src="/wyht/img/qtimg/logo.jpg"
						alt="启源物业"></a>
				</h2>
			</div>
			<ul id="nav">
				<li class="n1"><a href="/wyht/qt/index"> <span>首页</span> <span
						class="bkg"></span>
				</a></li>
				<li class="n0"><a href="/wyht/qt/gywm"> <span>关于我们</span>
						<span class="bkg"></span>
				</a></li>
				<li class="n2"><a href="/wyht/qt/ggall"> <span>公告汇总</span>
						<span class="bkg"></span>
				</a></li>
				<li class="n3"><a href="/wyht/qt/newall"> <span>新闻中心</span> <span
						class="bkg"></span>
				</a></li>
				<li class="n4"><a href="/wyht/qt/service"> <span>业务领域</span> <span
						class="bkg"></span>
				</a></li>
				<li class="n5"><a href="/wyht/qt/addwm"> <span>加入我们</span> <span
						class="bkg"></span>
				</a></li>
				<li class="n6"><a href="/wyht/qt/lxwm"> <span>联系我们</span> <span
						class="bkg"></span>
				</a></li>
				<li class="n7"><a href="javascript:void(0)" class="btn md-trigger md-setperspective" data-modal="updatePwds" > <span>
						<c:choose><c:when test="${sessionScope.owners.opass==null }">设置密码</c:when>
						<c:otherwise>修改密码</c:otherwise>
						</c:choose></span> 
						<span class="bkg"></span>
					</a></li>
			</ul>
			<c:choose>
				<c:when test="${sessionScope.owners!=null }">
					<div class="loginsuccess">欢迎您,${sessionScope.owners.owername }!</div>
				</c:when>
				<c:otherwise>
					<div id="shop">
						<a class="btn md-trigger md-setperspective cllogins" data-modal="myModal">登录</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="subNav" style="margin-top: 79px;">
		<div class="wrap">
			<div class="item about">
				<a href="/wyht/qt/jtjs">集团介绍</a> 
				<a href="/wyht/qt/jtjzg">核心价值观</a> 
				<!-- <a href="##">社会认同</a> -->
			</div>
			<div class="item notice">
				<a href="/wyht/qt/ggall">公告汇总</a> 
				<a href="/wyht/qt/tghz" class="yanzhenlogin">通知汇总</a>
			</div>
			<div class="item news">
				<a href="/wyht/qt/newall">实时新闻</a> 
				<a href="/wyht/qt/mthb">媒体汇报</a> 
				<a href="/wyht/qt/spzx">视频中心</a>
			</div>
			<div class="item relation">
				<a href="/wyht/qt/lykj">楼宇科技</a> 
				<a href="/wyht/qt/fwbx" class="yanzhenlogin">房屋报修</a> 
				<a href="/wyht/qt/jffw" class="yanzhenlogin">缴费服务</a>
				<a href="/wyht/qt/cmplaint" class="yanzhenlogin">投诉</a>
			</div>
			<div class="item service">
				<a href="/wyht/qt/rcln">人才理念</a> 
				<a href="/wyht/qt/xyzp">校园招聘</a> 
				<a href="/wyht/qt/shzp">社会招聘</a>
			</div>
		</div>
	</div>

	<!-- 模态框（Modal） -->
	<!-- 修改员工  -->
	<div class="md-modal md-effect-17" id="myModal">
		<div class="md-content">
			<div class="modal-header">
				<button type="button" class="close md-close">&times;</button>
				<h4 class="modal-title" style="text-align: center" id="dl_top">
					业主登录</h4>
			</div>
			<div id="dl">
				<form class="form-horizontal" role="form">
				<div class="modal-body">
					<div class="container">
							<div class="form-group">
								<label for="phone" class="col-sm-1 control-label">手机号:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="ownerphone"
										placeholder="请输入手机号(为注册迁入时填写的手机号)">
								</div>
							</div>
							<div class="form-group">
								<label for="pwd" class="col-sm-1 control-label">密码:</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="pwd" name="opass"
										placeholder="请输入密码">
								</div>
							</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-sm-7">
						<button type="button" onclick="ispasslogin(this.form)" class="btn btn-primary qtlogin">登录</button>
						<button type="button" class="btn btn-success" id="zhuce">
							验证码登录</button>
					</div>
				</div>
				</form>
			</div>
			<!-- /.modal-content -->
			<div id="zc" style="display: none">
				<form class="form-horizontal" role="form" id="dl">
				<div class="modal-body">
					<div class="container">
							<div class="form-group">
								<label for="phone" class="col-sm-1 control-label">手机号:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="lophone" name="ownerphone"
										placeholder="请输入手机号">
								</div>
							</div>
							<div class="form-group">
								<label for="pwd" class="col-sm-1 control-label">验证码:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="keywords" placeholder="请输入验证码">
								</div>
								<div class="col-sm-3">
									<button type="button" class="btn btn-primary fasong" >发送验证码</button>
								</div>
							</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-sm-7">
						<button type="button" onclick="isphonelogin(this.form)" class="btn btn-primary qtlogin">登录</button>
						<button type="button" class="btn btn-success" id="denglu">
							返回</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div class="md-modal md-effect-17" id="updatePwds">
		<form class="layui-form" action="" method="post" id="staff_add">
		<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">设置新密码</h4>
		        </div>
					<div class="modal-body">
						<div class="layui-form-item">
							<div class="layui-form-label"> 新密码： <span
								class="text-danger">*</span> </div>
							<div class="layui-input-block">
								<input type="password" class="layui-input" id="pass" placeholder="请输入新密码">
							</div>
						</div> 
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label"> 确认密码：
							 <span class="text-danger">*</span> 
							</div>
							<div class="layui-input-block">
							<input type="password" class="layui-input" id="queds" placeholder="请输入确认密码">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button type="button" onclick="updatepwds(this.form)" class="layui-btn" id="staff-add">确定</button>
								<button class="layui-btn layui-btn-primary md-close">关闭</button>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
	<!-- /.modal -->
	<!-- 模态框的背景层  -->
	<div class="md-overlay"></div>
</body>
</html>