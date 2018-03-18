
$(function(){
	$("#luru").niceScroll({
		 scrollspeed: 70,// 滚动速度
	        mousescrollstep: 38,// 鼠标滚轮的滚动速度
	        cursorwidth: '8px',//宽度
	        cursorborder: 0,// CSS方式定义滚动条边框
	        cursorcolor: '#CFCFCF',//滚动条颜色
	        cursorborderradius: 0,
	        autohidemode: false,//不隐藏滚动条
	        background:"#999999",
	        horizrailenabled: false// nicescroll可以管理水平滚动，false不可以
	});
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
    	//年月选择器
        laydate.render({
            elem: '#tabMonths1'
            ,type: 'month'
        });
        laydate.render({
            elem: '#tabMonths2'
            ,type: 'month',
            done:function(value,data,endDate){
                $("#addtabMonth").val(value);
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
      $("#select_zhuhu").click(function(){
			if(this.className=="layui-input layui-input-k yes"){
    	  		datacenterController.selectAll(function(data){
					for(var i=0;i<data.length;i++){
						$(".FanNumresult").append(
						"<ul class=\"tree-list\">\n" +
				   	 	"    <li id=\"dis"+data[i].disid+"\">\n" +
				    	"       <label><span class=\"get_xq yes\" id=\"ds"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].dname+"</label>" +
				    	"    </li>\n" +
				    	"</ul>");
					}
		  		});
    	  		$("#select_zhuhu").removeClass("yes");
			}
      })
    $(document).on("click",".get_xq",function () {
    	var datas=this.id;
        datas=datas.replace('ds','');
        if ($(this).children("i").attr("class")=="fa fa-plus") {
            if(this.className=="get_xq yes"){
            		datacenterController.selectloudid(datas,function(data){
						var fooldiv='';
						for(var i=0;i<data.length;i++){
							fooldiv+="<ul class=\"tree-child\" >\n" +
								    "       <li id=\"lou"+data[i].hlid+"\">\n" +
								    "             <label><span class=\"get_house yes\" id=\"hlf"+data[i].hlid+"\"><i class='fa fa-plus'></i></span><a class=\"get_b\" >"+data[i].floorname+"</a></label>" +
								    "       </li>\n" +
								    "</ul>";
						}
						fooldiv="<div id=\"tx"+data[0].disid+"\">"+fooldiv+"</div>";
						$("#dis"+data[0].disid+"").append(fooldiv);
					});
					$("#ds"+datas).removeClass("yes");
            }
            $("#tx"+datas).show();
            $(this).children("i").attr("class","fa fa-minus");
        } else {
        	$("#tx"+datas).hide();
        	$(this).children("i").attr("class","fa fa-plus");
        }
    })
    $(document).on("click",".get_house",function () {
    	var datas=this.id;
    	datas=datas.replace('hlf','');
        if($(this).children("i").attr("class")=="fa fa-plus"){
            if(this.className=="get_house yes"){
            	datacenterController.selectfanid(datas,function(data){
						var fandiv='';
						for(var i=0;i<data.length;i++){
							fandiv+="<ul class=\"tree-child\">\n" +
								    "           <li><label><input type=\"radio\" id=\""+data[i].fanid+"\" class=\"fw_input_"+data[i].disid+"\" name=\"get_c\" value=\""+data[i].hnum+"\"> "+data[i].hnum+"\n" +
								    "                     </label>\n" +
								    "          </li></ul>"
						}
						fandiv="<div class=\"tcs"+data[0].hlid+"\" name=\"+sss+\">"+fandiv+"</div>";
						$("#lou"+data[0].hlid).append(fandiv);
						layui.use('form',function(){
							var form=layui.form;
							form.render();
						});
            	});
            	$("#hlf"+datas).removeClass("yes");
            }
            $(this).children("i").attr("class","fa fa-minus");
            $(".tcs"+datas).show();
        }else {
        	$(this).children("i").attr("class",'fa fa-plus');
            $(".tcs"+datas).hide();
        }
    })
    //添加的一段
    layui.use('form',function(){
    	var form=layui.form;
    	form.on('radio',function(data){
    		$('#select_zhuhu').val(data.value);
            $("input[name=tabDisId]").val(this.className.replace("fw_input_",""));
            $("input[name=tabFanId]").val(this.id);
    	});
    });
   /* $(document).on('change','input[name="get_c"]',function(){
        $('#select_zhuhu').val(($(this).val()));
        $("input[name=tabDisId]").val(this.className.replace("fw_input_",""));
        $("input[name=tabFanId]").val(this.id);
    });*/
      var tabPriceId='';//用于存储priceid全局变量
      var priceides='';//用于存储priceid全局变量
      $("select[name=tabPriceId]").change(function(){
    	  $("#charg1")[0].selectedIndex = 0; //将下拉框变为0
    	  $("#charg2")[0].selectedIndex = 0; //将下拉框变为0
    	  var tabPriceId=this.id;
     	  if(tabPriceId=="price1"){
    		  var priceid1=$("#price1").val();
    	 		 if(priceid1>0){
    	 			if(priceides==priceid1){
    	 				return;
    	 			}else{
    	 			$("#charg1 option[value!='0']").remove();
    	 		 		tollController.chargyiid(priceid1,function(data){
    	 						for(var i=0;i<data.length;i++){
    	 							$("#charg1").append("<option value=\""+data[i].chargid+"\">"+data[i].chargname+"</option>");
    	 						} 		
    	 			 	});
    	 		 		priceides=priceid1;
    	 	 		}
    	 		 }
          }else{
        	  var priceid2=$("#price2").val();
     		 if(priceid2>0){
     			if(tabPriceId==priceid2){
     				return;
     			}else{
     			$("#charg2 option[value!='0']").remove();
     		 		tollController.chargyiid(priceid2,function(data){
     						for(var i=0;i<data.length;i++){
     							$("#charg2").append("<option value=\""+data[i].chargid+"\">"+data[i].chargname+"</option>");
     						}
     			 	});
     		 		tabPriceId=priceid2;
     	 		}
     		 }
          }
      });
      $("#charg2").click(function(){
		 if($("#select_zhuhu").val()==''){
			sweetAlert({text:'请选择房号',type:'warning',timer:1500,showConfirmButton:false});
			return;
  		 }
      })
	 $("#charg2").change(function(){
		 var chargid=$(this).val();
		 var fanid=$("input[name=tabFanId]").val();
		 if(chargid!=""&&fanid!=0){
			 $("input[name=tabStartnum]").val(0);
			 tollController.chargidend({tabChargId:chargid,tabFanId:fanid},function(data){
					var num=data[0].tabEndnum;
					if(num>0){
						$("input[name=tabStartnum]").val(num);
					}
			})	
		 }
	 });
	 $(".updateedit").on("click",function(){
		 $(this).html("保存");
		 $(this).addClass("submi");
	 })
	 $(document).on("click",".submi",function(){
		var tid=this.name;
		if($("."+this.name).attr("readonly")=="readonly"){
			$("."+this.name).removeAttr("readonly");
			return;
		}else{
			tid=tid.replace("edit","");
			var tabSnum=$("input[name=tabStartnum"+tid+"]").val();
			var tabEnum=$("input[name=tabEndnum"+tid+"]").val();
			if(tabEnum<tabSnum){
				sweetAlert({text:'止度须大于起度',type:'warning',timer:1500,showConfirmButton:false});
				return;
			}else{
					$("."+this.name).attr("readonly","readonly");
					tollController.tableupdate({tabStartnum:tabSnum,
					tabEndnum:tabEnum,
					beilv:$("input[name=beilv"+tid+"]").val(),
					tabRemark:$("input[name=tabRemark"+tid+"]").val(),
					gongtan:$("input[name=gongtan"+tid+"]").val(),
					tabId:tid},function(data){
					swal({text:"修改成功",type:"success",confirmButtonText:"确认",confirmButtonColor: '#4cd964'})
						setTimeout(function(){
							window.location.reload();
						}, 1500);
				});
			}
		}
	 });
	 $(".pagination").change(function(){
		var size=$(this).val();
		$("input[name=pageSize]").val(size);
		$("form[name=f1]").submit();
	 });
 });
function daoru_submit(form){
	if($("#select_zhuhu").val()==''){
		sweetAlert({text:'请选择房号',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("#tableMonth2").val()==''){
		sweetAlert({text:'请选择月份',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("#price2").val()==0){
		sweetAlert({text:'请选择收费项目',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("#charg2").val()==0){
		sweetAlert({text:'请选择收费标准',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("input[name=tabStartnum]").val()==''){
		sweetAlert({text:'请填写起始度数',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("input[name=tabEndnum]").val()==''){
		sweetAlert({text:'请填写停止度数',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(parseInt($("input[name=tabStartnum]").val())>parseInt($("input[name=tabEndnum]").val())){
		sweetAlert({text:'止度必须大于起度',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("input[name=tabBeilv]").val()==''){
		sweetAlert({text:'请填写倍率',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if($("input[name=tabGongtan]").val()==''){
		sweetAlert({text:'请填写公摊',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else{
		var fanid=$("input[name=tabFanId]").val();
		var month=$("#addtabMonth").val();
		var priceid=$("#price2").val();
		var chargid=$("#charg2").val();
		dates=new Date(month);
		tollController.Tollmonths({tabFanId:fanid,tabMonths:dates,tabPriceId:priceid,tabChargId:chargid},
			function(data){
			if(data>0){	
				sweetAlert({text:'该月已录入收费',type:'warning',timer:1500,showConfirmButton:false});
				return false;
			}else{
				sweetAlert({
			        text: "添加成功",
			        type: "success",
			        confirmButtonText: '确认',
			        confirmButtonColor: '#4cd964',
			    });
				window.setTimeout(function(){form.submit()},2000);
			}
		});
		return false;
	}
}
