$(function(){
	//------------------查出所有种类----------------------
	employeeController.task_all(function(data){
		$("#taskTapeTid").empty();
		$("#taskTapeTid").append("<option value=''>---请选择种类---</option>");	
		for(var i=0;i<data.length;i++)
		{
			$("#taskTapeTid").append("<option value="+data[i].tasktypeId+">"+data[i].tasktypeName+"</option>");		
		}
	});
	//------------------查出所有部门----------------------
	employeeController.selectAllDepartment(function(data){
		$("#dep").empty();
		$("#dep").append("<option value=''>---请选择部门---</option>");	
		$("#emp").append("<option value=''>---请选择负责人---</option>");	
		for(var i=0;i<data.length;i++)
		{
			$("#dep").append("<option value="+data[i].depId+">"+data[i].depName+"</option>");	
		}
	});
	//------------------查出所有业主----------------------
	
	$("#dep").change(function(){
		var depid = $("#dep").val();
		$("#emp [value!='']").remove();
		employeeController.selectEmployeeDep(depid,function(data){
			for(var i=0;i<data.length;i++)
			{
	 			$("#emp").append("<option value="+data[i].empId+">"+data[i].empName+"</option>")
			}
		});
	});
});