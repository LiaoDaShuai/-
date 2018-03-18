<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/express/add_express.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="#">
                <div class="navkuai" style="border-bottom: 2px solid #37a10b;">取快递</div></a>
            <a href="/wyht/express/action/2/${ex.expId }"><div class="navkuai" >快递入库</div></a>
            <a href="/wyht/express/action/3/${ex.expId }"><div class="navkuai" >快递列表</div></a>
        </div>
        <div class="layui-form">
			<div class="layui-form-item"><label class="layui-form-label">当前取件点：</label>
				<br/>
                <span style="color:red;font-size: 15px;padding:50px;">${ex.expAddress }--${ex.expServicephone }</span>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人电话：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                	<input type="text" class="layui-input" id="mb4" placeholder="请输入收件人手机后4位" onkeyup="selectStorages('${ex.expId }')">
                	<div id="sug" class="wxq-sug"></div>
                	<div id="no-sug" style="display:none;"><b>没有快递信息</b></div>
                </div>
            </div>
            <div id="details" class="layui-form-item"><label class="layui-form-label"></label>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                	<button type="button" id="take" class="layui-btn layui-btn-lg" disabled>取快递</button>
                </div>
            </div>
		</div>
    </div>
</body>
</html>