$(function(){
	 //------------------添加的查出所有业主----------------------(二级联动) 
	employeeController.selectownersname(function(data){
		$("#owners").empty();
		$("#owners").append("<option value=''>-----请选择业主-----</option>");
		for (var i = 0; i < data.length; i++) {
			$("#owners").append("<option value="+data[i].oid+">"+data[i].owername+"</option>");
		}
	});
	
	//------------------添加通告----------------------
	$("#message-add").click(function(){
		if($("#owners").val()==null || $("#owners").val()=="")
		{
			swal(' ',
				'业主不能为空，请重新选择',
				'warning');
		}else if($("#Title").val()==null || $("#Title").val()=="")
		{
			swal(' ',
				'事件名称不能为空，请重新输入',
				'warning');
		}else if($("#Context").val()==null || $("#Context").val()=="")
		{
			swal(' ',
				'事件内容不能为空，请重新选择',
				'warning');
		}else{
			swal(' ',
				'添加成功',
				'success');	
				setTimeout(function(){//两秒后跳转
						$("#message_add").submit();
		       },2000);
		}	
	});
});
//------------------查看详情信息----------------------
function select(mesId) {
	employeeController.message_selectKey(mesId,function(data) {
				$("#mesName").html(data.mesName);
				$("#mesContext").html(data.mesContext);
				//修改和删除操作
				$('#mes-del').val(data.mesId);
				$("#ownername").html(data.owners.owername);
				$('#ophoto').attr("src","http://localhost:8080/wyht/img/"+data.owners.ophoto);
			});
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
    			 employeeController.messageDel(empid,function(data){
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