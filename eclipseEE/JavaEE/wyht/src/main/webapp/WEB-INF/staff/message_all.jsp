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
	<script type="text/javascript" src="/wyht/js/js-staff/message_all.js"></script>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<ul class="tab-nav">
				<li ><a href="internal_notice">通知员工</a></li>
				<li class="active"><a href="message_all">通知住户</a></li>
			</ul>
			<div class="card-body">
				<form action="${pageContext.request.contextPath }/staff/message_all" name="f1" method="get">
					<div class="col-md-12"
						style="background: #fff; margin-bottom: 10px;">
						<div class="pull-left">
							 <a class="btn btn-success md-trigger md-setperspective" data-modal="modal-add">
		                       <i class="fa fa-plus"></i>&nbsp;添加住户通告
		                 </a>
						</div>
						<div class="pull-right">
							<div class="suotext">
								<input type="text" name="mohu" value="${mohu}" class="wentext" placeholder="请输入事件名称关键字">
								<button type="submit" class="btn-list list-setting">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<a href="https://www.weixiaoqu.com/faqs" class="btn-list"
								target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
						</div>
					</div>
					<input type="hidden" name="pageNum" value=""> <input
						type="hidden" name="pageSize" value="${page2.size}">
				</form>
					<div class="com-md-12">
						<table class="table table-hover text-center">
							<thead>
								<tr class="active">
									<th>业主</th>
									<th>通知事件名称</th>
									<th style="width:300px;">通知内容</th>
									<th>通知时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="message" items="${page.list}">
									<tr>
<%-- 										<td>${message.owners.owername}</td> --%>
										<td>${message.owners.owername}</td>
										<td>${message.mesName}</td>
										<td ><div style="width:300px; overflow: hidden; text-overflow: ellipsis;">${message.mesContext}</div></td>
										<td><fmt:formatDate value="${message.mesAdate}" pattern="yyyy-MM-dd" /></td>
										<td>
										<a class="btn btn-default btn-icon-text user-info" onClick="select('${message.mesId}')"> 
											<i class="fa fa-search"></i>查看详情
										</a>
										<a class="btn btn-default btn-icon-text" onClick="del('${message.mesId}')">
												<i class="fa fa-trash"></i>删除
										</a>
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
	<!-- 添加通知 -->
	<div class="md-modal md-effect-17" id="modal-add">
		<form class="layui-form" action="<%=request.getContextPath()%>/staff/message_add" method="Post" id="message_add">
			<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">添加通知业主</h4>
		        </div>
					<div class="modal-body">
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">业主： </div>
							<div class="layui-input-block">
								<select name="mesOwerId" id="owners"></select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">名称： </div>
							<div class="layui-input-block">
								<input type="text" class="layui-input" name="mesName" id="Title" placeholder="请输入事件名称">
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">内容：</div>
							<div class="layui-input-block">
								<textarea class="layui-textarea" name="mesContext" id="Context" placeholder="请输入通知内容"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="layui-form-item">
							<label class="layui-form-label"></label>
							<div class="layui-input-block">
								<button type="button" class="layui-btn" id="message-add">确定</button>
								<a href="javascript:history.go(-1)" class="layui-btn layui-btn-primary md-close">关闭</a>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>

	<!-- 显示通知 -->
	<div class="user_info1">
		<ul class="tab-nav ">
			<li class="active"><a href="">查看通知</a></li>
		</ul>
	<div style="padding: 20px; overflow: hidden; width: auto; height: 95%">
			<div class="form-group" style="margin-bottom: 40px;">
				<div class="col-sm-offset-1">
					<a href="" class="profile-logo"> 
						<img src="../img/no.jpg" alt="" id="ophoto">
					</a>
					<div class="staff-name">
						<h3 class="user_name" id="ownername"></h3> 
					</div>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12">
				<label for="" class="col-md-3 text-right">名称：</label>
				<div class="col-sm-6">
					<div style="width:200px;word-wrap:break-word;">
						<span class="phone" id="mesName"></span>
					</div>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12">
				<label for="" class="col-md-3 text-right">内容</label>
				<div class="col-sm-6">
					<div style="width:200px;word-wrap:break-word;">
						<span class="phone" id="mesContext"></span>
					</div>
				</div>
			</div>
				<div class="form-group p-20 col-md-12">
				<label for="" class="col-md-3 text-right">操作</label>
				<div class="col-sm-9">
					<button class="btn btn-default" id="mes-del" onClick="del(this.value)">
						<i class="fa fa-trash"></i>删除
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 模态框的背景层  -->
	<div class="md-overlay"></div> 	
	<div class="user_bg"></div>
</body>
<script>
$(function(){
	layui.use('form', function(){
		var form=layui.form;
		employeeController.selectownersname(function(data){
			$("#owners").empty();
			$("#owners").append("<option value=''>-----请选择业主-----</option>");
			for (var i = 0; i < data.length; i++) {
				$("#owners").append("<option value="+data[i].oid+">"+data[i].owername+"</option>");
			}
			form.render();
		});
	});
})
</script>
</html>