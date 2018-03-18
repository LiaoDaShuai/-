$(function(){
	//验证
	$(".verification").click(function(){
		var id=this.id;
		var str=id.substring(4);
		var disid=$("#disid"+str).val();
		var cname=$("#cname"+str).val();
		var cphone=$("#cphone"+str).val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		var carnum=$("#carnum"+str).val();
		if(disid==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(cname.length==0){
			swal({
		          text: "请填写车主姓名",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(cphone.length==0){
			swal({
		          text: "请填写车主手机号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(!ss.test(cphone)){
			swal({
		          text: "车主手机号格式有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(carnum.length==0){
			swal({
		          text: "请填写车牌号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			$("#myModal"+str).modal("hide");
			str=str+str;
			$("#myModal"+str).modal("show");
		}
	})
	//验证导入
	$(".impver").click(function(){
		var did=$("#disid4").val();
		var parkid=$("#parkid4").val();
		var efile=$("#excelFile").val();
		if(did==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(parkid==0){
			swal({
		          text: "请选择车位号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(efile==""){
			swal({
		          text: "请选择文件",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			swal({
		          text: "导入成功",
		          type: "success",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#4cd964',
		          timer:1000,
	        })
	        setTimeout(function(){$("#f4").submit();},1500);
		}
	})
	//添加和修改
	$(".sub").click(function(){
		var id=this.id;
		var form=id.replace("sub","");
		if(form==2){
			swal({
		          text: "添加成功",
		          type: "success",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#4cd964',
		          timer:1000,
		      })
		}else{
			swal({
		          text: "修改成功",
		          type: "success",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#4cd964',
		          timer:1000,
		      })
		}
		setTimeout(function(){$("#f"+form).submit();},1500);
	})
	 //绑定住户--->保存
    $(".fake-save").on("click",function(){
    	var chk=[];//定义一个空数组
    	var oid=$("input[name='get_c']:checked").each(function(i){
			chk[i]=$(this).val();
        });
    	
    	var ocd=$(".cardid2 option:selected").val();
    	var vid=$("#vehicid2").val();
    	 var count=0;
         for(var i=0;i<chk.length;i++){
    	datacenterController.insert_binding({ownerId:chk[i],ownercard:ocd,vehicleId:vid},function(data){
    		count+=data;	
		});
    	if(i==chk.length-1){
    		if(count<1){
    			swal({
    	            text: "保存成功！",
    	            type: "success",
    	            confirmButtonText: '确认',
    	            confirmButtonColor: '#4cd964',
    	        }).then(function(){
    	            $(".user_bg").click();
    	        });
    		}else{
    			sweetAlert({
    	            text: "该车位以绑定该住户！",
    	            type: "warning",
    	            timer:2000,
    	            showConfirmButton:false,
    	        })
        	}
         }
        }
    });
	//批量删除车辆
	$("#del").on("click",function(){
	    swal({
	        text: "您确定要批量删除？",
	        type: "info",
	        confirmButtonText: '确认',
	        confirmButtonColor: '#3fc3ee',
	        reverseButtons:true,
	        focusCancel:true,
	        showCancelButton:true,
	        cancelButtonText:'取消',
	    }).then(function(){
	    	var array=new Array;
	        $("input[type=checkbox]:gt(0):checked").each(function(){
	          array.push($(this).parent().next().text());
	        });
	        datacenterController.batchDeleteCar(array,function(data){
	        	if(data!=0){
	        		swal({
	    	            text: "批量删除成功！",
	    	            type: "success",
	    	            confirmButtonText: '确认',
	    	            confirmButtonColor: '#4cd964',
	    	            timer:1000,
	    	        })
	    	        setTimeout("location.reload()",1500);
	        	}else{
	        		swal({
	    	            text: "批量删除失败！",
	    	            type: "error",
	    	            confirmButtonText: '确认',
	    	            confirmButtonColor: '#f27474',
	    	            timer:1000,
	    	        })
	        	}
	        })
	    },function(dismiss){
	        if(dismiss='cancel'){
	            swal({
	                text: "取消了！",
	                type: "warning",
	                confirmButtonText: '确认',
	                confirmButtonColor: '#FF8C00',
	                timer:1000,
	            })
	        }
	    })
	})
	$(document).on("click",".get_xq",function(){
		var datas=this.id;
	    datas=datas.replace('ds','');
	    if($(this).children("i").attr("class")=='fa fa-plus'){
	    	if(this.className=="get_xq yes"){
	    		datacenterController.selectallowners(datas,function(data){
	    			var yzdiv="";
					for(var i=0;i<data.length;i++){
						yzdiv+="<ul style=\"margin-left:20px;\">" +
						"	<li>"+
						"		<label>"+
						"			<input type=\"checkbox\" name=\"get_c\" value=\""+data[i].oid+"\">"+data[i].owername+ 
						" "+data[i].ownerphone+""+
					    "			<select class=\"cardid2\" style=\"float:right;\">"+
					    "				<option value=\"1\">业主本人</option>"+
					    "				<option value=\"2\">亲属</option>"+
					    "				<option value=\"3\">租客</option>"+
					    "				<option value=\"4\">其他</option>"+
					    "			</select>"+
						"		</label>"+
					    "	</li>"+
					    "</ul>";
					}
					yzdiv="<div id=\"tx"+datas+"\">"+yzdiv+"</div>";
					$("#dis"+datas+"").append(yzdiv);
	    		})
				$("#ds"+datas).removeClass("yes");
	        }
	    	$(this).children("i").attr("class","fa fa-minus");
	        $("#tx"+datas).show();
	    } else {
	    	$(this).children("i").attr("class",'fa fa-plus');
	        $("#tx"+datas).hide();
	    }
	})
})
//搜索
function sousuo(){
	var sousuo=$("#ordinary").val();
	$("#advanced").val(sousuo);
	$("#f1").submit();
}
//清空
function clear_form(){
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#parkid1").find("option[value='0']").attr("selected",true);
	$("#carnum1").val("");
	$("#ordinary").val("");
	$("#advanced").val("");
	$("#f1").submit();
}
//删除
function after_delete(vehicid){
	swal({
        text: "您确定要删除当前内容？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function() {
    	datacenterController.delete_car(vehicid,function(data){
			if(data!=0){
				swal({
	                text: "删除成功！",
	                type: "success",
	                confirmButtonText: '确认',
	                confirmButtonColor: '#4cd964',
	                timer:1000,
	            })
			}else{
				swal({
		            text: "删除失败！",
		            type: "error",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#f27474',
		            timer:1000,
		        })
			}
			//延时刷新页面
			setTimeout("location.reload()",1500);
		})
    },function(dismiss){
        if(dismiss='cancel') {
            swal({
                text: "已取消",
                type: "warning",
                confirmButtonText: '确认',
                confirmButtonColor: '#FF8C00',
                timer:1000,
            })
        }
    })
}
//绑定住户
function bangding(vehicid){
	$(".SelectZhuhu").html("");
	datacenterController.selectdisall(function(data){
		$(".SelectZhuhu").append("<input type='hidden' id='vehicid2' value='"+vehicid+"'>");
		for(var i=0;i<data.length;i++){
			$(".SelectZhuhu").append(		
			"<ul class=\"tree-list\">" +
	   	 	"    <li id=\"dis"+data[i].disid+"\">" +
	    	"       <label><span class=\"get_xq yes\" id=\"ds"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].dname+"</label>" +
	    	"    </li>" +
	    	"</ul>");
		}
	})
	$(".user_info").animate({right:'0px'});
    $(".user_bg").css("display","block");		
}

//编辑
function edit(vehicid){
	datacenterController.editVehicle(vehicid,function(data){
		$("#vehicid3").val(vehicid);
		dwr.util.setValue("kanum3",data.kanum);
		dwr.util.setValue("cname3",data.cname);
		dwr.util.setValue("cphone3",data.cphone);
		dwr.util.setValue("carnum3",data.carnum);
		dwr.util.setValue("carpai3",data.carpai);
		dwr.util.setValue("carxing3",data.carxing);
		dwr.util.setValue("carcolor3",data.carcolor);
		dwr.util.setValue("carqq3",data.carqq);
		dwr.util.setValue("carweixin3",data.carweixin);
		dwr.util.setValue("caremail3",data.caremail);
		dwr.util.setValue("homephone3",data.homephone);
		if(data.carphoto!=null){
			$("#img3").attr("src","/wyht/img/"+data.carphoto);
			$("#img3").removeClass("hide");
			$("#span3").html("");//去掉“+”号
		}if(data.jiazhao!=null){
			$("#img4").attr("src","/wyht/img/"+data.jiazhao);
			$("#img4").removeClass("hide");
			$("#span4").html("");//去掉“+”号
		}if(data.drivingphoto!=null){
			$("#img5").attr("src","/wyht/img/"+data.drivingphoto);
			$("#img5").removeClass("hide");
			$("#span5").html("");//去掉“+”号
		}
		dwr.util.setValue("remark3",data.remark);
		layui.use('form', function(){
			var form=layui.form;
			$("#disid3").find("option[value="+data.disid+"]").attr("selected",true);
			datacenterController.selectPks(data.disid,function(da){
				for(var i=0;i<da.length;i++){
					$("#parkid3").append("<option value="+da[i].parkid+">"+da[i].pnum+"</option>");
				}
				$("#parkid3").find("option[value="+data.parkid+"]").attr("selected",true);
				form.render('select');
			});
			form.render();
		});
	})
}
//清空
function clear_form(){
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#parkid1").find("option[value='0']").attr("selected",true);
	$("#carnum1").val("");
	$("#ordinary").val("");
	$("#advanced").val("");
	$("#f1").submit();
}