$(function(){ 
    //------------------添加的查出所有部门----------------------(二级联动) 
	employeeController.selectAllDepartment(function(data){
		$("#dep").empty();
		$("#dep").append("<option value=''>--请选择部门--</option>");
		$("#emp").append("<option value=''>--请选择负责人--</option>");
		for (var i = 0; i < data.length; i++) {
			$("#dep").append("<option value="+data[i].depId+">"+ data[i].depName + "</option>");
		}
	});
	$("#dep").change(
			function() {
				var depid = $("#dep").val();
				$("#emp").empty();
				$("#emp").append("<option value=''>--请选择负责人--</option>");
				employeeController.selectEmployeeDep(depid, function(
						data) {
					for (var i = 0; i < data.length; i++) {
						$("#emp").append("<option value="+data[i].empId+">"+ data[i].empName+ "</option>")
					}
				});
	});
	//添加的图片上传
    $("#upload").click(function(){
             $("#file").click();
     });
    $("#file").change(function(){
         var file=this.files[0];
         var url = upload_img(file);
         $("#img").attr("src",url);
         $("#img").attr("hidden",null);
     });
	//------------------添加通告----------------------
	$("#internal-add").click(function(){
		if($("#dep").val()==null || $("#dep").val()=="")
		{
			swal(' ',
				'部门不能为空，请重新选择',
				'warning');
		}else if($("#emp").val()==null || $("#emp").val()=="")
		{
			swal(' ',
				'负责人不能为空，请重新选择',
				'warning');
		}else if($("#Content").val()==null || $("#Content").val()=="")
		{
			swal(' ',
				'内容不能为空，请重新选择',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');
				setTimeout(function(){//两秒后跳转
						$("#internal_add").submit();
		       },2000);
		}	
	});
	//------------------用于模糊----------------------
	employeeController.selectAllDepartment(function(data) {
		$("#interDepId").empty();
		$("#interDepId").append("<option value=''>--请选择部门--</option>");
		var interDepIdMohu = $("#interDepIdMohu").val();
		for (var i = 0; i < data.length; i++) {
			$("#interDepId").append("<option value="+data[i].depId+">"+ data[i].depName + "</option>");
			if (data[i].depId == interDepIdMohu) {
				$("#interDepId").find("option[value='" + data[i].depId + "']").attr("selected", true);
			}
		}
	});
	//------------------用于修改任务状态----------------------
	$("#interStatus").change(function(){
			swal(' ',
				'修改成功',
				'success');
				setTimeout(function(){//两秒后跳转
						$("#inter_update").submit();
		       },2000);
	});
});
//------------------查看内部通告信息----------------------
function internal_selectKey(interId) {
	employeeController.internal_selectKey(interId, function(data) {
		$("#inter-del").val(data.interId);
		$("#interId").val(data.interId);
		$("#empImg").attr("src","http://localhost:8080/wyht/img/"+data.employee.empPhoto); 
		$("#interEmpId").html(data.employee.empName);
		$("#internalDepId").html(data.department.depName);
//		$("#interYdate").html(data.interYdate);//出现不了
		$("#interContent").html(data.interContent);
		$("#interIntimg").attr("src","http://localhost:8080/wyht/img/"+data.interIntimg);
		$("#interStatus").empty();
		if(data.interStatus==0)
		{
			$("#interStatus").append("<option value='0' selected>未处理</option>")
			$("#interStatus").append("<option value='1'>已处理</option>")
		}else{
			$("#interStatus").append("<option value='0'>未处理</option>")
			$("#interStatus").append("<option value='1' selected>已处理</option>")
		}
	});
};
//------------------删除内部通告信息----------------------
function del(interId){
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
    			 employeeController.internalDel(interId,function(data){
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