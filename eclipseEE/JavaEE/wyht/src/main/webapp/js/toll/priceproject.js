
//验证收费项目
function issubmit(form){
	var header=$(".header").html();
	header=header.replace("收费项目","");
	if($("input[name=pricename]").val()==""){
		sweetAlert({text:'项目名不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=remark]").val()==""){
		sweetAlert({text:'备注不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=latetian]").val()==""){
		sweetAlert({text:'天数不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if($("input[name=latefee]").val()==""){
		sweetAlert({text:'收取比例不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else{
		var pricename=$("input[name=pricename]").val();
		if(header=="修改"){
			var priceid=$("input[name=priceid]").val();
			tollController.ispricename(priceid,pricename,function(data){
				if(data>0){
					sweetAlert({text:'该收费名已存在',type:'warning',timer:1500,showConfirmButton:false});
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
			tollController.ispricename(pricename,function(data){
				if(data>0){
					sweetAlert({text:'该收费名已存在',type:'warning',timer:1500,showConfirmButton:false});
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
//验证添加收费标准
function isChargsubmit(form){
	var header=$(".price-header").html();
	header=header.replace("收费标准","");
	if(form.chargname.value==""){
		sweetAlert({text:'收费标准名不能为空',type:'warning',timer:1500,showConfirmButton:false});
	}else if(form.shouid.value==0){
		if(form.pricing.value==""||form.pricing.value==0){
			sweetAlert({text:'收费单价不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'收费单价必须为数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else if(form.priceweek.value==""||form.priceweek.value==0){
			sweetAlert({text:'该收费周期不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'该收费周期必须是数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else{
			sweetAlert({
		        text: header+"成功",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		    });
			window.setTimeout(function(){form.submit()},2000);
		}
	}else if(form.shouid.value==2){
		if(form.fixedprice.value=""||form.fixedprice.value==0){
			sweetAlert({text:'固定金额不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'固定金额必须为数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else if(form.priceweek.value==""||form.priceweek.value==0){
			sweetAlert({text:'该收费周期不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'该收费周期必须是数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else{
			
			sweetAlert({
		        text: header+"成功",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		    });
			window.setTimeout(function(){form.submit()},2000);
		}
	}else if(form.shouid.value==3){
		if(form.formula_id.value=""){
			sweetAlert({text:'请选择公式',type:'warning',timer:1500,showConfirmButton:false});
		}else if(form.priceweek.value==""||form.priceweek.value==0){
			sweetAlert({text:'该收费周期不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'该收费周期必须是数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else{
			sweetAlert({
		        text: header+"成功",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		    });
			window.setTimeout(function(){form.submit()},2000);
		}
	}else{
		if(form.priceweek.value==""||form.priceweek.value==0){
			sweetAlert({text:'该收费周期不能为空且不能为0',type:'warning',timer:1500,showConfirmButton:false});
		}else if(isNaN(form.pricing.value)){
			sweetAlert({text:'该收费周期必须是数字类型',type:'warning',timer:1500,showConfirmButton:false});
		}else{
			sweetAlert({
		        text: header+"成功",
		        type: "success",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#4cd964',
		    });
			window.setTimeout(function(){form.submit()},2000);
		}
	}
	
}