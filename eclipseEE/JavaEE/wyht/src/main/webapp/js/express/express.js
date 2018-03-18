//搜索
function sousuo(){
	var sousuo=$("#ordinary").val();
	$("#advanced").val(sousuo);
	$("#f1").submit();
}
//清空
function clear_form(){
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#ordinary").val("");
	$("#advanced").val("");
	$("#f1").submit();
}
//删除
function deleteEpress(eid){
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
    	expressController.delete_selectStorages(eid,function(datas){
    		if(datas==0){
    			expressController.deleteExpress(eid,function(data){
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
    			})
    		}else{
    			swal({
		            text: "该快递下还有"+datas+"个快递未取",
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