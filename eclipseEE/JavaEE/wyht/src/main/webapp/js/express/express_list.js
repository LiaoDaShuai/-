//搜索
function sousuo(){
	var sousuo=$("#ordinary").val();
	$("#advanced").val(sousuo);
	$("#f1").submit();
}
//清空
function clear_form(){
	$("#company").find("option[value='0']").attr("selected",true);
	$("#stor_status").find("option[value='']").attr("selected",true);
	$("input[name='storReceiverphone']").val("");
	$("#ordinary").val("");
	$("#advanced").val("");
	$("#f1").submit();
}
//删除
function deleteStorage(sid){
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
    	expressController.deleteStorage(sid,function(data){
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