$(function(){
	//添加和修改时验证
	$(".verification").click(function(){
		var id=this.id;
		var str=id.substring(4);
		var unitname=$("#unitname"+str).val();
		if(unitname.length==0){
			swal({
		          text: "请填写单元名称",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			if(str==2){
				swal({
			          text: "添加成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
			      })
			}else{
				swal({
			          text: "修改成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
			      })
			}
	      setTimeout(function(){$("#f"+str).submit();},1500);
		}
	})
})

//删除
function after_delete(unitid,disid,hlid){
	swal({
        text: "您确定要删除当前内容？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function(){
    	datacenterController.delete_unit({unitid:unitid,disid:disid,hlid:hlid},function(data){
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
        
    },function(dismiss) {
        if(dismiss = 'cancel') {
            swal({
                text: "已取消",
                type: "warning",
                confirmButtonText: '确认',
                confirmButtonColor: '#FF8C00',
            })
        }
    })
}
//清空
function clear_form(){
	$("input[name='unitname']").val("");
	$("#f1").submit();
}
//添加
function insert(){
	$("#dd").val($("#disid1").val());
	$("#hd").val($("#hlid1").val());
}
//编辑
function edit(unitid,unitname,disid,hlid){
	$("#unitid").val(unitid);
	$("#unitname3").val(unitname);
	$("#disid").val(disid);
	$("#hlid").val(hlid);
}