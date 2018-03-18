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
	    employeeController.selectAllcmptype(function(data){
			$("#cmptype_id [value!='']").remove();
			$("#cmptype_id").append("<option value=''>-----请选择类型-----</option>");	
			for(var i=0;i<data.length;i++){	
				$("#cmptype_id").append("<option value="+data[i].cmptypeId+">"+data[i].cmptypeName+"</option>");	
	    	}	
			var cmptypeIdMohu = $("#cmptypeIdMohu").val();
		    $("#cmptype").append("<option value=''>-----请选择类型-----</option>");	
		    for(var i=0;i<data.length;i++)
		    {
		    	$("#cmptype").append("<option value="+data[i].cmptypeId+">"+data[i].cmptypeName+"</option>");	
		    	if (data[i].cmptypeId == cmptypeIdMohu) 
		    	{
		    		$("#cmptype").find( "option[value='" + data[i].cmptypeId + "']").attr("selected", true);
		    	}
		   	}
		    form.render();
	    });
	});
  //------------------添加投诉----------------------
	$("#cmplaints-add").click(function(){
		if($("#cmptype_id").val()==null || $("#cmptype_id").val()=="")
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
				'投诉说明不能为空，请重新选择',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');	
				setTimeout(function(){//两秒后跳转
						$("#cmplaints_add").submit();
		       },2000);
		}	
	});
	//------------------用于修改任务状态----------------------
	$("#cmpStatus").change(function(){
			swal(' ',
				'修改成功',
				'success');
				setTimeout(function(){//两秒后跳转
						$("#cmplaints_update").submit();
		       },2000);
	});
});
//------------------查看投诉详情----------------------
function select(cid) {
	employeeController.cmplaints_selectKey(cid, function(data) {
		$("#cmpId").val(data.cmpId);
		$("#cmp-del").val(data.cmpId);
		$("#ownerphoto").attr("src","http://localhost:8080/wyht/img/"+data.owners.ophoto); 
		$("#ownername").html(data.owners.owername);
//		$("#cmp_owner_id").html(data.owners.hnum);
		$("#cmptypeId").html(data.cmptype.cmptypeName);
		$("#cmpContent").html(data.cmpContent);
		$("#cmpImg").attr("src","http://localhost:8080/wyht/img/"+data.cmpImg);
		$("#cmpStatus").empty();
		if(data.cmpStatus==0)
		{
			$("#cmpStatus").append("<option value='0' selected>未处理</option>")
			$("#cmpStatus").append("<option value='1'>已处理</option>")
		}else{
			$("#cmpStatus").append("<option value='0'>未处理</option>")
			$("#cmpStatus").append("<option value='1' selected>已处理</option>")
		}
	});
};
//------------------删除投诉内容----------------------
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
    			 employeeController.cmplaintsDel(cid,function(data){
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