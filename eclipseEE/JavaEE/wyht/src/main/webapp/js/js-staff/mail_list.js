$(function(){
		var reg = new RegExp("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$");
		//------------------添加员工----------------------
		$("#add").click(function(){
				if($("#empName").val()==null || $("#empName").val()=="")
				{
					swal(' ',
						'员工名称不能为空，请重新输入',
						'warning');
				}else if($("#dep").val()==null || $("#dep").val()=="")
				{
					swal(' ',
						'部门不能为空，请重新选择',
						'warning');
				}else if($("#post").val()==null || $("#post").val()=="")
				{
					swal(' ',
						'岗位不能为空，请重新选择',
						'warning');
				}else if($("#empPhone").val().length!=11){
					swal(' ',
							'手机号码格式不对，请重新输入',
							'warning');
				}else if(!reg.test($("#empEmail").val()))
				{
							swal(' ',
								'邮箱格式不正确，请重新输入',
								'warning');
				}
				else{
					swal(' ',
						'添加成功',
						'success');
							 setTimeout(function(){//两秒后跳转
									$("form[name=staff_add]").submit();
				            },2000);
				}	
		}); 
		//-----------------添加和修改时的二级联动----------------
		layui.use('form', function(){
			var form=layui.form;
			form.on('select(depSelect)',function(da){
				$("#post [value!='']").remove(); 
				$("#edit-empPostId [value!='']").remove();
				employeeController.selectPost(da.value,function(data){
					for(var i=0;i<data.length;i++)
					{
			 			$("#post").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
			 			$("#edit-empPostId").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
					}
					form.render();
				});
			});
		});
		//------------------修改员工----------------------
		$("#staff-update").click(function(){
			if($("#edit-empName").val()==null || $("#edit-empName").val()=="")
			{
				swal(' ',
					'员工名称不能为空，请重新输入',
					'warning');
			}else if($("#edit-empDepId").val()==null || $("#edit-empDepId").val()=="")
			{
				swal(' ',
					'部门不能为空，请重新选择',
					'warning');
			}else if($("#edit-empPostId").val()==null || $("#edit-empPostId").val()=="")
			{
				swal(' ',
					'岗位不能为空，请重新选择',
					'warning');
			}else if($("#edit-empPhone").val().length!=11){
				swal(' ',
						'手机号码格式不对，请重新输入',
						'warning');
			}else if(!reg.test($("#edit-empEmail").val()))
			{
						swal(' ',
							'邮箱格式不正确，请重新输入',
							'warning');
			}
			else{
				swal(' ',
					'修改成功',
							 'success');
						 setTimeout(function(){//两秒后跳转
								$("#staff_update").submit();
			            },2000);
			}	
		});
		//-----------------添加时的二级联动----------------
//		$("#dep").change(function(){
//			var depid = $("#dep").val();
//			$("#post [value!='']").remove();
//			employeeController.selectPost(depid,function(data){
//				for(var i=0;i<data.length;i++)
//				{
//		 			$("#post").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
//				}
//			});
//		});
		//-----------------修改时的二级联动----------------
//		$("#edit-empDepId").change(function(){
//			var depid = $("#edit-empDepId").val();
//			if(depid!="" && depid!=null)
//			{
//				$("#edit-empPostId").empty();
//				employeeController.selectPost(depid,function(data){
//					for(var i=0;i<data.length;i++)
//					{
//			 			$("#edit-empPostId").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
//					}
//				});
//			}
//		});
//        //添加的图片上传
//        $("#upload").click(function(){
//                 $("#file").click();
//         });
//        $("#file").change(function(){
//             var file=this.files[0];
//             var url = upload_img(file);
//             $("#img").attr("src",url);
//             $("#img").attr("hidden",null);
//         });
//         //修改的图片上传
//         $("#edit-upload").click(function(){
//               $("#edit-file").click();
//       	 });
//         $("#edit-file").change(function(){
//           var file=this.files[0];
//           var url = upload_img(file);
//           $("#edit-img").attr("src",url);
//         });
//       	 //头像的图片上传，还没做好
//         $("#staff-photo").click(function(){
//             $("#img-file").click(); 
//         });
//         $("#img-file").change(function(){
//             var file=this.files[0];
//             var url = upload_img(file);
//             $("#staff-photo").attr("src",url);
//         });
	});

//------------------查看员工信息----------------------
function emp_selectKey(empid)
{
	employeeController.emp_selectKey(empid,function(data){	
			$('#staff-edit').val(data.empId);
			$('#staff-del').val(data.empId);
			$('#staff-ename').html(data.empName);
			$('#staff-dname').html(data.deparement.depName);	
			$('#staff-pname').html(data.post.postName);
			$('#staff-ephone').html(data.empPhone);
			$('#staff-eremark').html(data.empRemark);
			$('#staff-photo').attr("src","http://localhost:8080/wyht/img/"+data.empPhoto); 
			if(data.empStatus=="1")
			{
				$('#staff-estatus').html("在职");
			}else
			{
				$('#staff-estatus').html("离岗");
			}
		})
}
//------------------删除员工----------------------
function del(empid){
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
    			    '删除成功',
    			    '',
    			    'success'
    			  )
    			 employeeController.EmployeeDelete(empid,function(data){
    				 setTimeout(function(){//两秒后跳转
    					 location.reload();
                     },2000);
				  })
    			},
    			function (dismiss) {
    			  if (dismiss === 'cancel') {
    			    swal(
    			      '删除失败',
    			      '',
    			      'error'
    			    )
    			  }
      		 })
};
//------------------编辑员工信息----------------------
function edit(empid){
	layui.use('form', function(){
	var form=layui.form;
		employeeController.emp_selectKey(empid,function(data){	
			$('#edit-empId').val(data.empId);	
			$('#edit-empName').val(data.empName);
			var empDepId = data.empDepId;
			var empPostId = data.empPostId;
			$("#edit-empDepId [value!='']").remove();
			$("#edit-empPostId [value!='']").remove();
			$("#edit-empStatus [value!='']").remove();
			employeeController.selectAll_dep(empDepId,function(data){
				for(var i=0;i<data.length;i++)
				{
					$("#edit-empDepId").append("<option value="+data[i].depId+">"+data[i].depName+"</option>");	
					if(data[i].depId==empDepId)
					{
						$("#edit-empDepId").find("option[value='"+data[i].depId+"']").attr("selected",true);
					}
				}
				form.render();
			});
			employeeController.selectAll_post(empDepId,empPostId,function(data){
				for(var i=0;i<data.length;i++)
				{
					$("#edit-empPostId").append("<option value="+data[i].postId+">"+data[i].postName+"</option>");	
					if(data[i].postId==empPostId)
					{
						$("#edit-empPostId").find("option[value='"+data[i].postId+"']").attr("selected",true);
					}
				}
				form.render();
			});
			$('#edit-empPhone').val(data.empPhone);
			$('#edit-empEmail').val(data.empEmail);
			$('#edit-empRemark').val(data.empRemark);
			$('#img1').attr("src","http://localhost:8080/wyht/img/"+data.empPhoto);
			if(data.empStatus==1)
			{
				$('#edit-empStatus').append("<option value="+data.empStatus+">在职</option>")
				$('#edit-empStatus').append("<option value='0'>离岗</option>")
			}else
			{
				$('#edit-empStatus').append("<option value="+data.empStatus+">离岗</option>")
				$('#edit-empStatus').append("<option value='1'>在职</option>")
			}
		});
	});
};
//------------------JQ里的显示的条数----------------------
//$("#tiaoshu").change(function(){
//	var size = $("#tiaoshu").val();
//	$("input[name=pageSize]").val(size);
//	$("form[name=f1]").submit();
//});

//function Fenye(num){
//	var total='${page.lastPage}';
//	if(num<1){
//		num=1;
//	}if(num>total){
//		num=total;
//	}
//	$("input[name=pageNum]").val(num);
//	$("form[name=f1]").submit();
//}