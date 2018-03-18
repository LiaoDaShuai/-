<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业管理系统</title>

<script>
	$(function() {
		layui.use("form",function(data){
			var form=layui.form;
			//全选
			form.on('checkbox(allChoose)', function(data){
			    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
			    child.each(function(index, item){
			      item.checked = data.elem.checked;
			    });
			    form.render('checkbox');
			    var sib = $(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    if(sib==0){
			    	$('#del').attr('disabled', true);
			    }else{
			    	$('#del').attr('disabled', false);
			    }
			});
			form.render();
		});
		$("#shoufeis").on("click",function() {
			var zongsub = 0, zongyou = 0, zongzhi = 0, zongyu = 0, zongyin = 0;
			var tollid = '';
			var ycount = $(".ybill:checked").length;// 获取选中的复选框有多少长度
			if (ycount < 1) {
				sweetAlert({
					text : '请选择要缴纳的帐单',
					type : 'warning',
					timer : 1500,
					showConfirmButton : false
				});
				return false;
			}
			for (var i = 0; i < ycount; i++) {
				var idx = $(".ybill:checked").eq(i).index(
						"input[name=tolids]");// 获取选择的复选框对应的input的索引值,
				zongsub += parseInt($(".subtotal").eq(idx).text()
						.replace("￥", ''));// 匹配索引值
				zongyou += parseInt($(".youhui").eq(idx).text()
						.replace("￥", ''));
				zongzhi += parseInt($(".zhina").eq(idx).text()
						.replace("￥", ''));
				zongyu += parseInt($(".yuck").eq(idx).text()
						.replace("￥", ''));
				zongyin += parseInt($(".yjiao").eq(idx).text()
						.replace("￥", ''));
				tollid += "<input type='hidden' name='tolids' value='"
						+ $(".ybill:checked").eq(i).val() + "'>";
			}
			$("input[name=totalMoney]").val(zongsub);
			$("input[name=totalYh]").val(zongyou);
			$("input[name=totalZnj]").val(zongzhi);
			$("input[name=totalYc]").val(
					(isNaN(zongyu) == true ? '0' : zongyu));
			$("input[name=totalYjmoney]").val(zongyin);
			$(".chidden").html(tollid);
		});
		$(".content .fy .xiangq").click(
				function() {
					var index = $(".content .fy .xiangq").index(this);
					var count = $(".content .fy .xiangq").length;
					if ($(".content").eq(index).css("height") == "274px") {
						$(".content").eq(index).animate({
							height : '80px'
						}, 600);
						$(".content .fy .on").eq(index).css("transform",
								"rotate(0deg)");
					} else {
						$(".content").eq(index).animate({
							height : '274px'
						}, 600);
						$(".content .fy .on").eq(index).css("transform",
								"rotate(180deg)");
					}
					for (var i = 0; i < count; i++) {
						if (i == index) {
							continue;
						} else {
							$(".content").eq(i).animate({
								height : '80px'
							}, 600);
							$(".content .fy .on").eq(i).css("transform",
									"rotate(0deg)");
						}
					}
				});
})
function Addyucunk(ahref, money) {
	var count = $(".subtotal").length;
	if (ahref.innerHTML.trim() == '开启预存款抵扣') {
		for (var i = 0; i < count; i++) {
			if (money > 0) {
				var yj = parseFloat($(".yjiao").eq(i).text().replace("￥", ""));
				if (money - yj > 0) {
					$(".yjiao").eq(i).html("￥0.0");
					$(".yuck").eq(i).html("￥" + yj);
					money -= yj;
				} else {
					$(".yjiao").eq(i).html("￥" + (yj - money));
					$(".yuck").eq(i).html("￥" + money);
					money = 0;
				}
			}
		}
		ahref.innerHTML = "关闭预存款抵扣";
	} else {
		for (var i = 0; i < count; i++) {
			if (money > 0) {
				var yj = parseFloat($(".yjiao").eq(i).text().replace("￥", ""));
				var yuck = parseFloat($(".yuck").eq(i).text().replace("￥", ""));
				$(".yuck").eq(i).html("￥0.0");
				$(".yjiao").eq(i).html("￥" + (yj + yuck));
			}
		}
		ahref.innerHTML = "开启预存款抵扣";
	}
}
</script>
<style>
h3 {
    font-weight: normal!important;
    font-size: 16px!important;
}
</style>
</head>
<body>
	<div id="content">
		<div id="banner">
			<div style="background: url(/wyht/img/qtimg/b2.jpg)"></div>
		</div>

		<div class="nav">
			<div class="wrap">
				<div class="crumbs">
					<a href="index.html">首页</a> <a class="on">业务领域</a> <a class="on">缴费服务</a>
				</div>
			</div>
		</div>
	</div>

	<div class="zong layui-form">
		<h2>未缴账单</h2>
		<div class="weijiao">
			<table class="table table-cost">
				<thead>
					<tr>
						<th style="text-align:center"><input type="checkbox" class="quan" lay-filter="allChoose"></th>
						<th>类型</th>
						<th>房屋/车位/车辆</th>
						<th>费用名称</th>
						<th>开始时间/结束时间</th>
						<th>单价</th>
						<th>数量</th>
						<th>应收金额</th>
						<th>优惠</th>
						<th>滞纳金</th>
						<th>预存款抵扣</th>
						<th>应缴金额</th>
						<th>备注</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${!empty page.list[0].tollid }">
					<c:forEach items="${page.list }" var="jt">
						<tr>
							<td><input type="checkbox"
								class="dan ybill" lay-filter="itemChoose" name="tolids" value="${jt.tollid }"></td>
							<td><c:choose>
									<c:when test="${jt.ztype==1 }">房屋</c:when>
									<c:when test="${jt.ztype==2 }">车位</c:when>
									<c:when test="${jt.ztype==3 }">车辆</c:when>
									<c:when test="${jt.ztype==4 }">自定义金额</c:when>
								</c:choose></td>
							<td><c:choose>
										<c:when test="${jt.housefan.hnum!=null}">
													${jt.housefan.hnum}
											</c:when>
											<c:when test="${jt.parkingspace.parkid!=null}">
													${jt.parkingspace.pnum }
											</c:when>
											<c:when test="${jt.vehiclemanager.carnum!=null}">
													${jt.vehiclemanager.carnum }
											</c:when>
											<c:when test="${jt.temporary.owners.oid!=null}">
													${jt.temporary.owners.owername}
											</c:when>
										</c:choose></td>
							<td>${jt.priceproject.pricename }${jt.temporary.chargname }</td>
							<td>${jt.simsdate }/${jt.simedate }</td>
							<td>${jt.priceing==null?'':'￥'} ${(jt.priceing==null)?'--':jt.priceing }</td>
							<td>${jt.count==null?'--':jt.count }</td>
							<td class="subtotal"><b class="c-red">￥${jt.subtotal }</b></td>
							<td class="youhui">￥${jt.youfei }<a href="#youhui"
								data-toggle="modal" class="m-l-10 yh"
								title="设置优惠"><i class="fa fa-edit"></i></a></td>
							<td class="zhina">￥${jt.zhina }<a href="#zhinajin"
								data-toggle="modal" class="m-l-10 znj" title="设置滞纳金"><i
									class="fa fa-edit"></i></a>
							</td>
							<td class="yuck">￥${jt.yuck }</td>
							<td class="yjiao">￥${jt.subtotal-jt.youfei+jt.zhina-jt.yuck }</td>
							<td>${jt.remark }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="13">
						<c:if test="${!empty predcount}">
							<div class="pull-left">
								<a class="btn btn-success btn-sm start" style="height:30px;font-size: 14px;" onclick="Addyucunk(this,'${predcount}')"> 
								开启预存款抵扣 </a>
							</div>
						</c:if>
							<div class="pull-right">
								<button type="button" data-toggle="modal" id="shoufeis"
                                    data-target="#shoufei" style="width:80px;height:30px;font-size: 14px;"
                                    class="btn btn-xs btn-success">
                                <i class="fa fa-cc-visa"></i> 收款</button>
							</div>
							<div class="pull-right p-t-10 m-r-10 none" style="margin-top:8px;">
								<span class="m-l-15"> 应收合计： <em class="c-red ys"></em></span>
							</div>
						</td>
					</tr>
					</c:when>
					 <c:otherwise>
                        	<tr><td colspan='16' style="text-align:center;"><h3>暂无未缴信息</h3></td></tr>
                        </c:otherwise>
                     </c:choose>
				</tbody>
			</table>
		</div>
	</div>
	<div class="zong">
		<h2>历史账单</h2>
		<div class="weijiao">
			<c:choose>
				<c:when test="${!empty unpaid }">
					<c:forEach items="${unpaid }" var="unpai">
						<div class="content">
							<div>
								<span>${unpai.undate.date }</span>
								<div class="date">${unpai.zfyms }</div>
							</div>
							<div class="fy">
								<h3>
									收费状态：
									<c:choose>
										<c:when test="${unpai.status==0 }">已缴</c:when>
										<c:when test="${unpai.status==1 }">退费</c:when>
										<c:when test="${unpai.status==2 }">已退</c:when>
									</c:choose>
								</h3>
								<h3>
									费用：<strong>${unpai.totalMoney }</strong>
								</h3>
								<h3>
									缴费方式：
									<c:choose>
										<c:when test="${unpai.means==1 }">现金</c:when>
										<c:when test="${unpai.means==2 }">支票</c:when>
										<c:when test="${unpai.means==3 }">银行转账</c:when>
										<c:when test="${unpai.means==4 }">pos机刷卡</c:when>
										<c:when test="${unpai.means==5 }">支付宝直接转账</c:when>
										<c:when test="${unpai.means==6 }">微信直接转账<</c:when>
									</c:choose>
								</h3>
								<div class="xiangq">
									详情
									<div class="on"></div>
								</div>
							</div>
							<div class="details">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th class="table_th printdy">房号/车位号/车牌/住户</th>
											<th class="table_th printdy">收费项目</th>
											<th class="table_th printdy">开始时间</th>
											<th class="table_th printdy">结束时间</th>
											<th class="table_th printdy">起度</th>
											<th class="table_th printdy">止度</th>
											<th class="table_th printdy">数量</th>
											<th class="table_th printdy">单价</th>
											<th class="table_th printdy">金额</th>
											<th class="table_th printdy">优惠</th>
											<th class="table_th printdy">滞纳金</th>
											<th class="table_th printdy">预存款抵扣</th>
											<th class="table_th printdy">应收合计</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${unpai.tolllist }" var="toll">
											<tr>
												<td><c:choose>
											<c:when test="${toll.housefan.hnum!=null}">
													${toll.housefan.hnum}
											</c:when>
											<c:when test="${toll.parkingspace.parkid!=null}">
													${toll.parkingspace.pnum }
											</c:when>
											<c:when test="${toll.vehiclemanager.carnum!=null}">
													${toll.vehiclemanager.carnum }
											</c:when>
											<c:when test="${toll.temporary.owners.oid!=null}">
													${toll.temporary.owners.owername}
											</c:when>
										</c:choose></td>
												<td><c:if test="${toll.temId!=null }">
													${toll.temporary.chargname}
								</c:if>
													<c:if test="${toll.temId==null }">
														${toll.priceproject.pricename }
														</c:if>-<c:if test="${unpai.status==0 }">已缴</c:if> <c:if
														test="${unpai.status==1 }">退费</c:if> <c:if
														test="${unpai.status==2 }">已退</c:if></td>
												<td>${toll.simsdate }</td>
												<td>${toll.simedate==''?'--':toll.simedate }</td>
												<td>${toll.tablemanager.tabStartnum==null?'--':toll.tablemanager.tabStartnum }</td>
												<td>${toll.tablemanager.tabEndnum==null?'--':toll.tablemanager.tabEndnum }</td>
												<td>${toll.count==null?'--':toll.count }</td>
												<td>${toll.priceing==null?'--':toll.priceing }</td>
												<td>${toll.subtotal }</td>
												<td>${toll.youfei }</td>
												<td>${toll.zhina }</td>
												<td>${toll.yuck }</td>
												<td class="total">${toll.subtotal }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div
						style="text-align: center; font-size: 26px; font-weight: 600px; margin: 20px auto; color: #746969;">
						暂无已缴账单</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="modal fade " id="shoufei" role="dialog" aria-hidden="true">
	<form method="post" action="/wyht/qt/payment">
    <div class="modal-dialog modal-lg" style="margin-top: 5%;">
        <div class="modal-content" >
            <div class="modal-header"><h4 class="modal-title">收款</h4></div>
            <div class="modal-body">
                <div class="row p-10">
                    <div class="col-sm-3">
                    <label for="">  应收合计:</label>
                    <span class="c-red">￥<input class="noborder" name="totalMoney"></span></div>
                    <div class="col-sm-3"><label for="">优惠:</label>
                    <span class="c-green">-￥<input class="noborder" name="totalYh"></span></div>
                    <div class="col-sm-3"><label for="">
                        滞纳金:
                    </label><span class="c-red">+￥<input class="noborder" name="totalZnj"></span></div>
                    <div class="col-sm-3"><label for="">
                        预存款抵扣:
                    </label><span class="c-green">-￥<input class="noborder" name="totalYc"></span></div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-2 text-left"><label for="">
                        应缴合计:
                    </label></div>
                    <div class="col-sm-8 c-red">￥<input class="noborder" name="totalYjmoney"></div>
                </div>
                	<div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">姓名:</label>
                    </div>
                    <div class="col-sm-6">
                  		<input type="hidden" name="oid" value="${sessionScope.owners.oid }" readonly class="form-control">
                    	<input type="text" value="${sessionScope.owners.owername }" readonly class="form-control">
                    </div>
                </div><div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">手机号:</label>
                    </div>
                    <div class="col-sm-6">
                    	<input type="text" value="${sessionScope.owners.ownerphone }" readonly class="form-control">
                    </div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for=""> 备注:</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" name="remark" class="form-control">
                    </div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for=""> 收款方式:</label>
                    </div>
                    <div class="col-sm-6">
                    <select name="means" id="" class="form-control">
                        <option value="0">请选择收款方式</option>
                        <option value="1">线下支付-现金</option>
                        <option value="2">线下支付-支票</option>
                        <option value="3">线下支付-银行转账</option>
                        <option value="4">线下支付-pos机刷卡</option>
                        <option value="5">线下支付-支付宝直接转账</option>
                        <option value="6">线下支付-微信直接转账</option>
                        <option value="7">其他支付方式</option>
                    </select></div>
                </div>
                <div class="chidden"></div>
                <input type="hidden" name="disid" value="${page.list[0].disid }" />
                <div class="xianjins hide">
                	<div class="row p-10 cash">
                    <div class="col-sm-2 text-left">
                    <label for="">
                        	实收金额:
                    </label></div>
                    <div class="col-sm-6">
                    	<input type="text" class="form-control xjsubtotal">
                        <div class="m-t-10">
                           	 仅做找零计算，可不填。
                        </div>
                    </div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">找零: </label>
                    </div>
                    <div class="col-sm-6">
                        <div class="m-t-10 zling"></div>
                    </div>
                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" id="qrbill" class="btn btn-primary">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
</html>