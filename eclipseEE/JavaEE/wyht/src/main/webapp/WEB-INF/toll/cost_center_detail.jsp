<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<!-- dwr异步框架生成的js -->
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script>
<script src="/wyht/js/toll/cost_center_detail.js"></script>
<style>
table {
	border: 1px solid #e0e0e0;
}

th, td {
	border-bottom: 1px solid #E0E0E0;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
			<a href="cost_center_detail.jsp">
				<div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">收银台</div>
			</a> 
			<c:choose>
				<c:when test="${isower }"><a href="/wyht/toll/tollDetail/${page.list[0].ownerlist[0].oid }">
					<div class="navkuai">历史缴费</div>
				</a></c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${page.list[0].ztype==1 }"><a href="/wyht/toll/tollDetail/${page.list[0].ztype}/${page.list[0].housefan.fanid }">
						<div class="navkuai">历史缴费</div></a></c:when>
						<c:when test="${page.list[0].ztype==2 }"><a href="/wyht/toll/tollDetail/${page.list[0].ztype}/${page.list[0].parkingspace.parkid }">
						<div class="navkuai">历史缴费</div></a></c:when>
						<c:when test="${page.list[0].ztype==3 }"><a href="/wyht/toll/tollDetail/${page.list[0].ztype}/${page.list[0].vehiclemanager.vehicid }">
						<div class="navkuai">历史缴费</div></a></c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row small m-t-20">
			<div class="col-sm-12">
				<i class="fa fa-question-circle"></i> 功能说明：根据房号（或车位号、车牌号）搜索未缴费用后，
				可选择房屋（或车位号、车牌号）的相关住户，查看相关住户的未缴费用，并对费用进行收取。
			</div>
		</div>

		<div class="layui-form table-responsive cost-center">
			<table class="table table-cost">
				<thead>
					<tr class="billtitle">
						<th colspan="13">
							<div class="p-t-5 pull-left">
								<c:choose>
									<c:when test="${isower }">
										<h4>
											<span style="margin-right:10px;">小区: ${page.list[0].district.dname }</span>
											<span style="margin-right:10px;">住户姓名: ${page.list[0].ownerlist[0].owername }</span> 
											<span class="">手机号: ${page.list[0].ownerlist[0].ownerphone }</span>
											<span><c:if test="${!empty predcount}">
											<a href="/wyht/toll/selectPredAll" class="btn btn-success">查看预存款</a></c:if></span>
										</h4>
									</c:when>
									<c:otherwise>
										<select class="form-control-static xiangower" lay-filter="xiangower">
											<option value="0">--相关用户--</option>
											<c:forEach items="${page.list[0].ownerlist }" var="jj">
												<option value="${jj.oid }">${jj.owername }  ${jj.ownerphone }</option>
											</c:forEach>
										</select>
									</c:otherwise>
								</c:choose>
								<input type="hidden" name="disid" value=${page.list[0].district.disid }>
							</div>
							<div class="pull-right p-t-10">
							<c:if test="${!empty predcount}">
							 <a class="btn btn-default btn-sm start" onclick="Addyucunk(this,'${predcount}')"> 
								开启预存款抵扣 </a>
							</c:if>
								<a data-toggle="modal" href="#linshi"
									class=" btn btn-default btn-sm"> 添加临时收费 </a>
									<a data-toggle="modal" href="#jiaofei-date"
									class=" btn btn-default btn-sm "> 交费到指定时间 </a>
									<c:if test="${isower }">
										<a data-toggle="modal" href="#print_template"
										class="btn btn-default btn-sm"> 打印 </a>
									</c:if>
									<a href="/cost/cost_center.jsp" class="btn btn-default btn-sm">
									返回 </a>
							</div>
						</th>
					</tr>
					<tr>
						<th width="40px"><input type="checkbox" class="quan" lay-filter="allChoose"></th>
						<th>类型</th>
						<th>房屋/车位/车辆</th>
						<th>费用名称</th>
						<th>开始时间/结束时间</th>
						<th>单价</th>
						<th>数量</th>
						<th>应收金额</th>
						<th>优惠</th>
						<th>滞纳金</th>
						<c:if test="${isower }"><th>预存款抵扣</th></c:if>
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
							<td>
									<c:choose>
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
										</c:choose>
                           		</td>
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
							<c:if test="${isower }">
								<td class="yuck">￥${jt.yuck }</td>
							</c:if>
							<td class="yjiao">￥${jt.subtotal-jt.youfei+jt.zhina-jt.yuck }</td>
							<td>${jt.remark }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="13">
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
			 <form action="#" name="f1" method="post">
				<div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
                </div>
             </form>
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
	<div class="modal fade " id="shoufei" role="dialog" aria-hidden="true">
	<form method="post" action="/wyht/toll/payment">
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
                <c:choose>
                <c:when test="${!empty page.list[0].ownerlist }">
                <div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">缴费人:</label>
                    </div>
                    <div class="col-sm-6">
                        <select name="oid" class="form-control ">
                        	<option value="0">--请选择缴费人--</option>
                            <c:forEach items="${page.list[0].ownerlist }" var="jj">
								<option value="${jj.oid }">${jj.owername }  ${jj.ownerphone }</option>
							</c:forEach>
                        </select>
                    </div>
                </div>
                </c:when><c:otherwise>
                	<div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">姓名:</label>
                    </div>
                    <div class="col-sm-6">
                    	<input type="text" name="onames" class="form-control">
                    </div>
                </div><div class="row p-10">
                    <div class="col-sm-2 text-left">
                        <label for="">手机号:</label>
                    </div>
                    <div class="col-sm-6">
                    	<input type="text" name="ophone" class="form-control">
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
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
            	<input type="hidden" name="undate" >
                <button type="button" id="qrbill" onclick="shoukuan(this.form,'${isower}')" class="btn btn-primary">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
    </form>
</div>
	<div class="modal fade" id="linshi" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style=" margin-top: 4%">
			<form class="add_form" method="get" action="/wyht/toll/tmpAdd">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">添加临时收费</h4>
					</div>
					<div class="modal-body">
						<div class="row  p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 收费类型 </label>
							</div>
							<div class="col-sm-6">
								<select name="ztype" class="form-control form-control-k" onchange="chargeType('${page.list[0].district.dname }')">
									<c:choose>
										<c:when test="${isower }">
											<option value="">--请选择类型--</option>
											<option value="1">房屋相关</option>
											<option value="2">车位相关</option>
											<option value="3">车辆相关</option>
											<option value="4">自定义金额</option>
										</c:when>
										<c:otherwise>
											<c:if test="${page.list[0].ztype==1 }">
												<option value="1">房屋相关</option>
											</c:if>
											<c:if test="${page.list[0].ztype==2 }">
												<option value="2">车位相关</option>
											</c:if>
											<c:if test="${page.list[0].ztype==3 }">
												<option value="3">车辆相关</option>
											</c:if>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>
						<c:if test="${isower }">
						<div class="row p-10 fantype">
							<div class="col-sm-3 p-t-10">
								<label class="labtype">选择房屋</label>
							</div>
							<div class="col-sm-6">
								<select name="fanId" id="xuanzeType"
									class="form-control">
									<option value="0" class="xuanze">--请选择房屋--</option>
								</select>
							</div>
						</div>
						</c:if>
						<div class="row p-10 feitype none">
							<div class="col-sm-3 p-t-10">
								<label for=""> 费用名称 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="chargname" value="">
							</div>
						</div>
						<div class="row p-10 pricetype">
							<div class="col-sm-3 p-t-10">
								<label for=""> 收费项目 </label>
							</div>
							<div class="col-sm-6 ">
								<select name="priceid" id="project_id"
									class="form-control yes">
									<option value="0">--请选择收费项目--</option>
								</select>
							</div>
						</div>
						<div class="row p-10 chargtype">
							<div class="col-sm-3 p-t-10">
								<label for=""> 收费标准 </label>
							</div>
							<div class="col-sm-6">
								<select name="chargid" id="biaozhun"
									class="form-control">
									<option value="0">--请选择收费标准--</option>
								</select>
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 单价 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" name="priceing" class="form-control">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 数量 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" name="count" class="form-control">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 金额 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" name="subtotal" class="form-control">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 开始时间 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control " name="sdate"
									readonly value="${page.list[0].nowdate }" id="startdata">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 结束时间 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" readonly
									name="edate" value="${page.list[0].nowdate}" id="enddata">
							</div>
						</div>
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 备注 </label>
							</div>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="remark">
							</div>
						</div>
						<div class="linshihidd">
							<input type="hidden" name="disid" class="xq_id" value="${page.list[0].district.disid }"> 
							<input type="hidden" name="flag" value="${isower }" />
							<input type="hidden" name="oid" value="${page.list[0].ownerlist[0].oid }" />
						</div>
					</div>
					<div class="modal-footer linshij">
						<button type="button" onclick="isaddlingshi(this.form)" class="btn btn-primary">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" id="jiaofei-date" role="dialog"
		aria-hidden="true" >
		<div class="modal-dialog" style="margin-top: 8%">
			<div class="modal-content">
				<div class="modal-header">
					<h4>交费到指定时间</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3">
							<label>选择时间</label>
						</div>
						<div class="col-sm-6">
							<input type="text" readonly id="zhidata" class="form-control">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success zhidingjiao">确定</button>
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" id="print_template" role="dialog" aria-hidden="true" style="margin-top: 8%">
		<form action="/wyht/toll/dayinjiao" name="jday" target="_blank" method="post">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>选择打印模板</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-3">
							<label>模板</label>
						</div>
						<div class="col-sm-6">
							<select class="form-control">
								<option>启源交费通知单(默认)</option>
							</select>
						</div>
						<div class="jiaotoll"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success jiaofei" >确定</button>
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
			var flags=${isower};
			if(flags==true){
				$(".fantype").show();
			}else{
				$(".fantype").hide();
				$("#xuanzeType").attr("disabled",true);
				$("input[name=chargname]").attr("disabled",true);
				var ztype="${page.list[0].ztype==null?'':page.list[0].ztype}";
				if(ztype==1){
					$(".linshihidd").append("<input type='hidden' name='fanId' value='${page.list[0].fanId==null?0:page.list[0].fanId}'>");
				}else if(ztype==2){
 					$(".linshihidd").append("<input type='hidden' name='parkId' value='${page.list[0].parkId==null?0:page.list[0].parkId}'>");
 				}else if(ztype==3){
					$(".linshihidd").append("<input type='hidden' name='vehicleId' value='${page.list[0].vehicleId==null?0:page.list[0].vehicleId}'>");
				}
			}
	});
	
</script>
</body>
</html>