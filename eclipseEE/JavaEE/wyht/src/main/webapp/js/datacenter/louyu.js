$(function(){
	//验证
	$(".verification").click(function(){
		var id=this.id;
		var str=id.substring(4);
		var disid=$("#disid"+str).val();
		var floorname=$("#floorname"+str).val();
		var units=$("#units"+str).val();
		var cengcount=$("#cengcount"+str).val();
		if(disid==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(floorname.length==0){
			swal({
		          text: "请填写楼宇名称",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(isNaN(units)){
			swal({
		          text: "单元层数有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(units.length==0){
			swal({
		          text: "请填写单元层数",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(units<0){
			swal({
		          text: "单元数量不能小于0",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(isNaN(cengcount)){
			swal({
		          text: "楼宇层数有误",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(cengcount.length==0){
			swal({
		          text: "请填写楼宇层数",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(cengcount<=0){
			swal({
		          text: "楼宇层数必须大于0",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			datacenterController.selectHLname(floorname,function(data){
				if(str==2){
					if(data!=0){
						swal({
					          text: "楼宇名称已存在",
					          type: "warning",
					          confirmButtonText: 'OK',
					          confirmButtonColor: '#f8bb86',
					          timer:1000,
					      })
					}else{
						swal({
					          text: "添加成功",
					          type: "success",
					          confirmButtonText: 'OK',
					          confirmButtonColor: '#4cd964',
					          timer:1000,
					      })
					      setTimeout(function(){$("#f"+str).submit();},1500);
					}
				}else{
					swal({
				          text: "修改成功",
				          type: "success",
				          confirmButtonText: 'OK',
				          confirmButtonColor: '#4cd964',
				          timer:1000,
				    })
				    setTimeout(function(){$("#f"+str).submit();},1500);
				}
			})
		}
	});
})
//搜索
function sousuo(){
	var sousuo=$("#ordinary").val();
	$("#advanced").val(sousuo);
	$("#f1").submit();
}
//清空
function clear_form(){
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#advanced").val("");
	$("#ordinary").val("");
	$("#f1").submit();
}
//管理
function manage(hlid,disid,units){
	if(units==0){
		swal({
	          text: "单元数量为0",
	          type: "warning",
	          confirmButtonText: 'OK',
	          confirmButtonColor: '#f8bb86',
	          timer:1000,
	      })
	}else{
		window.location="/wyht/unit/all?hlid="+hlid+"&disid="+disid+"&unitname=";
	}
}
//编辑
function edit(hlid) {
	datacenterController.edithouselou(hlid,function(data){
		dwr.util.setValue("hlid3",data.hlid);
		$("#disid3").find("option[value="+data.disid+"]").attr("selected",true);
		dwr.util.setValue("floorname3",data.floorname);
		dwr.util.setValue("units3",data.units);
		dwr.util.setValue("cengcount3",data.cengcount);
		dwr.util.setValue("floortype3",data.floortype);
		dwr.util.setValue("structure3",data.structure);
		dwr.util.setValue("remark3",data.remark);
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
}
//删除楼宇
function after_delete(hlid){
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
    	datacenterController.delete_selecthouse(hlid,function(data){
			if(data!=0){
				swal({
		            text: "该楼宇下还有"+data+"个关联的房屋",
		            type: "warning",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#FF8C00',
		            timer:1000,
		        })
			}else{
				datacenterController.delete_houselou(hlid,function(data){
					if(data!=0){
						swal({
				            text: "删除成功！",
				            type: "success",
				            confirmButtonText: '确认',
				            confirmButtonColor: '#4cd964',
				            timer:1000,
				        })
					}
				})
			}
			//延时刷新页面
			setTimeout("location.reload()",1500);
		})
    },function(dismiss){
        if(dismiss='cancel') {
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