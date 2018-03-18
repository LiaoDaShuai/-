<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业</title>
<style>
td{text-align: center;}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row header">
			<div class="col-sm-12">${unpdetails.owners.owername }的缴费记录</div>
		</div>
		<div class="hr-solid"></div>
		<div style="padding: 10px 10px;">
			<div class="row">
				<ul class="tab-nav">
					<li class="active"><a href="javascript:;">住户信息</a></li>
				</ul>
				<div class="tab-content">
					<div class="col-sm-3 p-20">
						<label>姓名：</label><c:if test="${unpdetails.oid!=null }">
						${unpdetails.owners.owername }</c:if>
						<c:if test="${unpdetails.oid==null }">${unpdetails.onames }</c:if>
					</div>
					<div class="col-sm-3 p-20">
						<label>小区：</label>${unpdetails.district.dname }
					</div>
					<div class="col-sm-3 p-20">
						<label>楼宇：</label>${unpdetails.houselou.floorname }
					</div>
					<div class="col-sm-3 p-20">
						<label>房号：</label>${unpdetails.housefan.hnum }
					</div>
					<div class="col-sm-3 p-20">
						<label>手机号：</label><c:if test="${unpdetails.oid!=null }">
						${unpdetails.owners.ownerphone }</c:if>
						<c:if test="${unpdetails.oid==null }">${unpdetails.ophone }</c:if>
					</div>
					<div class="col-sm-3 p-20">
						<label>收款状态：</label>
						<c:choose>
							<c:when test="${unpdetails.status==0 }">已缴</c:when>
							<c:when test="${unpdetails.status==1 }">退费</c:when>
							<c:when test="${unpdetails.status==2 }">已退</c:when>
						</c:choose>
					</div>
					<div class="col-sm-3 p-20">
						<label>收费日期：</label>${unpdetails.zfdate }
					</div>
					<div class="col-sm-3 p-20">
						<label>操作员：</label>
					</div>
					<c:if test="${unpdetails.status!=1 }">
					<div class="col-sm-12 p-20">
						<label>收款方式：</label>
						<c:choose>
							<c:when test="${unpdetails.means==1 }">现金</c:when>
							<c:when test="${unpdetails.means==2 }">支票</c:when>
							<c:when test="${unpdetails.means==3 }">银行转账</c:when>
							<c:when test="${unpdetails.means==4 }">pos机刷卡</c:when>
							<c:when test="${unpdetails.means==5 }">支付宝直接转账</c:when>
							<c:when test="${unpdetails.means==6 }">微信直接转账<</c:when>
						</c:choose>
					</div>
					<div class="col-sm-12 p-20">
						<label>收款备注：</label>${unpdetails.remark }
					</div></c:if>
					<c:if test="${unpdetails.status==1 }">
						<div class="col-sm-12 p-20">
						<label>退款备注：</label> ${unpdetails.remark }
						</div>
					</c:if>
				</div>
			</div>
			<div class="row">
				<ul class="tab-nav">
					<li class="active"><a href="javascript:;">费用明细</a></li>
				</ul>
				<div class="tab-content m-t-20">
					<table class="table i-table">
						<thead style="background-color: #fff">
							<tr style="background-color: #fff;">
								<th class="c-gray">状态</th>
								<th class="c-gray">类型</th>
								<th class="c-gray">房号/车位号/车牌</th>
								<th class="c-gray">费用名称</th>
								<th class="c-gray">开始时间</th>
								<th class="c-gray">结束时间</th>
								<th class="c-gray">单价</th>
								<th class="c-gray">数量</th>
								<th class="c-gray">应收金额</th>
								<th class="c-gray">优惠</th>
								<th class="c-gray">滞纳金</th>
								<th class="c-gray">实收合计</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${unpdetails.tolllist }" var="tlist">
							<tr>
								<td>
								<c:if test="${unpdetails.status==0 }">已缴</c:if>
								<c:if test="${unpdetails.status==1 }">退费</c:if>
								<c:if test="${unpdetails.status==2 }">已退</c:if></td>
								<td><c:choose>
                            	<c:when test="${tlist.ztype==1 }">房屋</c:when>
                            	<c:when test="${tlist.ztype==2 }">车位</c:when>
                            	<c:when test="${tlist.ztype==3 }">车辆</c:when>
                            	<c:when test="${tlist.ztype==4 }">自定义金额</c:when>
                            	</c:choose></td>
								<td><c:choose>
											<c:when test="${tlist.housefan.hnum!=null}">
													${tlist.housefan.hnum}
											</c:when>
											<c:when test="${tlist.parkingspace.parkid!=null}">
													${tlist.parkingspace.pnum }
											</c:when>
											<c:when test="${tlist.vehiclemanager.carnum!=null}">
													${tlist.vehiclemanager.carnum }
											</c:when>
											<c:when test="${tlist.temporary.owners.oid!=null}">
													${tlist.temporary.owners.owername}
											</c:when>
										</c:choose></td>
								<td>
								<c:choose>
									<c:when test="${tlist.priceid!=null }">
									${tlist.priceproject.pricename }
									</c:when><c:otherwise>
										${tlist.temporary.chargname}
									</c:otherwise>
								</c:choose>
									</td>
								<td>${tlist.simsdate }</td>
								<td>${tlist.simedate }</td>
								<td>${tlist.priceing==null?'--':tlist.priceing }</td>
								<td>${tlist.count==null?'--':tlist.count }</td>
								<td>￥<span class="yingjiao">${tlist.subtotal }</span></td>
								<td>￥<span class="youhui">${tlist.youfei }</span></td>
								<td>￥<span class="znj">${tlist.zhina }</span></td>
								<td class=""><span class="c-red">￥ <span
										class="yshj">${tlist.subtotal-tlist.youfei+tlist.zhina }</span>
										</span></td>
							</tr>
						</c:forEach>
							<tr>
								<td>小计</td>
								<td colspan="7"></td>
								<td colspan="" class=""><b>￥<span
										class="yingjiao_total">${unpdetails.totalMoney }</span></b></td>
								<td class=""><b>￥<span class="youhui_total">${unpdetails.totalYh }</span></b></td>
								<td class=""><b>￥<span class="znj_total">${unpdetails.totalZnj }</span></b></td>
								<td><b>￥<span class="yshj_total">${unpdetails.totalYjmoney }</span></b></td>
							</tr>
							<tr>
								<td colspan="12" class=" highlight p-r-30 text-right"><p>
										总金额： <span class="c-red">￥<span class="yshj_total">${unpdetails.totalMoney }</span></span>
									</p>
									<p>
										预存款抵扣：<span class="c-green">￥ ${unpdetails.totalYc }</span>
									</p>
									<p>
										优惠抵扣：<span class="c-green">￥ ${unpdetails.totalYh }</span>
									</p>
									<h3>
										<c:if test="${unpdetails.status==1 }">退费金额：</c:if>
										<c:if test="${unpdetails.status!=1 }">实收金额：</c:if>
									    <b class="c-red">￥${unpdetails.totalYjmoney }</b>
									</h3></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>