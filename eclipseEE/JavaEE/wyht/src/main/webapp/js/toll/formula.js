$(function(){
	$(".div-scroll").niceScroll({
		 cursorcolor: '#CFCFCF',
		 horizrailenabled: false,
		 hidecursordelay: 0,
	})
})

//验证公式
function issubmit(form){
	var header=$(".header").html();
	header=header.replace("公式","");
	if($("input[name=formulaname]").val()==""){
		sweetAlert({text:'公式名不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=num1]").val()==""){
		sweetAlert({text:'数值1不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=num2]").val()==""){
		sweetAlert({text:'数值2不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=num3]").val()==""){
		sweetAlert({text:'数值3不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=remark]").val()==""){
		sweetAlert({text:'描述不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else{
		var formulaname=$("input[name=formulaname]").val();
		if(header=="修改"){
			var formulaid=$("input[name=formulaid]").val();
			tollController.isformulaName(formulaid,formulaname,function(data){
				if(data>0){
					sweetAlert({text:'该公式名已存在',type:'warning',timer:1500,showConfirmButton:false});
				}else{
					sweetAlert({
				        text: header+"成功",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				    });
					window.setTimeout(function(){form.submit()},2000);
				}
			});
		}
		else{
			tollController.isformulaname(formulaname,function(data){
				if(data>0){
					sweetAlert({text:'该公式名已存在',type:'warning',timer:1500,showConfirmButton:false});
				}else{
					sweetAlert({
				        text: header+"成功",
				        type: "success",
				        confirmButtonText: '确认',
				        confirmButtonColor: '#4cd964',
				    });
					window.setTimeout(function(){form.submit()},2000);
				}
			});
		}
	}
}