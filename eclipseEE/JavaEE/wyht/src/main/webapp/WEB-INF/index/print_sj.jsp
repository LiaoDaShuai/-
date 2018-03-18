<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业管理系统</title>
<script type="text/javascript" src="/wyht/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/wyht/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/wyht/js/jquery.jqprint-0.3.js"></script>
<style>
.print-item {
	padding: 15px;
}

.print-item>div {
	margin: 0 auto;
	border: 1px solid #E1E1E1;
}

.print-option {
	text-align: center;
}

font {
	font-size: 20px;
	display: inline-block;
	width: 40% px;
	height: auto;
	margin: 0 auto;
	border: 1px solid #ddd;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: #fff;
}
</style>
<script>
$(function(){
	var count=$(".total").length;
	var subtotal=0;
	for(var i=0;i<count;i++){
		subtotal+=parseInt($(".total").html());
	}
	$(".subtotal").html("￥"+subtotal);
})
</script>
</head>
<body>
	<div class="print-option">	
		<a href="javascript:dayin();" style="margin-left: 15px;">点击打印</a>
	</div>
	<div class='print-item'>
		<div class="sj-item"
			style="width: 725px; height: auto; min-height: 200px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px; padding-left: 20px;">
			<header class="sj-hd sj-h_f"
				style="min-height:40px;overflow: hidden;padding: 5px 20;position:relative;">
			<div class="sj-top"
				style="height: 50px; line-height: 50px; min-height: 40px;">

				<div class="sj-logo"
					style="position: absolute; top: 0; left: 0; width: 20%; text-align: center;">
					<img src="/wyht/img/dalogo.jpg"
						style="width: 100%; height: 55px;" alt="">
				</div>
				<div class="sj-title"
					style="width: 55%; position: absolute; top: 10px; left: 20%; text-align: center; line-height: 30px;">
					<div style="font-size: 23px; font-weight: 600;">启源缴费收据（默认）</div>
				</div>
				<div class="sj-num" style="position: absolute; top: 10px; right: 0; width: 25%; text-align: left; height: 40px; line-height: 30px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					<b>No:</b><span
						style="font-size: 20px; font-weight: 600; color: #F1352A;">${unpaidbills.unpaino }</span>
				</div>
			</div>
			<div class="sj-else"
				style="height: 40px; line-height: 40px; min-height: 40px;">

				<div class=""
					style="float: left; font-size: 14px; width: 31%; text-align: left;">
					<label style="font-weight: 600;">小区：</label>${unpaidbills.district.dname }
				</div>
				<div class=""
					style="float: left; width: 31%; text-align: left; font-size: 14px;">
					<label style="font-weight: 600;">姓名：<c:if test="${unpaidbills.oid!=null }">
						${unpaidbills.owners.owername }</c:if>
						<c:if test="${unpaidbills.oid==null }">${unpaidbills.onames }</c:if></label>
				</div>
				<div class=""
					style="float: left; width: 31%; text-align: left; font-size: 14px;">
					<label style="font-weight: 600;">付款日期：</label>${unpaidbills.zfdate }
				</div>
			</div>
			</header>
			<div class="sj-bd" style="overflow: hidden; padding: 5px 20;">
				<table style="width: 100%; border: 1px solid #ccc; border-collapse: collapse;">
					<thead>
						<tr>
							<th class="table_th printdy" >房号/车位号/车牌/住户</th>
							<th class="table_th printdy">收费项目</th>
							<th class="table_th printdy">开始时间</th>
							<th class="table_th printdy" >结束时间</th>
							<th class="table_th printdy">起度</th>
							<th class="table_th printdy">止度</th>
							<th class="table_th printdy" >数量</th>
							<th class="table_th printdy">单价</th>
							<th class="table_th printdy">金额</th>
							<th class="table_th printdy">优惠</th>
							<th class="table_th printdy">滞纳金</th>
							<th class="table_th printdy">预存款抵扣</th>
							<th class="table_th printdy">应收合计</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${unpaidbills.tolllist }" var="tlist">
						<tr>
							<td>${tlist.housefan.hnum}
                            	${tlist.parkingspace.pnum }
                           		${tlist.vehiclemanager.carnum }
                           		${tlist.temporary.owners.owername}</td>
							<td><c:if test="${tlist.temId!=null }">
									${tlist.temporary.chargname}
								</c:if><c:if test="${tlist.temId==null }">
								${tlist.priceproject.pricename }
								</c:if>-<c:if test="${unpaidbills.status==0 }">已缴</c:if>
								<c:if test="${unpaidbills.status==1 }">退费</c:if>
								<c:if test="${unpaidbills.status==2 }">已退</c:if>
								</td>
							<td>${tlist.simsdate }</td>
							<td>${tlist.simedate==''?'--':tlist.simedate }</td>
							<td>${tlist.tablemanager.tabStartnum==null?'--':tlist.tablemanager.tabStartnum }</td>
							<td>${tlist.tablemanager.tabEndnum==null?'--':tlist.tablemanager.tabEndnum }</td>
							<td>${tlist.count==null?'--':tlist.count }</td>
							<td>${tlist.priceing==null?'--':tlist.priceing }</td>
							<td>${tlist.subtotal }</td>
							<td>${tlist.youfei }</td>
							<td>${tlist.zhina }</td>
							<td>${tlist.yuck }</td>
							<td class="total">${tlist.subtotal }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<footer class="sj-ft sj-h_f"
				style="overflow: hidden;padding: 5px 20;">
			<div class=""
				style="clear: both; text-align: left; font-size: 14px; height: 40px; line-height: 40px; min-height: 40px;">
				<label style="font-weight: 600;">合计：</label><b class="subtotal"></b>
			</div>
			<div class=""
				style="float: left; width: 31%; text-align: left; font-size: 14px; min-height: 40px; line-height: 40px;">
				<label style="font-weight: 600;">收款人：</label>
			</div>
			<div class=""
				style="clear: both; text-align: left; font-size: 14px; min-height: 40px; line-height: 40px;">
				<label style="font-weight: 600;">收款备注：</label>
			</div>
			</footer>
		</div>
	</div>
	<script language="javascript" type="text/javascript">
		$('th,td').css({
			"padding" : "5px",
			"text-align" : "left",
			'border-right' : '1px solid #ccc',
			'border-bottom' : '1px solid #ccc',
			'font-weight' : '400'
		});
		$('tr').find('th:last,td:last').css({
			'border-right' : '0'
		});
		$('tbody').find('tr:last').find('td').css({
			'border-bottom' : '0'
		});
		function dayin(){
			$(".print-item").jqprint();
		}
	</script>
</body>
</html>
</script>