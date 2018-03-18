<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业系统</title>
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/autoController.js"></script>  
<style>
.dropdown-menu li{
	min-width:300px;
	margin:5px 0 5px 0;
	line-height:30px;
}
</style>
<script>
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
		        text: "密码修改成功，即将跳到登录页面",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		  });
    	 window.setTimeout(function(){
 	   		autoController.updatePwd($("#pass").val(),function(){
 		 	 window.location.reload(); 		 
 	  		})
 		},2000);
    }
}
</script>
</head>
<body>
<header id="header">
    <ul class="header-inner">
        <li class="logo">
            <a href="#"><img src="/wyht/img/logo.jpg" alt=""></a>
        </li>
        <li id="console">
            <a href="/wyht/index/index">控制台</a>
        </li>
        <li id="dash">
            <a href="#">产品和服务 <b class="caret"></b></a>
        </li>
        <li id="dash">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">账户管理
            <b class="caret"></b></a>
             <ul class="dropdown-menu" style="margin:26px 0 0 0;">
                    <li><a href="/wyht/staff/all"><i class="fa fa-address-card-o"></i> 员工管理</a></li>
                    <li><a href="/wyht/staff/admin"><i class="fa fa-cog"></i>  管理员管理</a></li>
                    <li><a class="md-trigger md-setperspective" data-modal="updatePwds"><i class="fa fa-unlock"></i>  修改密码</a></li>
                    <li class="divider"></li>
                    <li><a href="/wyht/auth/logout"><i class="fa fa-power-off"></i> 退出系统</a></li>
                </ul>
        </li>
        <li class="pull-right">
            <ul class="top-menu">
                <li class="gd-icon"><a title="帮助" href="#">帮助</a></li>
                <li class="gd-icon"><a title="提交工单" href="#">工单</a></li>
                <li class="dropdown top-message"><a href="#" class="tm-message"></a></li>
                <li class="gd-icon wap-admin"><a href="#" class=""><i class="fa fa-qrcode"></i></a></li>
            </ul>
        </li>
    </ul>
</header>
<div class="md-modal md-effect-17" id="updatePwds">
		<form class="layui-form" action="" method="post" id="staff_add" enctype="multipart/form-data">
		<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">修改密码</h4>
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
	 <!-- 模态框的背景层  -->
	<div class="md-overlay"></div> 
</body>
</html>