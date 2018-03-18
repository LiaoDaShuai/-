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
    <script type="text/javascript" src="/wyht/js/datacenter/car.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
    <div class="row header">
        <div class="col-sm-12" style="margin:0 0 0 20px;">车辆管理</div>
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
                        <option value="0">---请选择小区---</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-4 p-t-10">车位号：</label>
                	<select class="form-control-static col-sm-7" id="parkid1" name="parkid">
                    	<option value="0">--请选择车位号--</option>
                	</select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 p-t-10">关键字：</label>
                    <input type="text" id="carnum1" name="carnum" value="${vehicle.carnum }" class="form-control-static col-sm-7" placeholder="车牌号码">
                </div>
            </div>
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 p-t-10" >关键字：</label>
                    <input type="text" id="advanced" name="keywords" value="${vehicle.keywords }" class="form-control-static col-sm-7" placeholder="车辆编号">
                </div>
                <div class="form-group col-sm-4">
                    <button type="submit" class="btn btn-success">
                    	<i class="fa fa-search"></i> 搜索
                    </button>
                    <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                    <button type="button" class="btn btn-default"> 关闭</button>
                </div>
            </div>
        </form>    
    </div>
    <div style="margin:10px 0 5px 15px;">
        <a class="btn btn-success" data-toggle="modal" href="#myModal2"><i class="fa fa-plus"></i>添加车辆</a>
        <a class="btn btn-success" data-toggle="modal" href="#myModal6">导入车辆</a>
<!--         <a class="btn btn-success" data-toggle="modal" href="#myModal6">批量添加收费标准</a> -->
        <a class="btn btn-success" id="del" disabled>批量删除</a>
        <div class="pull-right">
            <a href="javascript:" class="pull-left gaoji">高级搜索</a>
            <div class="suotext">
                <input type="text" id="ordinary" value="${vehicle.keywords }" class="wentext" placeholder="停车卡号/车牌号/车主姓名/车主手机号">
                <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
            </div>
            <a href="" class="btn-list" target="_blank" title="帮助中心">
                <i class="fa fa-question"></i>
            </a>
        </div>
    </div>
    <div class="layui-form table-responsive col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr style="font-size: 18px;">
                    <th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
                    <th>车辆编号</th>
                    <th>所属小区</th>
                    <th>车位号</th>
                    <th>停车卡号</th>
                    <th>车主姓名</th>
                    <th>车主手机号</th>
                    <th>车牌号码</th>
                    <th>车辆排量</th>
                    <th>收费模板个数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list }" var="car">
                <tr>
                    <td><input type="checkbox" class="dan" lay-filter="itemChoose"></td>
                    <td>${car.vehicid }</td>
                    <td>${car.dis.dname }</td>
                    <td>${car.park.pnum}</td>
                    <td>${car.kanum }</td>
                    <td>${car.cname }</td>
                    <td>${car.cphone }</td>
                    <td>${car.carnum }</td>
                    <td>${car.carpai==null?'--':car.carpai}</td>
                    <td>${car.tollcount }</td>
                    <td>
                        <a href="/wyht/fandetail/clid/${car.vehicid }"><i class="fa fa-search"></i> 查看详情</a>
                        <a class="se-house yes onClickhand" onclick="bangding('${car.vehicid }')" ><i class="fa fa-exchange"></i> 绑定住户</a>
                        <a data-toggle="modal" href="#addCharg" onclick="addcharg('${car.vehicid}')"><i class="fa fa-money"></i> 添加收费标准</a>
                        <a data-toggle="modal" href="#myModal3" onclick="edit('${car.vehicid }')"><i class="fa fa-edit"></i> 编辑</a>
                        <a onclick="after_delete('${car.vehicid }')" class="onClickhand"><i class="fa fa-trash"></i> 删除</a>
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


<!--添加车辆-->
<form class="layui-form" action="/wyht/car/insert" method="post" id="f2" enctype="multipart/form-data">
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    	添加车辆
                </h4>
            </div>
            	<div class="modal-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label">小区: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <select class="sel_1" id="disid2" name="disid" lay-filter="disselect">
                                <option value="0">--请选择小区--</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择车位号: </label>
                        <div class="layui-input-block">
                        	<select class="sel_p" id="parkid2" name="parkid">
                            	<option value="0">--请选择车位号--</option>
                        	</select>
                    	</div>
                    </div> 
                    <div class="layui-form-item">
                        <label class="layui-form-label">停车卡号: </label>
                        <div class="layui-input-block">
                            <input type="text" name="kanum" class="layui-input" placeholder="请输入停车卡号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车主姓名: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="cname2" name="cname" class="layui-input" placeholder="请输入车主姓名">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车主手机号: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="cphone2" name="cphone" class="layui-input" placeholder="请输入车主手机号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车牌号码: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="carnum2" name="carnum" class="layui-input" placeholder="请输入车牌号码">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车辆排量(升):</label>
                        <div class="layui-input-block">
                            <input type="text" name="carpai" class="layui-input" placeholder="0">
                        </div>
                    </div>
            	</div>
	            <div class="modal-footer">
		            <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button type="button" class="layui-btn verification" id="save2">下一步</button>
					      <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
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
                    	车辆其他信息
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车辆型号: </label>
                            <div class="layui-input-block">
                                <input type="text" name="carxing" class="layui-input" placeholder="请输入车辆型号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车身颜色: </label>
                            <div class="layui-input-block">
                                <input type="text" name="carcolor" class="layui-input" placeholder="请输入车身颜色">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车主QQ: </label>
                            <div class="layui-input-block">
                                <input type="text" name="carqq" class="layui-input" placeholder="请输入车主QQ">
                        	</div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车主微信: </label>
                            <div class="layui-input-block">
                                <input type="text" name="carweixin" class="layui-input" placeholder="请输入车主微信">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车主邮箱: </label>
                            <div class="layui-input-block">
                                <input type="text" name="caremail" class="layui-input" placeholder="请输入车主邮箱">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">家庭电话: </label>
                            <div class="layui-input-block">
                                <input type="text" name="homephone" class="layui-input" placeholder="请输入家庭电话">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable" >车辆照片: </label>
                            <div class="layui-input-block">
                                <div class="source">
                            	<label class="upload-picture-btn" title="选择图片" for="file0">
            						+<img src="" id="img0" class="hide">
        						</label>
        						<input type="file" id="file0" name="input_file" class="hide" onchange="showPicture(this,'0')">
                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">行驶证: </label>
                            <div class="layui-input-block">
                                <div class="source">
                            	<label class="upload-picture-btn" title="选择图片" for="file1">
            						+<img src="" id="img1" class="hide">
        						</label>
        						<input type="file" id="file1" name="input_file1" class="hide" onchange="showPicture(this,'1')">
                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable" >驾照: </label>
                            <div class="layui-input-block">
                                <div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file2">
	            						+<img src="" id="img2" class="hide">
	        						</label>
	        						<input type="file" id="file2" name="input_file2" class="hide" onchange="showPicture(this,'2')">
	                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">备注: </label>
                            <div class="layui-input-block">
                                <input type="text" name="remark" class="layui-input">
                            </div>
                    </div>
                </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn sub" id="sub2">保存</button>
				      <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
            </div>
        </div>
	</div>
</form>
<!--编辑车辆-->
<form class="layui-form" action="/wyht/car/update" method="post" id="f3" enctype="multipart/form-data">
<div class="modal fade" id="myModal3" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑车辆
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                    	<input type="hidden" name="vehicid" id="vehicid3">
                        <label class="layui-form-label">小区: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <select class="sel_1" id="disid3" name="disid" lay-filter="disselect">
                                <option value="0">--请选择小区--</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择车位号: </label>
                        <div class="layui-input-block">
                        	<select class="sel_p" id="parkid3" name="parkid">
                            	<option value="0">--请选择车位号--</option>
                        	</select>
                    	</div>
                    </div>    
                    <div class="layui-form-item">
                        <label class="layui-form-label">停车卡号: </label>
                        <div class="layui-input-block">
                            <input type="text" id="kanum3" name="kanum" class="layui-input" placeholder="请输入停车卡号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车主姓名: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="cname3" name="cname" class="layui-input" placeholder="请输入车主姓名">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车主手机号: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="cphone3" name="cphone" class="layui-input" placeholder="请输入车主手机号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车牌号码: <samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                            <input type="text" id="carnum3" name="carnum" class="layui-input" placeholder="请输入车牌号码">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车辆排量(升):</label>
                        <div class="layui-input-block">
                            <input type="text" id="carpai3" name="carpai" class="layui-input" placeholder="0">
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save3">下一步</button>
				      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal33" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	车辆其他信息
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车辆型号: </label>
                            <div class="layui-input-block">
                                <input type="text" id="carxing3" name="carxing" class="layui-input" placeholder="请输入车辆型号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车身颜色: </label>
                            <div class="layui-input-block">
                                <input type="text" id="carcolor3" name="carcolor" class="layui-input" placeholder="请输入车身颜色">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车主QQ: </label>
                            <div class="layui-input-block">
                                <input type="text" id="carqq3" name="carqq" class="layui-input" placeholder="请输入车主QQ">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-able">车主微信: </label>
                            <div class="layui-input-block">
                                <input type="text" id="carweixin3" name="carweixin" class="layui-input" placeholder="请输入车主微信">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">车主邮箱: </label>
                            <div class="layui-input-block">
                                <input type="text" id="caremail3" name="caremail" class="layui-input" placeholder="请输入车主邮箱">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">家庭电话: </label>
                            <div class="layui-input-block">
                                <input type="text" id="homephone3" name="homephone" class="layui-input" placeholder="请输入家庭电话">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable" >车辆照片: </label>
                            <div class="layui-input-block">
                                <div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file3">
	            						+<img src="" id="img3" class="hide">
	        						</label>
	        						<input type="file" id="file3" name="input_file3" class="hide" onchange="showPicture(this,'3')">
                            	</div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">行驶证: </label>
                            <div class="layui-input-block">
                                <div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file4">
	            						+<img src="" id="img4" class="hide">
	        						</label>
	        						<input type="file" id="file4" name="input_file4" class="hide" onchange="showPicture(this,'4')">
	                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable" >驾照: </label>
                            <div class="layui-input-block">
                                <div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file5">
	            						+<img src="" id="img5" class="hide">
	        						</label>
	        						<input type="file" id="file5" name="input_file5" class="hide" onchange="showPicture(this,'5')">
	                            </div>
                                <div class="upload-tips">最多可上传1张图片，且图片大小不可超过2M。</div>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-lable">备注: </label>
                            <div class="layui-input-block">
                                <input type="text" id="remark3" name="remark" class="layui-input">
                            </div>
                    </div>
            	</div>
		            <div class="modal-footer">
		            	<div class="layui-form-item">
						    <div class="layui-input-block">
						      <button type="button" class="layui-btn sub" id="sub3">保存</button>
						      <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
						    </div>
					  	</div>
		            </div>
		</div>
	</div>
</div>
</form>
<!--导入车辆-->
<div class="modal fade" id="myModal6" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	导入车辆
                </h4>
            </div>
            <form class="layui-form" id="f4" name="importFile" enctype="multipart/form-data" action="/wyht/importVehicle" method="post">
            	<div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择小区:</label>
                            <div class="layui-input-block">
                                <select class="sel_1" id="disid4" name="disid" lay-filter="disselect">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">选择车位号:</label>
                            <div class="layui-input-block">
                                <select class="sel_p" id="parkid4" name="parkid">
                                    <option value="0">--请选择车位号--</option>
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
<div class="modal fade" id="myModal7" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	批量添加收费标准
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
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
                                <button type="button" data-dismiss="modal" data-toggle="modal" data-target="#myModal4" style="border-style: none;background-color: #fff;margin-top: 5px;">
                                    + 添加收费标准
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="text-align: center;background-color: #cccccc;">
                <button type="button" data-dismiss="modal" class="btn btn-success" data-toggle="modal">
                    	保存
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    	关闭
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 绑定住户 -->
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
			    var sib = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    var total = $(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
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
				$(".sel_p option[value!='0']").remove();//清空车位下拉框
				datacenterController.selectPks(data.value,function(datas){
		    		for(var i=0;i<datas.length;i++) {  
		    			$("#parkid2").append("<option value='"+datas[i].parkid+"'>"+datas[i].pnum+"</option>");
		    			$("#parkid3").append("<option value='"+datas[i].parkid+"'>"+datas[i].pnum+"</option>");
		    			$("#parkid4").append("<option value='"+datas[i].parkid+"'>"+datas[i].pnum+"</option>"); 
		            }
		    		form.render('select');
		    	});
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
				tollController.chargVehicAllid(data.value,function(data){
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
		//初始化小区下拉框的方法
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
				$("#disid2").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
				$("#disid3").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
				$("#disid4").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
				var ds="${vehicle.disid}";
        	    if(ds!=0){
        	    	$("#disid1").find("option[value="+ds+"]").attr("selected",true);
        	    }
			}
		})
		//初始化车位下拉框
		$("#disid1").change(function(){
			$("#parkid1 option[value!='0']").remove();
			var dis=$(this).val();
			datacenterController.selectPks(dis,function(data){
				for(var i=0;i<data.length;i++){
					$("#parkid1").append("<option value="+data[i].parkid+">"+data[i].pnum+"</option>");
				}
				if("${vehicle.parkid }"!=0){
					$("#parkid1").find("option[value='${vehicle.parkid }']").attr("selected",true);
				}
			});
		})
	})
</script>
</body>
</html>