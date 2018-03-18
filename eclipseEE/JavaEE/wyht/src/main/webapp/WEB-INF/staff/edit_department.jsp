<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
</head>
	<script src="${pageContext.request.contextPath }/dwr/engine.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/util.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/interface/employeeController.js"></script>
<script src="/wyht/js/js-staff/edit_department.js"></script>
<body>
<!-- 头部页面 -->
<section id="main">
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                <div class="card-header">
                    <h2>添加岗位</h2>
                </div>
                <div class="hr-solid"></div>
                <div class="card-body">
                    <form action="" class="col-lg-12">
                        <div class="col-md-12 m-10">
                            <div class="col-md-2 text-right" >部门名称:</div>
                            <div class="col-md-4">
                              <input type="text" class="form-control" value="${dep.depName}" readonly>
                            </div>
                        </div>
                       
                        <div class="hr-dashed"></div>
                        <div class="col-md-12 m-10">
                            <div class="col-md-2 text-right" >岗位:</div>
                            <div class="col-md-8">
                                 <table class="table table-hover text-center">
		                            <thead>
		                            <tr class="active">
		                                <th>岗位</th>
		                                <th>员工</th>
		                                <th>操作</th>
		                            </tr>
		                            <c:forEach var="post" items="${list}">
			                            	<tr>
					                            <td>${post.postName}</td>
					                            <td>${post.postCount}</td>
					                            <td>
													 <a   class=" md-trigger md-setperspective" data-modal="modal-18" onClick="edit('${post.postId}')">
						                                &nbsp;&nbsp;编辑 &nbsp;&nbsp;
						                            </a>
													<a  onClick="del('${post.postId}')"> 删除 </a>
					                            </td>
				                            </tr>
		                              </c:forEach>
		                            </thead>
		                        </table>
                            </div>
                            <div class="col-md-offset-2 col-md-4" style="background:#fff; margin-bottom:10px;">
		                        <div class="pull-left">
		                            <button type="button" class="btn btn-success md-trigger md-setperspective" data-modal="modal-add">
		                                <i class="fa fa-plus"></i>&nbsp;添加岗位
		                            </button>
		                        </div>
               				</div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="col-md-12 m-10">
                            <div class="col-md-2 text-right" > </div>
                            <div class="col-md-4">
                                <a  class="btn btn-primary m-t-10 btn-w-m" href="${pageContext.request.contextPath}/staff/department_all">保存并返回</a>
                                <button type="button" class="btn btn-default m-t-10 btn-w-m" onclick="javascript:history.go(-1)">返回</button>
                            </div>
                        </div>
                      </form>
                </div>
        </div>
    </div>
</section>
<div class="md-modal md-effect-17" id="modal-18">
	<form class="layui-form" action="<%=request.getContextPath()%>/staff/post_update" modelAttribute="post" method="Post" id="post_update">
	  		<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">编辑岗位</h4>
		        </div>
	              <div class="modal-body"> 
	            	 <input  class="form-control" type="hidden" name="postId" id="post_id">
	            	 <input  class="form-control" type="hidden" name="postDepId" value="${depId}">
	                <div class="layui-form-item">
						<label class="layui-form-label">岗位:<samp style="color: red;">*</samp></label>
	                    <div class="layui-input-block">
	                        <input type="text" class="form-control" name="postName" id="post_name">
	                    </div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default md-close">关闭</button>
	                <button type="button" class="btn btn-success" id="post-update">确定</button>
	            </div>
	        </div>
	   </form>
</div>

<div class="md-modal md-effect-17" id="modal-add">
	<form  class="layui-form" action="<%=request.getContextPath()%>/staff/post_add"  method="Post" id="post_add">
	  		<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">新增岗位</h4>
		        </div>
	            <div class="modal-body">
	            	 <input type="hidden" class="form-control" name="postDepId" value="${dep.depId}">
	                <div class="layui-form-item">
						<label class="layui-form-label">岗位:<samp style="color: red;">*</samp></label>
	                    <div class="layui-input-block"> <input type="text" class="form-control" id="postName" name="postName"></div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default md-close">关闭</button>
	                <button type="button" class="btn btn-success" id="post-add">确定</button>
	            </div>
	        </div>
	   </form>
</div>
<!-- 模态框的背景层  -->
<div class="md-overlay"></div> 
</body>
</html>