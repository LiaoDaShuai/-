<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <!-- dwr -->
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
   	<script type="text/javascript" src="/wyht/dwr/interface/tollController.js"></script>
   	<script type="text/javascript" src="/wyht/js/toll/charg_fpv.js"></script>
   	<script type="text/javascript" src="/wyht/js/datacenter/parking.js"></script>
</head>
<body>
<div class="container col-sm-11 container-bianju">
    <div class="row header">
        <div class="col-sm-12" style="margin:0 0 0 20px;">车位管理</div>
    </div>
    <div class="hr-solid"></div>
    <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
    	<form action="" id="f1" name="f1" method="post">
        	<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 p-t-10">小区：</label>
                    <select class="form-control-static col-sm-7" id="disid1" name="disid">
                        <option value="0">--选择小区--</option>
                    </select></div>
                <div class="form-group col-sm-4 ">
                    <label class="col-sm-3 p-t-10">车位状态：</label>
                        <select class="form-control-static col-sm-7" id="status1" name="status">
                            <option value="0" selected>--选择车位状态--</option>
                            <option value="1">空闲</option>
                            <option value="2">出租</option>
                            <option value="3">出售</option>
                            <option value="4">自用</option>
                        </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 p-t-10">关键字：</label>
                    <input type="text" id="advanced" name="pnum" value="${parking.pnum }" placeholder="请输入车位号" class="form-control-static col-sm-7">
                </div>
            </div>
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 p-t-10" >车位编号：</label>
                    <input type="text" id="parkid1" name="parkid" value="${parking.parkid }" placeholder="请输入车位编号" class="form-control-static col-sm-7">
                </div>
                <div class="form-group col-sm-4">
                    <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> 搜索</button>
                    <button type="button" class="btn btn-default" onclick="clear_form()">&nbsp;清空&nbsp;</button>
                    <button type="button" class="btn btn-default">&nbsp;关闭&nbsp;</button>
                </div>
            </div>
       </form> 
    </div>
    <div style="margin:10px 0 5px 15px;">
       <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> 添加车位</button>
       <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">导入车位</button>
<!--        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal4">批量添加收费标准</button> -->
       <button type="button" class="btn btn-success" id="del" disabled>批量删除</button>
       <div class="pull-right">
           <a href="javascript:" class="pull-left gaoji">高级搜索</a>
           <div class="suotext">
               <input type="text" id="ordinary" value="${parking.pnum }" class="wentext" placeholder="请输入车位号">
               <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
           </div>
           <a href="" class="btn-list" target="_blank" title="帮助中心">
              <i class="fa fa-question"></i>
           </a>
       </div>
    </div>
    <div class="layui-form table-responsive">
        <table class="table table-hover">
            <thead>
                <tr style="font-size: 18px;">
                    <th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
                    <th>车位编号</th>
                    <th>所属小区</th>
                    <th>车位号</th>
                    <th>车位状态</th>
                    <th>车位面积</th>
                    <th>收费模板个数</th>
                    <th>备注</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
            	<c:forEach items="${page.list}" var="p">
                <tr style="font-size: 14px;">
                    <td><input type="checkbox" class="dan" lay-filter="itemChoose"></td>
                    <td>${p.parkid }</td>
                    <td>${p.dis.dname }</td>
                    <td>${p.pnum }</td>
                    <c:choose>
	                    <c:when test="${p.status==1 }">
	                    	<td>出售</td>
	                    </c:when>
	                    <c:when test="${p.status==2 }">
	                    	<td>出租</td>
	                    </c:when>
	                    <c:when test="${p.status==3 }">
	                    	<td>空闲</td>
	                    </c:when>
	                    <c:when test="${p.status==4 }">
	                    	<td>自用</td>
	                    </c:when>
	                    <c:otherwise>
	                    	<td>无</td>
	                    </c:otherwise>
                    </c:choose>
                    <td>${p.carea }</td>
                    <td>${p.tollcount }</td>
                    <td>${p.remark==null?'--':p.remark }</td>
                    <td>
                        <a href="/wyht/fandetail/cwid/${p.parkid }"><i class="fa fa-search"></i> 查看详情</a>
                        <a class="se-house yes onClickhand" onclick="bangding('${p.parkid }')"><i class="fa fa-exchange"></i> 绑定住户</a>
                        <a data-toggle="modal" href="#addCharg" onclick="addcharg('${p.parkid}')"><i class="fa fa-money"></i> 添加收费标准</a>
                        <a data-toggle="modal" href="#myModal5" data-toggle="modal" onclick="edit('${p.parkid}')"><i class="fa fa-edit"></i> 编辑</a>
                        <a onclick="delete_ps('${p.parkid }')" class="onClickhand"><i class="fa fa-trash"></i> 删除</a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
   </div>    
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
</body>

<!--添加车位-->
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	添加车位
                </h4>
            </div>
            <form class="layui-form" action="/wyht/parking/insert" method="post" id="f2">
            <div class="modal-body">
	            <div class="layui-form-item">
				    <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
				    <div class="layui-input-block">
				      <select id="disid2" name="disid">
				        <option value="0">--请选择小区--</option>
				      </select>
				    </div>
			  	</div>
            	<div class="layui-form-item">
				    <label class="layui-form-label">车位号:<samp style="color: red;">*</samp></label>
				    <div class="layui-input-block">
				      <input type="text" id="pnum2" name="pnum" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">车位面积(㎡):<samp style="color: red;">*</samp></label>
				    <div class="layui-input-block">
				      <input type="text" id="carea2" name="carea" autocomplete="off" class="layui-input">
				    </div>
			  	</div>
                <div class="layui-form-item">
				    <label class="layui-form-label">车位状态:<samp style="color: red;">*</samp></label>
				    <div class="layui-input-block">
				      <select id="status2" name="status">
				        <option value="0">--请选择车位状态--</option>
                        <option value="1">出售</option>
                        <option value="2">出租</option>
                        <option value="3">空闲</option>
                        <option value="4">自用</option>
				      </select>
				    </div>
			  	</div>
			  	<div class="layui-form-item">
				    <label class="layui-form-label">备注:</label>
				    <div class="layui-input-block">
				      <input type="text" name="remark" autocomplete="off" class="layui-input">
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
<!--导入车位-->
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	导入车位
                </h4>
            </div>
            <form class="layui-form" id="f4" name="importFile" enctype="multipart/form-data" action="/wyht/importParking" method="post">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:</label>
                            <div class="layui-input-block">
                                <select class="sel_1" name="disid" id="disid4">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择excel文件:</label>
                            <div class="layui-input-block">
                                <input type="file" id="excelFile" name="excelFile" accept=".xls,.xlsx" multiple>
                            </div>
                            <div class="layui-input-block">
                                <i class="fa fa-warning text-danger"></i><a href="#">如何导入车辆</a>
                            </div>
                    </div>
	            </div>
	            <div class="modal-footer">
	            	<div class="layui-form-item">
					    <div class="layui-input-block">
					      <button type="button" class="layui-btn impver">立即导入</button>
					      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
	            </div>
            </form>
        </div>
    </div>
</div>
<!--添加收费标准-->
<div class="modal fade" id="addCharg" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	添加收费标准
                </h4>
            </div>
            <form class="layui-form"  method="post" action="/wyht/fandetail/addcharg">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">收费项目:</label>
                            <div class="layui-input-block">
                                <select name="priceId" lay-filter="priceIdSelect">
                                    <option value="">--请选择收费项目--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">收费标准:</label>
                            <div class="layui-input-block">
                                <select name="chargid" lay-filter="chargidSelect">
                                    <option value="">--请选择收费标准--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">开始时间: </label>
                            <div class="layui-input-block">
                                <input type="text" name="startdate" class="layui-input" readonly placeholder="请选择日期" id="test1">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">结束时间: </label>
                            <div class="layui-input-block" id="over" style="display: none;">
                                <input type="text" disabled class="layui-input" name="enddate" readonly placeholder="请选择日期" id="test2">
                            </div>
                            <div class="layui-input-block">
                                <input type="checkbox" lay-filter="wu" checked>
                                <div style="font-size: 12px;margin-top: -18px;margin-left: 23px;">无结束时间</div>
                            </div>
                    </div>
                    <div class="layui-form-item hide" id="shoushu">
                            <label class="layui-form-label">手动输入(元): </label>
                            <div class="layui-input-block">
                               	<input type="text" name="price" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">备注: </label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input">
                            </div>
                    </div>
            	</div>
	            <div class="modal-footer">
 	                <div class="layui-form-item">
					    <div class="layui-input-block">
				    		  <input type="hidden" id="other_id" name="park_id">
	                		  <input type="hidden" name="type" value="1">
						      <button type="button" class="layui-btn" onclick="isCharg(this.form)">确定</button>
						      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
	            </div>
            </form>
        </div>
    </div>
</div>
<!--批量添加收费标准-->
<div class="modal fade" id="myModal4" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                   	 批量添加收费标准
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="row">
                            <label class="col-sm-3 control-label">房屋/车位/车辆:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="已选择车辆：0个">
                                <p class="help-block">注:点击输入框后右侧选择房屋。</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-sm-3 control-label">保存设置:</label>
                            <div class="col-sm-7">
                                <label for="" style="margin-top: 5px;">
                                    <input type="radio" class="radio-inline" checked  value="1">批量新增
                                    <input type="radio" class="radio-inline" value="1">批量删除
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-sm-3 control-label">收费标准:</label>
                            <div class="col-sm-7">
                                <button type="button" data-dismiss="modal" data-toggle="modal" data-target="#addCharg" style="border-style: none;background-color: #fff;margin-top: 5px;">
                                    + 添加收费标准
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="text-align: center;background-color: #cccccc;">
                <button type="button" class="btn btn-success">
                    	保存
                </button>
                <button type="button" class="btn btn-default " data-dismiss="modal">
                    	关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!--编辑-->
<div class="modal fade" id="myModal5" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑车位
                </h4>
            </div>
            <form class="layui-form" action="/wyht/parking/update" method="post" id="f3">
            	<input type="hidden" id="parkid3" name="parkid">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_1" id="disid3" name="disid">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">车位号: <samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="pnum3" name="pnum" class="layui-input" placeholder="请输入车位号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">车位面积(㎡):</label>
                            <div class="layui-input-block" >
                                <input type="text" id="carea3" name="carea" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">车位状态: <samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select id="status3" name="status">
                                    <option value="0">--请选择车位状态--</option>
                                    <option value="1">出售</option>
                                    <option value="2">出租</option>
                                    <option value="3">空闲</option>
                                    <option value="4">自用</option>
                                </select>
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
					      <button type="button" class="layui-btn verification" id="save3">确定</button>
					      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
            	</div>
            </form>
        </div>
    </div>
</div>
<!--绑定住户 -->
<div class="user_info">
    <ul class="tab-nav ">
        <li class="active">
            <a href="">绑定住户</a>
        </li>
    </ul>
    <a class="close_side closediv">×</a>
    <div style="padding: 20px;height: 95%">
        <input type="text" class="chat-search" placeholder="搜索">
        <div class="r-content">
            <div class="SelectZhuhu" id="scrollcediv"></div>
        </div>
    </div>
    <div class="fake-box">
		<button type="button" class="btn btn-sm btn-primary btn-w-m fake-save">保存</button>
		<a class="btn btn-sm btn-default btn-w-m m-l-10 closediv">返回</a>
	</div>
</div>
<div class="user_bg"></div>
<script>
	$(function(){
		layui.use('form', function(){
			var form=layui.form;
			//全选
			form.on('checkbox(allChoose)', function(data){
			    var child=$(data.elem).parents('table').find('tbody input[type="checkbox"]');
			    child.each(function(index, item){
			      item.checked = data.elem.checked;
			    });
			    form.render('checkbox');
			    var sib=$(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    if(sib==0){
			    	$('#del').attr('disabled', true);
			    }else{
			    	$('#del').attr('disabled', false);
			    }
			});
			//单选
			form.on('checkbox(itemChoose)',function(data){
			    var sib=$(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    var total=$(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
			    if(sib==0){
			    	$('#del').attr('disabled', true);
			    }else if(sib==total){
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",true);
			        $('#del').attr('disabled', false);
			    }else{
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",false);
			        $('#del').attr('disabled', false);
			    }
			    form.render();
			});
			//收费标准-->结束时间的显示和隐藏
			form.on('checkbox(wu)',function(data){
				if(this.checked==false){
					$("input[name=enddate]").attr('disabled',false);
					$("#over").show();
				}else{
					$("input[name=enddate]").attr('disabled',true);
			        $("#over").hide();
				}
				form.render('checkbox');
			});
			form.on('select(priceIdSelect)',function(data){
				$("select[name=chargid] option[value!='']").remove();
				$("#shoushu").addClass("hide");
				tollController.chargParkAllid(data.value,function(data){
					for(var i=0;i<data.length;i++){
						$("select[name=chargid]").append("<option value='"+data[i].chargid+"'>"+data[i].chargname+"</option>")
					}
					form.render('select');
				});
			});
			form.on('select(chargidSelect)',function(data){
				 tollController.editChargs(data.value,function(da){
		    		if(da.shouid==1){
		    			$("#shoushu").removeClass("hide");
		    		}else{
		    			$("#shoushu").addClass("hide");
		    		}
		    	}) 
		    	form.render('select');
			});
		});
		//初始化小区下拉框
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
	            $("#disid2").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");  
	            $("#disid3").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
	            $("#disid4").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
			var ds="${parking.disid}";
        	if(ds!=0){
        		$("#disid1").find("option[value="+ds+"]").attr("selected",true);
        	}
		})
		var st="${parking.status}";
    	if(st!=0){
    		$("#status1").find("option[value="+st+"]").attr("selected",true);
    	}
	})
</script>

</html>