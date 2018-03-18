<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
.card-body .table>thead>tr>th {
	background-color: #fff !important;
	vertical-align: middle;
	font-weight: 500;
	padding: 0 0 10px 30px;
	color: #333;
	border-width: 1px;
	text-transform: uppercase;
	text-align: left;
	border-top: 0 !important;
	border-bottom: 1px solid #ddd;
}

.card-body td {
	text-align: left;
	padding: 13px 0 13px 30px!important;
}

.card-body {
	padding: 0 !important;
	overflow: hidden;
}
</style>
<script type="text/javascript" src="/wyht/dwr/engine.js"></script>
<script type="text/javascript" src="/wyht/dwr/util.js"></script>
<script type="text/javascript"
	src="/wyht/dwr/interface/datacenterController.js"></script>
<script type="text/javascript"
	src="/wyht/dwr/interface/tollController.js"></script>
<script type="text/javascript" src="/wyht/js/toll/charg_fpv.js"></script>
</head>
<body>
	<div class="container col-sm-11" style="margin: 80px 0 0 90px;">
		<div class="card">
			<c:if test="${! empty housefan }">
				<div class="card-body card-padding"
					style="padding: 15px 26px !important;">
					<div class="infor-head">
						<h3>房屋详情</h3>
						<div class="infor-opts">
							<a href="" class="a-link m-l-15"><i class="fa fa-edit"></i>
								编辑 </a>
						</div>
					</div>
					<div class="row top-infor">
						<div class="col-sm-2">
							<label for=""> 房号： </label><span>${housefan.hnum }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 所属小区： </label><span>${housefan.dis.dname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 楼宇： </label><span>${housefan.hl.floorname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 单元： </label><span>${housefan.ut.unitname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 所在楼层： </label><span>${housefan.louceng }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 建筑面积： </label><span>${housefan.zarea}</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 套内面积： </label><span>${housefan.tarea}</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 公摊面积： </label><span>${housefan.garea }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 房屋类型： </label>
						</div>
						<div class="col-sm-2">
							<label for=""> 房屋朝向： </label><span>${housefan.hchaoxiang}</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 交房时间： </label><span>${housefan.startdates}</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 产权年限： </label><span>${housefan.cyear}年 </span>
						</div>
						<div class="col-sm-2">
							<label for=""> 附件： </label><span class="light-img"><a
								href="javascript:" class="a-link"
								data-src=" http://localhost:8080/wyht/img/${housefan.fujian }">
									查看图片 </a></span>
						</div>
						<div class="col-sm-2">
							<label for=""> 备注： </label><span>${housefan.remark}</span>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${! empty park }">
				<div class="card-body card-padding"
					style="padding: 15px 26px !important;">
					<div class="infor-head">
						<h3>车位详情</h3>
						<div class="infor-opts">
							<a href="/car/edit_parking/place_id/47342.html"
								class="a-link m-l-15"><i class="fa fa-edit"></i> 编辑 </a>
						</div>
					</div>
					<div class="row top-infor">
						<div class="col-sm-2">
							<label for=""> 车位号： </label><span>${park.pnum }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 产权面积： </label><span>${park.carea }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车位状态： </label><span> <c:if
									test="${park.status==0 }">空闲</c:if> <c:if
									test="${park.status==1 }">出租</c:if> <c:if
									test="${park.status==2 }">出售</c:if> <c:if
									test="${park.status==3 }">自用</c:if>
							</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 所属小区： </label><span>${park.dis.dname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 备注： </label><span>${park.remark }</span>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${! empty vehic }">
				<div class="card-body card-padding"
					style="padding: 15px 26px !important;">
					<div class="infor-head">
						<h3>车辆详情</h3>
						<div class="infor-opts">
							<a href="/car/edit_car/carid/18906.html" class="a-link m-l-15"><i
								class="fa fa-edit"></i> 编辑 </a>
						</div>
					</div>
					<div class="row top-infor">
						<div class="col-sm-2">
							<label for=""> 车牌号码： </label><span>${vehic.carnum }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车主姓名： </label><span>${vehic.cname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车主手机号： </label><span>${vehic.cphone }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 小区： </label><span>${vehic.dis.dname }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车位号： </label><span>${vehic.park.pnum }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车辆排量： </label><span>${vehic.carpai }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车辆型号： </label><span>${vehic.carxing }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车身颜色： </label><span>${vehic.carcolor }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车主QQ： </label><span>${vehic.carqq }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车主微信： </label><span>${vehic.carweixin }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车主邮箱： </label><span>${vehic.caremail }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 家庭电话： </label><span>${vehic.homephone }</span>
						</div>
						<div class="col-sm-2">
							<label for=""> 车辆照片： </label><span class="light-img"><a
								href="javascript:" class="a-link"
								data-src="/vipstatic/images/${vehic.carphoto }"> 查看图片 </a></span>
						</div>
						<div class="col-sm-2">
							<label for=""> 行驶证： </label><span class="light-img"><a
								href="javascript:" class="a-link"
								data-src="/vipstatic/images/${vehic.jiazhao }"> 查看图片 </a></span>
						</div>
						<div class="col-sm-2">
							<label for=""> 驾照： </label><span class="light-img"><a
								href="javascript:" class="a-link"
								data-src="/vipstatic/images/${vehic.jiazhao }"> 查看图片 </a></span>
						</div>
						<div class="col-sm-2">
							<label for=""> 备注： </label><span>${vehic.remark }</span>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${! empty owner }">
				<div class="card-body card-padding"
					style="padding: 15px 26px !important;">
					<div class="infor-head">
						<h3>住户详情</h3>
						<div class="infor-opts">
							<a href="/zhuhu/movein_edit/id/469767.html" class="a-link m-l-15"><i
								class="fa fa-edit"></i> 编辑 </a>
						</div>
					</div>
					<div class="zhuhu-infor">
						<div class="row">
							<div class="col-sm-2">
								<label for=""> 姓名： </label><span>${owner.owername } <c:if
										test="${owner.status==2 }">（已迁入）</c:if> <c:if
										test="${owner.status==0 }">（待审核）</c:if> <c:if
										test="${owner.status==1 }">（已迁入）</c:if> <c:if
										test="${owner.status==3 }">（已迁出）</c:if>
								</span><span class="light-img m-l-10"></span>
							</div>
							<div class="col-sm-2">
								<label for=""> 手机号： </label><span>${owner.ownerphone }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 家庭电话： </label><span>${owner.homephone }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 业主卡号： </label><span>${owner.onum }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 所属小区： </label><span>${owner.dis.dname }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 迁入时间： </label><span>${owner.mdates }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> QQ号： </label><span>${owner.qqnum }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 微信号： </label><span>${owner.weixin }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 邮箱： </label><span>${owner.email }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 紧急联系人： </label><span>${owner.emergency }</span>
							</div>
							<div class="col-sm-4">
								<label for=""> 紧急联系人电话： </label><span>${owner.emergphone }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 性别 ： </label><span>${owner.sex }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 民族： </label><span>${owner.nation }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 婚姻状况 ： </label><span> 
										${owner.ishunyin}
								</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 政治面貌： </label><span>${owner.political }</span>
							</div>
							<div class="col-sm-4">
								<label for=""> 身份证： </label><span></span>${owner.cardphoto }<span
									class="light-img m-l-5"></span>
							</div>
							<div class="col-sm-2">
								<label for=""> 户口类型： </label><span></span>
							</div>
							<div class="col-sm-2">
								<label for=""> 户籍地址： </label><span>${owner.hujiaddress }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 暂住证号码： </label><span>${owner.temporarynum }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 居住类型： </label><span>${owner.livetype }</span>
							</div>
							<div class="col-sm-2">
								<label for=""> 宠物信息： </label><span>${owner.petxinxi }</span>
							</div>
							<div class="col-sm-12">
								<label for=""> 备注： </label><span>${owner.remark }</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关房屋</h2>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${!empty houses || !empty housefan}">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>房号</th>
										<th>小区</th>
										<th>建筑面积</th>
										<!--<th>-->
										<!--房屋状态-->
										<!--</th>-->
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
									<c:when test="${! empty housefan }">
										<tr>
											<td>${housefan.hnum}</td>
											<td>${housefan.dis.dname}</td>
											<td>${housefan.zarea }</td>
											<td>
											<a href="/wyht/fandetail/fwid/${housefan.fanid }"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${houses }" var="bind">
										<tr>
											<td>${bind.house.hnum }</td>
											<td>${bind.dis.dname }</td>
											<td>${bind.house.zarea }</td>
											<td><a href="/wyht/fandetail/fwid/${bind.house.fanid}"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:forEach>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-30 text-center">暂无相关房屋信息</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${empty owner }">
			<div class="card xiangqing">
				<div class="card-header ch-alt m-b-20">
					<h2>
						收费项目 <a data-toggle="modal" href="#addChargs"
							class="a-opts m-l-20"> + 添加收费标准 </a>
					</h2>
				</div>
				<div class="card-body">
					<c:choose>
						<c:when test="${!empty bclist }">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>收费项目</th>
											<th>收费标准</th>
											<th>开始时间</th>
											<th>结束时间</th>
											<th>备注</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bclist }" var="bc">
											<tr>
												<td><a href="">${bc.prices.pricename }</a></td>
												<td><a href="">${bc.chargs.chargname }</a></td>
												<td>${bc.simsdate }</td>
												<td>${bc.simedate==''?'--':bc.simedate }</td>
												<td>${bc.remark==null?'--':bc.remark }</td>
												<td><a href="javascript:editcharg('${bc.bcid }')">
												<i class="fa fa-edit"></i> 修改 </a> 
												<c:choose>
												<c:when test="${housefan.fanid!=null}">
													<c:set var="type" value="1"/>
													<c:set var="othid" value="${housefan.fanid}"/>
												</c:when><c:when test="${park.parkid!=null}">
													<c:set var="type" value="2"/>
													<c:set var="othid" value="${park.parkid}"/>
												</c:when><c:when test="${vehic.vehicid!=null}">
													<c:set var="type" value="3"/>
													<c:set var="othid" value="${vehic.vehicid}"/>
												</c:when>
												</c:choose>
												<a href="javascript:chargdel('${type }','${othid }','${bc.bcid }')"
													class="a-opts m-l-10 del_bz_btn"> 
												<i class="fa fa-trash"></i> 删除
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</c:when>
						<c:otherwise>
							<div class="p-30 text-center">暂无相关住户信息</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:if>
		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关住户</h2>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when
						test="${! empty houses || ! empty parks || ! empty vehics }">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>姓名</th>
										<th>小区</th>
										<th>房号</th>
										<th>手机</th>
										<th>身份</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach
										items="${houses!=null?houses:parks!=null?parks:vehics }"
										var="bind">
										<tr>
											<td>${bind.owner.owername}</td>
											<td>${bind.dis.dname}</td>
											<td>${bind.house.hnum}</td>
											<td>${bind.owner.ownerphone }</td>
											<td><c:if test="${bind.owner.cardid==1 }">业主本人
							</c:if> <c:if test="${bind.owner.cardid==2 }">亲属</c:if> <c:if
													test="${bind.owner.cardid==3 }">租客</c:if> <c:if
													test="${bind.owner.cardid==4 }">其他</c:if></td>
											<td><a href="/wyht/fandetail/owid/${bind.owner.oid }"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-30 text-center">暂无相关住户信息</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关车位</h2>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${!empty parks }">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>车位号</th>
										<th>小区</th>
										<th>车位状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${! empty park }">
										<tr>
											<td>${park.pnum}</td>
											<td>${park.dis.dname}</td>
											<td><c:if test="${park.status==0 }">空闲
							</c:if> <c:if test="${park.status==1 }">出租</c:if> <c:if
													test="${park.status==2 }">出租</c:if> <c:if
													test="${park.status==3 }">自备</c:if></td>
											<td><a href="/wyht/fandetail/cwid/${park.parkid}"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach items="${parks }" var="bind">
										<tr>
											<td>${bind.park.pnum}</td>
											<td>${bind.dis.dname}</td>
											<td><c:if test="${bind.park.status==0 }">空闲
							</c:if> <c:if test="${bind.park.status==1 }">出租</c:if> <c:if
													test="${bind.park.status==2 }">出租</c:if> <c:if
													test="${bind.park.status==3 }">自备</c:if></td>
											<td><a href="/wyht/fandetail/cwid/${bind.park.parkid}"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:forEach>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-30 text-center">暂无相关车位</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关车辆</h2>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${!empty vehics }">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>车辆号码</th>
										<th>小区</th>
										<th>车位号</th>
										<th>车主姓名</th>
										<th>车主手机号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
								<c:when test="${!empty vehic }">
										<tr>
											<td>${vehic.carnum}</td>
											<td>${vehic.dis.dname}</td>
											<td>${vehic.park.pnum }</td>
											<td>${vehic.cname}</td>
											<td>${vehic.cphone }</td>
											<td><a href="/wyht/fandetail/clid/${vehic.vehicid}"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${vehics }" var="bind">
										<tr>
											<td>${bind.vehic.carnum}</td>
											<td>${bind.dis.dname}</td>
											<td>${bind.park.pnum }</td>
											<td>${bind.vehic.cname}</td>
											<td>${bind.vehic.cphone }</td>
											<td><a href="/wyht/fandetail/clid/${bind.vehic.vehicid}"
												class=""><i class="fa fa-search"></i> 查看 </a></td>
										</tr>
									</c:forEach>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-30 text-center">暂无相关车辆</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关账单</h2>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${!empty tolllist }">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>类别</th>
										<th>房号/车牌/车位号/住户</th>
										<th>费用名称</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>单价</th>
										<th>数量</th>
										<th>应收金额</th>
										<th>滞纳金</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${tolllist }" var="toll">
										<tr>
											<td><c:if test="${toll.ztype==1 }">
							房屋相关
							</c:if> <c:if test="${toll.ztype==2 }">
							车位相关
							</c:if> <c:if test="${toll.ztype==3 }">
							车辆相关
							</c:if> <c:if test="${toll.ztype==4 }">
							自定义金额
							</c:if> <c:if test="${toll.ztype==5 }">
							租金相关
							</c:if> <c:if test="${toll.ztype==6 }">
							其他
							</c:if></td>
											<td><c:choose>
													<c:when test="${toll.housefan.hnum!=''}">
														<a
															href="/wyht/toll/checkoutids/${toll.ztype}/${toll.housefan.fanid}">
															${toll.housefan.hnum}</a>
													</c:when>
													<c:when test="${toll.parkingspace.pnum!=''}">
														<a
															href="/wyht/toll/checkoutids/${toll.ztype }/${toll.parkingspace.parkid}">
															${toll.parkingspace.parkingspace }</a>
													</c:when>
													<c:when test="${toll.vehiclemanager.carnum!=''}">
														<a
															href="/wyht/toll/checkoutids/${toll.ztype }/${toll.vehiclemanager.vehicid}">
															${toll.vehiclemanager.carnum }</a>
													</c:when>
													<c:when test="${toll.temporary.owners.ower_id!=''}">
														<a
															href="/wyht/toll/checkoutower/${temporary.owners.ower_id}">
															${toll.temporary.owners.owername} </a>
													</c:when>
												</c:choose>
											<td>${toll.priceproject.pricename }</td>
											<td>${toll.simsdate }</td>
											<td>${toll.simedate }</td>
											<td>${toll.priceing==''?'-':toll.priceing }</td>
											<td>${toll.count==''?'-':toll.count}</td>
											<td><b class="text-danger"> ￥${toll.subtotal }</b></td>
											<td><b class="text-danger"> ￥${toll.zhina }</b></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
					<c:otherwise>
						<div class="p-30 text-center">暂无相关账单</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="card xiangqing">
			<div class="card-header ch-alt m-b-20">
				<h2>相关报修</h2>
			</div>
			<div class="card-body">
				<div class="p-30 text-center">暂无相关报修</div>
			</div>
		</div>
		</div>
	<div class="modal fade" id="addChargs" tabindex="-1"
		data-keyboard="false">
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
					<div class="modal-footer"
						style="text-align: center; background-color: #cccccc;">
						<c:if test="${!empty housefan }">
							<input type="hidden" id="other_id" value="${housefan.fanid }"
								name="fan_id">
						</c:if>
						<c:if test="${!empty park }">
							<input type="hidden" id="other_id" name="park_id"
								value="${park.parkid }">
						</c:if>
						<c:if test="${!empty vehic }">
							<input type="hidden" id="other_id" name="vehic_id"
								value="${vehic.vehicid }">
						</c:if>
						<input type="hidden" name="type" value="2">
						<button type="button" onclick="isCharg(this.form)"
							class="btn btn-success">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exchange-sf" role="dialog"
		aria-hidden="false">
		<form class="" id='form1'>
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">修改亲属关系</h4>
					</div>
					<div class="hr-solid"></div>
					<div class="modal-body">
						<div class="row p-15">
							<label class="col-sm-3 text-right p-t-10">亲属关系：</label>
							<div class="col-sm-6">
								<input class="form-control-k" name="qs" id="qs" /><input
									class="form-control-k" name="qs_id" type="hidden" id="qs_id" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">保存</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="modal fade" id="modalWider" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form class="edit_form">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">修改</h4>
					</div>
					<div class="hr-solid"></div>
					<div class="modal-body">
						<div class="row p-10">
							<label for="" class="col-sm-3 p-t-10 text-right"> 收费项目: </label>
							<div class="col-sm-6">
								<input type="text" class="form-control-k project_id" readonly
									id="project_id">
							</div>
						</div>
						<div class="row p-10">
							<label for="" class="col-sm-3 p-t-10 text-right"> 收费标准: </label>
							<div class="col-sm-6">
								<input type="text" class="form-control-k biaozhun_id" readonly
									id="biaozhun_id">
							</div>
						</div>
						<div class="row p-10">
							<label for="" class="col-sm-3 p-t-10 text-right"> 开始时间: </label>
							<div class="col-sm-6">
								<input type="text" class="form-control-k" readonly
									id="begin_time">
							</div>
						</div>
						<div class="row p-10">
							<label for="" class="col-sm-3 p-t-10 text-right"> 结束时间: </label>
							<div class="col-sm-6 none edit_end_time">
								<input type="text" class="form-control-k end_time" readonly
									id="end_time" name="end_time">
							</div>
							<div class="col-sm-3 p-t-10">
								<label for="nodate" class="font-thin"><input
									type="checkbox" id='nodate' checked
									class="wxq-checkbox v-a-b in_1"><span>无结束时间</span></label>
							</div>
						</div>
						<div class="row p-10 none sd">
							<label for="" class="col-sm-3 p-t-10 text-right"> 手动输入: </label>
							<div class="col-sm-6">
								<div class="input-group">
									<input type="text" class="form-control-k" id="sd_money"
										name="sd_money" value=""><span
										class="input-group-addon" style="border-left: 0;"> 元 </span>
								</div>
							</div>
						</div>
						<div class="row p-10">
							<label for="" class="col-sm-3 p-t-10 text-right"> 备注: </label>
							<div class="col-sm-6">
								<input type="text" class="form-control-k" id="remark"
									name="remark">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="id" name="id"><input
							type="hidden" class="no_1_1" name="no_1"><input
							type="hidden" name="js_type" class="js_type_1"><input
							type="hidden" name="sf_flag" value="1">
						<button type="button" id="" class="btn btn-primary edit_bz_btn">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>
	layui.use('form',function(){
		var form=layui.form;
		form.on('select(priceIdSelect)',function(data){
			$("select[name=chargid] option[value!='']").remove();
			$("#shoushu").addClass("hide");
			if("${park}"!=null){
				tollController.chargParkAllid(data.value,function(data){
					for(var i=0;i<data.length;i++){
						$("select[name=chargid]").append("<option value='"+data[i].chargid+"'>"+data[i].chargname+"</option>")
					}
					form.render('select');
				});
			}else if("${housefan}"!=null){
				tollController.chargFanAllid(data.value,function(data){
					for(var i=0;i<data.length;i++){
						$("select[name=chargid]").append("<option value='"+data[i].chargid+"'>"+data[i].chargname+"</option>")
					}
					form.render('select');
				});
			}else if("${vehic}"!=null){
				tollController.chargVehicAllid(data.value,function(data){
					for(var i=0;i<data.length;i++){
						$("select[name=chargid]").append("<option value='"+data[i].chargid+"'>"+data[i].chargname+"</option>")
					}
					form.render('select');
				});
			}
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
	})
	</script>
</body>
</html>