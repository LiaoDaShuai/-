$(function(){
    		//------------------添加和验证部门是否重复----------------------
			$("#dep-add").click(function(){
				if($("#depName").val()==null || $("#depName").val()=="")
				{
					swal(' ',
						'部门名称不能为空，请重新输入',
						'warning');
				}else{
					var depName = $("#depName").val();
					var falg=0;
					employeeController.yz_depName(depName,function(data){	
						falg = data;
						if(falg==0){
							swal(' ',
								'添加成功',
								 'success');
							 setTimeout(function(){//两秒后跳转
									$("#dep_add").submit();
		                     },2000);
							}else{
								swal(' ',
									'部门已存在，请重新添加',
									'warning');
							}
					});
				}
			});
    	});	
    	//------------------删除部门----------------------
    	function del(depId){
    		swal({
    	           title: '你确定要删除吗?',
    	           type: 'warning',
    	           showCancelButton: true,
    	           confirmButtonColor: '#3085d6',
    	           cancelButtonColor: '#d33',
    	           confirmButtonText: '是的!',
    	           cancelButtonText:'取消'
    	       }).then(function () {
    	    	   swal(
    	    			    '',
    	    			    '删除成功',
    	    			    'success'
    	    			  );
    	    			 employeeController.DepartmentDelete(depId,function(data){
    	    				 setTimeout(function(){//两秒后跳转
    	    					 location.reload();
    	                     },2000);
    					  })
    	    			},
    	    			function (dismiss) {
    	    			  if (dismiss === 'cancel') {
    	    			    swal(
    	    			      '',
    	    			      '删除失败',
    	    			      'error'
    	    			    )
    	    			  }
    	      		 });
    	};