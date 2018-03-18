$(function(){
    	$("#select_zhuhu").click(function(){
		if(this.className=="layui-input layui-input-k yes"){
	  		datacenterController.selectAll(function(data){
				for(var i=0;i<data.length;i++){
					$(".FanNumresult").append(
					"<ul class=\"tree-list\">\n" +
			   	 	"    <li id=\"dis"+data[i].disid+"\">\n" +
			    	"       <label><span class=\"get_xq yes\" id=\"ds"+data[i].disid+"\"><i class='fa fa-plus'></i></span>"+data[i].dname+"</label>" +
			    	"    </li>\n" +
			    	"</ul>");
				}
	  		});
	  		$("#select_zhuhu").removeClass("yes");
		}
  		})
	$(document).on("click",".get_xq",function () {
		var datas=this.id;
        datas=datas.replace('ds','');
        if ($(this).children("i").attr("class")=="fa fa-plus") {
            if(this.className=="get_xq yes"){
            		datacenterController.selectOwner(datas,function(data){
						var owerdiv='';
						for(var i=0;i<data.length;i++){
							owerdiv+="<ul class=\"tree-child\" >\n" +
								    "       <li id=\"lou"+data[i].hlid+"\">\n" +
								    "             <label id='ower"+data[i].oid+"'><input type='radio' id='"+data[i].disid+"' name='oid' value='"+data[i].oid+"'>"+
								    ""+data[i].owername+"\t"+data[i].ownerphone+"</label>" +
								    "       </li>\n" +
								    "</ul>";
						}
						owerdiv="<div id=\"tx"+data[0].disid+"\">"+owerdiv+"</div>";
						$("#dis"+data[0].disid+"").append(owerdiv);
						layui.use('form',function(){
							var form=layui.form;
							form.render();
						});
					});
					$("#ds"+datas).removeClass("yes");
            }
            $("#tx"+datas).show();
            $(this).children("i").attr("class","fa fa-minus");
        } else {
        	$("#tx"+datas).hide();
        	$(this).children("i").attr("class","fa fa-plus");
        }
    })
    $(document).on("click","input[name=oid]",function(){
    	var oid=$(this).val();
    	var disid=this.id;
    	$("#did1").val(disid);
    	$("#oid1").val(oid);
    	var oval=$("#ower"+oid).text();
    	oval=oval.substr(1);//添加一句
		$("#select_zhuhu").val(oval);
    });
	$(document).on("click",".tuikuns",function(){
		var oid=$(this).attr("name");
		oid=oid.replace("or","");
		var disid=this.id;
		disid=disid.replace("ds","");
		$("#did2").val(disid);
    	$("#oid2").val(oid);
	});
});
	function isSubmit(form){
		var zphone=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
		if(form.predTuiname.value==''){
			sweetAlert({text:'请输入退款人姓名',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else if(form.predTuiphone.value==''){
			sweetAlert({text:'请输入退款人手机号',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else if(!zphone.test(form.predTuiphone.value)){
			sweetAlert({text:'退款人手机号格式有误',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else if(form.predMoney.value==''||form.predMoney.value==0){
			sweetAlert({text:'退款金额须不为空且大于0',type:'warning',timer:1500,showConfirmButton:false});
			return false;
		}else{
			var textMoney=form.predMoney.value;
			var oid=$("#oid2").val();
			var money=$(".or"+oid).html();
			if(parseFloat(textMoney)>parseFloat(money)){
				sweetAlert({text:'退款金额不能大于现有金额',type:'warning',timer:1500,showConfirmButton:false});
				return false;
			}else{
				sweetAlert({
		            text: "退款成功",
		            type: "success",
		            confirmButtonText: '确认',
		            confirmButtonColor: '#4cd964',
		        })
				window.setTimeout(function(){form.submit()},2000);
			}
		}
	}