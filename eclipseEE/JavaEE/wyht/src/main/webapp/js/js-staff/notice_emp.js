$(function(){
	//------------------三级联动----------------------
	employeeController.selectAllDepartment(function(data) {
		$("#dep").empty();
		$("#dep").append("<option value=''>-----请选择部门-----</option>");
		$("#post").append("<option value=''>-----请选择岗位-----</option>");
		$("#emp").append("<option value=''>----------请选择员工----------</option>");
		for (var i = 0; i < data.length; i++) {
			$("#dep").append("<option value="+data[i].depId+">"+data[i].depName+"</option>");
		}
	});
	$("#dep").change(
			function() {
				var depid = $("#dep").val();
//				$("#post").empty();
				$("#post [value!='']").remove();
				employeeController.selectPost(depid, function(data) {
					for (var i = 0; i < data.length; i++) {
						$("#post").append(
								"<option value="+data[i].postId+">"
										+ data[i].postName
										+ "</option>")}
				});
			});
	$("#post").change(
			function() {
				var postid = $("#post").val();
//				$("#emp").empty();
				$("#emp [value!='']").remove();
				employeeController.selectEmployee(postid,
						function(data) {
							for (var i = 0; i < data.length; i++) {
								$("#emp").append(
										"<option value="+data[i].empId+">"
												+ data[i].empName
												+ "</option>")
							}
						});
			});
	//------------------添加通知----------------------
	$("#notice-add").click(function(){
		if($("#dep").val()==null || $("#dep").val()=="")
		{
			swal(' ',
				'部门不能为空，请重新选择',
				'warning');
		}else if($("#post").val()==null || $("#post").val()=="")
		{
			swal(' ',
				'岗位不能为空，请重新选择',
				'warning');
		}else if($("#emp").val()==null || $("#emp").val()=="")
		{
			swal(' ',
				'员工不能为空，请重新选择',
				'warning');
		}else if($("#Title").val()==null || $("#Title").val()=="")
		{
			swal(' ',
				'标题不能为空，请重新输入',
				'warning');
		}else if($("#Context").val()==null || $("#Context").val()=="")
		{
			swal(' ',
				'内容不能为空，请重新输入',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');
				setTimeout(function(){//两秒后跳转
						$("#notice_add").submit();
		       },2000);
		}	
	});
});
//------------------查看详情----------------------
function notice_selectKey(intnotId) {
	employeeController.internalnotice_selectKey(intnotId,function(data) {
				//修改和删除操作
				$('#notice-del').val(data.intnotEmpId);
				$("#interEmpId").html(data.employee.empName);
				$('#empImg').attr("src","http://localhost:8080/wyht/img/"+data.employee.empPhoto);
				$("#intnotDate").html(data.intnotDate);
				$("#intnotName").html(data.intnotName);
				$("#intnotContext").html(data.intnotContext);
			});
}
//------------------删除通知----------------------
function del(intnotId){
	swal({
           title: '你确定要删除吗?',
           type: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: '是的!',
           cancelButtonText:'取消'
       }).then(function () {
    	   swal('删除成功',
    			'',
    			'success')
    			 employeeController.Internalnoticedel(intnotId,function(data){
    				 setTimeout(function(){//两秒后跳转
    					 location.reload();
                     },2000);
				  })
    			},
    			function (dismiss) {
    			  if (dismiss === 'cancel') {
    			    swal('删除失败',
    			      '',
    			      'error')
    			  }
    			});
};