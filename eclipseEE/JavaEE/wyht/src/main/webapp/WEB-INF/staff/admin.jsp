<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<style>
.inps[readonly]{
 background: #eee;
}
</style>
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/employeeController.js"></script>  
	<script src="/wyht/js/index/admin.js"></script>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<div class="card-header">
				<h2>权限管理</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body ">
				<div class="col-md-12"
					style="background: #fff; margin-bottom: 10px;">
					<div class="pull-left">
						<button type="button" class="btn btn-success md-trigger md-setperspective"
							data-modal="addAdmin">
							<i class="fa fa-plus"></i>&nbsp;添加管理员
						</button>
					</div>
					<div class="pull-right">
						<div class="suotext">
						<form action="" id="f1" name="f1" method="post">
							<input type="hidden" name="pageNum" value=""> 
							<input type="hidden" name="pageSize" value="${page2.size }">
							<input type="text" name="kw" value="" class="wentext"
								placeholder="输入管理员账号或姓名搜索">
							<button class="btn-list list-setting">
								<i class="fa fa-search"></i>
							</button>
							</form>
						</div>
						<a href="" class="btn-list" target="_blank" title="帮助中心"> <i
							class="fa fa-question"></i></a>
					</div>
				</div>
				<div class="com-md-12">
					<table class="table table-hover text-center">
						<thead>
							<tr class="active">
								<th>管理员账号</th>
								<th>姓名</th>
								<th>手机号</th>
								<th>添加时间</th>
								<!--<th>已关联小区</th>-->
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${!empty page.list }">
							<c:forEach items="${page.list }" var="admin">
							<tr>
							<td>${admin.userPhone }</td>
							<td>${admin.userName }</td>
							<td>${admin.userPhone }</td>
							<td>${admin.createats }</td>
							<td>
								<a href="/wyht/auth/authAll/${admin.userId }" class="btn btn-default m-t-10">
									<i class="fa fa-wrench">&nbsp;</i>权限设置
								</a>
								<button onclick="repass('${admin.userId}')" class="btn btn-default m-t-10">
									<i class="fa fa-unlock">&nbsp;</i>重置密码
								</button>
								<button onclick="delAdmin('${admin.userId }')" class="btn btn-default m-t-10">
									<i class="fa fa-trash ">&nbsp;</i>删除
								</button>
							</td>
							<tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
                        	<tr><td colspan='5' style="text-align:center;"><h3>暂无管理员信息</h3></td></tr>
                		</c:otherwise>
                		</c:choose>
						</tbody>
					</table>
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
					<div class="pull-right biao-er-wai">
						该页显示： <select style="width: 100px; height: 25px;"
							class="pagination">
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
				</div>
			</div>
		</div>
	</div>
	<!-- 添加管理员 -->
	<div class="md-modal md-effect-17" id="addAdmin">
		<form class="layui-form" action="/wyht/staff/addAdmin" method="Post">
			<div class="md-content">    
	            	<div class="modal-header">
				          <h3 class="modal-title" style="text-align:center">添加管理员</h3>
			        </div>
					<div class="modal-body">
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">部门： </div>
							<div class="layui-input-block">
								<select id="dep" lay-filter="bumen">
									<option value="">--请选择部门--</option>
								</select>
								<select id="empl" lay-filter="empl">
									<option value="">--请选择员工--</option>
								</select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">登录账户： </div>
							<div class="layui-input-block">
								<input type="text" name="userPhone" readonly class="layui-input inps">
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">姓名：</div>
							<div class="layui-input-block">
								<input type="text" name="userName" readonly class="layui-input inps">
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">密码：</div>
							<div class="layui-input-block">
								<input type="password" name="userPass" class="layui-input">
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">确认密码：</div>
							<div class="layui-input-block">
								<input type="password" id="qued" class="layui-input">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="layui-form-item">
							<div class="layui-input-block">
							  <button type="button" onclick="addAdmin(this.form)" class="layui-btn" id="cmplaints-add">确定</button>
							  <button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
	<div class="md-overlay"></div> 	
</body>
</html>