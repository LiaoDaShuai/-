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
	<script src="/wyht/js/js-staff/warranty_all.js"></script>
</head>
<body>
	<section id="main"> <!--主要内容 -->
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<div class="card-header">
				<h2>报修列表</h2>
			</div>
			<div class="hr-solid"></div>
						<div class="col-md-12" style="background: #fff; margin-bottom: 10px;">
					<form method="post" name="f1" action="${pageContext.request.contextPath}/staff/warranty_all" class="form-horizontal">
						<div class="list-action-grid">
								<div class="col-sm-12 toggaoji" style="margin: 0px;">
									<div class="row p-t-10">
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">类型</label>
											 <input type="hidden" value="${warranty.wartypeId}" id="wartypeIdMohu">
											<select class="form-control-static col-sm-7" id="wartype" name="wartypeId"></select>
										</div> 
										<div class="form-group col-sm-3">
											<label class="col-sm-3" style="margin-top: 8px;">状态</label>
											 <input type="hidden" value="${warranty.warStatus}" id="warStatusMohu">
											 <select class="form-control-static col-sm-7"  id="warstatus" name="warStatus">
												<option value='' select>---请选择状态---</option>
												<option value='0'>待接单</option>
												<option value='1'>待服务</option>
												<option value='2'>待费用确定</option>
												<option value='3'>待付款</option>
												<option value='4'>已完成</option>		
											</select>
										</div>
										 <div class="form-group col-sm-5">
											<label class="col-sm-4" style="margin-top: 8px;">提交日期</label>
											<div class="col-sm-4">
											<input type="text" class="form-control"  placeholder="开始日期">
											</div>
											<div class="col-sm-4">
											<input type="text" class="form-control"  placeholder="结束日期">
											</div>
										</div>
									</div>
									<div class="row p-t-10">
										<div class="form-group col-sm-4">
											<label class="col-sm-3" style="margin-top: 8px;">关键字：</label>
											<input type="text" class="form-control-static col-sm-7"
												id="advanced" disabled value="${warranty.warContent}"
												name="warContent" placeholder="请输入关键字">
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
								<a class="btn btn-success md-trigger md-setperspective" data-modal="modal-add">
			                       <i class="fa fa-plus"></i>&nbsp;添加报修单
			                 </a>
							</div>
							<div class="pull-right">
								<a href="javascript:" class="pull-left gaoji"> 高级搜索</a>
								<div class="suotext">
									<input type="text" name="warContent" id="ordinary"
										value="${warranty.warContent}" class="wentext" placeholder="请输入关键字">
									<button class="btn-list list-setting">
										<i class="fa fa-search"></i>
									</button>
								</div>
								<a href="https://www.weixiaoqu.com/faqs" class="btn-list"
									target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
							</div>
						</div>
						<input type="hidden" name="pageNum" value=""> 
						<input type="hidden" name="pageSize" value="${page2.size}">
					</form>
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
							<th>报修单ID</th>
							<th>报修类型</th>
							<th>报修内容</th>
							<th>提交人</th>
							<th>房间</th>
							<th>提交时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="war" items="${page.list}">
							<tr>
								<td>${war.warId}</td>
								<td>${war.wartype.wartypeName}</td>
								<td>${war.warContent}</td>
								<td>${war.owners.owername}</td>
								<td>${war.hnum}</td>
								<td><fmt:formatDate value="${war.warDate}"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>
								<c:if test="${war.warStatus==0}">
                            		待接单
                            	</c:if>
                            	<c:if test="${war.warStatus==1}">
                            		待服务
                            	</c:if>
                            	<c:if test="${war.warStatus==2}">
                            		待费用确定
                            	</c:if>
                            	<c:if test="${war.warStatus==3}">
                            		待付款
                            	</c:if>
                            	<c:if test="${war.warStatus==4}">
                            		已完成
                            	</c:if>
                            	</td>
								<td>
								<button class="btn btn-default btn-icon-text md-trigger md-setperspective" data-modal="modal-edit"
									onClick="update('${war.warId}')">
									<i class="fa fa-wrench"></i>安排维修 
								</button>
								<a class="btn btn-default btn-icon-text user-info"
									onClick="select('${war.warId}')"> 
									<i class="fa fa-search"></i>查看详情
								</a> 
								<a class="btn btn-default btn-icon-text" onClick="del('${war.warId}')">
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
	</section>
	<!-- 显示通知 -->
	<div class="user_info1">
		<ul class="tab-nav ">
			<li class="active"><a href="">报修单信息</a></li>
		</ul>
		<div style="padding: 20px; overflow: hidden; width: auto; height: 95%">
			<div class="form-group" style="margin-bottom: 40px;">
				<div class="col-sm-offset-1">
					<a href="" class="profile-logo"> 
						<img src="../img/no.jpg" alt="" id="ownerphoto">
					</a>
					<div class="staff-name">
						<h3 class="user_name" id="ownername"></h3>
						<span class="" id="hnum"></span>
					</div>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20  ">
				<label for="" class="col-md-3 text-right">类型</label>
				<div class="col-sm-6">
						<span class="phone" id="wartypeId"></span>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20  ">
				<label for="" class="col-md-3 text-right">内容</label>
				<div class="col-sm-6">
					<span class="phone" id="warContent"></span>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20 col-md-12" >
				<label for="" class="col-md-3 text-right">图片</label>
				<div class="col-sm-6">
					<span class="phone"></span>
					<img alt="" src="" id="warImg" style="width:150px;height:150px;">
				</div>
			</div>
			<div class="hr-dashed"></div>
			<div class="form-group p-20  ">
				<label for="" class="col-md-3 text-right">接单人</label>
				<div class="col-sm-6">
					<span class="phone" id="warserviceId"></span>
				</div>
			</div>
			<div class="hr-dashed"></div>
			<form action="/wyht/staff/war_update" method="Get" id="war_update">
				<input type="text" id="warId" name="warId" hidden>
				<div class="form-group p-20 col-md-12">
					<label for="" class="col-md-3 text-right">状态</label>
					<div class="col-sm-6"> 
						<select class="form-control" id="warStatus" name="warStatus">
						<option value='0'>待接单</option>
						<option value='1'>待服务</option>
						<option value='2'>待费用确定</option>
						<option value='3'>待付款</option>
						<option value='4'>已完成</option>			
						</select>
					</div>
				</div>
			</form>
			<div class="hr-dashed"></div>
			<div class="form-group p-20">
				<label for="" class="col-md-3 text-right">操作</label>
				<div class="col-sm-9">
					<button class="btn btn-default" id="war-del"
						onClick="del(this.value)">
						<i class="fa fa-trash"></i>删除
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="user_bg"></div>
	
	<!-- 添加报事  -->
	<div class="md-modal md-effect-17" id="modal-add">
		<form class="layui-form" action="<%=request.getContextPath()%>/staff/warranty_add" method="Post" id="warranty_add" enctype="multipart/form-data">
			<div class="md-content">    
	            	<div class="modal-header">
				          <h4 class="modal-title" style="text-align:center">添加报修单</h4>
			        </div>
					<div class="modal-body">
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">类型： </div>
							<div class="layui-input-block">
								<select class="layui-input" name="wartypeId" id="wartype_id"></select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">业主： </div>
							<div class="layui-input-block">
								<select class="layui-input" name="cmpOwnersOid" id="cmp_owners_oid"></select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">内容：</div>
							<div class="layui-input-block">
								<textarea class="layui-textarea" name="warContent" id="Context" placeholder="请输入内容"></textarea>
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
							  <button type="button"  class="layui-btn layui-btn-primary  md-close" data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
	
	<!-- 添加维修人员 -->
	<div class="md-modal md-effect-17" id="modal-edit">
		<form  class="layui-form" action="<%=request.getContextPath()%>/staff/war_update" method="Post" id="warranty_update">
			<div class="md-content">    
	            <div class="modal-header">
			          <h4 class="modal-title" style="text-align:center">编辑员工</h4>
		        </div>
					<div class="modal-body">
						<div class="layui-form-item">
							<div class="layui-form-label"> 部门： </div>
							<div class="layui-input-block">
								<select id="dep" lay-filter="depSelect">
									<option value="">----------请选择部门----------</option>
								</select>&ensp;
								<select id="post" lay-filter="postSelect">
									<option value="">----------请选择岗位----------</option>
								</select>
							</div>
						</div>
						<div class="hr-dashed"></div>
						<div class="layui-form-item">
							<div class="layui-form-label">员工： </div>
							<div class="layui-input-block">
								<select name="warserviceId" id="emp">
									<option value="">----------请选择员工----------</option>
								</select>
							</div>
						</div>
						<input type="hidden"  name="warStatus" value="1"></input>
						<input type="hidden" name="warId" id="war-update"></input>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default md-close">关闭</a>
						<a class="btn btn-success" id="warranty-update">确定</a>
					</div>
				</div>
		</form>
	</div>
	
	<!-- 模态框的背景层  -->
	<div class="md-overlay"></div> 		
	<script type="text/javascript">
	$(function(){
		layui.use('form', function(){
			var form=layui.form;
			form.on('select(depSelect)',function(da){
				$("#post [value!='']").remove();
				employeeController.selectPost(da.value,function(data){
					for(var i=0;i<data.length;i++)
					{
			 			$("#post").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
					}
					form.render('select');
				});
			});
			form.on('select(postSelect)',function(da){
				$("#emp [value!='']").remove();
				employeeController.selectEmployee(da.value,function(data){
					for(var i=0;i<data.length;i++)
					{
			 			$("#emp").append("<option value="+data[i].empId+">"+data[i].empName+"</option>")
					}
					form.render('select');
				});
			});
			form.render();
		});
	})
	</script>
</body>
</html>