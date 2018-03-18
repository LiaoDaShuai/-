<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/express/edit_express.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
    	<div class="row header">
            <div class="col-sm-11">修改快递</div>
        </div>
        <div class="hr-solid"></div>
        <form class="layui-form" action="/wyht/express/updatestorage" method="post" id="f1">
        	<input type="hidden" name="eid" value="${ex.expId }">
        	<input type="hidden" name="storId" value="${stor.storId }">
        	<input type="hidden" name="op" value="3">
            <div class="layui-form-item"><label class="layui-form-label">快递单号:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storNum" value="${stor.storNum }" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人手机号:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storReceiverphone" value="${stor.storReceiverphone }" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人姓名:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storReceivername" value="${stor.storReceivername }" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">快递员:</label>
                <div class="layui-input-block">
                    <select name="storCouId" id="storCouId2" disabled>
                        <option value="">--请选择快递员--</option>
                    </select>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">包裹大小:</label>
                <div class="layui-input-block">
                   <c:choose>
                     <c:when test="${stor.storIsstatus eq 0 }">
                     	<input type="radio" name="storIssize" checked value="0" disabled>小件
                     	<input type="radio" name="storIssize" value="1" disabled>大件
                     </c:when>
                     <c:otherwise>
                     	<input type="radio" name="storIssize" value="0" disabled>小件
                     	<input type="radio" name="storIssize" checked value="1" disabled>大件
                     </c:otherwise>
                   </c:choose>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件员小区:</label>
                <div class="layui-input-block">
                    <select disabled>
                        <option value="${ex.expDisid }">${ex.dis.dname }</option>
                    </select>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">取件点:</label>
                <div class="layui-input-block">
                	<input type="text" value="${ex.expAddress }" class="layui-input" readonly>
                	<input type="hidden" name="storExpId" value="${ex.expId }">
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人房号:</label>
                <div class="layui-input-block"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">备注:</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" name="storRemark" value="${stor.storRemark }">
                </div>
            </div>
            <div class="hr-dashed"></div>
			<div class="layui-form-item">
                <div class="layui-form-label"></div>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn baoc">保存</button>
                    <a href="javascript:history.go(-1);" class="layui-btn layui-btn-primary">返回</a>
                </div>
            </div>
        </form>
    </div>
</body>
<script>
	$(function(){
		expressController.selectCourier(function(data){
			for(var i=0;i<data.length;i++){
				$("#storCouId2").append("<option value="+data[i].couId+">"+data[i].couName+"("+data[i].epcy.expgsName+")</option>");
			}
			if("${stor.storCouId}!=0"){
				$("#storCouId2").find("option[value='${stor.storCouId}']").attr("selected",true);
			}
		});
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
</script>
</html>