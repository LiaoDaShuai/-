$(function(){
	$(".verification").click(function(){
		var couName=$("input[name='couName']").val();
		var couPhone=$("input[name='couPhone']").val();
		var couECid=$("#company_id").val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(couName.length==0){
			swal({
		          text: "请填写快递员名称",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(couPhone.length==0){
			swal({
		          text: "请填写快递员手机号",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(!ss.test(couPhone)){
			swal({
		          text: "手机号格式有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(couECid==0){
			swal({
		          text: "请选择快递公司",
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
function couver(id){
	var couName=$("input[name='couName']").val();
	var couPhone=$("input[name='couPhone']").val();
	if(id==1){
		expressController.select_couName(couName,function(data){
			if(data!=0){
				swal({
			          text: "快递员名称已存在",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}
		})
	}else if(id==2){
		expressController.select_couPhone(couPhone,function(data){
			if(data!=0){
				swal({
			          text: "快递员手机号已存在",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}
		})
	}
}	