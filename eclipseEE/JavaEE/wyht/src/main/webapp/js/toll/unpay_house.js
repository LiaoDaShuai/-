$(function() {
		layui.use('laydate',function(){
			var laydate=layui.laydate;
			laydate.render({
				elem : '#startdata'
			});
			laydate.render({
				elem : '#enddata'
			});
		})
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
  		var priceid="${mohuselect.priceid}";//获取收费的id，高级查询
	  		tollController.yipriceAll(function(data){
	  			for(var i=0;i<data.length;i++){
	  				if(data[i].priceid==priceid){
	  					$("select[name=priceid]").append("<option value=\""+data[i].priceid+"\" selected='selected'>"+data[i].pricename+"</option>");
	  				}else{
	  					$("select[name=priceid]").append("<option value=\""+data[i].priceid+"\">"+data[i].pricename+"</option>");
	  				}
	  			}
	  		});
  		if("${mohuselect.ztype}"!="" ){
			$("select[name=ztype]").val("${mohuselect.ztype }");
  	  	}if("${mohuselect.pricetype}"!=""){
  	  		$("select[name=pricetype]").val("${mohuselect.pricetype }");
  	  	}
		$('.deleweijiao').click(function() {
			var tollid = this.id;
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
					$.ajax({
						url : 'deleteWeij',
						type : "post",
						data : "tollid=" + tollid,
						dataType : 'JSON',
						success : function(data) {
							swal({
								text : "删除成功",
								type : "success",
								confirmButtonTest : "确认",
								confirmButtonColor : "#4cd964",
								timer : 1500
							})
							setTimeout(function() {
								window.location.reload();
							}, 1500);
						}
					});
				}
			});
		});

		var subcount = $(".subtotal").length;
		var zongsub = 0, zongyou = 0, zongzhi = 0, zongyu = 0, zongyin = 0;
		for (var i = 0; i < subcount; i++) {
			zongsub += parseInt($(".subtotal").eq(i).text().replace("￥", ''));
			zongyou += parseInt($(".youhui").eq(i).text().replace("￥", ''));
			zongzhi += parseInt($(".zhina").eq(i).text().replace("￥", ''));
			zongyin += parseInt($(".yjiao").eq(i).text().replace("￥", ''));
		}
		$(".totalMoney").eq(0).html("￥" + zongsub.toFixed(2));
		$(".totalYh").html("￥" + zongyou.toFixed(2));
		$(".totalZnj").html("￥" + zongzhi.toFixed(2));
		$(".totalYj").html("￥" + zongyin.toFixed(2));
		$(".totalMoney").eq(1).html("￥" + zongsub);
	});