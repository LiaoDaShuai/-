<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业管理后台</title>
<style>
table td, th {
	border: 1px solid #e1e6eb;
	text-align: center;
}
</style>
<script type="text/javascript" src="/wyht/js/toll/formula.js"></script>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on('blur', '.shuzhi_list .gs_list', function() {
			var num = $(this).index('.shuzhi_list .gs_list');
			var vvv = parseFloat($(this).val());
			if (isNaN(vvv)) {
				sweetAlert({
					title : '请输入数字',
					text : '',
					type : "warning",
					timer : 1500,
					showConfirmButton : false
				});
				return false;
			}
			$('.shuzhi_' + num).text(vvv);
		});
		var forid = ${formula.formulaid};
				$.ajax({
					type : "get",
					url : "/wyht/xml/formula.xml",
					dataType : "xml",
					timeout : 1000,//设定超时
					cache : false,//禁用延迟
					success : function(xml) {
						var frag = $("<ul/>");
						$(xml).find("formula").each(
							function(i) {
								i++;
								if (i == forid) {
									var ids = $(this).attr("id");
									var names = $(this).children("formulaname");
									formulaname = names.text();
									frag.append("<li class=\"zi-formula\" style='background-color: #f8f8f8' id=\""+i+"\"><a href=\"javascript:;\">"
										+ i+ "-"+ formulaname+ "</a></li>")
									$("input[name=formulanum]").val(forid);
									var content = $(this).children("formulacontent");
									forcontent = content.text();
									var gongshi = $(this).children("formulagongshi");
									formulagaoshi = gongshi.text();
									var count = $(this).children("formulacount");
									formulacount = count.text();
									$(".shuoming").html(forcontent);
									$(".gongshi").html(formulagaoshi);
									var textcount = $(".shuzhi_list").find(".layui-form-item").length;
									if (formulacount < textcount) {
									for (var i = textcount - 1; i >= formulacount; i--) {
										$(".shuzhi_list").find(".layui-form-item").eq(i).remove();
									}
								}
							}
						});
						frag.appendTo(".list-show");
					}
		});
	});
</script>
</head>
<body>
<form action="/wyht/toll/updateformula">
	<div class="container col-sm-11"
		style="margin: 90px 0 0 100px; background: #fff;">
		<div class="row header">修改公式</div>
		<div class="hr-solid"></div>
		<div class="col-sm-4 pad-form-div div-scroll">
			<div class="slimscroll"
				style="position: relative; overflow: hidden; height: 100%;">
				<div class="sidebar-inner" style="overflow: hidden; height: 100%;">
					<div class="a-form-hd">
						<span>选择已有信息</span>
					</div>
					<div class="row">
						<div class="col-sm-12 sousuoj">
							<i class="fa fa-search"></i> <input type="text"
								class="form-control">
						</div>
					</div>
					<div class="list-show"></div>
					<!--插入标题-->
					<div class="fenyes">共1条记录 1/1页</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4 pad-form-div div-scroll">
					<div class="a-form-hd">
						<span>公式内容</span>
					</div>
					<div class="formula-content">
						<h4>说明：</h4>
						<p class="shuoming"></p>
						<h4>具体规则：</h4>
						<div class="gongshi"></div>
					</div>
		</div>
		<div class="col-sm-4 pad-form-div div-scroll">
					<div class="a-form-hd">
						<span>变量设置</span>
					</div><br>
					<div class="formula-content layui-form" style="margin-bottom: 60px;">
						<div class="layui-form-item">
							<label for="" class="layui-form-label"> 公式名字&emsp;</label>
							<div class="layui-input-inline">
								<input type="text" name="formulaname" value=${formula.formulaname } class="layui-input">
								<input type="hidden" name="formulanum" value="${formula.formulanum }">
								<input type="hidden" name="formulaid" value="${formula.formulaid }"/>
								</div>
						</div>
						<div class="layui-form-item">
							<label for="" class="layui-form-label">备注&emsp;</label>
							<div class="layui-input-inline">
								<input type="text" name="remark" value="${formula.remark }" class="layui-input">
							</div>
						</div>
						<div class="shuzhi_list">
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值1&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num1" value="${formula.num1 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值2&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num2" value="${formula.num2 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值3&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num3" value="${formula.num3 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值4&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num4" value="${formula.num4 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值5&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num5" value="${formula.num5 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值6&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num6" value="${formula.num6 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值7&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num7" value="${formula.num7 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值8&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num8" value="${formula.num8 }" class="layui-input gs_list">
								</div>
							</div>
							<div class="layui-form-item">
								<label for="" class="layui-form-label">数值9&emsp;</label>
								<div class="layui-input-inline">
									<input type="text" name="num9" value="${formula.num9 }" class="layui-input gs_list">
								</div>
							</div>
				</div>
			</div>
		</div>	
				<div class="formula_bottom ">
					<button type="button" onclick="issubmit(this.form)" class="btn btn-success" style="width: 96px; margin-right: 20px;">保存</button>
					<button type="button" onclick="javascript:history.back(-1)" class="btn btn-default" style="width: 96px;">返回</button>
				</div>
	</div>
</form>	
</body>
</html>