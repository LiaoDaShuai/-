<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/courier/edit_courier.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                <div class="card-header">
                    <h2>编辑快递员</h2>
                </div>
                <div class="hr-solid"></div>
                <div class="card-body">
                    <form class="layui-form" action="/wyht/express/updatecourier" class="col-lg-12" id="f2" method="post">
                    	<input type="hidden" name="couId" value="${cer.couId }">
                        <div class="layui-form-item">
                            <label class="layui-form-label" >
                                	快递员:
                                <span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="couName" value="${cer.couName }">
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >
                                	手机号:<span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="couPhone" value="${cer.couPhone }">
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >
                            	快递公司:<span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <select name="couExpgsId" id="company_id" disabled>
                                    <option value="0">-------请选择-------- </option>
                                </select>
                            </div>
                        </div>
						<div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <a href="/wyht/express/company">快递公司管理</a>
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
						<div class="layui-form-item">
                            <label class="layui-form-label" >收费标准:</label>
                            <span class="layui-form-label" style="margin-left:-20px;margin-right:10px;">小件</span>
                            <div class="layui-input-inline">
                                    <input type="text" class="layui-input" name="couCostsmall" value="${cer.couCostsmall }">
                            </div>
                            <span class="layui-form-label" style="margin-left:-30px;">元/每单</span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" ></label>
                            <span class="layui-form-label" style="margin-left:-20px;margin-right:10px;">大件</span>
                            <div class="layui-input-inline">        
                                    <input type="text" class="layui-input" name="couCostbig" value="${cer.couCostbig }">
                            </div>
                            <span class="layui-form-label" style="margin-left:-30px;">元/每单</span>
                        </div>
                        <div class="hr-dashed"></div>
						<div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn verification">保存</button>
                                <a href="javascript:history.go(-1)" class="layui-btn layui-btn-primary">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
        </div>
    </div>
<script>
	$(function(){
		expressController.selectECAll(function(data){
			for(var i=0;i<data.length;i++) {  
				$("#company_id").append("<option value='"+data[i].expgsId+"'>"+data[i].expgsName+"</option>");
				if("${cer.couExpgsId}!=0"){
					$("#company_id").find("option[value='${cer.couExpgsId}']").attr("selected",true);
				}
			}
		})
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
</script>    
</body>
</html>