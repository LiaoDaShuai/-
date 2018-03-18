$(function(){
	layui.use('form',function(){
		var form=layui.form;
		 //------------------一开始 添加的查出所有业主---------------------- 
		employeeController.selectownersname(function(data){
			$("#cmp_owners_oid [value!='']").remove();
			$("#cmp_owners_oid").append("<option value=''>-----请选择业主-----</option>");
			for (var i = 0; i < data.length; i++) {
				$("#cmp_owners_oid").append("<option value="+data[i].oid+">"+data[i].owername+"</option>");
			}
			form.render();
		});
	    //一开始把所有类型查出来
	    employeeController.selectAllwartype(function(data){
	    	$("#wartype_id [value!='']").remove();
			$("#wartype_id").append("<option value=''>---请选择类型---</option>");	
	    	for(var i=0;i<data.length;i++)
	    	{
	    		$("#wartype_id").append("<option value="+data[i].wartypeId+">"+data[i].wartypeName+"</option>");		
	    	}
			var wartypeIdMohu = $("#wartypeIdMohu").val();
	    	$("#wartype").append("<option value=''>---请选择类型---</option>");	
	    	for(var i=0;i<data.length;i++)
	    	{
	    		$("#wartype").append("<option value="+data[i].wartypeId+">"+data[i].wartypeName+"</option>");	
	    		if (data[i].wartypeId == wartypeIdMohu) {
					$("#wartype").find( "option[value='" + data[i].wartypeId + "']").attr("selected", true);
				}
	    	}
	    	var warStatusMohu = $("#warStatusMohu").val(); 
			$("#warstatus").find( "option[value='" + warStatusMohu  + "']").attr("selected", true);
			form.render();
	    });
	});
   
  //------------------添加投诉----------------------
	$("#cmplaints-add").click(function(){
		if($("#wartype_id").val()==null || $("#wartype_id").val()=="")
		{
			swal(' ',
				'类型不能为空，请重新选择',
				'warning');
		}else if($("#cmp_owners_oid").val()==null || $("#cmp_owners_oid").val()=="")
		{
			swal(' ',
				'业主不能为空，请重新选择',
				'warning');
		}else if($("#Context").val()==null || $("#Context").val()=="")
		{
			swal(' ',
				'报修说明不能为空，请重新选择',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');	
				setTimeout(function(){//两秒后跳转
						$("#warranty_add").submit();
		       },2000);
		}	
	});
	//------------------用于修改任务状态----------------------
	$("#warStatus").change(function(){
			swal(' ',
				'修改成功',
				'success');
				setTimeout(function(){//两秒后跳转
						$("#war_update").submit();
		       },2000);
	});
	 //------------------添加维修人员----------------------
	$("#warranty-update").click(function(){
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
				'维修人员不能为空，请重新选择',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');	
				setTimeout(function(){//两秒后跳转
					$("#warranty_update").submit();
		       },2000);
		}	
	});
});
//------------------查看投诉详情----------------------
function select(warId) {
	employeeController.warranty_selectKey(warId, function(data) {
		$("#warId").val(data.warId);
		$("#war-del").val(data.warId);
		$("#ownerphoto").attr("src","http://localhost:8080/wyht/img/"+data.owners.ophoto); 
		$("#ownername").html(data.owners.owername);
		$("#hnum").html(data.hnum);
		$("#wartypeId").html(data.wartype.wartypeName);
		$("#warContent").html(data.warContent);
		$("#warImg").attr("src","http://localhost:8080/wyht/img/"+data.warImg);
		for(var i=0; i<=5;i++)
		{
			if(i==data.warStatus)
			{
				$("#warStatus").find("option[value='"+i+"']").attr("selected",true);
			}
		}
		if(data.warserviceId==null)
		{
			$("#warserviceId").html("还未安排维修人员");
		}else{
			$("#warserviceId").html(data.emp.empName);
		}
	});
};

function update(warId) {
	employeeController.warranty_selectKey(warId, function(data) {
//		$("#war-del").val(data.warId);
		$("#war-update").val(data.warId);
	});
};

//------------------删除报修内容----------------------
function del(cid){
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
    			 employeeController.warrantyDel(cid,function(data){
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
//------------------三级联动----------------------
	employeeController.selectAllDepartment(function(data) {
		$("#dep [value!='']").remove();
		$("#dep").append("<option value=''>-----请选择部门-----</option>");
		for (var i = 0; i < data.length; i++) {
			$("#dep").append("<option value="+data[i].depId+">"+data[i].depName+"</option>");
		}
	});
//	$("#dep").change( function() {
//				var depid = $("#dep").val(); 
//				$("#post [value!='']").remove();
//				employeeController.selectPost(depid, function(data) {
//					for (var i = 0; i < data.length; i++) {
//						$("#post").append("<option value="+data[i].postId+">"+data[i].postName+"</option>")
//					}
//				});
//			});
//	$("#post").change(function() {
//				var postid = $("#post").val(); 
//				$("#emp [value!='']").remove();
//				employeeController.selectEmployee(postid,function(data) {
//							for (var i = 0; i < data.length; i++) {
//								$("#emp").append("<option value="+data[i].empId+">"+ data[i].empName+ "</option>")
//							}
//						});
//			});