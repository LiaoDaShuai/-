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
	<script type="text/javascript" src="/wyht/js/datacenter/zhuhu.js"></script>
</head>
<body>
<div class="container col-sm-11 container-bianju">
    <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
        <a href="/wyht/yezhu/all?status=2"><div class="navkuai" style="border-bottom: 2px solid #7a7a7a;margin-left: 13px;">已迁入</div></a>
        <a href="/wyht/yezhu/all?status=0"><div class="navkuai" >待审核</div></a>
        <a href="/wyht/yezhu/all?status=1">
            <div class="navkuai">未通过</div></a>
        <a href="/wyht/yezhu/all?status=3">
            <div class="navkuai">已迁出</div></a>
    </div>
    <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
         <form action="" id="f1" name="f1" method="post">
         	<input type="hidden" name="status" value="2">
         	<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3" style="margin-top:8px;">所属小区：</label>
                    <select class="form-control-static col-sm-7 sel_1" id="disid1" name="disid">
                        <option value="0">---请选择小区---</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-4" style="margin-top:8px;">楼宇：</label>
                    <select class="form-control-static col-sm-7 sel_2" id="hlid1" name="hlid">
                    	<option value="0">--选择楼宇--</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-3" style="margin-top:8px;">单元：</label>
                    <select class="form-control-static col-sm-7 sel_3" id="unitid1" name="unitid">
                    	<option value="0">--选择单元--</option>
                    </select>
                </div>
            </div>
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3" style="margin-top:8px;" >住户身份：</label>
                    <select class="form-control-static col-sm-7" id="cardid1" name="cardid">
                        <option value="0">--请选择--</option>
                        <option value="1">业主本人</option>
                        <option value="2">亲属</option>
                        <option value="3">租客</option>
                        <option value="4">其他</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-4" style="margin-top:8px;">登录验证：</label>
                    <select class="form-control-static col-sm-7" id="loginver" name="loginver">
                        <option value="0">--请选择--</option>
                        <option value="1">未验证</option>
                        <option value="2">已验证</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-3 " style="margin-top:8px;">关键字：</label>
                    <input type="text" id="advanced" value="${owner.keywords }" name="keywords" class="form-control-static col-sm-7" placeholder="请输入关键字">
                </div>
            </div>
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <button type="submit" class="btn btn-success">
                    	<i class="fa fa-search"></i>搜索
                    </button>
                    <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                    <button type="button" class="btn btn-default closes"> 关闭</button>
                </div>
            </div>
        </form>
  	</div>
    <div style="margin:10px 0 5px 15px;">
            <div class="pull-left">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i>添加住户</button>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal4">导入</button>
                <button type="button" class="btn btn-success" id="moveout" disabled>迁出</button>
            </div>
            <div class="pull-right">
                <a href="javascript:" class="pull-left gaoji">高级搜索</a>
                <div class="suotext">
                    <input type="text" id="ordinary" value="${owner.keywords }" class="wentext" placeholder="姓名/房号/手机号/业主卡号">
                    <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
                </div>
                <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
                    <i class="fa fa-question"></i>
                </a>
            </div>
        </div>
    <div class="layui-form table-responsive col-sm-12">
        <table class="table table-hover">
            <thead>
                <tr style="font-size: 18px;">
                    <th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
                    <th>住户编号</th>
                    <th>手机</th>
                    <th>姓名</th>
                    <th>小区</th>
                    <th>楼宇</th>
                    <th>单元</th>
                    <th>房号</th>
                    <th>住户身份</th>
                    <th>入住时间</th>
                    <th>登录次数</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
            	<c:forEach items="${page.list}" var="yz">
                <tr style="font-size: 14px;">
                    <td><input type="checkbox" class="dan" lay-filter="itemChoose"></td>
                    <td>${yz.oid }</td>
                    <td>${yz.ownerphone }</td>
                    <td>${yz.owername }</td>
                    <td>${yz.dis.dname }</td>
                    <td>${yz.hl.floorname }</td>
                    <td>${yz.ut.unitname }</td>
                    <td>${yz.fanid }</td>
                    <c:choose>
                    	<c:when test="${yz.cardid==1 }">
                    		<td>业主本人</td>
                    	</c:when>
                    	<c:when test="${yz.cardid==2 }">
                    		<td>亲属</td>
                    	</c:when>
                    	<c:when test="${yz.cardid==3 }">
                    		<td>租客</td>
                    	</c:when>
                    	<c:when test="${yz.cardid==4 }">
                    		<td>其他</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td>无</td>
                    	</c:otherwise>
                    </c:choose>	
                    <td>${yz.mdates }</td>
                    <td>${yz.logincount }</td>
                    <td>
                        <a href="/wyht/fandetail/owid/${yz.oid }" class="onClickhand"><i class="fa fa-search"></i> 查看详情</a>
                        <a data-toggle="modal" class="onClickhand" href="#myModal3" onclick="edit('${yz.oid }')"><i class="fa fa-edit"></i> 编辑</a>
                        <a class="onClickhand" onclick="update_status('迁出','${yz.oid}','3')"><i class="fa fa-sign-out"></i> 迁出房屋</a>
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

<!--添加住户-->
<form class="layui-form" action="/wyht/yezhu/insert" method="post" id="f2" enctype="multipart/form-data">
<div class="modal fade" id="myModal2" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                   	 添加住户
                    <p style="font-size: 10px;color: #cccccc;">说明：1、添加单个新住户，如需批量导入请点击“住户列表—住户批量迁入”；2、如已迁出用户需再次迁入，请在住户列表中选中已迁出用户进行操作。</p>
                </h4>
            </div>
            <div class="modal-body">
                    <div class="layui-form-item">
                            <label class="layui-form-label">关联房屋:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <span class="sf"></span>
                                <input type="hidden" name="disid" id="disid2">
                                <input type="hidden" name="hlid" id="hlid2">
                                <input type="hidden" name="unitid" id="unitid2">
                                <input type="hidden" name="fanid" id="fanid2">
                                <label class="control-label se-house yes" style="color: #00bcd4;" id="select_house">选择房屋</label>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">姓名:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="owername2" name="owername" class="layui-input" placeholder="请输入姓名">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">性别:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select id="sex2" name="sex">
                                    <option value="">--请选择住户性别--</option>
                                    <option value="男" selected>男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">手机号:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="ownerphone2" name="ownerphone" class="layui-input" placeholder="请输入手机号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">家庭电话:</label>
                            <div class="layui-input-block">
                                <input type="text" name="homephone" class="layui-input" placeholder="请输入家庭电话">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">业主卡号:</label>
                            <div class="layui-input-block">
                                <input type="text" name="onum" class="layui-input" placeholder="请输入业主卡号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">迁入时间:</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" placeholder="请选择迁入时间" name="mdate" id="test1" readonly>
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
                    	住户其他信息
                </h4>
            </div>
            <div class="modal-body">
                        <div class="layui-form-item">
                                <label class="layui-form-label" >住户照片:</label>
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
                                <label class="layui-form-label">QQ号:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="qqnum" class="layui-input" placeholder="请输入住户QQ号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">微信号:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="weixin" class="layui-input" placeholder="请输入住户微信号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">电子邮箱:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="email" class="layui-input" placeholder="请输入电子邮箱">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">紧急联系人:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="emergency" class="layui-input" placeholder="请输入紧急联系人姓名">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">联系人手机号:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="emergphone" class="layui-input" placeholder="请输入紧急联系人手机号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">民族:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="nation" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">政治面貌:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="political" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">婚姻状况:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="ishunyin" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">身份证号:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="idcard" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label" >身份证图片:</label>
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
                                <label class="layui-form-label">户籍地址:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="hujiaddress" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">暂住证号码:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="temporarynum" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">居住类型:<samp style="color: red;">*</samp></label>
                                <div class="layui-input-block">
                                    <select name="livetype">
                                        <option value="">--请选择住户居住类型--</option>
                                        <option value="常住">常住</option>
                                        <option value="暂住">暂住</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">宠物信息: &emsp;</label>
                                <div class="layui-input-block">
                                    <input type="text" name="petxinxi" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">备注:&emsp;</label>
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
<!--编辑-->
<form class="layui-form" action="/wyht/yezhu/update" method="post" id="f3" enctype="multipart/form-data">
<div class="modal fade" id="myModal3" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close ref" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	编辑住户
                    <p style="font-size: 10px;color: #cccccc;">说明：1、添加单个新住户，如需批量导入请点击“住户列表—住户批量迁入”；2、如已迁出用户需再次迁入，请在住户列表中选中已迁出用户进行操作。</p>
                </h4>
            </div>
            <div class="modal-body">
            		<div class="layui-form-item">
                        	<input type="hidden" name="oid" id="oid3">
                            <label class="layui-form-label">选择小区:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select class="layui-input sel_1" id="disid3" name="disid">
                                    <option value="0">--请选择小区--</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">姓名:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="owername3" name="owername" class="layui-input" placeholder="请输入姓名">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">性别:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <select id="sex3" name="sex">
                                    <option value="">--请选择住户性别--</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">手机号:<samp style="color: red;">*</samp></label>
                            <div class="layui-input-block">
                                <input type="text" id="ownerphone3" name="ownerphone" class="layui-input" placeholder="请输入手机号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">家庭电话:</label>
                            <div class="layui-input-block">
                                <input type="text" id="homephone3" name="homephone" class="layui-input" placeholder="请输入家庭电话">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">业主卡号:</label>
                            <div class="layui-input-block">
                                <input type="text" id="onum3" name="onum" class="layui-input" placeholder="请输入业主卡号">
                            </div>
                    </div>
                    <div class="layui-form-item">
                            <label class="layui-form-label">迁入时间:</label>
                            <div class="layui-input-block">
                                <input type="text" name="mdate" class="layui-input" placeholder="请选择迁入时间" readonly id="test2">
                            </div>
                    </div>
			</div>
            <div class="modal-footer">
				<div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn verification" id="save3">修改其他信息</button>
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
                <h4 class="modal-title">
                    	住户其他信息
                </h4>
            </div>
            <div class="modal-body">
                        <div class="layui-form-item">
                                <label class="layui-form-label" >住户照片:</label>
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
                                <label class="layui-form-label">QQ号:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="qqnum3" name="qqnum" class="layui-input" placeholder="请输入住户QQ号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">微信号:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="weixin3" name="weixin" class="layui-input" placeholder="请输入住户微信号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">电子邮箱:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="email3" name="email" class="layui-input" placeholder="请输入电子邮箱">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">紧急联系人:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="emergency3" name="emergency" class="layui-input" placeholder="请输入紧急联系人姓名">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">联系人手机号:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="emergphone3" name="emergphone" class="layui-input" placeholder="请输入紧急联系人手机号">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">民族:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="nation3" name="nation" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">政治面貌:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="political3" name="political" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">婚姻状况:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="ishunyin3" name="ishunyin" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">身份证号:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="idcard3" name="idcard" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label" >身份证图片:</label>
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
                                <label class="layui-form-label">户籍地址:</label>
                                <div class="layui-input-block">
                                    <input type="text" name="hujiaddress3" name="hujiaddress" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">暂住证号码:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="temporarynum3" name="temporarynum" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">居住类型:</label>
                                <div class="layui-input-block">
                                    <select id="livetype3" name="livetype">
                                        <option value="0">--请选择住户居住类型--</option>
                                        <option value="常住">常住</option>
                                        <option value="暂住">暂住</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label">宠物信息:</label>
                                <div class="layui-input-block">
                                    <input type="text" id="petxinxi3" name="petxinxi" class="layui-input">
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
						  <button type="button" class="layui-btn sub" id="sub3">保存</button>
						  <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</form>
<!--导入住户-->
<div class="modal fade" id="myModal4" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close " data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">
                    	导入住户
                </h4>
            </div>
            <form class="layui-form" id="f4" name="importFile" enctype="multipart/form-data" action="/wyht/importOwners" method="post" >
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
                            <label class="layui-form-label">选择楼宇:</label>
                            <div class="layui-input-block">
                                <select class="sel_2" name="hlid" id="hlid4">
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
						</div>
						<div class="layui-form-item">
								<label class="layui-form-label"></label>
								<div class="col-sm-3">
									<i class="fa fa-warning text-danger"></i><a href="#">如何导入住户</a>
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
<!--选择房屋 -->
<div class="user_info">
    <ul class="tab-nav">
        <li class="active">
            <a>选择房屋</a>
        </li>
    </ul>
    <a class="close_side closediv">×</a>
    <div style="padding: 20px;height: 95%">
        <input type="text" class="chat-search" placeholder="搜索">
        <div class="r-content">
            <div class="SelectHouse" id="scrollcediv"></div>
        </div>
    </div>
    <div class="fake-box">
        <button type="button" class="btn btn-sm btn-primary btn-w-m closediv">确定</button>
        <button type="button" class="btn btn-sm btn-default btn-w-m m-l-10 closediv">返回</button>
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
		});
		//初始化小区下拉框
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$(".sel_1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
			//高级搜索
           	if("${owner.disid}"!=0){
           		$("#disid1").find("option[value='${owner.disid}']").attr("selected",true);
       			datacenterController.selectly("${owner.disid}",function(data){
       				$("#hlid1 option[value!='0']").remove();//清空楼宇下拉框
            		$("#unitid1 option[value!='0']").remove();//清空单元下拉框
   					for(var i=0;i<data.length;i++) {  
   						$("#hlid1").append("<option value='"+data[i].hlid+"'>"+data[i].floorname+"</option>");
   					}
            		if("${owner.hlid}"!=0){
    					$("#hlid1").find("option[value='${owner.hlid}']").attr("selected",true);
	            		datacenterController.selectut({disid:"${owner.disid}",hlid:"${owner.hlid}"},function(data){
	            			$("#unitid1 option[value!='0']").remove();//清空单元下拉框
							for(var i=0;i<data.length;i++) {  
								$("#unitid1").append("<option value='"+data[i].unitid+"'>"+data[i].unitname+"</option>"); 
							}
							if("${owner.unitid}"!=0){
								$("#unitid1").find("option[value='${owner.unitid}']").attr("selected",true);
							}
		            	})
					}
        		})
           	}
		})
		if("${owner.loginver}"!=0){
			$("#loginver").find("option[value='${owner.loginver}']").attr("selected",true);
		}
		if("${owner.cardid}"!=0){
			$("#cardid1").find("option[value='${owner.cardid}']").attr("selected",true);
		}
	})
</script>
</html>