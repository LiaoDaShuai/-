<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
	<script type="text/javascript" src="/wyht/js/datacenter/xiaoqu.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
</head>
<body>
 <div class="container col-sm-11 container-bianju">
    <div class="row header">
        <div class="col-sm-12" style="margin:0 0 0 20px;">小区列表</div>
    </div>
    <div class="hr-solid"></div>
	<div style="margin: 24px 0px 0px 15px;">
		<form action="/wyht/xiaoqu/all" id="f1" name="f1" method="post">
			<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">
				<i class="fa fa-plus"></i>添加小区
			</button>
			<div class="pull-right">
				<div class="suotext">
					<input type="text" name="dname" id="dname" value="${disname }" class="wentext" placeholder="请输入关键字">
					<button type="submit" class="btn-list list-setting">
						<i class="fa fa-search"></i>
					</button>
					<button type="button" class="btn-list list-setting" onclick="clear_form()">
						<i class="fa fa-eraser"></i>
					</button>
				</div>
				<a href="" class="btn-list" target="_blank" title="帮助中心">
					<i class="fa fa-question"></i>
				</a>
			</div>
		</form>
		</div>
	<div style="margin-top: 20px;margin-left: 15px;">
    	<table class="table table-hover">
                <thead>
                <tr style="font-size: 18px;">
                    <th>小区名称</th>
                    <th>小区地址</th>
                    <th>小区状态</th>
                    <th>客服电话</th>
                    <th>负责人姓名</th>
                    <th>负责人电话</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody style="text-align:center;" id="aa">
                <c:forEach items="${page.list}" var="dl">
                <tr style="font-size: 14px;" >
                    <td>${dl.dname }</td>
                    <td>${dl.address }</td>
                    <td>
                    	<c:choose>
                    		<c:when test="${dl.status eq 1 }">
                    			<span class="switch-off" onclick="status('${dl.disid}','0')"></span>
                    		</c:when>
                    		<c:otherwise>
                    			<span class="switch-on" onclick="status('${dl.disid}','1')"></span>
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                    <td>${dl.customerp }</td>
                    <td>${dl.fperson }</td>
                    <td>${dl.fphone }</td>
                    <td>
                        <div class="dropdown">
                            <a class="pianyil edit" data-toggle="modal" href="#myModal3" onclick="edit('${dl.disid}')">
                                <i class="fa fa-edit"></i> 编辑</a>
                            <a  class="pianyil" data-toggle="dropdown" style="cursor:pointer;" aria-expanded="true">
                                <i class="fa fa-building"></i> 小区管理<span class="caret"></span>
                            </a>
                            <!--小区管理-->
                            <ul class="dropdown-menu" role="menu" style="margin-left: 148px;">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="/wyht/louyu/all"><i class="fa fa-building pianyil"></i>楼宇管理</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="/wyht/house/all"><i class="fa fa-home pianyil"></i>房屋管理</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="/wyht/parking/all"><i class="fa fa-map-marker pianyil"></i>车位管理</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="/wyht/car/all"><i class="fa fa-car pianyil"></i>车辆管理</a></li>
                                <li class="divider"></li>
                                <li role="presentation"><a role="menuitem" class="close_dropdown" tabindex="-1"><i class="fa fa-times pianyil"></i>收起</a></li>
                            </ul>
                        </div>
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

<!--添加小区-->
<form class="layui-form" enctype="multipart/form-data" action="/wyht/xiaoqu/insert" method="post" id="f2">
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	添加小区
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
	                        <label class="layui-form-label">小区名称:<samp style="color: red;">*</samp></label>
	                        <div class="layui-input-block">
	                            <input type="text" class="layui-input" id="dname2" name="dname" placeholder="请输入小区名称">
	                        </div>
                    </div>
                    	<div class="layui-form-item">
	                            <label class="layui-form-label">小区地址:<samp style="color: red;">*</samp></label>
	                            <div id="city" class="layui-input-block">
	    							<select class="prov" name="prov" lay-filter="prov" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
	    							<select class="city" name="city" lay-filter="city" disabled="disabled" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
	    							<select class="dist" name="dist" lay-filter="dist" disabled="disabled" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
								</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">详细地址:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="address2" name="address" class="layui-input" placeholder="请输入小区详细地址">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">客服电话:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="customerp2" name="customerp" class="layui-input" placeholder="电话格式：028-87722262">
                                <p class="help-block">注:如果有多个电话,请用英文的逗号隔开</p>
                            </div>
                        </div>
                     <div class="layui-form-item">
                        <label class="layui-form-label">负责人:<samp style="color: red;">*</samp></label>
                        <div class="layui-input-block">
                        	<input type="text" id="fperson2" name="fperson" class="layui-input" placeholder="请输入负责人姓名">
                        </div>
                     </div>
                     <div class="layui-form-item">
                      	<label class="layui-form-label">负责人电话:<samp style="color: red;">*</samp></label>
                     	<div class="layui-input-block">
                        	<input type="text" id="fphone2" name="fphone" class="layui-input"  placeholder="请输入负责人电话">
                     	</div>
                     </div>
                     <div class="layui-form-item">
                     	<label class="layui-form-label">注册说明:</label>
                     	<div class="layui-input-block">
                        	<input type="text" name="description" class="layui-input" placeholder="请输入注册说明">
                     	</div>
                     </div>
                     <div class="layui-form-item">
                     	<label class="layui-form-label">小区Logo:</label>
                     	<div class="layui-input-block">
                     		<div class="source">
                            	<label class="upload-picture-btn" title="选择图片" for="file0">
            						+<img src="" id="img0" class="hide">
        						</label>
        						<input type="file" id="file0" name="input_file" class="hide" onchange="showPicture(this,'0')">
                            </div>
                            <div class="upload-tips">注:该图片在生成小区专属二维码时使用,图片不可大于2M</div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save2">下一步</button>
				      <button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
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
                    	小区其他信息
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label">占地面积(㎡):</label>
                        <div class="layui-input-block">
                            <input type="text" name="zarea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">建筑面积(㎡):</label>
                        <div class="layui-input-block">
                            <input type="text" name="jarea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">公共场所面积(㎡):</label>
                        <div class="layui-input-block">
                            <input type="text" name="garea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">绿化面积(㎡):</label>
                        <div class="layui-input-block">
                            <input type="text" name="larea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车库面积(㎡):</label>
                        <div class="layui-input-block">
                            <input type="text" name="carea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车位数(个):</label>
                        <div class="layui-input-block">
                            <input type="text" name="carcount" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">楼宇数量(栋):</label>
                        <div class="layui-input-block">
                            <input type="text" name="housecount" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            <textarea class="layui-textarea" name="remark"></textarea>
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
<!---编辑-->
<form class="layui-form" action="/wyht/xiaoqu/update" method="post" id="f3" enctype="multipart/form-data">
<div class="modal fade" id="myModal3" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	修改小区
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
	                        <label class="layui-form-label">小区名称:<samp style="color: red;">*</samp></label>
	                        <div class="layui-input-block">
	                        	<input type="hidden" id="disid3" name="disid">
	                            <input type="text" class="layui-input" id="dname3" name="dname" placeholder="请输入小区名称">
	                        </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">小区地址:<samp style="color: red;">*</samp></label>
                            <div id="city1" class="layui-input-block">
    							<select class="prov" name="prov" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
    							<select class="city" name="city" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
    							<select class="dist" name="dist" style="width: 100px;height: 34px;border: 1px solid #ccc;border-radius: 4px;"></select>
							</div>
                    </div>
                    <div class="layui-form-item">
                    	<label class="layui-form-label">详细地址:<samp style="color: red;">*</samp></label>
                    	<div class="layui-input-block">
                        	<input type="text" id="address3" name="address" class="layui-input" placeholder="请输入小区详细地址">
                        </div>
                    </div>
                    <div class="layui-form-item">
                     	<label class="layui-form-label">客服电话:<samp style="color: red;">*</samp></label>
                     	<div class="layui-input-block">
                        	<input type="text" id="customerp3" name="customerp" class="layui-input" placeholder="电话格式：028-87722262">
                       		<p class="help-block">注:如果有多个电话,请用英文的逗号隔开</p>
                    	</div>
               		</div>
                    <div class="layui-form-item">
                       	<label class="layui-form-label">负责人:<samp style="color: red;">*</samp></label>
                    	<div class="layui-input-block">
                        	<input type="text" id="fperson3" name="fperson" class="layui-input" placeholder="请输入负责人姓名">
                    	</div>
                 	</div>
                    <div class="layui-form-item">
                      	<label class="layui-form-label">负责人电话:<samp style="color: red;">*</samp></label>
                     	<div class="layui-input-block">
                      		<input type="text" id="fphone3" name="fphone" class="layui-input"  placeholder="请输入负责人电话">
                    	</div>
                    </div>
                	<div class="layui-form-item">
                       	<label class="layui-form-label">注册说明:</label>
                      	<div class="layui-input-block">
                       		<input type="text" id="description3" name="description" class="layui-input" placeholder="请输入注册说明">
                       	</div>
                 	</div>
                	<div class="layui-form-item">
                      	<label class="layui-form-label">小区Logo:</label>
                      	<div class="layui-input-block">
                       		<div class="source">
                        		<label class="upload-picture-btn" title="选择图片" for="file1">
            						+<img src="" id="img1" class="hide">
        						</label>
                                <input type="file" id="file1" name="input_file" class="hide" onchange="showPicture(this,'1')">
                            </div>
                        	<div class="upload-tips">注:该图片在生成小区专属二维码时使用,图片不可大于2M</div>
                     	</div>
                	</div>
          	</div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" data-dismiss="modal" class="layui-btn verification" data-toggle="modal" data-target="#myModal4" id="save3">下一步</button>
				      <button type="button" class="layui-btn layui-btn-primary" data-dismiss="modal">关闭</button>
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
                <h4 class="modal-title">
                   	 小区其他信息
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label">占地面积(㎡)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="zarea3" name="zarea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">建筑面积(㎡)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="jarea3" name="jarea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">公共场所面积(㎡)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="garea3" name="garea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">绿化面积(㎡)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="larea" name="larea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车库面积(㎡)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="carea3" name="carea" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车位数(个)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="carcount3" name="carcount" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">楼宇数(栋)：</label>
                        <div class="layui-input-block">
                            <input type="text" id="housecount3" name="housecount" class="layui-input" placeholder="0">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">备注：</label>
                        <div class="layui-input-block">
                            <textarea id="remark3" name="remark" class="layui-textarea"></textarea>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn sub" id="sub3">保存</button>
				      <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
				    </div>
			  	</div>
            </div>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">
$(function(){
	layui.use('form', function(){
		var form=layui.form;
		form.render();
	});
})
</script>
</body>
</html>