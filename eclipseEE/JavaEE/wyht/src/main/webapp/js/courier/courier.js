$(function(){
	$(".verification").click(function(){
		var balance=$("#couBalance2").val();
		if(balance.length==0){
			swal({
		          text: "请填写要充值的金额",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(isNaN(balance)){
			swal({
		          text: "金额有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(balance<=0){
			swal({
		          text: "金额必须大于0",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			swal({
	            text: "充值成功",
	            type: "success",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#4cd964',
	            timer:1000,
	        })
	        setTimeout(function(){$("#f2").submit();},1500);
		}
	})
})
function recharge(cid){
	expressController.reCourier(cid,function(data){
		dwr.util.setValue("couId2",data.couId);
		dwr.util.setValue("couName2",data.couName);
	})
}
function delete_courier(cid){
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
    	expressController.before_deleteCourier(cid,function(data){
    		if(data!=0){
    			 swal({
    	                text: "该快递员下还有"+data+"个快递未被领取！",
    	                type: "warning",
    	                confirmButtonText: '确认',
    	                confirmButtonColor: '#FF8C00',
    	                timer:1000,
    	            })
    		}else{
    			expressController.deleteCourier(cid,function(data){
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
        	                type: "warning",
        	                confirmButtonText: '确认',
        	                confirmButtonColor: '#f27474',
        	                timer:1000,
        	            })
    				}
    			})
    		}
    	})
    	setTimeout("location.reload()",1500);
    },function(dismiss){
        if(dismiss='cancel'){
            swal({
                text: "取消了！",
                type: "error",
                confirmButtonText: '确认',
                confirmButtonColor: '#f27474',
            })
        }
    })
}