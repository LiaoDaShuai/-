<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
    <script type="text/javascript" src="/wyht/dwr/interface/tollController.js"></script>
    <script type="text/javascript" src="/wyht/js/toll/charg_fpv.js"></script>
    <script type="text/javascript" src="/wyht/js/datacenter/house.js"></script>
</head> 
<body>
  	<div class="container col-sm-11 container-bianju">
	   	<div class="row header">
	        <div class="col-sm-12" style="margin:0 0 0 20px;">房屋管理</div>
	    </div>
    	<div class="hr-solid"></div>
	    <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
	        <form action="" id="f1" name="f1" method="post">
		    	<input type="hidden" name="pageNum" value=""> 
				<input type="hidden" name="pageSize" value="${page2.size }">
	            <div class="row p-t-10">
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10">小区：</label>
	                    <select class="form-control-static col-sm-7 sel_1" id="disid1" name="disid">
	                        <option value="0">---选择小区---</option>
	                    </select>
	                </div>
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10">楼宇：</label>
	                    <select class="form-control-static col-sm-7 sel_2" id="hlid1" name="hlid">
	                        <option value="0">--选择楼宇--</option>
	                    </select>
	                </div>
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10">单元：</label>
	                    <select class="form-control-static col-sm-7 sel_3" id="unitid1" name="unitid">
	                        <option value="0">--选择单元--</option>
	                    </select>
	                </div>
	            </div>
	            <div class="row p-t-10">
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10" >关键字：</label>
	                    <input type="text" id="advanced" value="${housefan.keywords }" name="keywords" class="form-control-static col-sm-7" placeholder="请输入关键字">
	                </div>
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10" >房屋编号：</label>
	                    <input type="text" id="fanid" name="fanid" value="${housefan.fanid }" placeholder="请输入房屋编号" class="form-control-static col-sm-7">
	                </div>
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10" >房屋类型：</label>
	                    <select id="utype" name="utype" class="form-control-static col-sm-7">
	                        <option value="0" selected>--选择房屋类型--</option>
	                        <option value="1">住宅</option>
	                        <option value="2">公寓</option>
	                        <option value="3">办公</option>
	                        <option value="4">厂房</option>
	                        <option value="5">仓库</option>
	                        <option value="6">商铺</option>
	                        <option value="7">酒店</option>
	                        <option value="8">别墅</option>
	                        <option value="9">其他</option>
	                    </select>
	                </div>
	            </div>
	            <div class="row p-t-10">
	                <div class="form-group col-sm-4">
	                    <label class="col-sm-3 p-t-10" >房屋楼层：</label>
	                    <input type="text" id="louceng" name="louceng" value="${housefan.louceng }" placeholder="请输入所在楼层" class="form-control-static col-sm-7">
	                </div>
	                <div class="form-group col-sm-4">
	                    <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> 搜索</button>
	                    <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
	                    <button type="button" class="btn btn-default"> 关闭</button>
	                </div>
	            </div>
	        </form>
	    </div>
	    <div style="margin:10px 0 5px 15px;">
	            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i> 添加房屋</button>
	            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal5">导入房屋</button>
<!-- 	            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal4">批量添加收费标准</button> -->
	            <button type="button" class="btn btn-success" id="del" disabled>批量删除</button>
	            <div class="pull-right">
	                <a href="javascript:" class="pull-left gaoji">高级搜索</a>
	                <div class="suotext">
	                    <input type="text" id="ordinary" value="${housefan.keywords }" class="wentext" placeholder="门牌号/备注">
	                    <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
	                </div>
	                <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
	                    <i class="fa fa-question"></i></a>
	            </div>
		</div>
	    <div class="layui-form table-responsive  col-sm-12">
	        <table class="table table-hover">
	            <thead>
	            <tr style="font-size: 18px;">
	                <th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
	                <th>房屋编号</th>
	                <th>所属小区</th>
	                <th>所在楼宇</th>
	                <th>所在单元</th>
	                <th>所在楼层</th>
	                <th>门牌号</th>
	                <th>建筑面积</th>
	                <th>房屋类型</th>
	                <th>收费项目(个数)</th>
	                <th>操作</th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach items="${page.list }" var="hf">
	            <tr style="font-size: 14px;">
	                <td><input type="checkbox" class="dan" lay-filter="itemChoose"></td>
	                <td>${hf.fanid }</td>
	                <td>${hf.dis.dname }</td>
	                <td>${hf.hl.floorname }</td>
	                <td>${hf.ut.unitname }</td>
	                <td>${hf.louceng }</td>
	                <td>${hf.hnum }</td>
	                <td>${hf.zarea }</td>
	                <c:choose>
	                	<c:when test="${hf.utype==0 }">
	                    	<td>无</td>
	                    </c:when>
	                    <c:when test="${hf.utype==1 }">
	                    	<td>住宅</td>
	                    </c:when>
	                    <c:when test="${hf.utype==2 }">
	                    	<td>公寓</td>
	                    </c:when>
	                    <c:when test="${hf.utype==3 }">
	                    	<td>办公</td>
	                    </c:when>
	                    <c:when test="${hf.utype==4 }">
	                    	<td>厂房</td>
	                    </c:when>
	                    <c:when test="${hf.utype==5 }">
	                    	<td>仓库</td>
	                    </c:when>
	                    <c:when test="${hf.utype==6 }">
	                    	<td>商铺</td>
	                    </c:when>
	                    <c:when test="${hf.utype==7 }">
	                    	<td>酒店</td>
	                    </c:when>
	                    <c:when test="${hf.utype==8 }">
	                    	<td>别墅</td>
	                    </c:when>
	                    <c:otherwise>
	                    	<td>其他</td>
	                    </c:otherwise>
	                </c:choose>
	                <td>${hf.tollcount }</td>
	                <td>
	                    <a href="/wyht/fandetail/fwid/${hf.fanid }"><i class="fa fa-search"></i> 查看详情</a>
	                    <a class="se-house yes onClickhand" onclick="bangding('${hf.fanid }')"><i class="fa fa-exchange"></i> 绑定住户</a>
	                    <a data-toggle="modal" href="#addCharg" onclick="addcharg('${hf.fanid}')"><i class="fa fa-money"></i>添加收费标准</a>
	                    <a data-toggle="modal" href="#myModal6" onclick="edit(${hf.fanid },${hf.disid },${hf.hlid })"><i class="fa fa-edit"></i> 编辑</a>
	                    <a class="se-house yes onClickhand" onclick="after_delete('${hf.fanid }')"><i class="fa fa-trash"></i> 删除</a>
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

<!--添加房屋-->
<form class="layui-form" action="/wyht/house/insert" method="post" id="f2" enctype="multipart/form-data">
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	添加房屋
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_1" name="disid" id="disid2" lay-filter="disselect">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                 	</div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择楼宇:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_2" name="hlid" id="hlid2" lay-filter="hlselect">
                                    <option value="0">--请选择楼宇--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择单元:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_3" name="unitid" id="unitid2" lay-filter="unitselect">
                                    <option value="0">--请选择单元--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">所在楼层:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" name="louceng" id="louceng2" class="layui-input sel_4" placeholder="请输入楼层所在数">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">门牌号:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" name="hnum" id="hnum2" class="layui-input sel_5">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">建筑面积(㎡):<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block" >
                                <input type="text" name="zarea" id="zarea2" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">套内面积(㎡):</label>
                            <div class="layui-input-block" >
                                <input type="text" name="tarea" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">公摊面积(㎡):</label>
                            <div class="layui-input-block" >
                                <input type="text" name="garea" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择房屋类型:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select name="utype" id="utype2">
                                    <option value="0" selected>--选择房屋类型--</option>
                        			<option value="1">住宅</option>
			                        <option value="2">公寓</option>
			                        <option value="3">办公</option>
			                        <option value="4">厂房</option>
			                        <option value="5">仓库</option>
			                        <option value="6">商铺</option>
			                        <option value="7">酒店</option>
			                        <option value="8">别墅</option>
			                        <option value="9">其他</option>
                                </select>
                            </div>
                    </div>
            </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save2">下一步</button>
				      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal22" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    	房屋其他信息
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">房屋朝向:</label>
                            <div class="layui-input-block">
                                <input type="text" name="hchaoxiang" class="layui-input" placeholder="请输入房屋朝向">
                            </div>
                    </div>
                    <div class="layui-form-item">
	                        <label class="layui-form-label">交房时间: </label>
	                        <div class="layui-input-block">
	                            <input type="text" name="startdate" id="startdate2" class="layui-input" readonly placeholder="请选择日期">
	                        </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">产权年限(年):</label>
                            <div class="layui-input-block">
                                <input type="text" name="cyear" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label" >附件:</label>
                            <div class="layui-input-block">
                                <div class="source">
	                        		<label class="upload-picture-btn" title="选择图片" for="file0">
	            						+<img src="" id="img0" class="hide">
	        						</label>
	                                <input type="file" id="file0" class="hide" name="input_file" onchange="showPicture(this,'0')">
	                            </div>
                            	<div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">备注: </label>
                            <div class="layui-input-block">
                                <input type="text" name="remark" class="layui-input">
                            </div>
                    </div>
            </div>
            <div class="modal-footer">
                <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn sub">确定</button>
				      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
        </div>
    </div>
</div>
</form>
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
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	批量添加收费标准
                </h4>
            </div>
            <form class="form-horizontal" role="form">
            <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <label for="" class="col-sm-3 control-label">房屋/车位/车辆:</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="已选择车辆：0个">
                                <p class="help-block">注:点击输入框后右侧选择房屋。</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label for="" class="col-sm-3 control-label">保存设置:</label>
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
                            <label for="" class="col-sm-3 control-label">收费标准:</label>
                            <div class="col-sm-7">
                                <a data-dismiss="modal" data-toggle="modal" href="#addCharg" style="border-style: none;background-color: #fff;margin-top: 5px;">
                                    + 添加收费标准
                                </a>
                            </div>
                        </div>
                    </div>
            	</div>
	            <div class="modal-footer" style="text-align: center;background-color: #cccccc;">
	                <button type="submit"  class="btn btn-success">
	                    	保存
	                </button>
	                <button type="button" class="btn btn-default" data-dismiss="modal">
	                    	关闭
	                </button>
	            </div>
            </form>
        </div>
    </div>
</div>
<!--导入房屋-->
<div class="modal fade" id="myModal5" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	导入房屋
                </h4>
            </div>
            <form class="layui-form" name="importFile" enctype="multipart/form-data" action="/wyht/importHouse" method="post" id="f4">
            	<div class="modal-body">
                   	<div class="layui-form-item">
                       <label class="layui-form-label">选择小区:</label>
                       <div class="layui-input-block">
                           <select class="sel_1" name="disid" id="disid4" lay-filter="disselect">
                               <option value="0">--请选择小区--</option>
                           </select>
                       </div>
                   	</div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择楼宇:</label>
                            <div class="layui-input-block">
                                <select class="sel_2" name="hlid" id="hlid4" lay-filter="hlselect">
                                    <option value="0">--请选择楼宇--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择单元:</label>
                            <div class="layui-input-block">
                                <select class="sel_3" name="unitid" id="unitid4">
                                    <option value="0">--请选择单元--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择excel文件:</label>
                            <div class="layui-input-block">
                                <input type="file" id="excelFile" name="excelFile" accept=".xls,.xlsx">
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
<!--编辑-->
<div class="modal fade" id="myModal6" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑房屋
                </h4>
            </div>
            <form class="layui-form" action="/wyht/house/update" method="post" id="f3" enctype="multipart/form-data">
            	<input type="hidden" name="fanid" id="fanid3">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_1" name="disid" id="disid3" lay-filter="disselect">
                                	<option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择楼宇:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_2" name="hlid" id="hlid3" lay-filter="hlselect">
                                	<option value="0">--请选择楼宇--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择单元:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="sel_3" name="unitid" id="unitid3" lay-filter="unitselect">
                                	<option value="0">--请选择单元--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">所在楼层:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" name="louceng" id="louceng3" class="layui-input sel_4" placeholder="请输入楼层所在数">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">门牌号:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" name="hnum" id="hnum3" class="layui-input sel_5">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">建筑面积(㎡):<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" name="zarea" id="zarea3" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">套内面积(㎡):</label>
                            <div class="layui-input-block" >
                                <input type="text" name="tarea" id="tarea3" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">公摊面积(㎡):</label>
                            <div class="layui-input-block" >
                                <input type="text" name="garea" id="garea3" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择房屋类型:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select name="utype" id="utype3">
                                    <option value="0">--选择房屋类型--</option>
			                        <option value="1">住宅</option>
			                        <option value="2">公寓</option>
			                        <option value="3">办公</option>
			                        <option value="4">厂房</option>
			                        <option value="5">仓库</option>
			                        <option value="6">商铺</option>
			                        <option value="7">酒店</option>
			                        <option value="8">别墅</option>
			                        <option value="9">其他</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">房屋朝向:</label>
                            <div class="layui-input-block">
                                <input type="text" name="hchaoxiang" id="hchaoxiang3" class="layui-input" placeholder="请输入房屋朝向">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">交房时间:</label>
                            <div class="layui-input-block">
                                <input type="text" name="startdate" id="startdate3" class="layui-input" readonly placeholder="请选择日期">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">产权年限(年):</label>
                            <div class="layui-input-block">
                                <input type="text" name="cyear" id="cyear3" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label" >附件:</label>
                            <div class="layui-input-block">
                                <div class="source">
	                        		<label class="upload-picture-btn" title="选择图片" for="file1">
	            						+<img src="" id="img1" class="hide">
	        						</label>
	                                <input type="file" id="file1" name="input_file" class="hide" onchange="showPicture(this,'1')">
	                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">备注:</label>
                            <div class="layui-input-block">
                                <input type="text" name="remark" id="remark3" class="layui-input">
                            </div>
                    </div>
            	</div>
	            <div class="modal-footer">
		            <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button type="button" class="layui-btn verification" id="save3">保存</button>
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
            <a>绑定住户</a>
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
			      item.checked=data.elem.checked;
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
			form.on('select(disselect)',function(data){
				$(".sel_2 option[value!='0']").remove();//清空楼宇下拉框
		    	$(".sel_3 option[value!='0']").remove();//清空单元下拉框
		    	datacenterController.selectly(data.value,function(datas){
		    		for(var i=0;i<datas.length;i++) {  
		    			$("#hlid2").append("<option value='"+datas[i].hlid+"'>"+datas[i].floorname+"</option>");
		    			$("#hlid3").append("<option value='"+datas[i].hlid+"'>"+datas[i].floorname+"</option>");
		    			$("#hlid4").append("<option value='"+datas[i].hlid+"'>"+datas[i].floorname+"</option>"); 
		            }
		    		form.render('select');
		    	});
			});
			form.on('select(hlselect)',function(data){
				$(".sel_3 option[value!='0']").remove();//清空单元下拉框
		    	$(".sel_4").val();//清空文本框
		    	var disid2=$("#disid2").val();
		    	var hlid2=$("#hlid2").val();
		    	var louyu2=$("#hlid2").find("option:selected").text()+"-";
		    	$("#hnum2").val(louyu2);
		    	datacenterController.selectut({disid:disid2,hlid:hlid2},function(datas){
		    		for(var i=0;i<datas.length;i++) {  
		    			$("#unitid2").append("<option value='"+datas[i].unitid+"'>"+datas[i].unitname+"</option>"); 
		            }
		    		form.render('select');
		    	});
		    	var disid3=$("#disid3").val();
		    	var hlid3=$("#hlid3").val();
		    	var louyu3=$("#hlid3").find("option:selected").text()+"-";
		    	$("#hnum3").val(louyu3);
		    	datacenterController.selectut({disid:disid3,hlid:hlid3},function(datas){
		    		for(var i=0;i<datas.length;i++) {  
		    			$("#unitid3").append("<option value='"+datas[i].unitid+"'>"+datas[i].unitname+"</option>"); 
		            }
		    		form.render('select');
		    	});
		    	var disid4=$("#disid4").val();
		    	var hlid4=$("#hlid4").val();
		    	datacenterController.selectut({disid:disid4,hlid:hlid4},function(datas){
		    		for(var i=0;i<datas.length;i++) {  
		    			$("#unitid4").append("<option value='"+datas[i].unitid+"'>"+datas[i].unitname+"</option>"); 
		            }
		    		form.render('select');
		    	});
			});
			form.on('select(unitselect)',function(data){
				$(".sel_5").val();//清空文本框
				var louyu2=$("#hlid2").find("option:selected").text()+"-";
		    	var unit2=$("#unitid2").find("option:selected").text()+"-";
		    	$("#hnum2").val(louyu2+unit2);
		    	var louyu3=$("#hlid3").find("option:selected").text()+"-";
		    	var unit3=$("#unitid3").find("option:selected").text()+"-";
		    	$("#hnum3").val(louyu3+unit3);
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
				tollController.chargFanAllid(data.value,function(data){
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
			});
		});
		//初始化小区下拉框
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$(".sel_1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
			//高级搜索
           	if("${housefan.disid}"!=0){
           		$("#disid1").find("option[value='${housefan.disid}']").attr("selected",true);
	   			datacenterController.selectly("${housefan.disid}",function(data){
	   				$("#hlid1 option[value!='0']").remove();//清空楼宇下拉框
	        		$("#unitid1 option[value!='0']").remove();//清空单元下拉框
					for(var i=0;i<data.length;i++) {  
						$("#hlid1").append("<option value='"+data[i].hlid+"'>"+data[i].floorname+"</option>");
					}
					if("${housefan.hlid}"!=0){
						$("#hlid1").find("option[value='${housefan.hlid}']").attr("selected",true);
	            		datacenterController.selectut({disid:"${housefan.disid}",hlid:"${housefan.hlid}"},function(data){
	            			$("#unitid1 option[value!='0']").remove();//清空单元下拉框
							for(var i=0;i<data.length;i++) {  
								$("#unitid1").append("<option value='"+data[i].unitid+"'>"+data[i].unitname+"</option>"); 
							}
							if("${housefan.unitid}"!=0){
								$("#unitid1").find("option[value='${housefan.unitid}']").attr("selected",true);
							}
	            		})
					}
	   			})
           	}	
		});
		if("${housefan.utype}"!=0){
	    	$("#utype").find("option[value='${housefan.utype}']").attr("selected",true);
	    }
	});
</script>
</html>