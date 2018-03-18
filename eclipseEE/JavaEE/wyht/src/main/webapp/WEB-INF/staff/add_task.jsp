<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<script src="${pageContext.request.contextPath }/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath }/dwr/util.js"></script>
<script src="${pageContext.request.contextPath }/dwr/interface/employeeController.js"></script>
<script type="text/javascript" src="/wyht/js/js-staff/task_all.js"></script>
<script type="text/javascript">
$(function(){
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  laydate.render({
			elem : '#sdates',
			type : 'datetime',
			done : function(value, data, endDate) {
				$("input[name=taskStartdate]").val(value);
			}
		});
	});
	layui.use('form', function(){
		var form=layui.form;
		form.on('select(depSelect)',function(da){
			$("#emp [value!='']").remove();
			employeeController.selectPost(da.value,function(data){
				for(var i=0;i<data.length;i++)
				{
		 			$("#emp").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
				}
				form.render('select');
			});
		});
		form.render();
	});
})
</script>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<ul class="tab-nav">
				<li class="waves-effect active"><a href="#">任务详情</a></li>
			</ul>
			<div class="card-body">
				<div class="col-sm-12 ">
					<form class="layui-form" action="<%=request.getContextPath()%>/staff/task_add"
						modelAttribute="Task" method="Post" name="f1">
						<div class="layui-form-item">
								<label class="layui-form-label">名称：</label> 
								<div class="layui-input-block">
									<input type="text" class="layui-input" placeholder="请输入任务名称" name="taskName">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">种类：</label>
								<div class="layui-input-block">
									<select id="taskTapeTid" name="taskTapeTid">
									</select>
								</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label">频率：</label> 
								<div class="layui-input-block">
									<select name="taskFrequency">
										<option value=''>---请选择频率---</option>
										<option value='1'>---每日一次---</option>
										<option value='7'>---每周一次---</option>
										<option value='14'>---两周一次---</option>
										<option value='30'>---每月一次---</option>
										<option value=''>---其他---</option>
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">开始日期：</label> 
								<div class="layui-input-block">
								<input type="text" name="taskStartdate" class="layui-input" id="sdates" placeholder="xxxx年xx月xx日">
								<!--<input type="hidden" class="" name="taskStartdate">-->
								</div>
							</div>
							
							<div class="layui-form-item">
								<label class="layui-form-label">循环次数：</label> 
								<div class="layui-input-block">
									<input type="text" class="layui-input" placeholder="N次 " name="taskWcount">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">责任人：</label> 
								<div class="layui-input-block">
									<select name="taskDepId" id="dep" lay-filter="depSelect">
									</select> &ensp;
									<select name="taskEmpId" id="emp">
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">是否公开：</label> 
								<div class="layui-input-block">
									<select name="taskIspublic">
										<option value="0">公开</option>
										<option value="1">不公开</option>
									</select>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">任务说明：</label>
								<div class="layui-input-block">
									<textarea class="layui-textarea" name="reskRemark"></textarea>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label"></label>
								<div class="layui-input-block">
	                                <button type="submit" class="layui-btn">保存</button>
	                                <a href="javascript:history.go(-1)" class="layui-btn layui-btn-primary">返回</a>
	                            </div>
                            </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>