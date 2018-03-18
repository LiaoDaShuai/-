$(function(){
	layui.use('form',function(){
		var form=layui.form;
		form.on('checkbox(subMenu)',function(data){
			var sbid=data.elem.className.replace('sb','');
			var userid=$("input[name=userId]").val();
			var permid="";
			if(data.elem.checked){
				permid=data.value;
				$(".pm"+sbid).each(function(index, item){
					item.checked=data.elem.checked;
					autoController.addAuth({upUserId:userid,upPermId:item.value},function(data){
					});
				});
				autoController.addAuth({upUserId:userid,upPermId:permid},function(data){
				})
			}else{
				$(".pm"+sbid).each(function(index, item){
					item.checked=data.elem.checked;
					autoController.delAuth({upUserId:userid,upPermId:item.value},function(data){
					});
				});
				permid=data.value;
				autoController.delAuth({upUserId:userid,upPermId:permid},function(data){
				})
			}
			form.render('checkbox');
		})
		form.on('checkbox(permName)',function(data){
			var userid=$("input[name=userId]").val();
			var permid="";
			var sbid=data.elem.className.replace('pm','');
			if(data.elem.checked){
				if($(".sb"+sbid).checked!='checked'){
					$(".sb"+sbid).each(function(index, item){
						item.checked=data.elem.checked;
						autoController.addAuth({upUserId:userid,upPermId:item.value},function(data){
						});
					});
				}
				permid=data.value;
				autoController.addAuth({upUserId:userid,upPermId:permid},function(data){
				})
			}else{
				permid=data.value;
				autoController.delAuth({upUserId:userid,upPermId:permid},function(data){
				})
			}
			form.render('checkbox');
		})
	})
	var intheight="";
	$(".menu").click(function(){
		if($(this).parent().height()>40){
			intheight=$(this).parent().height();
			$(this).parent().animate({height:"40px"},1000);
			$(this).find("span i").attr("class","fa fa-chevron-circle-right");
		}else{
			$(this).parent().animate({height:intheight+"px"},1000);
			$(this).find("span i").attr("class","fa fa-chevron-circle-down");
		}
	});
});