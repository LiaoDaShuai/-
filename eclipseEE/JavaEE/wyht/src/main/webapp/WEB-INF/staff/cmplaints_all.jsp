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
	<script type="text/javascript" src="/wyht/js/js-staff/cmplaints_all.js"></script>
</head>
<body>
<section id="main">
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<div class="card-header">
				<h2>投诉管理</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body">
<%-- 				<form action="${pageContext.request.contextPath }/staff/message_all" name="f1" method="get"> --%>
<!-- 					<div class="col-md-12" -->
<!-- 						style="background: #fff; margin-bottom: 10px;"> -->
<!-- 						<div class="pull-left"> -->
<!-- 							 <a class="btn btn-success md-trigger md-setperspective" data-modal="modal-add"> -->
<!-- 		                       <i class="fa fa-plus"></i>&nbsp;添加投诉 -->
<!-- 		                 </a> -->
<!-- 						</div> -->
<!-- 						<div class="pull-right"> -->
<!-- 							<div class="suotext"> -->
<%-- 								<input type="text" name="mohu" value="${mohu}" class="wentext" placeholder="请输入投诉名称关键字"> --%>
<!-- 								<button type="submit" class="btn-list list-setting"> -->
<!-- 									<i class="fa fa-search"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 							<a href="https://www.weixiaoqu.com/faqs" class="btn-list" -->
<!-- 								target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<input type="hidden" name="pageNum" value=""> <input -->
<%-- 						type="hidden" name="pageSize" value="${page2.size}"> --%>
<!-- 				</form> -->
					<form action="${pageContext.request.contextPath }/staff/cmplaints_all" name="f1" method="get">
					<div class="col-sm-12 toggaoji" style="border-top: 0; border-bottom: 1px solid #E0E0E0">
						<div class="row p-t-10">
							<div class="form-group col-sm-4">
								<label for class="col-sm-3 p-t-10">种类：</label> 
								<input  value="${cmplaints.cmptypeId}" id="cmptypeIdMohu" type="hidden">
								<select class="form-control-static col-sm-7" name="cmptypeId" id="cmptype"></select>
							</div>
	
							<div class="form-group col-sm-4 ">
								<label for class="col-sm-4 p-t-10">关键字：</label> 
								<input type="text" class="col-sm-7  form-control-static" id="advanced"
									name="cmpContent" value="${cmplaints.cmpContent}" disabled>
							</div>
							<div class="form-group col-sm-4">
								<button class="col-sm-3 btn btn-success"
									style="margin: 0 5px 0 10px;">
									<i class="fa fa-search"></i> 搜索
								</button>
								<button class="col-sm-3 btn btn-default"
									style="margin-right: 5px;">清空</button>
								<button class="col-sm-3 btn btn-default">关闭</button>
							</div>
						</div>
					</div>
					<div class="col-md-12 table" style="background: #fff; margin-bottom: 10px;">
						<div class="pull-left">
							 <a class="btn btn-success md-trigger md-setperspective" data-modal="modal-add">
			                       <i class="fa fa-plus"></i>&nbsp;添加报事
			                 </a>
						</div>
						<div class="pull-right">
							<a href="javascript:" class="pull-left gaoji">高级搜索</a>
							<div class="suotext">
								<input type="text" name="cmpContent" id="ordinary"
									value="${cmplaints.cmpContent}" class="wentext" placeholder="请输入内容关键字">
								<button class="btn-list list-setting">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<a href="https://www.weixiaoqu.com/faqs" class="btn-list"
								target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
						</div>
					</div>
					<div>
						<input type="hidden" name="pageNum" value=""> <input
							type="hidden" name="pageSize" value="${page2.size }">
					</div>
				</form>
					<div class="com-md-12">
						<table class="table table-hover text-center">
							<thead>
								<tr class="active">
									<th>投诉类型</th>
									<th style="width:300px;">投诉内容</th>
									<th>提交人</th>
									<th>房间</th>
									<th>提交时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cmp" items="${page.list}">
									<tr>
										<td>${cmp.cmptype.cmptypeName}</td>
										<td><div style="width:300px; overflow: hidden; text-overflow: ellipsis;">${cmp.cmpContent}</div></td>
										<td>${cmp.owners.owername}</td>
										<td>${cmp.hnum}</td>
		                            	<td><fmt:formatDate value="${cmp.cmpData}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td ><c:if test="${cmp.cmpStatus==0}">
		                            		未处理
		                            	</c:if>
		                            	<c:if test="${cmp.cmpStatus==1}">
		                            		已处理
		                            	</c:if></td>
										<td>
										<a class="btn btn-default btn-icon-text user-info" onClick="select('${cmp.cmpId}')"> 
											<i class="fa fa-search"></i>查看详情
										</a>
										<a class="btn btn-default btn-icon-text" onClick="del('${cmp.cmpId}')">
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
</section>
	<!-- 添加通知 -->
	<div class="md-modal md-effect-17" id="modal-add">
		<form class="layui-form" action="/wyht/staff/cmplaints_add" method="Post" id="cmplaints_add" enctype="multipart/form-data">
			<div class="md-content">    
	            	<div class="modal-header">
				          <h4 class="modal-title" style="text-align:center">添加投诉</h4>
			        </div>
					<div class="modal-body">
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">类型： </div>
							<div class="layui-input-block">
								<select name="cmptypeId" id="cmptype_id"></select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">业主： </div>
							<div class="layui-input-block">
								<select  name="cmpOwnersOid" id="cmp_owners_oid"></select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">内容：</div>
							<div class="layui-input-block">
								<textarea class="layui-textarea" rows="4" cols="4" name="cmpContent" id="Context" placeholder="请输入说明"></textarea>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<label class="layui-form-label">图片： </label>
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
						<div class="layui-form-item">
							<div class="layui-input-block">
							  <button type="button" class="layui-btn" id="cmplaints-add">确定</button>
							  <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
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
	<div style="padding: 20px; overflow: hidden; width: auto; height: 95%" >
			<div class="form-group" style="margin-bottom: 40px;">
				<div class="col-sm-offset-1" >
					<a href="" class="profile-logo"> 
						<img src="../img/no.jpg" alt="" id="ownerphoto">
					</a>
					<div class="staff-name">
						<h3 class="user_name" id="ownername"></h3>
						<span id="hnum"></span> 
					</div>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12">
				<label for="" class="col-md-3 text-right">类型</label>
				<div class="col-sm-6">
						<span class="phone" id="cmptypeId"></span>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12">
				<label for="" class="col-md-3 text-right">内容</label>
				<div class="col-sm-6">
					<div style="width:200px;word-wrap:break-word;">
						<span class="phone" id="cmpContent"></span>
					</div>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12" >
				<label for="" class="col-md-3 text-right">图片</label>
				<div class="col-sm-6">
					<span class="phone"></span>
					<img alt="" src="" id="cmpImg" style="width:150px;height:150px;">
				</div>
			</div>
<!-- 			<div class="hr-dashed"></div> -->
<!-- 			<div class="form-group p-20 col-md-12"> -->
<!-- 				<label for="" class="col-md-3 text-right">回复内容 </label> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 						<span class="phone"></span> -->
<!-- 				</div> -->
<!-- 			</div>		 -->
<!-- 			<div class="hr-dashed"></div> -->
<!-- 			<div class="form-group p-20 col-md-12"> -->
<!-- 				<label for="" class="col-md-3 text-right">回复人</label> -->
<!-- 				<div class="col-sm-6"> -->
<!-- 						<span class="phone"></span> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="hr-dashed"></div>
			<form action="/wyht/staff/cmplaints_update" method="Post" id="cmplaints_update">
				<input type="text" id="cmpId" name="cmpId" hidden>
				<div class="form-group p-20 col-md-12">
					<label for="" class="col-md-3 text-right">状态</label>
					<div class="col-sm-6"> 
						<select class="form-control" id="cmpStatus" name="cmpStatus">
						</select>
					</div>
				</div>
			</form>
			<div class="form-group p-15 col-md-12">
				<label for="" class="col-md-3 text-right">操作</label>
				<div class="col-sm-9">
					<button class="btn btn-default" id="cmp-del" onClick="del(this.value)">
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
</html>