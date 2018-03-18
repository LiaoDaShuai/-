$(function(){
	//验证
	$(".verification").click(function(){
		var id=this.id;
		id=id.replace("save","");
		var expgsName=$("#expgsName"+id).val();
		if(expgsName.length==0){
			swal({
		          text: "请输入快递公司名称",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			if(id==2){
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
			setTimeout(function(){$("form[name=f"+id+"]").submit();},1500);
		}
	})
})
//管理
function cer_manage(expgsId,expgsCouriers){
	if(expgsCouriers==0){
		swal({
	          text: "快递人数为0",
	          type: "warning",
	          confirmButtonText: 'OK',
	          confirmButtonColor: '#f8bb86',
	          timer:1000,
	      })
	}else{
		window.location="/wyht/express/courier?couExpgsId="+expgsId;
	}
}
//删除
function after_delete(eid){
	swal({
        text: "您确定要删除当前内容？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function() {
    	expressController.delete_selectECompany(eid,function(datas){
			if(datas!=0){
				swal({
		            text: "该快递公司下还有"+datas+"个快递员",
		            type: "error",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#f27474',
		            timer:1000,
		        })
			}else{
				expressController.deleteECompany(eid,function(data){
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
				})
			}
			//延时刷新页面
			setTimeout("location.reload()",1500);
		})
    },function(dismiss){
        if(dismiss='cancel'){
            swal({
                text: "已取消",
                type: "warning",
                confirmButtonText: '确认',
                confirmButtonColor: '#FF8C00',
                timer:1000,
            })
        }
    })
}
//编辑
function edit(eid){
	expressController.editCompany(eid,function(data){
		dwr.util.setValue("expgsId3",data.expgsId);
		dwr.util.setValue("expgsName3",data.expgsName);
	})
}
//验证快递公司名称
function epnamever(){
	var expgsName=$("#expgsName2").val();
	expressController.selectECname(expgsName,function(data){
		if(data!=0){
			swal({
		          text: "快递公司名称已存在",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		      })
		}
	})
}
