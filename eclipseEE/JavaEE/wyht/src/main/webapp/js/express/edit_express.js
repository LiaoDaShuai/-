$(function(){
	$(".baoc").click(function(){
		var storNum=$("input[name='storNum']").val();
		var phone=$("input[name='storReceiverphone']").val();
		var name=$("input[name='storReceivername']").val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(storNum.length==0){
			swal({
	            text: "请填写快递单号",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(isNaN(storNum)){
			swal({
	            text: "快递单号有误",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(phone.length==0){
			swal({
	            text: "请填写收件人手机号",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(!ss.test(phone)){
			swal({
	            text: "手机号格式有误",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(name.length==0){
			swal({
	            text: "请填写收件人姓名",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else{
			expressController.selectStornum(storNum,function(data){
				if(data!=0){
					swal({
			            text: "该快递单号已存在",
			            type: "warning",
			            confirmButtonText: '确认',
			            confirmButtonColor: '#FF8C00',
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
			        setTimeout(function(){$("#f1").submit();},1500);
				}
			})
		}
	})
})