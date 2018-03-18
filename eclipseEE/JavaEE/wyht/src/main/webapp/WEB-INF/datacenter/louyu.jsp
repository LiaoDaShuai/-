<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/datacenter/louyu.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
	    <div class="row header">
	        <div class="col-sm-12" style="margin:0 0 0 20px;">楼宇列表</div>
	    </div>
	    <div class="hr-solid"></div>
	    <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
	    	<form action="" id="f1" name="f1" method="post">
				<input type="hidden" name="pageNum" value=""> 
				<input type="hidden" name="pageSize" value="${page2.size }">
	            <div class="row p-t-10">
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10"> 所属小区：</label>
	                    <select class="form-control-static col-sm-7" id="disid1" name="disid">
	                        <option value="0">---请选择小区---</option>
	                    </select>
	                </div>
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10">关键字：</label>
	                    <input type="text" id="advanced" name="floorname" value="${houselou.floorname }" placeholder="请输入楼宇名称" class="form-control-static col-sm-7">
	                </div>
	                <div class="form-group col-sm-4">
	                    <button type="submit" class="btn btn-success" style="margin:0 5px 0 10px;">
	                    	<i class="fa fa-search"></i> 搜索
	                    </button>
	                    <button type="button" class="btn btn-default" onclick="clear_form()">&nbsp;清空&nbsp;</button>
	                    <button type="button" class="btn btn-default">&nbsp;关闭&nbsp;</button>
	                </div>
	            </div>
	    	</form>
	    </div>
	    <div style="margin:10px 0 5px 15px;">
            <button type="button" value="" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                <i class="fa fa-plus"></i> 添加楼宇
            </button>
            <div class="pull-right">
                <a href="javascript:" class="pull-left gaoji">高级搜索</a>
                <div class="suotext">
                    <input type="text" id="ordinary" value="${houselou.floorname }" class="wentext" placeholder="请输入楼宇名称">
                    <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
                </div>
                <a href="" class="btn-list" target="_blank" title="帮助中心">
                    <i class="fa fa-question"></i></a>
            </div>
        </div>
	    <div class="table-responsive col-sm-12" >
	        <table class="table table-hover col-sm-12">
	                 <thead>
	                    <tr style="font-size: 18px;">
	                        <th>所属小区</th>
	                        <th>楼宇名称</th>
	                        <th>单元数量</th>
	                        <th>楼宇层数</th>
	                        <th>楼宇类型</th>
	                        <th>楼宇结构</th>
	                        <th>楼宇朝向</th>
	                        <th>操作</th>
	                    </tr>
	                 </thead>
	                 <tbody style="text-align:center;">
	                 	<c:forEach items="${page.list }" var="hl">
	                     <tr style="font-size: 14px;">
	                        <td>${hl.dis.dname }</td>
	                        <td>${hl.floorname }</td>
	                        <td>
	                            <input type="text" size="2" value="${hl.units }" class="text-center"
	                                   readonly style="border:0;">
	                            <a href="javascript:manage('${hl.hlid }','${hl.disid }','${hl.units }');">管理</a>
	                        </td>
	                        <td>${hl.cengcount }</td>
	                        <td>${hl.floortype }</td>
	                        <td>${hl.structure }</td>
	                        <td>${hl.orientation }</td>
	                        <td>
	                            <a href="/wyht/house/all" class="onClickhand"><i class="fa fa-home"></i> 房屋管理</a>
	                            <a data-toggle="modal" href="#myModal2" onclick="edit('${hl.hlid}')"><i class="fa fa-edit"></i> 编辑</a>
	                            <a onclick="after_delete('${hl.hlid}')" class="onClickhand"><i class="fa fa-trash"></i> 删除</a>
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
</body>

<!--添加楼宇-->
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                   	 添加楼宇
                </h4>
            </div>
            <form class="layui-form" action="/wyht/louyu/insert" method="post" id="f2">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_1" id="disid2" name="disid">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇名称:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="floorname2" name="floorname" class="layui-input" placeholder="请输入楼宇名称">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">单元数量:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="units2" name="units" class="layui-input" value="1">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇层数:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="cengcount2" name="cengcount" class="layui-input" placeholder="请输入楼宇层数">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇类型:</label>
                            <div class="layui-input-block">
                                <input type="text" name="floortype" class="layui-input" placeholder="例如:多层/高层">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇结构:</label>
                            <div class="layui-input-block">
                                <input type="text" name="structure" class="layui-input" placeholder="请输入楼宇结构">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇朝向:</label>
                            <div class="layui-input-block">
                                <input type="text" name="orientation" class="layui-input" placeholder="请输入楼宇朝向">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">备注:</label>
                            <div class="layui-input-block">
                                <input type="text" name="remark" class="layui-input">
                            </div>
                    </div>
            </div>
            <div class="modal-footer">
                <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save2">保存</button>
				      <button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
            </form>
        </div>
    </div>
</div>
<!--编辑-->
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑楼宇
                </h4>
            </div>
            <form class="layui-form" action="/wyht/louyu/update" method="post" id="f3">
	            <input type="hidden" id="hlid3" name="hlid">
	            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_1" id="disid3" name="disid" disabled>
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇名称:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="floorname3" name="floorname" class="layui-input" placeholder="请输入楼宇名称">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">单元数量:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="units3" name="units" class="layui-input" placeholder="请输入单元数量" disabled>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇层数:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="cengcount3" name="cengcount" class="layui-input" placeholder="请输入楼宇层数">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇类型:</label>
                            <div class="layui-input-block">
                                <input type="text" id="floortype3" name="floortype" class="layui-input" placeholder="例如:多层/高层">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇结构:</label>
                            <div class="layui-input-block">
                                <input type="text" id="structure3" name="structure" class="layui-input" placeholder="请输入楼宇结构">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">楼宇朝向:</label>
                            <div class="layui-input-block">
                                <input type="text" id="orientation3" name="orientation" class="layui-input" placeholder="请输入楼宇朝向">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">备注:</label>
                            <div class="layui-input-block">
                                <input type="text" id="remark3" name="remark" class="layui-input">
                            </div>
                    </div>
            </div>
            <div class="modal-footer">
                <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save3">保存</button>
				      <button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function(){
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
		//初始化小区下拉框
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
                $("#disid2").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");  
                $("#disid3").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
			var ds="${houselou.disid}";
    	    if(ds!=0){
    	    	$("#disid1").find("option[value="+ds+"]").attr("selected",true);
    	    }
		})
	})
</script>
</html>