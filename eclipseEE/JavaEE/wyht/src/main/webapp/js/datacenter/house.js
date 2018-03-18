$(function(){
	layui.use('laydate',function(){
		var laydate=layui.laydate;
		laydate.render({
			elem:'#startdate2',
			type:'date',
			done:function(value,data,endDate){
				$("#startdate2").val(value);
			}
		});
		laydate.render({
			elem:'#startdate3',
			type:'date',
			done:function(value,data,endDate){
				$("#startdate3").val(value);
			}
		});
	})
    //验证
    $(".verification").click(function(){
    	var id=this.id;
    	var str=id.substring(4);
    	var disid=$("#disid"+str).val();
    	var hlid=$("#hlid"+str).val();
    	var unitid=$("#unitid"+str).val();
    	var louceng=$("#louceng"+str).val();
    	var hnum=$("#hnum"+str).val();
    	var zarea=$("#zarea"+str).val();
    	var utype=$("#utype"+str).val();
    	if(disid==0){
    		swal({
    	          text: "请选择小区",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(hlid==0){
    		swal({
    	          text: "请选择楼宇",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(unitid==0){
    		swal({
    	          text: "请选择单元",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(isNaN(louceng)){
    		swal({
    	          text: "楼层不是数字",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(louceng.length==0){
    		swal({
    	          text: "请填写楼层",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(louceng<0){
    		swal({
    	          text: "楼层不能小于0",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(hnum.length==0){
    		swal({
    	          text: "门牌号不能为空",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(isNaN(zarea)){
    		swal({
    	          text: "建筑面积输入有误",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(zarea.length==0){
    		swal({
    	          text: "建筑面积不能为空",
    	          type: "warning",
    	          confirmButtonText: 'OK',
    	          confirmButtonColor: '#f8bb86',
    	          timer:1000,
    	      })
    	}else if(utype==0){
    		swal({
  	          text: "请选择房屋类型",
  	          type: "warning",
  	          confirmButtonText: 'OK',
  	          confirmButtonColor: '#f8bb86',
  	          timer:1000,
  	      	})
    	}else{
    		if(str==3){
    			//成功修改房屋
    			swal({
			          text: "修改成功",
			          type: "success",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#4cd964',
			          timer:1000,
			    })
			    setTimeout(function(){$("#f"+str).submit();},1500);
    		}else{
    			$("#myModal"+str).modal("hide");
    			str=str+str;
    			$("#myModal"+str).modal("show");
    		}
    	}
    })
    //成功添加房屋
    $(".sub").click(function(){
    	swal({
          text: "添加成功",
          type: "success",
          confirmButtonText: 'OK',
          confirmButtonColor: '#4cd964',
          timer:1000,
        })
        setTimeout(function(){$("#f2").submit();},1500);
    })
    //导入验证
    $(".impver").click(function(){
    	var did=$("#disid4").val();
    	var hlid=$("#hlid4").val();
    	var unitid=$("#unitid4").val();
		var efile=$("#excelFile").val();
		if(did==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(hlid==0){
			swal({
		          text: "请选择楼宇",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(unitid==0){
			swal({
		          text: "请选择单元",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(efile==""){
			swal({
		          text: "请选择文件",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else{
			swal({
		          text: "导入成功",
		          type: "success",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#4cd964',
		          timer:1000,
	        })
	        setTimeout(function(){$("#f4").submit();},1500);
		}
    })
    //小区下拉框发生改变时
    $(".sel_1").change(function(){
    	$(".sel_2 option[value!='0']").remove();//清空楼宇下拉框
    	$(".sel_3 option[value!='0']").remove();//清空单元下拉框
    	var id=this.id;
    	var n=id.replace("disid","");
    	var disid=$("#"+id).val();
    	if(disid!=0){
    		selectlouyu(disid,n);
    	}
    });
	//楼宇下拉框发生改变时
    $(".sel_2").change(function(){
    	$(".sel_3 option[value!='0']").remove();//清空单元下拉框
    	$(".sel_5").val();//清空文本框
    	var id=this.id;
    	var x=id.replace("hlid","");
    	var disid=$("#disid"+x).val();
    	var hlid=$("#"+id).val();
    	var louyu=$("#"+id).find("option:selected").text()+"-";
    	$("#hnum"+x).val(louyu);
    	if(disid!=0&&hlid!=0){
    		selectunit(disid,hlid,x);
    	}
    });
    //当单元下拉框发生改变时
    $(".sel_3").change(function(){
    	$(".sel_5").val();//清空文本框
    	var id=this.id;
    	var x=id.replace("unitid","");
    	var louyu=$("#hlid"+x).find("option:selected").text()+"-";
    	var unit=$("#"+id).find("option:selected").text()+"-";
    	$("#hnum"+x).val(louyu+unit);
    });
    //当楼层数键入时
    $(".sel_4").keyup(function(){
    	$(".sel_5").val();//清空文本框
    	var id=this.id;
    	var x=id.replace("louceng","");
    	var louyu=$("#hlid"+x).find("option:selected").text()+"-";
    	var unit=$("#unitid"+x).find("option:selected").text()+"-";
    	var ceng=$("#"+id).val()+"-";
    	$("#hnum"+x).val(louyu+unit+ceng);
    });
    //绑定住户--->保存
    $(".fake-save").on("click",function(){
    	var ocd=$(".cardid2 option:selected").val();
    	var hid=$("#fanid2").val();
    	var chk=[];//定义一个空数组
    	var oid=$("input[name='get_c']:checked").each(function(i){
			chk[i]=$(this).val();
        });
        var count=0;
        for(var i=0;i<chk.length;i++){
    	datacenterController.insert_binding({ownerId:chk[i],ownercard:ocd,houseId:hid},function(data){
    		count+=data;	
		});
		if(i==chk.length-1){
    		if(count<1){
    			swal({
    	            text: "保存成功！",
    	            type: "success",
    	            confirmButtonText: '确认',
    	            confirmButtonColor: '#4cd964',
    	            timer:1500,
    	        }).then(function(){
    	            $(".user_info").hide();
    	        })
    		}else{
    			sweetAlert({
    	            text: "该房屋已绑定该住户！",
    	            type: "warning",
    	            timer:2000,
    	            showConfirmButton:false,
    	        })
        	}
		}
        }
    });
});
//编辑
function edit(fanid,disid,hlid){
	selectlouyu(disid,3);
	selectunit(disid,hlid,3);
	datacenterController.selecthf(fanid,function(data){
		dwr.util.setValue("fanid3",fanid);
		dwr.util.setValue("louceng3",data.louceng);
		dwr.util.setValue("hnum3",data.hnum);
		dwr.util.setValue("zarea3",data.zarea);
		dwr.util.setValue("tarea3",data.tarea);
		dwr.util.setValue("garea3",data.garea);
		$("#utype3").find("option[value="+data.utype+"]").attr("selected",true);
		dwr.util.setValue("hchaoxiang3",data.hchaoxiang);
		dwr.util.setValue("startdate3",data.startdates);
		dwr.util.setValue("cyear3",data.cyear);
		if(data.fujian!=null){
			$("#img1").attr("src","/wyht/img/"+data.fujian);
			$("#img1").removeClass("hide");
		}
		dwr.util.setValue("remark3",data.remark);
		layui.use('form', function(){
			var form=layui.form;
			$("#disid3").find("option[value="+data.disid+"]").attr("selected",true);
			datacenterController.selectly(data.disid,function(datas){
	    		for(var i=0;i<datas.length;i++) {  
	    			$("#hlid3").append("<option value='"+datas[i].hlid+"'>"+datas[i].floorname+"</option>");
	            }
	    		$("#hlid3").find("option[value="+data.hlid+"]").attr("selected",true);
	    		form.render('select');
	    	});
			datacenterController.selectut({disid:data.disid,hlid:data.hlid},function(datas){
	    		for(var i=0;i<datas.length;i++) {  
	    			$("#unitid3").append("<option value='"+datas[i].unitid+"'>"+datas[i].unitname+"</option>"); 
	            }
	    		$("#unitid3").find("option[value="+data.unitid+"]").attr("selected",true);
	    		form.render('select');
	    	});
			form.render();
		});
	})
}
//绑定住户
function bangding(fanid){
	$(".SelectZhuhu").html("");
	datacenterController.selectdisall(function(data){
		$(".SelectZhuhu").append("<input type='hidden' id='fanid2' value='"+fanid+"'>");
		for(var i=0;i<data.length;i++){
			$(".SelectZhuhu").append(
			"<ul class=\"tree-list\">" +
	   	 	"    <li id=\"dis"+data[i].disid+"\">" +
	    	"       <label><span class=\"get_xq yes\" id=\"ds"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].dname+"</label>" +
	    	"    </li>" +
	    	"</ul>");
		}
	})
	$(".user_info").animate({right:'0px'});
    $(".user_bg").css("display","block");
}
$(document).on("click",".get_xq",function(){
	var datas=this.id;
    datas=datas.replace('ds','');
    if($(this).children("i").attr("class")=='fa fa-plus'){
    	if(this.className=="get_xq yes"){
    		datacenterController.selectallowners(datas,function(data){
    			var yzdiv="";
				for(var i=0;i<data.length;i++){
					yzdiv+="<ul style=\"margin-left:20px;\">" +
					"	<li>"+
					"		<label>"+
					"			<input type=\"checkbox\" name=\"get_c\" value=\""+data[i].oid+"\">"+data[i].owername+ 
					" "+data[i].ownerphone+""+
				    "			<select class=\"cardid2\" style=\"float:right;\">"+
				    "				<option value=\"1\">业主本人</option>"+
				    "				<option value=\"2\">亲属</option>"+
				    "				<option value=\"3\">租客</option>"+
				    "				<option value=\"4\">其他</option>"+
				    "			</select>"+
					"		</label>"+
				    "	</li>"+
				    "</ul>";
				}
				yzdiv="<div id=\"tx"+datas+"\">"+yzdiv+"</div>";
				$("#dis"+datas+"").append(yzdiv);
    		})
			$("#ds"+datas).removeClass("yes");
        }
    	$(this).children("i").attr("class","fa fa-minus");
        $("#tx"+datas).show();
    } else {
    	$(this).children("i").attr("class",'fa fa-plus');
        $("#tx"+datas).hide();
    }
})
//删除房屋
function after_delete(fanid){
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
    	datacenterController.delete_housefan(fanid,function(data){
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
//批量删除房屋
$("#del").on("click", function(){
	swal({
        text: "您确定要批量删除？",
        type: "info",
        confirmButtonText: '确认',
        confirmButtonColor: '#3fc3ee',
        reverseButtons:true,
        focusCancel:true,
        showCancelButton:true,
        cancelButtonText:'取消',
    }).then(function(){
    	var array=new Array;
        $("input[type=checkbox]:gt(0):checked").each(function(){
          array.push($(this).parent().next().text());
        });
        datacenterController.batchDeletehf(array,function(data){
        	if(data!=0){
        		swal({
                    text: "删除成功！",
                    type: "success",
                    confirmButtonText: '确认',
                    confirmButtonColor: '#4cd964',
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
})
//根据小区id查询楼宇
function selectlouyu(m,n){
	datacenterController.selectly(m,function(data){
		for(var i=0;i<data.length;i++) {  
			$("#hlid"+n).append("<option value='"+data[i].hlid+"'>"+data[i].floorname+"</option>"); 
        }
	})
	   	
}
//根据小区id和楼宇id查询单元
function selectunit(m,n,x){
	datacenterController.selectut({disid:m,hlid:n},function(data){
		for(var i=0;i<data.length;i++) {  
			$("#unitid"+x).append("<option value='"+data[i].unitid+"'>"+data[i].unitname+"</option>"); 
        }
	})
}
//搜索
function sousuo(){
	var sousuo=$("#ordinary").val();
	$("#advanced").val(sousuo);
	$("#f1").submit();
}
//清空
function clear_form(){
	$("#disid1").find("option[value='0']").attr("selected",true);
	$("#hlid1").find("option[value='0']").attr("selected",true);
	$("#unitid1").find("option[value='0']").attr("selected",true);
	$("#utype").find("option[value='0']").attr("selected",true);
	$("#ordinary").val("");
	$("#fanid").val("");
	$("#louceng").val("");
	$("#advanced").val("");
	$("#f1").submit();
}
