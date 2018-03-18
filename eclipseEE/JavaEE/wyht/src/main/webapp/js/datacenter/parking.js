$(function(){
    //验证
	$(".verification").click(function(){
		var id=this.id;
		var str=id.substring(4);
		var disid=$("#disid"+str).val();
		var pnum=$("#pnum"+str).val();
		var carea=$("#carea"+str).val();
		var cstatus=$("#status"+str).val();
		if(disid==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(pnum.length==0){
			swal({
		          text: "请填写车位号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(isNaN(carea)){
			swal({
		          text: "车位面积有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(carea.length==0){
			swal({
		          text: "请填写车位面积",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(cstatus==0){
			swal({
		          text: "请选择车位状态",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			if(str==2){
				swal({
			          text: "添加成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
		        })
		        setTimeout(function(){$("#f"+str).submit();},1500);
			}else{
				swal({
			          text: "修改成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
		        })
		        setTimeout(function(){$("#f"+str).submit();},1500);
			}
		}
	});
	//绑定住户--->保存
    $(".fake-save").on("click",function(){
    	var ocd=$(".cardid2 option:selected").val();
    	var pid=$("#parkid2").val();
		var chk=[];//定义一个空数组
    	var oid=$("input[name='get_c']:checked").each(function(i){
			chk[i]=$(this).val();
        });
        var count=0;
        for(var i=0;i<chk.length;i++){
    		datacenterController.insert_binding({ownerId:chk[i],ownercard:ocd,parkId:pid},function(data){
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
    	        	})
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
    })
    //导入验证
    $(".impver").click(function(){
    	var did=$("#disid4").val();
		var efile=$("#excelFile").val();
		if(did==0){
			swal({
		          text: "请选择小区",
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
});
//删除车位
function delete_ps(parkid){
	swal({
        text: "您确定要删除当前内容？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function(){
    	datacenterController.delete_parkid(parkid,function(data){
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
        if(dismiss='cancel'){
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
//批量删除车位
$("#del").click(function(){
	swal({
        text: "您确定要批量删除？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function(isConfirm){
		var array=new Array;
		$("input[type=checkbox]:gt(0):checked").each(function(){
	          array.push($(this).parent().next().text());
	    });
    	datacenterController.batchDeletePark(array,function(data){
    		if(data!=0){
        		swal({
                    text: "删除成功！",
                    type: "success",
                    confirmButtonText: '确认',
                    confirmButtonColor: '#4cd964',
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
    	if(dismiss='cancel'){
            swal({
                text: "已取消",
                type: "warning",
                confirmButtonText: '确认',
                confirmButtonColor: '#FF8C00',
                timer:1000,
            })
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
	$("#status1").find("option[value='0']").attr("selected",true);
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#advanced").val("");
	$("#parkid1").val("");
	$("#ordinary").val("");
	$("#f1").submit();
}
//编辑
function edit(parkid) {
	datacenterController.selectps(parkid,function(data){
		$("#parkid3").val(data.parkid);
		$("#disid3").find("option[value="+data.disid+"]").attr("selected",true);
		$("#pnum3").val(data.pnum);
		$("#carea3").val(data.carea);
		$("#status3").find("option[value="+data.status+"]").attr("selected",true);
		$("#remark3").val(data.remark);
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
}
//绑定住户
function bangding(parkid){
	$(".SelectZhuhu").html("");
	datacenterController.selectdisall(function(data){
		$(".SelectZhuhu").append("<input type='hidden' id='parkid2' value='"+parkid+"'>");
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