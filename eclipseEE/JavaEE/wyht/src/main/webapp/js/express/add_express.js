function selectStorages(exid){
	$("#take").attr("disabled",true);
	$("#details div").remove();
	var str=$("#mb4").val();
	if(str.length>=4){
		if(isNaN(str)){
			swal({
	            text: "您输入的是非数字",
	            type: "warning",
	            confirmButtonText: '确认',
	            confirmButtonColor: '#FF8C00',
	        })
		}else{
			expressController.selectStorages(str,exid,function(data){
				$("#sug div").remove();
				var div="";
				if(data!=null){
					for(var i=0;i<data.length;i++){
						div+="<div class=\"item addbg\" onclick=\"getContext("+data[i].storId+")\"><b>"+data[i].storReceiverphone+"</b>&emsp;&emsp;<span>"+data[i].storReceivername+"</span></div>";
					}
					$("#sug").append(div);
					$("#sug").css("display","block");
					$("#no-sug").css("display","none");
				}else{
					$("#sug").css("display","none");
					$("#no-sug").css("display","block");
				}
			})
		}
	}
}
function getContext(sid){
	$("#details div").remove();
	expressController.selectStorage(sid,function(data){
		var stordiv="";
		if(data!=null){
			stordiv+="<div class=\"col-sm-8\"><input type=\"hidden\" name=\"storId\" value="+data.storId+">快递单号：<b>"+data.storNum+"</b>&emsp;姓名：<b>"+data.storReceivername+"</b>&emsp;电话：<b>"+data.storReceiverphone+"</b></div>"
			$("#details").append(stordiv);
			$("#sug").css("display","none");
			$("#take").attr("disabled",false);
		}else{
			$("#take").attr("disabled",true);
		}
	})
}
$(function(){
	//取快递
	$("#take").click(function(){
		var storId=$("input[name=storId]").val();
		expressController.updateStorage(storId,function(data){
			if(data!=0){
				swal({
		            text: "成功收取快递",
		            type: "success",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#4cd964',
		            timer:2000,
		        })
			}else{
				swal({
		            text: "收取失败",
		            type: "error",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#f27474',
		            timer:2000,
		        })
			}
		})
		setTimeout("location.reload()",2500);
	})
})
