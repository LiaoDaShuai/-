<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	function del(taskId){
		swal({
	           title: '你确定要删除吗?',
	           type: 'warning',
	           showCancelButton: true,
	           confirmButtonColor: '#3085d6',
	           cancelButtonColor: '#d33',
	           confirmButtonText: '是的!',
	           cancelButtonText:'取消'
	       }).then(function () {
	    	   swal(
	    			    '删除成功',
	    			    '',
	    			    'success'
	    			  )
	    			 employeeController.taskDel(taskId,function(data){
	    				 setTimeout(function(){//两秒后跳转
	    					 location.reload();
	                     },2000);
					  })
	    			},
	    			function (dismiss) {
	    			  if (dismiss === 'cancel') {
	    			    swal(
	    			      '删除失败',
	    			      '',
	    			      'error'
	    			    )
	    			  }
	      		 })
	};
	</script>
</head>
<body>
<section id="main"> <!--主要内容 -->
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<ul class="tab-nav">
				<li class="waves-effect active"><a href="worker.jsp">常规任务</a></li>
				<li><a href="courier.jsp">临时任务</a></li>
			</ul>
			<div class="card-body">
				<div class="col-md-12" style="background: #fff; margin-bottom: 10px;">
					<form method="post" name="f1" action="${pageContext.request.contextPath}/staff/task_all" class="form-horizontal">
						<div class="list-action-grid">
								<div class="col-sm-12 toggaoji" style="margin: 0px;">
									<div class="row p-t-10">
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">部门：</label> <input
												type="hidden" value="${task.taskDepId}" id="taskDepIdMohu">
											<select class="form-control-static col-sm-7" id="dep"
												name="taskDepId">
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">种类</label> <input
												type="hidden" value="${task.taskTapeTid}"
												id="taskTapeTidMohu"> <select
												class="form-control-static col-sm-7" id="taskTapeTid"
												name="taskTapeTid">
											</select>
										</div>
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">状态：</label> <select
												class="form-control-static col-sm-7" name="">
												<option value=''>---请选择状态---</option>
												<option value='0'>公开</option>
												<option value='1'>循环中</option>
												<option value='2'>已结束</option>
											</select>
										</div>
									</div>
									<div class="row p-t-10">
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">关键字：</label>
											<input type="text" class="form-control-static col-sm-7"
												id="advanced" disabled value="${task.taskName}"
												name="taskName" placeholder="请输入任务名">
										</div>
										<div class="form-group col-sm-4">
											<button class="col-sm-3 btn btn-success" type="submit"
												style="margin: 0 5px 0 10px;">
												<i class="fa fa-search"></i> 搜索
											</button>
											<button class="col-sm-3 btn btn-default" type="reset"
												style="margin-right: 5px;">清空</button>
											<button class="col-sm-3 btn btn-default closes" type="button">
												关闭</button>
										</div>
									</div>
								</div>
						</div>
						<div>
							<div class="action pull-left">
								<a type="button" class="btn btn-success"
									href="${pageContext.request.contextPath}/staff/task-add"><i
									class="fa fa-plus"></i>&nbsp;添加常规任务</a>
							</div>
							<div class="pull-right">
								<a href="javascript:" class="pull-left gaoji"> 高级搜索</a>
								<div class="suotext">
									<input type="text" name="taskName" id="ordinary"
										value="${task.taskName}" class="wentext" placeholder="请输入任务名">
									<button class="btn-list list-setting">
										<i class="fa fa-search"></i>
									</button>
								</div>
								<a href="" class="btn-list"
									target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
							</div>
						</div>
						<input type="hidden" name="pageNum" value=""> 
						<input type="hidden" name="pageSize" value="${page2.size}">
					</form>
				</div>
				<div class="com-md-12">
					<table class="table table-hover text-center">
						<thead>
							<tr class="active">
								<th>任务名称</th>
								<th>种类</th>
								<th>频次</th>
								<th>次数</th>
								<th>已进行</th>
								<th>部门</th>
								<th>责任人</th>
								<th>公开</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${page.list}">
								<tr>
									<td style="display: none"><input value="${task.taskId}"
										id="taskId"></td>
									<td>${task.taskName }</td>
									<td>${task.taskType.tasktypeName }</td>
									<td><c:choose>
											<c:when test="${task.taskFrequency==1}">
															每日一次
													</c:when>
											<c:when test="${task.taskFrequency==7}">
															每周一次
													</c:when>
											<c:when test="${task.taskFrequency==14}">
															两周一次
													</c:when>
											<c:when test="${task.taskFrequency==30}">
															每月一次
													</c:when>
											<c:otherwise>
															每${task.taskFrequency}天一次
													</c:otherwise>
										</c:choose></td>
									<td>${task.taskWcount }</td>
									<td>${task.taskCompleted }</td>
									<td>${task.department.depName}</td>
									<td>${task.employee.empName }</td>
									<td><c:if test="${task.taskIspublic==0}">
														公开
												</c:if> <c:if test="${task.taskIspublic==1}">
														不公开
												</c:if></td>
									<td><c:if test="${task.taskStatus==0}">
														未开做
												</c:if> <c:if test="${task.taskStatus==1}">
														循环中
												</c:if> <c:if test="${task.taskStatus==2}">
														已结束
												</c:if></td>
									<td>
									<a class="btn btn-default btn-icon-text user-info"
										href="${pageContext.request.contextPath}/staff/select_key/${task.taskId}">
											<i class="fa fa-search"></i>查看详情
									</a> 
									<button class="btn btn-default btn-icon-text user-delete"
										onClick="del('${task.taskId}')">
										<i class="fa fa-trash"></i>删除
									</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="padding: 0 20px; overflow: hidden">
					<div class="pull-left biao-er-wai">共${page.total }条记录
						${page.pageNum }/${page.lastPage }页</div>
					<c:if test="${page.total>page2.size }">
						<div class="col-sm-6 col-sm-offset-3">
							<ul class="pagination pagination-sm">
								<li><a href="javascript:Fenye(1)"> <i
										class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
								<li><a
									href="javascript:Fenye(${page.pageNum-1},${page.lastPage })">
										<i class="fa fa-angle-left"></i>
								</a></li>
								<c:forEach begin="${page2.startPage }" end="${page2.endPage }"
									var="num">
									<c:if test="${num==page.pageNum}">
										<li class="active"><a
											href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li>
									</c:if>
									<c:if test="${num!=page.pageNum }">
										<li><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li>
									</c:if>
								</c:forEach>
								<li><a
									href="javascript:Fenye(${page.pageNum+1},${page.lastPage })">
										<i class="fa fa-angle-right"></i>
								</a></li>
								<li><a
									href="javascript:Fenye(${page.lastPage},${page.lastPage })">
										<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
								</a></li>
							</ul>
						</div>
					</c:if>
					<c:if test="${page.total>=8}">
						<div class="pull-right biao-er-wai">
							该页显示： <select style="width: 100px; height: 25px;"
								class="pagination" id="tiaoshu">
								<c:forEach items="${page2.selectnum }" var="selectsize">
									<c:if test="${selectsize==page2.size }">
										<option value="${selectsize }" selected="selected">${selectsize }条</option>
									</c:if>
									<c:if test="${selectsize!=page2.size }">
										<option value="${selectsize }">${selectsize }条</option>
									</c:if>
								</c:forEach>
							</select> 数据
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>