<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
	<script type="text/javascript" src="/wyht/js/datacenter/danyuan.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row header">
            <div class="col-sm-12" style="margin:0 0 0 20px;">单元管理</div>
        </div>
        <div class="hr-solid"></div>
        <div class="operation" style="padding:40px 0 70px;">
        <form action="/wyht/unit/all" id="f1" name="f1" method="post">
        	<input type="hidden" name="pageNum" value="">
			<input type="hidden" name="pageSize" value="${page2.size }">
            <div class="col-sm-12" style="border-top: 0;">
                <div class="row p-t-10">
                    <div class="col-sm-2">
                        <label>小区：</label>
                        <select class="form-control-static" id="disid1" name="disid">
                            <option value="0">---请选择小区---</option>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <label>楼宇：</label>
                        <select class="form-control-static" id="hlid1" name="hlid">
                            <option value="0">---请选择楼宇---</option>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <label>单元名称：</label>
                        <input type="text" class="form-control-static" name="unitname" value="${unit.unitname }" placeholder="请输入小区单元名称">
                    </div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-success" onclick="sousuo()"> 搜索</button>
                        <a class="btn btn-info" data-toggle="modal" href="#myModal" onclick="insert()"><i class="fa fa-plus"></i> 添加单元</a>
                    	<button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                    </div>
                </div>
            </div>
        </form>
        </div>
        <div class="table-responsive col-sm-12" >
            <table class="table table-hover">
                <thead>
                <tr style="font-size: 18px;">
                    <th>单元名称</th>
                    <th>所属小区</th>
                    <th>所属楼宇</th>
                    <th>房屋数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody style="text-align:center;">
                <c:forEach items="${page.list}" var="u">
                <tr style="font-size: 14px;">
                    <td>${u.unitname }</td>
                    <td>${u.dis.dname }</td>
                    <td>${u.hl.floorname }</td>
                    <td>${u.floorcount }</td>
                    <td>
                        <a data-toggle="modal" href="#myModal1" onclick="edit('${u.unitid }','${u.unitname }','${u.disid }','${u.hlid }')"><i class="fa fa-edit"></i> 编辑</a>
                        <a onclick="after_delete('${u.unitid }','${u.disid }','${u.hlid }')"><i class="fa fa-trash"></i> 删除</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="pull-left biao-er-wai">共${page.total }条记录 ${page.pageNum }/${page.lastPage }页</div>
            <c:if test="${page.total>page2.size }">
            <div class="col-sm-6 col-sm-offset-3">
           		<ul class="pagination pagination-sm">
           			<li><a href="javascript:Fenye(1)">
           			<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>     
           			<li><a href="javascript:Fenye(${page.pageNum-1},${page.lastPage })">
           			<i class="fa fa-angle-left"></i></a></li>     
           			<c:forEach begin="${page2.startPage }" end="${page2.endPage }" var="num">
           				<c:if test="${num==page.pageNum}">
           				<li class="active"><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li></c:if>
            			<c:if test="${num!=page.pageNum }">
            			<li><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li></c:if>
            		</c:forEach>
            		<li><a href="javascript:Fenye(${page.pageNum+1},${page.lastPage })">
            		<i class="fa fa-angle-right"></i></a></li> 
            		<li><a href="javascript:Fenye(${page.lastPage},${page.lastPage })">
            		<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>     
            	</ul>
            </div>
            </c:if>
            <div class="pull-right biao-er-wai">该页显示：
                <select style="width:100px;height:25px;" class="pagination">
                	<c:forEach items="${page2.selectnum }" var="selectsize">
                		<c:if test="${selectsize==page2.size }">
                			<option value="${selectsize }" selected="selected">${selectsize }条</option>
                		</c:if>
                		<c:if test="${selectsize!=page2.size }">
                			<option value="${selectsize }">${selectsize }条</option>
                		</c:if>
            		</c:forEach>
            	</select>
            	数据
            </div>
        </div>
    </div>

<!--添加单元-->
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	添加单元
                </h4>
            </div>
            <form class="layui-form" action="/wyht/unit/insert" method="post" id="f2">
            	<input type="hidden" id="dd" name="disid">
                <input type="hidden" id="hd" name="hlid">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">单元: </label>
                            <div class="layui-input-block">
                                <input type="text" id="unitname2" name="unitname" class="layui-input">
                            </div>
                    </div>
            	</div>
	            <div class="modal-footer">
	            	<div class="layui-form-item">
					    <div class="layui-input-block">
					      <button type="button" class="layui-btn verification" id="save2">确定</button>
					      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
	            </div>
            </form>
        </div>
    </div>
</div>

<!--编辑-->
<div class="modal fade" id="myModal1" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑单元
                </h4>
            </div>
            <form class="layui-form" action="/wyht/unit/update" method="post" id="f3">
            	<input type="hidden" id="unitid" name="unitid">
            	<input type="hidden" id="disid" name="disid">
            	<input type="hidden" id="hlid" name="hlid">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">单元: </label>
                            <div class="layui-input-block">
                                <input type="text" id="unitname3" name="unitname" class="layui-input">
                            </div>
                    </div>
            	</div>
            	<div class="modal-footer">
            		<div class="layui-form-item">
					    <div class="layui-input-block">
					      <button type="button" class="layui-btn verification" id="save3">确定</button>
					      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
            	</div>
            </form>
        </div>
    </div>
</div>

<script>
	$(function(){
		//初始化小区下拉框和楼宇下拉框
		var ds="${unit.disid}";
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
        	if(ds!=0){
        		$("#disid1").find("option[value="+ds+"]").attr("selected",true);
        	}
		})
		var hlid="${unit.hlid}";
		datacenterController.selectly("${unit.disid}",function(data){
			for(var i=0;i<data.length;i++) {  
                $("#hlid1").append("<option value='"+data[i].hlid+"'>"+data[i].floorname+"</option>");
            }
			if(hlid!=0){
		    	$("#hlid1").find("option[value="+hlid+"]").attr("selected",true);
		    }
		})
	})
</script>

</body>
</html>