$(function(){
	layui.use('laydate', function(){
		var laydate = layui.laydate;
		laydate.render({
	        elem: '#test1',
	        type:'datetime',
	        done:function(value,data,endDate){
	            $("#test1").val(value);
	        }
	    });
	    laydate.render({
	        elem: '#test2',
	        type:'datetime',
	        done:function(value,data,endDate){
	            $("#test2").val(value);
	        }
	    });
	});
    //成功添加和成功修改
	$(".sub").click(function(){
		var id=this.id;
		var form=id.replace("sub","");
		if(form==2){
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
		setTimeout(function(){$("#f"+form).submit();},1500);
	})
    //验证
	$(".verification").click(function(){
		var id=this.id;
		var str=id.substring(4);
		var sel=$(".sf").html();
		var oname=$("#owername"+str).val();
		var sex=$("#sex"+str).val();
		var ophone=$("#ownerphone"+str).val();
		var ss=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(id=='save2'){
			if(sel.length==0){
				swal({
			          text: "请选择房屋",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(oname.length==0){
				swal({
			          text: "请填写姓名",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(sex==0){
				swal({
			          text: "请选择性别",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(ophone.length==0){
				swal({
			          text: "请填写手机号",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(!ss.test(ophone)){
				swal({
			          text: "手机号格式有误",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else{
				datacenterController.selectOwnersphone(ophone,function(data){
					if(data!=0){
						swal({
					          text: "手机号码已存在",
					          type: "warning",
					          confirmButtonText: 'OK',
					          confirmButtonColor: '#f8bb86',
					          timer:1000,
					      })
					}else{
						$("#myModal"+str).modal("hide");
						str=str+str;
						$("#myModal"+str).modal("show");
					}
				})
			}
		}else{
			if(oname.length==0){
				swal({
			          text: "请填写姓名",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(sex==0){
				swal({
			          text: "请选择性别",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(ophone.length==0){
				swal({
			          text: "请填写手机号",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else if(!ss.test(ophone)){
				swal({
			          text: "手机号格式有误",
			          type: "warning",
			          confirmButtonText: 'OK',
			          confirmButtonColor: '#f8bb86',
			          timer:1000,
			      })
			}else{
				$("#myModal"+str).modal("hide");
				str=str+str;
				$("#myModal"+str).modal("show");
			}
		}
	})
    //选择房屋（滚动）
	$(".SelectHouse").slimScroll({
		height:'500px',
		color:'white'
	})
	//验证导入
	$(".impver").click(function(){
		var did=$("#disid4").val();
		var hid=$("#hlid4").val();
		var uid=$("#unitid4").val();
		var efile=$("#excelFile").val();
		if(did==0){
			swal({
		          text: "请选择小区",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(hid==0){
			swal({
		          text: "请选择楼宇",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      })
		}else if(uid==0){
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
		var id=this.id;
		var x=id.replace("hlid","");
		var disid=$("#disid"+x).val();
		var hlid=$("#"+id).val();
		if(disid!=0&&hlid!=0){
			selectunit(disid,hlid,x);
		}
	});
	//批量迁出
	$("#moveout").on("click",function(){
		swal({
	        text: "您确定要批量迁出？",
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
	        datacenterController.batchMoveOut(array,function(data){
	        	if(data!=0){
	        		swal({
	                    text: "迁出成功！",
	                    type: "success",
	                    confirmButtonText: '确认',
	                    confirmButtonColor: '#4cd964',
	                })
	        	}else{
	    			swal({
			            text: "迁出失败！",
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
	//批量删除
	$("#del").click(function(){
		swal({
	        text: "您确定要删除？",
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
	        datacenterController.batchDeleteOwners(array,function(data){
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
	$("#cardid1").find("option[value='0']").attr("selected",true);
	$("#loginver").find("option[value='0']").attr("selected",true);
	$("#ordinary").val("");
	$("#advanced").val("");
	$("#f1").submit();
}
//编辑
function edit(oid){
	layui.use("form",function(){
		var form=layui.form;
		datacenterController.editowners(oid,function(data){
			$("#oid3").val(oid);
//			$("#disid3").find("option[value="+data.disid+"]").attr("selected",true);
			$("#disid3").val(data.disid);
			dwr.util.setValue("owername3",data.owername);
//			$("#sex3").find("option[value="+data.sex+"]").attr("selected",true);
			$("#sex3").val(data.sex);
			dwr.util.setValue("ownerphone3",data.ownerphone);
			dwr.util.setValue("homephone3",data.homephone);
			dwr.util.setValue("onum3",data.onum);
			dwr.util.setValue("test2",data.mdates);
			if(data.ophoto!=null){
				$("#img2").attr("src","/wyht/img/"+data.ophoto);
				$("#img2").removeClass("hide");
				$("#span2").html("");//去掉“+”号
			}
			dwr.util.setValue("qqnum3",data.qqnum);
			dwr.util.setValue("weixin3",data.weixin);
			dwr.util.setValue("email3",data.email);
			dwr.util.setValue("emergency3",data.emergency);
			dwr.util.setValue("emergphone3",data.emergphone);
			dwr.util.setValue("nation3",data.nation);
			dwr.util.setValue("political3",data.political);
			dwr.util.setValue("ishunyin3",data.ishunyin);
			dwr.util.setValue("idcard3",data.idcard);
			if(data.cardphoto!=null){
				$("#img3").attr("src","http://localhost:8080/wyht/img/"+data.cardphoto);
				$("#img3").removeClass("hide");
			}
			dwr.util.setValue("hujiaddress3",data.hujiaddress);
			dwr.util.setValue("temporarynum3",data.temporarynum);
			$("#livetype3").find("option[value="+(data.livetype==''?0:data.livetype)+"]").attr("selected",true);
			dwr.util.setValue("petxinxi3",data.petxinxi);
			dwr.util.setValue("remark3",data.remark);
			form.render('select');
		});
	});
}
//选择房屋
$(document).on("click","#select_house",function(){
	$(".user_info").animate({right:'0px'});
    $(".user_bg").css("display","block");
	if(this.className=="control-label se-house yes"){
    	datacenterController.selectdisall(function(data){
    		for(var i=0;i<data.length;i++){
				$(".SelectHouse").append(
				"<ul class=\"tree-list\">" +
		   	 	"    <li id=\"dis"+data[i].disid+"\">" +
		    	"       <label><span class=\"get_xq yes\" id=\"ds"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].dname+"</label>" +
		    	"    </li>" +
		    	"</ul>");
			}
    	})
    	$(".se-house").removeClass("yes");
    }
})
$(document).on("click",".get_xq",function(){
	var datas=this.id;
    datas=datas.replace('ds','');
    if($(this).children("i").attr("class")=='fa fa-plus'){
    	if(this.className=="get_xq yes"){
    		datacenterController.selectly(datas,function(data){
    			var fooldiv="";
				for(var i=0;i<data.length;i++){
					fooldiv+="<ul style=\"margin-left:20px;\">" +
						    "	<li id=\"lou"+data[i].hlid+"\">" +
						    "		<label><span class=\"get_house yes\" id=\"hlf"+data[i].hlid+",dsd"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].floorname+"</label>" +
						    "	</li>" +
						    "</ul>";
				}
				fooldiv="<div id=\"tx"+data[0].disid+"\">"+fooldiv+"</div>";
				$("#dis"+data[0].disid+"").append(fooldiv);
    		})
			$("#ds"+datas).removeClass("yes");
        }
        $("#tx"+datas).show();
        $(this).children("i").attr("class","fa fa-minus");
    }else{
        $("#tx"+datas).hide();
        $(this).children("i").attr("class","fa fa-plus");
    }
})
$(document).on("click",".get_house",function(){
	var datas=this.id;
    var arr=new Array();
    arr=datas.split(",");
    var hlf=arr[0];
    hlf=hlf.replace("hlf","");
    var dsd=arr[1];
    dsd=dsd.replace("dsd","");
    if($(this).children("i").attr("class")=='fa fa-plus'){
        if(this.className=="get_house yes"){
        	datacenterController.selecthf({"disid":dsd,"hlid":hlf},function(data){
        		$(".tc"+data[0].hlid).empty();
        		var fandiv="";
				for(var i=0;i<data.length;i++){
					fandiv+="<ul style=\"margin-left:20px;\">"+
						    "	<li>"+
							"		<label>"+
							"			<input type=\"radio\" name=\"get_c\" value=\""+data[i].hnum+"\">"+data[i].hnum+
							"			<input type=\"hidden\" name=\"get_d\" value=\""+data[i].disid+"\">"+
							"			<input type=\"hidden\" name=\"get_h\" value=\""+data[i].hlid+"\">"+
							"			<input type=\"hidden\" name=\"get_u\" value=\""+data[i].unitid+"\">"+
							"			<input type=\"hidden\" name=\"get_f\" value=\""+data[i].fanid+"\">"+
						    "			<select name=\"cardid2\" style=\"float:right;\">"+
						    "				<option value=\"1\">业主本人</option>"+
						    "				<option value=\"2\">亲属</option>"+
						    "				<option value=\"3\">租客</option>"+
						    "				<option value=\"4\">其他</option>"+
						    "			</select>"+
							"		</label>"+
						    "	</li>"+
						    "</ul>";
				}
				fandiv="<div class=\"tc"+data[0].hlid+"\">"+fandiv+"</div>";
				$("#lou"+data[0].hlid).append(fandiv);
        	})
        	$("#hlf"+hlf+",dsd"+dsd).removeClass("yes");
        }
        $(this).children("i").attr("class","fa fa-minus");
        $(".tc"+hlf).show();
    }else {
    	$(this).children("i").attr("class",'fa fa-plus');
        $(".tc"+hlf).hide();
    }
})
$(document).on("change",'input[name="get_c"]',function(){
	$(".sf").html($(this).val());
	$("#hnum2").val($('input[name="get_c"]').val());
	$("#disid2").val($('input[name="get_d"]').val());
	$("#hlid2").val($('input[name="get_h"]').val());
	$("#unitid2").val($('input[name="get_u"]').val());
	$("#fanid2").val($('input[name="get_f"]').val());
})
$(document).on("change",'input[name="cardid2"]',function(){
	$("#cardid2").val($(this).val());
})
