$(function(){
	$(".addbiao").on("click",function(){
        $(".price-header").html("添加收费标准");//初始化模态框
		$("#form1").attr("action","chargadd");
		$("input[type=text]").val("");//将文本框清空
		$("#formula_name").html("");//将编辑留的公式名去掉
		$("#js_type option:first").prop("selected",'selected');//将下拉框默认选择第一个
		$("select[name=priceunit] option:first").prop("selected",'selected');
		$("input[name=price_id]").val(this.id);//把项目id给隐藏域
        $("#addpricename").val(this.name);//把项目名附在添加标准的文本框上
        layui.use('form',function(){
        	var form=layui.form;
        	form.render();
        });
    });
    $(".editbiao").on("click",function(){
		var chargid=this.id;
		$("#addpricename").val(this.name);
		$(".price-header").html("编辑收费标准");
		$("#form1").attr("action","chargupdate");
		tollController.editChargs(chargid,function(data){
				$("input[name=chargid]").val(data.chargid);
				$("input[name=priceid]").val(data.price_id);
				$("input[name=chargname]").val(data.chargname);
				$("select[name=shouid]").find("option[value="+data.shouid+"]").attr("selected",true);
				 //初始化时根据下拉框选择对应显示
			    var _val=data.shouid+1;
			    for(var i=1;i<5;i++){
			        if(i==_val&&i!=2){
			            $(".js_type-"+i).show();
			            if(i==4){
			            	$("input[name=formula_id]").attr("disabled",false);
			            }else{
			            	$("input[name=formula_id]").attr("disabled",true);
			            }
			        }else{
			            $(".js_type-"+i).hide();
			        }
			    }
				if(data.formulaid!=null){
					$("input[name=formula_id]").val(data.formulaid);
					tollController.yibuFormulaid(data.formulaid,function(datas){
						$("#formula_name").html(datas.formulaname);
					});
				}
				$("input[name=pricing]").val(data.pricing);
				$("input[name=fixedprice]").val(data.fixedprice);
				$("select[name=priceunit]").val(data.priceunit);
				$("input[name=priceweek]").val(data.priceweek);
				$("input[name=remark]").val(data.remark);
				layui.use('form',function(){
		        	var form=layui.form;
		        	form.render();
		        });
		});
    });
    $("#addshoufei").draggable({
        handle: ".modal-header",
        cursor: 'move',
        refreshPositions: false
    });
    $("#addshoufei").css("overflow", "hidden");//禁止模态对话框的半透明背景滚动
    $('.del').click(function(){
		var chargid=$(this).attr('id');
		swal({
			title: "你确定要删除么？",
			type: "info",
			showCancelButton: true,
			confirmButtonColor: "#AEDEF4",
			cancelButtonText: "取消",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			closeOnCancel: true
		}).then(function(isConfirm){
			if (isConfirm){
				swal({
					text:"删除成功",
					type:"success",
					confirmButtonTest:"确认",
					confirmButtonColor:"#4cd964",
					timer: 2000
				})
				setTimeout(function(){
					$("#form1").attr("action","chargdel?chargid="+chargid);
					$("#form1").html("");
					$("#form1").submit();
					},1300);
			}
		});
	});
	$(".del_pro").click(function(){
		var priceid=$(this).attr('id');
		var childName=$(this).attr('name');
		swal({
			title: "你确定要该收费项目删除？",
			type: "info",
			showCancelButton: true,
			confirmButtonColor: "#AEDEF4",
			cancelButtonText: "取消",
			confirmButtonText: "确定",
			closeOnConfirm: false,
			closeOnCancel: true
		}).then(function(isConfirm){
				if (isConfirm){
					if(childName==""){
						swal({
							text:"删除成功",
							type:"success",
							confirmButtonTest:"确认",
							confirmButtonColor:"#4cd964",
							timer: 2000
						})
						setTimeout(function(){
							$("#form1").attr("action","pricedelete?priceid="+priceid);
							$("#form1").html("");
							$("#form1").submit();
							},2000);
				
					}else{
						swal({
						       text: "请先删除收费项目下的收费标准",
						       type: "warning",
						       confirmButtonText: '确认',
						       confirmButtonColor: '#3fc3ee',
						  })
					}
				}
		});
	})
	//当点击选择公式时异步获取数据
	$(".select_formula").on("click",function(){
		tollController.yibuFormulaAll(function(data){
				for(var i=0;i<data.length;i++){
					var lis="<li class=\"\"><label><input type=\"radio\" class=\"formulas\" id=\""+data[i].formulaname+"\" name=\"formulaname\" value=\""+data[i].formulaid+"\">"+data[i].formulaname+"</label></li>"
				    $(".data-list").append(lis);
				}
		});
	});
	$(document).on("click","input[name=formulaname]",function(){
		$("#formula_name").html(this.id);
		$("#formulaid").val($(this).val());
	});
})