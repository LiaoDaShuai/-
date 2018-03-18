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
<style>
td {
	text-align: center
}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
			<a href="/wyht/toll/selectyijiluAll"><div class="navkuai">按缴费记录</div></a>
			<a href="/wyht/toll/unpaidXiangAll"><div class="navkuai">按缴费明细</div></a>
			<a href="/wyht/toll/recyclebin">
				<div class="navkuai" id="del" style="border-bottom: 2px solid #7a7a7a;">回收站</div>
			</a>
		</div>
		<form action="/wyht/toll/recyclebin" name="f1" method="get">
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
						<input type="text" class="form-control-static col-sm-7"
							id="advanced" value="${mohuselect.keyword }" placeholder="请输入住户/手机号">
					</div>
				</div>
				<div class="row p-t-10">
					<div class="form-group col-sm-4">
						<div>
							<!-- 存放分页的数据 -->
							<input type="hidden" name="pageNum" value=""> <input
								type="hidden" name="pageSize" value="${page2.size }">
						</div>
						<button class="col-sm-3 btn btn-success"
							style="margin: 0 5px 0 10px;">
							<i class="fa fa-search"></i> 搜索
						</button>
						<button class="col-sm-3 btn btn-default"
							style="margin-right: 5px;">清空</button>
						<button class="col-sm-3 btn btn-default">关闭</button>
					</div>
				</div>
			</div>
			<div style="margin: 10px 0 5px 15px;">
				<div class="pull-left">
					<button disabled class="btn btn-success">批量恢复</button>
				</div>
				<div class="pull-right">
					<a href="javascript:" class="pull-left gaoji"> 高级搜索</a>
					<div class="suotext">
						<input type="text" name="keyword" id="ordinary"
							value="${mohuselect.keyword }" class="wentext"
							placeholder="请输入住户/手机号">
						<button class="btn-list list-setting">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<a href="" class="btn-list" target="_blank" title="帮助中心"> <i
						class="fa fa-question"></i></a>
				</div>
			</div>
		</form>
		<div class="layui-form table-responsive col-sm-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
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
						<c:when test="${!empty page.list!='' }">
							<c:forEach items="${page.list }" var="del">
								<tr>
									<td><input type="checkbox" name="unpaid"
										value="${del.unpaid }" lay-filter="itemChoose" class="dan"></td>
									<td>${del.owners.owername }</td>
									<td>${del.owners.ownerphone }</td>
									<td class="c-red">￥<span class="totalMoney">${del.totalMoney }</span></td>
									<td class="c-red">￥<span class="totalZnj">${del.totalZnj  }</span></td>
									<td class="c-red">￥<span class="totalYc">${del.totalYc }</span></td>
									<td class="c-red">￥ <span class="totalYh">${del.totalYh }</span>
									<td class="c-red">￥ <span class="totalYjmoney">${del.totalYjmoney }</span>
									<td>${del.zfdate }</td>
									<td><c:choose>
											<c:when test="${del.status==0 }">已缴</c:when>
											<c:when test="${del.status==1 }">退费</c:when>
											<c:when test="${del.status==2 }">已退</c:when>
										</c:choose></td>
									<td>${del.remark }</td>
									<td><button class="btn huifu" id="${del.unpaid }">恢复</button></td>
								</tr>
							</c:forEach>
							<tr>
								<td>小计：</td>
								<td colspan="2"></td>
								<td class="c-red totalMoneyes"></td>
								<td class="c-red totalZnjes"></td>
								<td class="c-red totalYces"></td>
								<td class="c-red totalYhes"></td>
								<td class="c-red totalYjmoneyes"></td>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>合计：</td>
								<td colspan="2"></td>
								<td class="c-red totalMoneyes"></td>
								<td class="c-red totalZnjes"></td>
								<td class="c-red totalYces"></td>
								<td class="c-red totalYhes"></td>
								<td class="c-red totalYjmoneyes"></td>
								<td colspan="4"></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan='16' style="text-align: center;"><h3>暂无删除记录</h3></td>
							</tr>
						</c:otherwise>
					</c:choose>
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
<script>
	//日期时间选择器
	layui.use('laydate', function(){
  var laydate = layui.laydate;
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
		var subcount = $(".totalMoney").length;
		var zongsub = 0, zongyou = 0, zongzhi = 0, zongyc = 0, zongzong = 0;
		for (var i = 0; i < subcount; i++) {
			zongsub += parseFloat($(".totalMoney").eq(i).text());
			zongyc += parseFloat($(".totalYc").eq(i).text());
			zongyou += parseFloat($(".totalYh").eq(i).text());
			zongzhi += parseFloat($(".totalZnj").eq(i).text());
			zongzong += parseFloat($(".totalYjmoney").eq(i).text());
		}
		$(".totalMoneyes").eq(0).html("￥" + zongsub.toFixed(2));
		$(".totalYces").eq(0).html("￥" + zongyc.toFixed(2));
		$(".totalYhes").eq(0).html("￥" + zongyou.toFixed(2));
		$(".totalZnjes").eq(0).html("￥" + zongzhi.toFixed(2));
		$(".totalYjmoneyes").eq(0).html("￥" + zongzong.toFixed(2));
		$(".totalMoneyes").eq(1).html("￥" + zongsub);
		$(".totalYces").eq(1).html("￥" + zongyc);
		$(".totalYhes").eq(1).html("￥" + zongyou);
		$(".totalZnjes").eq(1).html("￥" + zongzhi);
		$(".totalYjmoneyes").eq(1).html("￥" + zongzong);

		$(".huifu").click(function() {
			var unpaid = this.id;
			swal({
				text : "你确定要恢复选择的记录吗?",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#AEDEF4",
				cancelButtonText : "取消",
				confirmButtonText : "确定",
				closeOnConfirm : false,
				closeOnCancel : true
			}).then(function(isConfirm) {
				if (isConfirm) {
					tollController.huifeijilv(unpaid, function(data) {
						if (data > 0) {
							swal({
								text : "恢复成功",
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
	})
</script>
</body>
</html>