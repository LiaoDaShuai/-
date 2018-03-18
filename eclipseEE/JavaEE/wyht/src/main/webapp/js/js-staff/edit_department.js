$(function(){
	//------------------添加和验证岗位是否重复----------------------
	$("#post-add").click(function(){
		if($("#postName").val()==null || $("#postName").val()=="")
		{
			swal(' ',
				'部门名称不能为空，请重新输入',
				'warning');
		}else{
			var postName = $("#postName").val();
			var falg=0;
			employeeController.yz_postName(postName,function(data){	
				falg = data;
				if(falg==0){
					swal(' ',
						'添加成功',
						 'success');
					 setTimeout(function(){//两秒后跳转
							$("#post_add").submit();
                     },2000);
					}else{
						swal(' ',
							'部门已存在，请重新添加',
							'warning');
					}
			});
		}
	});
	
	//------------------修改和验证岗位是否重复----------------------
	$("#post-update").click(function(){
		if($("#post_name").val()==null || $("#post_name").val()=="")
		{
			swal(' ',
				'部门名称不能为空，请重新输入',
				'warning');
		}else{
			var postName = $("#post_name").val();
			var falg=0;
			employeeController.yz_postName(postName,function(data){	
				falg = data;
				if(falg==0){
					swal(' ',
						'修改成功',
						 'success');
					 setTimeout(function(){//两秒后跳转
							$("#post_update").submit();
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
	//------------------编辑显示岗位----------------------
	function edit(postId)
	{
		employeeController.PostEdit(postId,function(data){
					$('#post_id').val(data.postId);
	    			$('#post_name').val(data.postName);
		});
	};
	//------------------删除部门----------------------
	function del(postId){
		swal({
	           title: '你确定要删除吗?',
	           type: 'warning',
	           showCancelButton: true,
	           confirmButtonColor: '#3085d6',
	           cancelButtonColor: '#d33',
	           confirmButtonText: '是的!',
	           cancelButtonText:'取消'
	       }).then(function () {
	    	   		swal('',
	    			    '删除成功',
	    			    'success');
	    			 employeeController.departmentDelete(postId,function(data){
	    				 setTimeout(function(){//两秒后跳转
	    					 location.reload();
	                     },2000);
					  })
	    			},
	    			function (dismiss) {
	    			  if (dismiss === 'cancel') {
	    			    swal('',
	    			      '删除失败',
	    			      'error')
	    			  }
	      		 });
	};