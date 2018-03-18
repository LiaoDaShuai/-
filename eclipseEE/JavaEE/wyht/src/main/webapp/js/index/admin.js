		$(function(){
			layui.use("form",function(){
				var form=layui.form;
				employeeController.selectAllDepartment(function(data){
					for(var i=0;i<data.length;i++){
						$("#dep").append("<option value='"+data[i].depId+"'>"+data[i].depName+"</option>")
					}
					form.render();
				});
				form.on("select(bumen)",function(data){
					$("#empl [value!='']").remove();
					employeeController.selectEmployee(data.value,function(data){
						for(var i=0;i<data.length;i++){
							$("#empl").append("<option value='"+data[i].empId+"'>"+data[i].empName+"</option>")
						}
						form.render();
					})
				})
				form.on("select(empl)",function(data){
					$("input[name=userPhone]").val("");
					$("input[name=userName]").val("");
					employeeController.emp_selectKey(data.value,function(data){
						$("input[name=userPhone]").val(data.empPhone);
						$("input[name=userName]").val(data.empName);
					})
				})
			});
		});
		function addAdmin(form) {
            if(form.userName.value==""||form.userName.value.length==0){
         	   sweetAlert({text:'用户不能为空',type:'warning',timer:1500,showConfirmButton:false});
				   return false;
            }else if(form.userPass.value==""||form.userPass.value.length==0){
         	   sweetAlert({text:'密码不能为空',type:'warning',timer:1500,showConfirmButton:false});
         	   return false;
            }else if($("#qued").val()==""||$("#qued").val().length==0){
            	sweetAlert({text:'确认密码不能为空',type:'warning',timer:1500,showConfirmButton:false});
         	   return false;
            }else if(form.userPass.value!=$("#qued").val()){
         	   sweetAlert({text:'确认密码与密码不相同',type:'warning',timer:1500,showConfirmButton:false});
         	   return false;
            }else{
            	autoController.isUser({userName:form.userName.value,userPhone:form.userPhone.value},function(data){
            		if(data<1){
	            		sweetAlert({
	            			text: "添加成功",
	            			type: "success",
	            			confirmButtonText: '确认',
	            			confirmButtonColor: '#4cd964',
            			});
            			window.setTimeout(function(){form.submit();},1500);
            		}else{
            			sweetAlert({text:'该用户名或账户已存在',type:'warning',timer:1500,showConfirmButton:false});
                  	   	return false;
            		}
            	})
            }
  		}
  		function delAdmin(userId){
  			swal({
  		        text: "您确定要删除该管理员及其权限？",
  		        type: "info",
  		        confirmButtonText: '确认',
  		        confirmButtonColor: '#3fc3ee',
  		        reverseButtons:true,
  		        focusCancel:true,
  		        showCancelButton:true,
  		        cancelButtonText:'取消',
  		    }).then(function(){
  		    	employeeController.delAdmin(userId,function(data){
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
  			});
  	  	}
  	  	function repass(userId){
  	  	  	var pwd="";
  	  	  	for(var i=0;i<6;i++){
  	  	  	  	pwd+=Math.floor(Math.random()*10);
  	  	  	}
  	  		swal({
		        text: "您确定要改管理员的密码重置为"+pwd+"?",
		        type: "info",
		        confirmButtonText: '确认',
		        confirmButtonColor: '#3fc3ee',
		        reverseButtons:true,
		        focusCancel:true,
		        showCancelButton:true,
		        cancelButtonText:'取消',
		    }).then(function(){
		    	employeeController.updatePwd({userId:userId,userPass:pwd},function(data){
		    		if(data!=0){
		    			swal({
		                    text: "重置成功！",
		                    type: "success",
		                    confirmButtonText: '确认',
		                    confirmButtonColor: '#4cd964',
		                    timer:1500,
		    			})
		    		}else{
		    			swal({
				            text: "重置失败！",
				            type: "error",
				            confirmButtonText: '确认',
				            confirmButtonColor: '#f27474',
				            timer:1500,
				        })
		    		}
		    	})
			});
  	  	}