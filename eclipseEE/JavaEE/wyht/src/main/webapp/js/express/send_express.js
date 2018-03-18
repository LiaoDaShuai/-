$(function(){
	$(".baoc").click(function(){
		var num=$("input[name='storNum']").val();
		var phone=$("input[name='storReceiverphone']").val();
		var name=$("input[name='storReceivername']").val();
		var couid=$("#storCouId2").val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(num.length==0){
			swal({
		          text: "请填写快递单号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(isNaN(num)){
			swal({
		          text: "快递单号有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(phone.length==0){
			swal({
		          text: "请填写收件人手机号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(!ss.test(phone)){
			swal({
		          text: "手机号格式有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(name.length==0){
			swal({
		          text: "请填写收件人姓名",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(couid==0){
			swal({
		          text: "请选择快递员",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			swal({
	            text: "添加成功",
	            type: "success",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#4cd964',
	            timer:1000,
	        })
	        setTimeout(function(){$("#f2").submit();},1500);
		}
	})
})
