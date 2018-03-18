$(function(){
	//添加收费标准
	layui.use('laydate',function(){
		var laydate=layui.laydate;
		//收费标准
		laydate.render({
			elem:'#test1',
			type:'datetime',
			done:function(value,data,endDate){
				$("#test1").val(value);
			}
		});
		laydate.render({
			elem:'#test2',
			type:'datetime',
			done:function(value,data,endDate){
				$("#test2").val(value);
			}
		});
	});
	layui.use('form',function(){
		var form=layui.form;
		tollController.yipriceAll(function(data){
			for(var i=0;i<data.length;i++){
				$("select[name=priceId]").append("<option value='"+data[i].priceid+"'>"+data[i].pricename+"</option>")
			}
			form.render('select');
		})
	})
})
function addcharg(id){
	$("#other_id").val(id);
}
function isCharg(from){
	if(from.priceId.value==""){
		sweetAlert({text:'请选择收费项目',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(from.chargid.value==""){
		sweetAlert({text:'请选择收费标准',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else if(from.startdate.value==""){
		sweetAlert({text:'请选择开始时间',type:'warning',timer:1500,showConfirmButton:false});
		return false;
	}else{
		var priceId=from.priceId.value;
		var chargid=from .chargid.value;
		var name=$("#other_id").attr("name");
		var vals=$("#other_id").val();
		if(name=='fan_id'){
			datacenterController.selectbcharg({priceId:priceId,chargid:chargid,fan_id:vals},function(data){
				if(data>0){
					sweetAlert({text:'该收费项目已绑定了',type:'warning',timer:1500,showConfirmButton:false});
					return false;
				}else{
					sweetAlert({
				        text: "添加成功",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				    });
					window.setTimeout(function(){from.submit();},2000);
				}
			});
		}else if(name=='park_id'){
			datacenterController.selectbcharg({priceId:priceId,chargid:chargid,park_id:vals},function(data){
				if(data>0){
					sweetAlert({text:'该收费项目已绑定了',type:'warning',timer:1500,showConfirmButton:false});
					return false;
				}else{
					sweetAlert({
				        text: "添加成功",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				    });
					window.setTimeout(function(){from.submit();},2000);
				}
			});
		}else if(name=='vehic_id'){
			datacenterController.selectbcharg({priceId:priceId,chargid:chargid,vehic_id:vals},function(data){
				if(data>0){
					sweetAlert({text:'该收费项目已绑定了',type:'warning',timer:1500,showConfirmButton:false});
					return false;
				}else{
					sweetAlert({
				        text: "添加成功",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				    });
					window.setTimeout(function(){from.submit();},2000);
				}
			});
		}
		return false;
	}
}
function chargdel(type,otherid,chargid){
	swal({
        text: "您确定要删除该收费？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function(){
    	datacenterController.delbcharg(type,otherid,chargid,function(data){
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
    	});
	});
}