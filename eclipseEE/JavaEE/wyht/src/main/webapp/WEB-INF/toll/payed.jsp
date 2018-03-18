<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script> 
<script src="/wyht/dwr/interface/datacenterController.js"></script>   
<style>
table a{
color:#2277da!important;
}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
			<a href="/wyht/toll/selectyijiluAll">
				<div class="navkuai" style="border-bottom: 2px solid #7a7a7a">按缴费记录</div>
			</a> 
			<a href="/wyht/toll/unpaidXiangAll">
			<div class="navkuai">按缴费明细</div></a> 
			<a href="/wyht/toll/recyclebin"><div class="navkuai">回收站</div></a>
		</div>
		<form action="/wyht/toll/selectyijiluAll" method="post" name="f1">
			<div class="col-sm-12 toggaoji"
				style="border-top: 0; border-bottom: 1px solid #E0E0E0">
				<div class="row p-t-10">
					<div class="form-group col-sm-4">
						<label for class="col-sm-3" style="margin-top: 8px;">小区：</label> <select
							class="form-control-static col-sm-7" name="disid">
							<option value="">---请选择小区---</option>
						</select>
					</div>
					<div class="form-group col-sm-4">
						<label for class="col-sm-4" style="margin-top: 8px;">收费款状态：</label>
						<select class="form-control-static col-sm-7" name="status">
							<option value="">---请选择状态---</option>
							<option value="0">已收</option>
							<option value="1">已退</option>
							<option value="2">退费</option>
						</select>
					</div>
					<div class="form-group col-sm-4">
						<label class="col-sm-3" style="margin-top: 8px;">收款方式：</label> <select
							class="form-control-static col-sm-7" name="unpaidtype">
							<option value="">---请选择收款方式---</option>
							<option value="0">预存款自动抵扣</option>
							<option value="1">线下支付-现金</option>
							<option value="2">线下支付-支票</option>
							<option value="3">线下支付-银行转账</option>
							<option value="4">线下支付-pos机刷卡</option>
							<option value="5">线下支付-支付宝直接转账</option>
							<option value="6">线下支付-微信直接转账</option>
							<option value="7">其他支付方式</option>
							<option value="8">线上支付-微信公众号支付</option>
							<option value="9">线上支付-支付宝物业缴费</option>
							<option value="10">线上支付-支付宝生活号支付</option>
							<option value="11">线上支付-支付宝扫码支付</option>
						</select>
					</div>
				</div>
				<div class="row p-t-10">
					<div class="form-group col-sm-4">
						<label for class="col-sm-3" style="margin-top: 8px;">支付起始时间：</label>
						<input type="text" class="form-control-static col-sm-7"
							name="sdate" value="${mohuselect.simsdate }" readonly
							id="startdata" placeholder="请选择日期">
					</div>
					<div class="form-group col-sm-4">
						<label for class="col-sm-4" style="margin-top: 8px;">支付截止时间：</label>
						<input type="text" class="form-control-static col-sm-7"
							name="edate" value="${mohuselect.simedate }" readonly
							id="enddata" placeholder="请选择日期">
					</div>
					<div class="form-group col-sm-4">
						<label for class="col-sm-3 " style="margin-top: 8px;">关键字：</label>
						<input type="text" class="form-control-static col-sm-7" name="keyword"
							id="advanced" value="${mohuselect.keyword }" placeholder="请输入住户/手机号">
					</div>
					</div>
					<div class="row p-t-10">
					<div class="form-group col-sm-3">
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
			<div style="margin: 10px 0 5px 15px;">
				<button disabled id="del" class="btn btn-success">批量删除</button>
<!-- 				<button class="btn btn-success" data-toggle="modal" -->
<!-- 					data-target="#daoru">导入已缴费用</button> -->
				<div class="pull-right">
					<a href="javascript:" class="pull-left gaoji"> 高级搜索</a>
					<div class="suotext">
						<input type="text" name="keyword" id="ordinary" value="${mohuselect.keyword }" class="wentext"
							placeholder="请输入关键字">
						<button type="submit" class="btn-list list-setting">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<a href="" class="btn-list"
						target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
				</div>
				<div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
                </div>
			</div>
		</form>
		<div class="layui-form table-responsive col-sm-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="padding-left: 15px;"><input type="checkbox" class="quan" lay-filter="allChoose"></th>
						<th>住户</th>
						<th>手机号</th>
						<th>应收金额</th>
						<th>优惠</th>
						<th>滞纳金</th>
						<th>预存款抵扣</th>
						<th>实收合计</th>
						<th>支付时间</th>
						<th>状态</th>
						<th>缴费备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${!empty page.list}">
					<c:forEach items="${page.list }" var="yj">
						<tr>
							<td><input type="checkbox" lay-filter="itemChoose" class="dan" id="${yj.unpaid }"></td>
							<td><c:choose>
									<c:when test="${(yj.oid!=null)}">${yj.owners.owername }</c:when>
									<c:otherwise>${yj.onames }</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${(yj.oid!=null)}">${yj.owners.ownerphone }</c:when>
									<c:otherwise>${yj.ophone }</c:otherwise>
								</c:choose></td>
							<td class="c-red totalMoney">￥ ${yj.totalMoney }</td>
							<td class="c-red totalYh">￥ ${yj.totalYh }</td>
							<td class="c-red totalZnj">￥ ${yj.totalZnj }</td>
							<td class="c-red totalYc">￥ ${yj.totalYc }</td>
							<td class="c-red totalYs">￥ ${yj.totalMoney-yj.totalYh+yj.totalZnj-yj.totalYc }</td>
							<td>${yj.zfdate }</td>
							<td><c:choose>
									<c:when test="${yj.status==0 }">已缴</c:when>
									<c:when test="${yj.status==1 }">退费</c:when>
									<c:when test="${yj.status==2 }">已退</c:when>
								</c:choose></td>
							<td>${yj.remark }</td>
							<td>
							<c:if test="${yj.status==1 }">
							<a href="yituiunpaid/${yj.unpaid }">查看</a>
							</c:if> 
							<c:if test="${yj.status!=1 }">
								<a href="editunpaid/${yj.unpaid }">查看</a>
							</c:if>
							<a data-toggle="modal" onClick="dayin('${yj.unpaid}')" class="onClickhand" style="margin-top: -3px;" data-target="#print_template" >打印</a> 
							<c:if test="${yj.status!=1 }">
								<a data-toggle="modal" data-target="#modalWider" class="onClickhand tuiqian" id="up${yj.unpaid }" style="margin-top: -3px;" >退款
								</a>
							</c:if> 
							<a href="javascrpit:;" class="delupid" id="${yj.unpaid }">删除</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3">小计：</td>
						<td class="c-red yjzong"></td>
						<td class="c-red yhzong"></td>
						<td class="c-red znzong"></td>
						<td class="c-red yczong"></td>
						<td class="c-red sszong" colspan="5"></td>
					</tr>
					<tr>
						<td colspan="7">合计：</td>
						<td class="heji c-red"></td>
					</tr>
					</c:when>
				<c:otherwise>
                        	<tr><td colspan='16' style="text-align:center;"><h3>暂无缴费记录</h3></td></tr>
                </c:otherwise>
                </c:choose>
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

	<div class="modal fade" id="print_template" tabindex="-1" role="dialog" aria-hidden="true">
		<form method="post" action="/wyht/toll/dayin" target="_blank">
			<div class="modal-dialog" style="margin-top: 8%;">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">选择打印模板</h4>
					</div>
					<div class="modal-body">
						<div class="row p-10">
							<div class="col-sm-3 p-t-10">
								<label for=""> 模板 </label>
							</div>
							<div class="col-sm-6">
								<select name="print_id" class="form-control">
									<option value="">启源缴费收据（默认）</option>
								</select>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="none ids">
							<input name="unpaid" id="tid_dayin" type="hidden" value="">
						</div>
						<button type="submit" id="" class="btn btn-primary">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="modal fade" id="modalWider" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" style="margin-top: 4%;">
		<form action="/wyht/toll/refund" method="post" onsubmit="return issubmit()">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">退款</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4 tuikcss">
							<label for=""> 缴费人： </label><span class="jfr"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 操作员： </label><span class="czy"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 操作日期： </label><span class="cz_time"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 付款方式： </label><span class="pay_type"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 实收金额： </label><span class="c-red yj_money"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 优惠金额： </label><span class="c-green youhui"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 滞纳金额： </label><span class="c-red znj"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 预存款使用金额： </label><span class="c-green yck"></span>
						</div>
						<div class="col-sm-4 tuikcss">
							<label for=""> 收款备注： </label><span class="bz"></span>
						</div>
						<div class="col-sm-12 tuikcss o-hidden">
							<label for="" class="pull-left p-t-10"> 备注： </label>
							<input type="text" class="form-control" name="remark" style="width: calc(100% - 80px)">
						</div>
					</div>
					<div class="row">
						<div class="layui-form table-responsive border">
							<table class="table table-hover">
								<thead>
									<tr>
										<th width="40px"><input type="checkbox" class="quan" lay-filter="allChoose"></th>
										<th>类别</th>
										<th>房号/车位号/车牌</th>
										<th>费用</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>应收金额</th>
										<th>优惠</th>
										<th>滞纳金</th>
										<th>实际金额</th>
									</tr>
								</thead>
								<tbody class="tt"></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="unpaid">
					<button type="submit" id="" class="btn btn-primary">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="daoru" tabindex="-1" role="dialog"
		aria-hidden="true">
		<form method="post" action="/cost/print_sj.jsp" target="_blank">
			<div class="modal-dialog" style="margin-top: 8%;">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">导入已缴费用</h4>
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
								<i class="fa fa-warning text-danger"></i> 如何导入已缴费用
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="none ids">
							<input name="tid" id="tid" type="hidden" value="34536">
						</div>
						<button type="submit" id="" class="btn btn-primary">导入</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</form>
	</div>
<script>
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	//日期时间选择器
	laydate.render({
		elem : '#startdata',
		type : 'datetime'
	});
	laydate.render({
		elem : '#enddata',
		type : 'datetime'
	})
});
	$(function() {
		 //加载小区的值，高级查询
  		datacenterController.selectAll(function(data){
			var disid="${mohuselect.disid}";
  			for(var i=0;i<data.length;i++){
  	  			if(data[i].disid==disid){
  					$("select[name=disid]").append("<option value=\""+data[i].disid+"\" selected='selected'>"+data[i].dname+"</option>");
  	  			}else{
  	  			    $("select[name=disid]").append("<option value=\""+data[i].disid+"\">"+data[i].dname+"</option>");
  	  	  		}
  	  		}
  		});
  		if("${mohuselect.status}"!="" ){
			$("select[name=status]").val("${mohuselect.status }");
  	  	}if("${mohuselect.unpaidtype}"!=""){
  	  		$("select[name=unpaidtype]").val("${mohuselect.unpaidtype }");
  	  	}
  		var count = $(".totalMoney").length;
		var zongsub = 0, zongyou = 0, zongzhi = 0, zongyu = 0, zongyin = 0;
		for (var i = 0; i < count; i++) {
			zongsub += parseFloat($(".totalMoney").eq(i).text().replace("￥ ",
					""));
			zongyou += parseFloat($(".totalYh").eq(i).text().replace("￥ ", ""));
			zongzhi += parseFloat($(".totalZnj").eq(i).text().replace("￥ ", ""));
			zongyu += parseFloat($(".totalYc").eq(i).text().replace("￥ ", ""));
			zongyin += parseFloat($(".totalYs").eq(i).text().replace("￥ ", ""));
		}
		$(".yjzong").html("￥ " + zongsub.toFixed(2));
		$(".yhzong").html("￥ " + zongyou.toFixed(2));
		$(".znzong").html("￥ " + zongzhi.toFixed(2));
		$(".yczong").html("￥ " + zongyu.toFixed(2));
		$(".sszong").html("￥ " + zongyin.toFixed(2));
		$(".heji").html("￥ " + zongyin + " 元");

		$(".delupid").click(function() {
			var unpaid = this.id;
			swal({
				text : "你确定要删除选择的记录吗?",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#AEDEF4",
				cancelButtonText : "取消",
				confirmButtonText : "确定",
				closeOnConfirm : false,
				closeOnCancel : true
			}).then(function(isConfirm) {
				if (isConfirm) {
					tollController.UnpaidDel(unpaid,function(data){
						if(data>0){
							swal({
								text : "删除成功",
								type : "success",
								confirmButtonTest : "确认",
								confirmButtonColor : "#4cd964",
								timer : 1500
							});
							setTimeout(function() {
								window.location.reload();
							}, 1500);
						}
					});
				}
			});
		});
		layui.use('form', function(){
			var form = layui.form;
		$(".tuiqian").on("click",function(){
			var upid=this.id;
			upid=upid.replace("up","");
			tollController.yifuunpaid(upid,function(data){
				if(data.oid!=null){
					$('.jfr').text(data.owners.owername);
				}else{
					$('.jfr').text(data.onames);
				}
                $('.czy').text("");
                $('.yj_money').text('￥' + data.totalYjmoney.toFixed(2));
                if(data.means==1){
                	$('.pay_type').text("现金");
                }else if(data.means==2){
                	$('.pay_type').text("支票");
                }else if(data.means==3){
                	$('.pay_type').text("银行转账");
                }else if(data.means==4){
                	$('.pay_type').text("pos机刷卡");
                }else if(data.means==5){
                	$('.pay_type').text("支付宝直接转账");
                }else if(data.means==6){
                	$('.pay_type').text("微信直接转账");
                }
                $('.cz_time').text(data.zfdate);
                $('.youhui').text(data.totalYh.toFixed(2));
                $('.znj').text(data.totalZnj.toFixed(2));
                $('.yck').text(data.totalYc.toFixed(2));
                $('.bz').text(data.remark);
                $('input[name="unpaid"]').val(data.unpaid);
                var html='';
                for(var i=0;i<data.tolllist.length;i++){
                	html += '<tr>';
                    html += '<td><input type="checkbox" lay-filter="itemChoose" class="dan" name="tolids" value="' + data.tolllist[i].tollid + '"></td>';
                    if(data.tolllist[i].ztype==1){
                    	html += '<td>房屋</td>';
                    }else if(data.tolllist[i].ztype==2){
                    	html += '<td>车位</td>';
                    }else if(data.tolllist[i].ztype==3){
                    	html += '<td>车辆</td>';
                    }else if(data.tolllist[i].ztype==4){
                    	html += '<td>自定义金额</td>';
                    }
                    if(data.tolllist[i].fanId!=null){
                    	html += '<td>' + data.tolllist[i].housefan.hnum+ '</td>';
                    }else if(data.tolllist[i].parkId !=null){
                    	html += '<td>' + data.tolllist[i].parkingspace.pnum + '</td>';
                    }else if(data.tolllist[i].vehicleId!=null){
                    	html += '<td>' + data.tolllist[i].vehiclemanager.carnum+ '</td>';
                    }else if(data.tolllist[i].temId!=null){
                        if(data.tolllist[i].temporary.owerId!=null){
                    		html += '<td>' + data.tolllist[i].temporary.owners.owername+ '</td>';
                        }
                    }
					if(data.tolllist[i].priceid!=null){
						html += '<td>' + data.tolllist[i].priceproject.pricename + '</td>';
					}else{
                    	html += '<td>' + data.tolllist[i].temporary.chargname + '</td>';
					}
                    html += '<td>' + data.tolllist[i].simsdate + '</td>';
                    html += '<td>' + data.tolllist[i].simedate + '</td>';
                    html += '<td><span class="c-red">￥' + data.tolllist[i].subtotal.toFixed(2) + '</span></td>';
                    html += '<td><span class="c-green">￥' + data.tolllist[i].youfei.toFixed(2) + '</span></td>';
                    html += '<td><span class="c-green">￥' + data.tolllist[i].zhina.toFixed(2) + '</span></td>';
                    html += '<td><span class="c-red">￥' + (data.tolllist[i].subtotal-data.tolllist[i].youfei+data.tolllist[i].zhina-data.tolllist[i].yuck).toFixed(2) +'</span></td>';
                    html += '</tr>'
                }
                $('.tt').html(html);
                form.render();
			});
		});
		
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
		});
	});
	function issubmit(){
		var len=$("input[name=tolids]:checked").length;
		if(len<1){
			sweetAlert({text:'请勾选要退费的记录',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
		return true;
	}
	function dayin(uid){
		$("#tid_dayin").val(uid);
	}
</script>
</body>
</html>