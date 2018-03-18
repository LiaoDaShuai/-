<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
	<script src="${pageContext.request.contextPath }/dwr/engine.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/util.js"></script>
	<script src="${pageContext.request.contextPath }/dwr/interface/employeeController.js"></script>
	<script src="/wyht/js/js-staff/index.js"></script>
</head>
</head>
<body>
<section id="main">
	<!--主要内容 -->
		<div class="container col-sm-11 container-bianju">
            <div class="card">
                <div class="card-header">
                    <h2>组织架构管理</h2>
                </div>
                <div class="hr-solid"></div>
                <div class="card-body ">
                    <div class="col-md-12" style="background:#fff; margin-bottom:10px;">
                        <div class="pull-left">
                            <a class="btn btn-success md-trigger md-setperspective" data-modal="modal-17">
                             	<i class="fa fa-plus"></i>&nbsp;添加部门
                            </a>
                        </div>                   
                    </div>
                    <form action="${pageContext.request.contextPath }/staff/department_all" name="f1" method="get">
						<input type="hidden" name="pageNum" value=""> 
						<input type="hidden" name="pageSize" value="${page2.size }">				
					</form>
                    <div class="com-md-12">
                        <table class="table table-hover text-center">
                            <thead>
                            <tr class="active">
                                <th>部门名称</th>
                                <th>岗位数</th>
                                <th>员工数量</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                               <c:forEach var="department" items="${page.list}">
		                            <tr>
			                            	<td>${department.depName}</td>
				                        	<td>${department.depCount}</td>
				                            <td>${department.depEmpCount}</td>
				                            <td>
				                               <a class="btn btn-default btn-icon-text user-edit" href="${pageContext.request.contextPath }/staff/department_edit/${department.depId}">
				                                        <i class="fa fa-edit"></i>修改信息
				                               </a>
				                               <c:if test="${department.depCount==0}">
<%-- 					                               <a class="btn btn-default btn-icon-text user-delete" href="${pageContext.request.contextPath }/staff/department_del/${department.depId}"> --%>
<!-- 				                                        <i class="fa fa-trash"></i>删除 -->
<!-- 				                                   </a> -->
				                                   <a class="btn btn-default btn-icon-text user-delete" onClick="del('${department.depId }')">
				                                        <i class="fa fa-trash"></i>删除
				                                   </a>
				                        		</c:if>
				                        	</td>
		                            </tr>
                              </c:forEach>
                        </table>
                    </div>
                    	<!--重改分页的样式 -->
						<div style="padding: 0 20px; overflow: hidden">
							<div class="pull-left biao-er-wai">共${page.total}条记录
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
    <div class="md-modal md-effect-17" id="modal-17">
     		<form class="layui-form" action="<%=request.getContextPath()%>/staff/department_add" method="Post" id="dep_add">
	     	    <div class="md-content">    
	                <div class="modal-header">
			               <h4 class="modal-title" style="text-align:center">新增部门</h4>
		            </div>
		            <div class="modal-body">
		               <div class="layui-form-item"> 
						<label class="layui-form-label">部门:<samp style="color: red;">*</samp></label>
		                    <div class="layui-input-block">
		                        <input type="text" class="layui-input" name="depName" id="depName">
		                    </div>
		                </div>
		            </div>
		            <div class="modal-footer">
		            	<div class="layui-form-item">
			            	<div class="layui-input-block">
								<button type="button" class="layui-btn" id="dep-add">确定</button>
								<a class="layui-btn layui-btn-primary md-close">关闭</a>
							</div>
						</div>
		            </div>
	            </div>
            </form>
    </div>
 	<!-- 模态框的背景层  -->
    <div class="md-overlay"></div>  
</body>
</html>