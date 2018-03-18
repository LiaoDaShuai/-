<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <!-- dwr -->
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
	<script type="text/javascript" src="/wyht/js/express/send_express.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/express/action/1/${ex.expId }">
                <div class="navkuai">取快递</div></a>
            <a href="#"><div class="navkuai" style="border-bottom: 2px solid #37a10b;">快递入库</div></a>
            <a href="/wyht/express/action/3/${ex.expId }"><div class="navkuai" >快递列表</div></a>
        </div><br/><br/>
        <form class="layui-form" action="/wyht/express/addstorage" method="post" id="f2">
            <div class="layui-form-item"><label class="layui-form-label">快递单号:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storNum" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人电话:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storReceiverphone" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">收件人姓名:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block"><input type="text" name="storReceivername" class="layui-input"></div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">快递员:<samp style="color: red;">*</samp></label>
                <div class="layui-input-block">
                    <select name="storCouId" id="storCouId2">
                        <option value="">--请选择快递员--</option>
                    </select>
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item"><label class="layui-form-label">包裹大小:</label>
                <div class="layui-input-block">
                   <input type="radio" name="storIssize" checked value="0" ><span style="margin-left:-22px;">小件</span>
                   <input type="radio" name="storIssize" value="1" ><span style="margin-left:-22px;">大件</span>
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
                    <input type="text" class="layui-input" name="remark">
                </div>
            </div>
            <div class="hr-dashed"></div>
            <div class="layui-form-item">
                <div class="layui-form-label"></div>
                <div class="layui-input-block">
					  <button type="button" class="layui-btn baoc">保存</button>
					  <a href="javascript:history.go(-1)" class="layui-btn layui-btn-primary">返回</a>
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
		})
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
</script>
</html>