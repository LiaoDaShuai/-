$(function() {
	layui.use('laydate', function() {
		var laydate = layui.laydate;
		// 执行一个laydate实例
		laydate.render({
			elem : '#startdata' // 指定元素
		});
		laydate.render({
			elem : '#enddata' // 指定元素
		});
		laydate.render({
			elem : '#zhidata'
		});
	})
	layui.use('form', function() {
		var form = layui.form;
		// 全选
		form.on('checkbox(allChoose)', function(data) {
			var child = $(data.elem).parents('table').find(
					'tbody input[type="checkbox"]');
			child.each(function(index, item) {
				item.checked = data.elem.checked;
			});
			form.render('checkbox');
			var sib = $(data.elem).parents('table').find(
					'tbody input[type="checkbox"]:checked').length;
			if (sib == 0) {
				$('#del').attr('disabled', true);
			} else {
				$('#del').attr('disabled', false);
			}
		});
		// 单选
		form.on('checkbox(itemChoose)', function(data) {
			var sib = $(data.elem).parents('table').find(
					'tbody input[type="checkbox"]:checked').length;
			var total = $(data.elem).parents('table').find(
					'tbody input[type="checkbox"]').length;
			if (sib == 0) {
				$('#del').attr('disabled', true);
			} else if (sib == total) {
				$(data.elem).parents('table').find(
						'thead input[type="checkbox"]').prop("checked", true);
				$('#del').attr('disabled', false);
			} else {
				$(data.elem).parents('table').find(
						'thead input[type="checkbox"]').prop("checked", false);
				$('#del').attr('disabled', false);
			}
			form.render();
		});
		form.on('select(xiangower)', function(data) {
			var oid = (data.value);
			if (oid == 0) {
				return;
			} else {
				window.location.href = "/wyht/toll/checkoutower/" + oid;
			}
		});
	});

	$("#shoufeis")
			.on(
					"click",
					function() {
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
	$(".jiaofei").click(
			function() {
				var toll = "";
				var ycount = $(".ybill:checked").length;// 获取选中的复选框有多少长度
				if (ycount < 1) {
					sweetAlert({
						text : '请选择要打印的未缴记录',
						type : 'warning',
						timer : 1500,
						showConfirmButton : false
					});
					return false;
				} else {
					for (var i = 0; i < ycount; i++) {
						toll += "<input type='hidden' name='tolids' value='"
								+ $(".ybill:checked").eq(i).val() + "'>";
					}
					$(".jiaotoll").html(toll);
					$("form[name=jday]").submit();
				}
			})
	$("select[name=means]").change(function() {
		if ($(this).val() == 1) {
			$(".xianjins").removeClass("hide");
			$(".xianjins").slideDown(1000);
		} else {
			$(".xianjins").slideUp(1000);
		}
	});
	$("#project_id").click(
			function() {
				if (this.className == "form-control yes") {
					tollController.selectYajinPrice(function(data) {
						for (var i = 0; i < data.length; i++) {
							$("#project_id").append(
									"<option value='" + data[i].priceid + "'>"
											+ data[i].pricename + "</option>")
						}
					});
					$(this).removeClass("yes");
				}
			});
	$("#project_id").change(
			function() {
				var pid = $(this).val();
				if (pid != 0) {
					$("#biaozhun option[value!='0']").remove();
					tollController.selectChargpid(pid, function(data) {
						for (var i = 0; i < data.length; i++) {
							$("#biaozhun").append(
									"<option value='" + data[i].chargid + "'>"
											+ data[i].chargname + "</option>")
						}
					});
				}
			});
	$("#biaozhun").change(
			function() {
				var cid = $(this).val();
				if (cid != 0) {
					tollController.selectChargid(cid, function(data) {
						$("input[name=priceing]").val(data.pricing.toFixed(2));
						$("input[name=count]").val(0.00);
						$("input[name=subtotal]").val(
								(data.fixedprice == null ? 0 : data.fixedprice)
										.toFixed(2));
					})
				}
			});
	$(".zhidingjiao").click(function(){
		if($("#zhidata").val()==""||$("#zhidata").val().length==0){
			sweetAlert({
				text : '请指定缴纳的日期',type : 'warning',timer : 1500,
				showConfirmButton : false
			});
		}else{
			$("input[name=undate]").val($("#zhidata").val());
			sweetAlert({
		        text: "指定日期成功！",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
			});
			window.setTimeout(function(){
				$("#jiaofei-date").modal('hide');
	 		},2000);
		}
	})
	$("input[name=priceing],input[name=count]").change(function(){
		var price=$("input[name=priceing]").val();
		var count=$("input[name=count]").val();
		if(isNaN(price)||isNaN(count)){
			sweetAlert({text:'请输入数字类型',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else{
			$("input[name=subtotal]").val(price*count);
		}
	})
	
});

function chargeType(dname) {
	var typeid = $("select[name=ztype]").val();
	var disid = $(".xq_id").val();
	if (typeid == 1) {
		$(".labtype").html("选择房屋");
		$(".xuanze").html("--选择房屋--");
		$("#xuanzeType").attr("name", "fanId");
		tollController.selectfanNum(disid, function(data) {
			$("#xuanzeType option[value!='0']").remove();
			for (var i = 0; i < data.length; i++) {
				$("#xuanzeType").append(
						"<option value='" + data[i].fanid + "'>" + dname + "  "
								+ data[i].hnum + "</option>");
			}
		});
	} else if (typeid == 2) {
		$(".labtype").html("选择车位");
		$(".xuanze").html("--选择车位--");
		$("#xuanzeType").attr("name", "parkId");
		tollController.selectParkNum(disid, function(data) {
			$("#xuanzeType option[value!='0']").remove();
			for (var i = 0; i < data.length; i++) {
				$("#xuanzeType").append(
						"<option value='" + data[i].parkid + "'>" + dname
								+ "  " + data[i].pnum + "</option>");
			}
		});
	} else if (typeid == 3) {
		$(".labtype").html("选择车辆");
		$(".xuanze").html("--选择车辆--");
		$("#xuanzeType").attr("name", "vehicleId");
		tollController.selectVehicle(disid, function(data) {
			$("#xuanzeType option[value!='0']").remove();
			for (var i = 0; i < data.length; i++) {
				$("#xuanzeType").append(
						"<option value='" + data[i].vehicid + "'>" + dname
								+ "  " + data[i].carnum + "</option>");
			}
		});
	} else if (typeid == 4) {
		$(".fantype").addClass("none");
		$(".feitype").removeClass("none");
		$(".pricetype").addClass("none");
		$(".chargtype").addClass("none");
		$("#xuanzeType").attr('disabled', true);
		return;
	} else {
		swal({
			text : "请选择类型",
			type : "warning",
			confirmButtonText : '确认',
			confirmButtonColor : '#f8bb86',
			timer : 2000,
		});
	}
	$(".fantype").removeClass("none");
	$(".feitype").addClass("none");
	$(".pricetype").removeClass("none");
	$(".chargtype").removeClass("none");
	$("#xuanzeType").attr('disabled', false);
	
}
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
/*验证收费*/
function shoukuan(form,flag){
	if(!flag){
		if(form.onames.value==""||form.onames.value.length==0){
			sweetAlert({text:'请输入姓名',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else if(form.ophone.value==""||form.ophone.value.length==0){
			sweetAlert({text:'请输入手机号',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}else{
		if(form.oid.value==0||form.oid.value.length==0){
			sweetAlert({text:'请输入缴费人',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}
	if(form.means.value==0||form.means.value.length==0){
		sweetAlert({text:'请选择收款方式',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else{
		sweetAlert({
	        text: "收款成功",
	        type: "success",
	        confirmButtonText: '确认',
	        confirmButtonColor: '#4cd964',
	  	});
    	 window.setTimeout(function(){
	    	 form.submit();
 	  	},2000);
	}
}
function isaddlingshi(form){
	if(form.ztype.value==""||form.ztype.value.length==0){
		sweetAlert({text:'请选择收费类型',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}if(form.ztype.value==1){
		if($("#xuanzeType").val()==0){
			sweetAlert({text:'请选择房屋',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}else if(form.ztype.value==2){
		if($("#xuanzeType").val()==0){
			sweetAlert({text:'请选择车位',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}else if(form.ztype.value==3){
		if($("#xuanzeType").val()==0){
			sweetAlert({text:'请选择车辆',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}else if(form.ztype.value==4){
		if(form.chargname.value==""||form.chargname.value.length==0){
			sweetAlert({text:'请填写费用名称',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}
	}
	if(form.ztype.value!=4){
		if(form.priceid.value==0){
				sweetAlert({text:'请选择收费项目',type:'warning',timer:1500,showConfirmButton:false});
				return false;
		}else if(form.chargid.value==0){
				sweetAlert({text:'请选择收费标准',type:'warning',timer:1500,showConfirmButton:false});
				return false;
		}
	}else if(form.priceing.value==""||form.priceing.value.length==0){
		sweetAlert({text:'请填写单价',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.count.value==""||form.count.value.length==0){
		sweetAlert({text:'请填写数量',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.subtotal.value==""||form.subtotal.value.length==0){
		sweetAlert({text:'请填写金额',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.priceing.value<0||isNaN(form.priceing.value)){
		sweetAlert({text:'请正确填写单价',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.count.value<0||isNaN(form.count.value)||form.count.value==""){
		sweetAlert({text:'请正确填写数量',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.subtotal.value<0||isNaN(form.subtotal.value)||form.subtotal.value==""){
		sweetAlert({text:'请正确填写金额',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(form.sdate.value==""||form.sdate.value.lenght==0){
		sweetAlert({text:'请选择开始时间',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}
	if(form.priceing.value>0&&form.count.value>0){
		var sub=form.subtotal.value;
		if((form.priceing.value*form.count.value)!=sub){
			sweetAlert({text:'总金额不对应单价和数量',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else{
			sweetAlert({
		        text: "添加成功",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		  	});
	    	 window.setTimeout(function(){
		    	 form.submit();
	 	  	},2000);
		}
	}
}
