<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/express/express_address.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>	
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">
            <div class="col-sm-11">快递取件点设置</div>
            <div class="row small">
                <div class="col-sm-12"><i class="fa fa-question-circle"></i>
                    	如需要验证码，系统将发送短信验证码至收件人，请确保短信包余额充足，否则无法发送。
                </div>
            </div>
        </div>
        <div class="hr-solid"></div>
        <form class="layui-form" action="/wyht/express/addexpress" method="post" id="f1">
            <div class="layui-form-item"><label class="layui-form-label">选择小区：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <select name="expDisid" id="disid1">
                        <option value="0">--选择小区--</option>
                    </select>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">取件地址：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="expAddress">
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">服务电话：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                   <input type="text" class="layui-input" name="expServicephone">
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">取件时间：<samp style="color: red;">*</samp></label>
                <div class="layui-input-inline" style="margin-left:10px;">
                    <input type="text" class="layui-input qj_1" name="expSdate" readonly>
                </div>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input qj_2" name="expEdate" readonly>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">验证方式：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <input type="radio" name="expIsvalis" checked value="0"><span style="margin-left:-22px;">不需要取件验证码</span>
                    <input type="radio" name="expIsvalis" value="1"><span style="margin-left:-22px;">需要取件验证码</span>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">发送短信：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <input type="radio" name="expIssms" checked value="0"><span style="margin-left:-22px;">不发送</span>
                    <input type="radio" name="expIssms" value="1"><span style="margin-left:-22px;">发送</span>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">发送微信：<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <input type="radio" name="expIsweixin" checked value="0"><span style="margin-left:-22px;">不发送</span>
                    <input type="radio" name="expIsweixin" value="1"><span style="margin-left:-22px;">发送</span>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item">
                <div class="layui-form-label"></div>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn baoc">保存</button>
                    <a href="javascript:history.back(-1);" class="layui-btn layui-btn-primary">返回</a>
                </div>
            </div>
        </form>
    </div>
</body>
<script>
	$(function(){
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
		})
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
</script>
</html>