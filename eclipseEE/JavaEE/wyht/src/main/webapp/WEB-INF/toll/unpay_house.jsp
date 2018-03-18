<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script> 
<script src="/wyht/dwr/interface/datacenterController.js"></script>   
<script src="/wyht/js/toll/unpay_house.js"></script>
<style>
table td, th {
	border: 1px solid #e1e6eb;
}
table a{color:#2277da!important;}
</style>

</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row header">
			<div class="col-sm-12">未缴查询</div>
		</div>
		<div class="row small">
			<div class="col-sm-12">
				<i class="fa fa-question-circle"></i>
				功能说明：可点击房号（或车位号、车牌号）、姓名、手机号进入收银台，收取对应房屋、车位、车辆或住户的未缴费用。
			</div>
		</div>
		<div class="hr-solid"></div>
		<div class="list-action-grid">
			<form method="post" class="form-horizontal" name="f1" action="#">
				<div class="col-sm-12 toggaoji">
					<div class="row p-t-10">
						<div class="form-group col-sm-4">
							<label for class="col-sm-3" style="margin-top: 8px;">类型：</label>
							 <select class="form-control-static col-md-7" name="ztype">
								<option value="">---请选择费用类型---</option>
								<option value="1">房屋相关</option>
								<option value="2">车位相关</option>
								<option value="3">车辆相关</option>
								<option value="4">自定义金额</option>
								<option value="5">租金</option>
								<option value="6">其他</option>
							</select>
						</div>
						<div class="form-group col-sm-4">
							<label class="col-sm-3" style="margin-top: 8px;">费用类别：</label> <select
								class="form-control-static col-sm-7" name="pricetype">
								<option value="">---请选择费用类别---</option>
								<option value="1">周期性</option>
								<option value="2">临时性</option>
								<option value="3">押金性</option>
							</select>
						</div>
						<div>
							<!-- 存放分页的数据 -->
							<input type="hidden" name="pageNum" value=""> <input
								type="hidden" name="pageSize" value="${page2.size }">
						</div>
						<div class="form-group col-sm-4">
							<label for class="col-sm-3" style="margin-top: 8px;">小区：</label>
							<select class="form-control-static col-sm-7" name="disid">
								<option value="">---请选择小区---</option>
							</select>
						</div>
					</div>
					<div class="row p-t-10">
						<div class="form-group col-sm-4">
							<label for class="col-sm-3" style="margin-top: 8px;">收费项目：</label>
							<select class="form-control-static col-sm-7" name="priceid">
								<option value="">---请选择项目---</option>
							</select>
						</div>
						<div class="form-group col-sm-4">
							<label for class="col-sm-3 " style="margin-top: 8px;">开始时间：</label>
							<input type="text" name="sdate" value="${mohuselect.simsdate}"
								class="form-control-static col-sm-7" id="startdata" readonly
								placeholder="请输入开始时间">
						</div>
						<div class="form-group col-sm-4">
							<label for class="col-sm-3 " style="margin-top: 8px;">结束时间：</label>
							<input type="text" name="edate" value="${mohuselect.simedate}"
								class="form-control-static col-sm-7" id="enddata" readonly
								placeholder="请输入结束时间">
						</div>
					</div>
					<div class="row p-t-10">
						<div class="form-group col-sm-4">
							<label for class="col-sm-3 " style="margin-top: 8px;">关键词：</label>
							<input type="text" class="form-control-static col-sm-7"
								id="advanced" name="keyword" disabled="disabled" value="${mohuselect.keyword}"
								placeholder="房号/车位号/车牌号/住户">
						</div>
						<div class="form-group col-sm-4">
							<button type="submit" class="col-sm-3 btn btn-success"
								style="margin: 0 5px 0 10px;">
								<i class="fa fa-search"></i> 搜索
							</button>
							<button type="reset" class="col-sm-3 btn btn-default"
								style="margin-right: 5px;">清空</button>
							<button type="button" class="col-sm-3 btn btn-default closes">关闭</button>
						</div>
					</div>
				</div>
				<div style="margin: 18px 0 5px 15px;">
					<button disabled id="del" class="btn btn-success">批量删除</button>
<!-- 					<a class="btn btn-success" data-toggle="modal" href="#daoru"> -->
<!-- 						导入未缴费用</a> -->
					<div class="pull-right">
						<a href="javascript:" class="pull-left gaoji"> 高级搜索</a>
						<div class="suotext">
							<input type="text" name="keyword" value="${mohuselect.keyword }"
								id="ordinary" class="wentext" placeholder="房号/车位号/车牌号/住户">
							<button class="btn-list list-setting">
								<i class="fa fa-search"></i>
							</button>
						</div>
						<a href="" class="btn-list"
							target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
					</div>
			</form>
		</div>
		<div class="layui-form  table-responsive col-sm-12">
			<table class="table table-hover zhuhuInfo">
				<thead>
					<tr>
						<th style="width:50px;"><input type="checkbox" class="quan" lay-filter="allChoose"></th>
						<th>类型</th>
						<th>小区</th>
						<th width="120px">房号/车位号/车牌号/住户</th>
						<th>费用名称</th>
						<th>开始/结束时间</th>
						<th>住户</th>
						<th>手机号</th>
						<th>单价</th>
						<th>数量</th>
						<th>应收金额</th>
						<th>优惠</th>
						<th>滞纳金</th>
						<th>应缴金额</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${!empty page.list }">
							<c:forEach items="${page.list }" var="wjiao">
								<tr>
									<td><input type="checkbox" class="dan" name="cb${wjiao.tollid }" lay-filter="itemChoose"></td>
									<td><c:choose>
											<c:when test="${wjiao.ztype==1 }">房屋</c:when>
											<c:when test="${wjiao.ztype==2 }">车位</c:when>
											<c:when test="${wjiao.ztype==3 }">车辆</c:when>
											<c:when test="${wjiao.ztype==4 }">自定义金额</c:when>
										</c:choose></td>
									<td>${wjiao.district.dname }</td>
									<td><c:choose>
											<c:when test="${wjiao.housefan.hnum!=null}">
												<a href="checkoutids/${wjiao.ztype}/${wjiao.housefan.fanid}">
													${wjiao.housefan.hnum}</a>
											</c:when>
											<c:when test="${wjiao.parkingspace.parkid!=null}">
												<a href="checkoutids/${wjiao.ztype }/${wjiao.parkingspace.parkid}">
													${wjiao.parkingspace.pnum }</a>
											</c:when>
											<c:when test="${wjiao.vehiclemanager.carnum!=null}">
												<a href="checkoutids/${wjiao.ztype }/${wjiao.vehiclemanager.vehicid}">
													${wjiao.vehiclemanager.carnum }</a>
											</c:when>
											<c:when test="${wjiao.temporary.owners.oid!=null}">
												<a href="checkoutower/${wjiao.temporary.owners.oid}">
													${wjiao.temporary.owners.owername} </a>
											</c:when>
										</c:choose></td>
									<td>${wjiao.priceproject.pricename }${wjiao.temporary.chargname }</td>
									<td>${wjiao.simsdate }<br />${wjiao.simedate }</td>
									<td style="padding: 0px;"><c:forEach
											items="${wjiao.ownerlist }" var="owname">
											<div class="rowspan">
												<a href="checkoutower/${owname.oid}"> ${owname.owername }</a>
											</div>
										</c:forEach></td>
									<td style="padding: 0px;"><c:forEach
											items="${wjiao.ownerlist }" var="owphone">
											<div class="rowspan">
												<a href="checkoutower/${owphone.oid}">
													${owphone.ownerphone }</a>
											</div>
										</c:forEach></td>
									<td class="c-red">￥${(wjiao.priceing==null)?'--':wjiao.priceing}</td>
									<td>${(wjiao.count==null)?'--':wjiao.count }</td>
									<td class="subtotal c-red">￥${wjiao.subtotal }</td>
									<td class="youhui c-red">￥${wjiao.youfei}</td>
									<td class="zhina c-red">￥${wjiao.zhina }</td>
									<td class="yjiao c-red">￥${wjiao.subtotal-wjiao.youfei-wjiao.zhina-wjiao.yuck }</td>
									<td>${wjiao.remark }</td>
									<td>
										<a class="deleweijiao onClickhand" id="${wjiao.tollid }">
											<i class="fa fa-trash"></i> 删除
										</a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan='16' style="text-align: center;"><h3>暂无未缴信息</h3></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="10">小计：</td>
						<td class="totalMoney c-red"></td>
						<td class="totalYh c-red"></td>
						<td class="totalZnj c-red"></td>
						<td class="totalYj c-red"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="10">合计：</td>
						<td class="totalMoney c-red"></td>
						<td colspan="5"></td>
					</tr>
				</tbody>
			</table>
		</div>
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
						href="javascript:Fenye(${page.lastPage},${page.lastPage })"> <i
							class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
				</ul>
			</div>
		</c:if>
		<div class="pull-right biao-er-wai">
			该页显示： <select style="width: 100px; height: 25px;" class="pagination">
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
	</div>
	<div class="modal fade" id="daoru" tabindex="-1" role="dialog"
		aria-hidden="true" style="margin-top: 8%;">
		<form method="post" action="/cost/print_sj.jsp" target="_blank">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">导入未缴费用</h4>
					</div>
					<div class="modal-body">
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 所选小区 </label>
							</div>
							<div class="col-sm-6">
								<select name="print_id" class="form-control">
									<option value="1942">--请选择小区--</option>
								</select>
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 选择类型 </label>
							</div>
							<div class="col-sm-6">
								<select name="print_id" class="form-control">
									<option value="1942">通过手机号</option>
								</select>
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 选择excel文件 </label>
							</div>
							<div class="col-sm-3">
								<input type="file">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-6 col-sm-offset-3">
								<i class="fa fa-warning text-danger"></i> 如何导入未缴费用
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="none ids">
							<input name="tid" id="tid" type="hidden" value="34536">
						</div>
						<button type="submit" id="" class="btn btn-primary">立即导入</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>