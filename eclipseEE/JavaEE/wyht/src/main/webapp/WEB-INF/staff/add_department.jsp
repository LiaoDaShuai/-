<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
</head>
<body>
<!-- 头部页面 -->
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                <div class="card-header">
                    <h2>添加部门</h2>
                </div>
                <div class="hr-solid"></div>
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/staff/dep_post_add" class="col-lg-12">
                        <div class="col-md-12 m-10">
                            <lable class="col-md-2 text-right" >部门名称:</lable>
                            <div class="col-md-4">
                              <input type="text" class="form-control"  name="depName">
                            </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="col-md-12 m-10">
                            <lable class="col-md-2 text-right" >岗位:</lable>
                            <div class="col-md-8">
                                 <table class="table table-hover text-center">
		                            <thead>
		                            <tr class="active">
		                                <th>岗位</th>
		                                <th>员工</th>
		                                <th>操作</th>
		                            </tr>
		                            </thead>
		                        </table>
                            </div>
                            <div class="col-md-offset-2 col-md-4" style="background:#fff; margin-bottom:10px;">
		                        <div class="pull-left">
		                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#post_add">
		                                <i class="fa fa-plus"></i>&nbsp;添加岗位
		                            </button>
		                    </div>
                        </div>
                        <div class="hr-dashed"></div>
                        <div class="col-md-12 m-10">
                            <lable class="col-md-2 text-right" > </lable>
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-primary m-t-10 btn-w-m">保存</button>
                                <button type="button" class="btn btn-default m-t-10 btn-w-m" onclick="history.go(-1)">返回</button>
                            </div>
                        </div>
                      </form>
                </div>
        </div>
    </div>

<!-- 添加职位 -->
<div class="modal fade" id="post_add" data-backdrop="static">
	<form class="layui-form" action="/wyht/staff/post_add" modelAttribute="post" method="Get" id="dep-add">
	    <div class="modal-dialog" style="margin-top:180px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" >新增岗位</h4>
	            </div>
	            <div class="modal-body">
	            	<input type="hidden" name="post_dep_id" >
	                <div class="layui-form-item">
	                    <label class="layui-form-label">
	                       	岗位：
	                        <span class="text-danger">*</span>
	                    </label>
	                    <div class="layui-input-block">
	                        <input type="text" class="layui-input" name="postName">
	                    </div>
	                </div>
	                <div class="hr-dashed"></div>
		             <div class="layui-form-item">
		                    <label class="layui-form-label">
		                       	权限：
		                        <span class="text-danger">*</span>
		                    </label>
							<div class="layui-input-block">
						      	<input type="checkbox">&ensp;&ensp;&ensp;通知公告通知
						      	<input type="checkbox">&ensp;&ensp;&ensp;内部报事通知	
						    </div>
		              </div>
	            </div>
	            <div class="modal-footer">
					<div class="layui-form-item">
		            	<div class="layui-input-block">
							<button type="button" class="layui-btn" id="post-add">确定</button>
							<button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
						</div>
					</div>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
	   </form>
</div>
<script>
$(function(){
// 		$("#post-add").click(function(){
// 			employeeController.PostDepIdAdd(function(data){	
// 			});
// 		});
		
	});
</script>
</body>
</html>