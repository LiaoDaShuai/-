<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/courier/add_courier.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                <div class="card-header">
                    <h2>添加快递员</h2>
                </div>

                <div class="hr-solid"></div>

                <div class="card-body">
                    <form action="/wyht/express/insertcourier" class="layui-form" id="f2" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label" >
                                	快递员:<span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="couName" onBlur="couver(1)">
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                	手机号:<span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="couPhone" onBlur="couver(2)">
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">
                            	快递公司:<span class="text-danger">*</span>
                            </label>
                            <div class="layui-input-block">
                                <select name="couExpgsId" id="company_id">
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
                                    <input type="text" class="layui-input" name="couCostsmall" value="1.00">
                            </div>
                            <span class="layui-form-label" style="margin-left:-30px;">元/每单</span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" ></label>
                            <span class="layui-form-label" style="margin-left:-20px;margin-right:10px;">大件</span>
                            <div class="layui-input-inline">        
                                    <input type="text" class="layui-input" name="couCostbig" value="2.00">
                            </div>
                            <span class="layui-form-label" style="margin-left:-30px;">元/每单</span>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn verification" id="save2">保存</button>
                                <a href="javascript:history.back(-1)" class="layui-btn layui-btn-primary">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
        </div>
    </div>
<script>
	$(function(){
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
		expressController.selectECAll(function(data){
			for(var i=0;i<data.length;i++) {  
				$("#company_id").append("<option value='"+data[i].expgsId+"'>"+data[i].expgsName+"</option>");
			}
		})
	})
</script>    
</body>
</html>