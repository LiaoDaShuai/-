<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
 	<script src="${pageContext.request.contextPath }/dwr/engine.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/util.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/interface/employeeController.js"></script>
	<script type="text/javascript" src="/wyht/js/js-staff/mail_list.js"></script>
</head>
<body>
	<section id="main"> <!--主要内容 -->
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<div class="card-header">
				<h2>员工管理</h2>
			</div>
			<div class="hr-solid"></div>
			<form action="${pageContext.request.contextPath }/staff/all"
				name="f1" method="get">
				<div class="col-sm-12 toggaoji"
					style="border-top: 0; border-bottom: 1px solid #E0E0E0">
					<div class="row p-t-10">
						<div class="form-group col-sm-4">
							<label  class="col-sm-3 p-t-10">部门：</label> 
							<select class="form-control-static col-sm-7" name="depmohu" id="depmohu">
								<option value="">全部</option>
								<c:forEach var="dep" items="${dep}">
									<c:if test="${dep.depId==dephomu}">
										<option value="${dephomu}" selected>${dep.depName}</option>
									</c:if>
									<c:if test="${dep.depId!=dephomu}">
										<option value="${dep.depId}">${dep.depName}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-sm-4 ">
							<label class="col-sm-4 p-t-10">关键字：</label>
							 <input type="text" class="col-sm-7  form-control-static"  placeholder="请输入手机号或姓名" id="advanced"
								name="mohu" value="${emphomu}" disabled>
						</div>
						<div class="form-group col-sm-4">
							<button class="col-sm-3 btn btn-success" type="button" style="margin: 0 5px 0 10px;">
								<i class="fa fa-search"></i> 搜索
							</button>
							<button class="col-sm-3 btn btn-default"
								style="margin-right: 5px;">清空</button>
							<button class="col-sm-3 btn btn-default closes" type="button">关闭</button>
						</div>
					</div>
				</div>
				<div class="col-md-12 table"
					style="background: #fff; margin-bottom: 10px;">
					<div class="pull-left">
						  <a class="btn btn-success md-trigger md-setperspective" data-modal="modal-add">
		                       <i class="fa fa-plus"></i>&nbsp;添加员工
		                   </a>
					</div>
					<div class="pull-right">
						<a href="javascript:" class="pull-left gaoji">高级搜索</a>
						<div class="suotext">
							<input type="text" name="mohu" id="ordinary" value="${emphomu}"
								class="wentext" placeholder="请输入手机号或姓名">
							<button class="btn-list list-setting">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<a href="https://www.weixiaoqu.com/faqs" class="btn-list"
							target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
					</div>
				</div>
				<div>
					<input type="hidden" name="pageNum" value=""> 
					<input type="hidden" name="pageSize" value="${page2.size }">
				</div>
			</form>
			<div class="col-sm-12">
				<table class="table table-hover text-center">
					<thead>
						<tr class="active">
							<th>姓名</th>
							<th>部门</th>
							<th>职位</th>
							<th>手机号</th>
							<th>邮箱</th>
							<th>完成任务数</th>
							<th>入职时间</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="staff" items="${page.list}">
								<tr>
									<td style="display: none"><input value="${staff.empId}"
										id="empid"></td>
									<td>${staff.empName }</td>
									<td>${staff.deparement.depName}</td>
									<td>${staff.post.postName}</td>
									<td>${staff.empPhone}</td>
									<td>${staff.empEmail}</td>
									<td>${staff.empCounts}</td>
									<td><fmt:formatDate value="${staff.empDate }"
											pattern="yyyy-MM" /></td>
									<td>${staff.empRemark}</td>
									<td>
										<button class="btn btn-default btn-icon-text user-info"
											id="staff-selectKey"  onClick="emp_selectKey('${staff.empId }')">
											<i class="fa fa-search"></i>查看详情
										</button>
										<button class="btn btn-default btn-icon-text md-trigger md-setperspective" data-modal="modal-edit"
											onClick="edit('${staff.empId}')">
											<i class="fa fa-edit"></i>修改信息
										</button>
										<button class="btn btn-default btn-icon-text user-delete"
											onClick="del('${staff.empId }')">
											<i class="fa fa-trash"></i>删除
										</button>
									</td>
								</tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
			<!--重改分页的样式 -->
			   
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
										<li class="active">
										<a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li>
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
	</section>
	<!-- 显示员工资料 -->
	<div class="user_info1">
		<ul class="tab-nav ">
			<li class="active"><a href="">员工信息</a></li>
		</ul>
		<div style="padding: 20px; overflow: hidden; width: auto; height: 95%">
			<div class="form-group" style="margin-bottom: 40px;">
				<div class="col-sm-offset-1">
					<a class="profile-logo"> 
						<img src="../img/no.jpg"  alt="" id="staff-photo">
					</a>
					<div class="staff-name">
						<h3 class="user_name" id="staff-ename"></h3>
						<span class="" id="staff-dname"></span>
					</div>
				</div>
			</div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">手机</label>
				<div class="col-sm-6">
					<span class="phone" id="staff-ephone"></span>
				</div>
			</div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">备注</label>
				<div class="col-sm-6">
					<span class="phone" id="staff-eremark"></span>
				</div>
			</div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">职位</label>
				<div class="col-sm-6">
					<span class="phone" id="staff-pname"></span>
				</div>
			</div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">状态</label>
				<div class="col-sm-6">
					<span class="phone" id="staff-estatus"></span>
				</div>
			</div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">操作</label>
				<div class="col-sm-9">
					<button class="btn btn-default md-trigger md-setperspective" data-modal="modal-edit"
							onClick="edit('${staff.empId}')">
							<i class="fa fa-edit"></i>修改信息
					</button>
					<button class="btn btn-default" id="staff-del"
						onClick="del(this.value)">
						<i class="fa fa-trash"></i>删除
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 显示员工的背景层 -->
	<div class="user_bg"></div>
		
	<!-- 添加员工 -->
	<div  class="md-modal md-effect-17 " id="modal-add">
		<form class="layui-form" action="/wyht/staff/staff_add" method="post" name="staff_add" enctype="multipart/form-data">
		<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">添加员工</h4>
		        </div>
					<div class="modal-body">
						<div class="layui-form-item"> 
						<label class="layui-form-label">姓名:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入姓名" name="empName"  id="empName">
							</div>
						</div>  
						<div class="layui-form-item"> 
							<label class="layui-form-label">部门:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<select class="layui-input" id="dep" name="empDepId" lay-filter="depSelect">
									<option value="">----------请选择部门----------</option>
									<c:forEach var="dep" items="${dep}">
										<option value="${dep.depId}">${dep.depName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">职位:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<select class="layui-input" id="post" name="empPostId">
									<option value="">----------请选择岗位----------</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">手机号:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入手机号" name="empPhone" id="empPhone">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入邮箱" name="empEmail" id="empEmail">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label" > 备注： </div>
							<div class="layui-input-block">
								<textarea  class="layui-textarea" placeholder="请输入备注"  name="empRemark"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label" placeholder="请输入备注" >头像： </div>
							<div class="layui-input-block">
								<div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file0">
	            						+<img src="" id="img0" class="hide">
	        						</label>
	        						<input type="file" id="file0" name="input_file" class="hide" onchange="showPicture(this,'0')">
	                            </div>
            				</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default md-close">关闭</a>
						<a class="btn btn-success" id="add">确定</a>
					</div>
			</div>
		</form>
	</div>

	<!-- 修改员工  -->
	<div class="md-modal md-effect-17" id="modal-edit">
		<form class="layui-form" action="/wyht/staff/staff_update" method="post" id="staff_update" enctype="multipart/form-data">
			<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">编辑员工</h4>
		        </div>
					<div class="modal-body">
						<input type="hidden" name="empId" id="edit-empId"> 
						<div class="layui-form-item">
						<label class="layui-form-label">姓名:<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入姓名" name="empName"  id="edit-empName">
							</div>
						</div> 
						<div class="layui-form-item">
						<label class="layui-form-label">部门：<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<select  name="empDepId" class="layui-input" id="edit-empDepId" lay-filter="depSelect">
								</select>
							</div>
						</div>
						<div class="layui-form-item"> 
							<label class="layui-form-label">岗位：<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<select class="layui-input" name="empPostId"  id="edit-empPostId">
									<option value="">----------请选择岗位----------</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">手机号：<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入手机号" name="empPhone" id="edit-empPhone">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱：<samp style="color: red;">*</samp></label>
							<div class="layui-input-block">
								<input type="text" class="layui-input" placeholder="请输入邮箱" name="empEmail" id="edit-empEmail">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label" > 状态： </div>
							<div class="layui-input-block">
								<select class="layui-input" name="empStatus" id="edit-empStatus"></select>	
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label" > 备注： </div>
							<div class="layui-input-block">
								<textarea class="layui-textarea" placeholder="请输入备注"  name="empRemark" id="edit-empRemark"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-form-label" placeholder="请输入备注">头像： </div>
							<div class="layui-input-block">
								<div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file1">
	            						+<img src="" id="img1" >
	        						</label>
	        						<input type="file" id="file1" name="input_file" class="hide" onchange="showPicture(this,'1')">
	                            </div>
            				</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default md-close">关闭</a>
						<a class="btn btn-success" id="staff-update">确定</a>
					</div>
				</div>
		</form>
	</div>
	<!-- 模态框的背景层  -->
	<div class="md-overlay"></div> 
</body>
</html>