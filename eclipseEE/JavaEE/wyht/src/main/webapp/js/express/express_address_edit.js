$(function(){
	layui.use('laydate',function(){
		var laydate=layui.laydate;
		laydate.render({
	        elem: '.qj_1',
	        type:'time',
	        done:function(value,data,endDate){
	            $(".qj_1").val(value);
	        }
	    });
		laydate.render({
	        elem: '.qj_2',
	        type:'time',
	        done:function(value,data,endDate){
	            $(".qj_2").val(value);
	        }
	    });
	});
	$(".baoc").click(function(){
		var disid=$("#disid1").val();
		var address=$("input[name='expAddress']").val();
		var phone=$("input[name='expServicephone']").val();
		var sdate=$("input[name='expSdate']").val();
		var edate=$("input[name='expEdate']").val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(disid==0){
			swal({
	            text: "请选择小区",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(address.length==0){
			swal({
	            text: "请填写取件点",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(phone.length==0){
			swal({
	            text: "请填写服务电话",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(!ss.test(phone)){
			swal({
	            text: "服务电话有误",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(sdate.length==0){
			swal({
	            text: "请选择取件开始时间",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	            timer:1000,
	        })
		}else if(edate.length==0){
			swal({
	            text: "请选择取件结束时间",
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
})