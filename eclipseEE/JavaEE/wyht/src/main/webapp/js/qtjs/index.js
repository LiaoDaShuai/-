$(function(){
	$("body").niceScroll({
		 scrollspeed: 70,// 滚动速度
	        mousescrollstep: 10,// 鼠标滚轮的滚动速度
	        cursorwidth: '8px',//宽度
	        cursorborder: 0,// CSS方式定义滚动条边框
	        cursorcolor: '#CFCFCF',//滚动条颜色
	        cursorborderradius: 0,
	        autohidemode: false,//不隐藏滚动条
	        background:"#999999",
	        horizrailenabled: false// nicescroll可以管理水平滚动，false不可以
	});
     var data = ['/wyht/img/qtimg/i1.jpg',
                '/wyht/img/qtimg/i2.jpg',
                '/wyht/img/qtimg/i3.jpg',
                '/wyht/img/qtimg/i4.jpg',
    ];

    //轮播
    var pic_str = '';
    var ctrl_str='';  
    for(var i = 0; i < data.length; i++){
        pic_str += '<li><img src="' + data[i] + '"></li>';      
        ctrl_str += '<li></li>'
    }   
    $('.banner').html(pic_str);
    $('.ctrl-banner').html(ctrl_str);
    $('.ctrl-banner > li').eq(0).addClass('active');
    $('.ctrl-banner > li').eq(data.length-1).css('margin-right','0px'); 
    var index=0;
    var timeout_timer = null;
    function move(num){
            clearTimeout(timeout_timer);
            timeout_timer = setTimeout(function () {
            //num > 0 ? index-- : index++;   不太理解下面那一段的意思！          
            num >= 0 ? index = num : num == -1 ? index++ : index--         
                //alert(num +"          "+index);                       
            index = index > data.length - 1 ? 0 : index;
            index = index < 0 ? data.length - 1 : index;
            $('.banner > li').eq(index).stop().fadeIn().siblings().stop().fadeOut();
            $('.ctrl-banner > li').eq(index).addClass('active').siblings().removeClass('active');
        },200);
    }

    var timer = null;
    timer = setInterval(function () {
        move(-1);
    },2000);
    $('.ctrl-banner > li').on('mouseover',function(){
        move($(this).index());
    });
    $('.box').hover(function(){
		$(".box").css("cursor","pointer");
		$(".span-right ").animate({
			right:'100px',
			opacity:1
		},600);
		$(".span-left ").animate({
			left:'100px',
			opacity:1
		},600);
        clearInterval(timer);
    },function () {
		$(".span-right ").animate({
			right:'-100px',
			opacity:0
		},600);
		$(".span-left ").animate({
			left:'-100px',
			opacity:0
		},600);
        timer = setInterval(function () {
            move(-1);
        },2000);
    });
    $('.span-right').on('click',function(){
        move(-1);
    });
    $('.span-left').on('click',function(){
        move(-2);
    });
    //返回顶部
    $("#topcontrol").click(function(){
    	if(!$("html,body").is(":animated")){
    	 $("html,body").animate({"scrollTop":"0"},500);
    	}
    });
    //公告轮播
    var len= $('.redian li').length;
		var index1 = 1;
        var notice = $('.redian ul');
		var top=setInterval(function(){
                if(index1 == len) { 
                    index1 = -1;
                } else {
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    	$(notice).animate({top:margin},1000);
                    }
                }
                index1++;
        },2000);
        $('.redian ul').hover(function(){
            clearInterval(top);
        },function(){
            top=setInterval(function(){
                if(index1 == len) { 
                    index1 = -1;
                } else { 
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    $(notice).animate({top:margin},1000);
                    }
                }
                index1++;
        },2000);
        });
		$(".up-down .up").click(function(){
            index1++;
            clearInterval(top);
            if(index1 == len) {
                    index1 = -1;
                } else { 
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    $(notice).animate({top:margin},1000);
                    }
             }
			 top=setInterval(function(){
                if(index1 == len) { 
                    index1 = -1;
                } else { 
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    $(notice).animate({top:margin},1000);
                    }
                }
                index1++;
        },2000);
		});
		$(".up-down .down").click(function(){
            index1--;
            clearInterval(top);
			  if(index1 == -1) {
                    index1 = len;
                } else { 
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    $(notice).animate({top:margin},1000);
                    }
                }
			 top=setInterval(function(){
                if(index1 == len) { 
                    index1 = -1;
                } else { 
                    var margin = -index1*60;//根据index值计算ul元素的top值
                    //$(notice).css("margin-top",margin);
                    if(!$(notice).is(":animated")){
                    $(notice).animate({top:margin},1000);
                    }
                }
                index1++;
        },2000);
		});
    //动画出现  图片
    $(window).scroll(function(){    
            var a =$(document).scrollTop()
        if(a>300)
        {
            $("#topcontrol").fadeIn(1000);
        }
        else{
            $("#topcontrol").fadeOut(1000);
        }
            if(a>100)
            {
                /*$(".redian .wrap .box-nav a img ").fadeIn(3000);*/
                $("#top-nav .left").animate({
                    left:'10.94%',
                    opacity:'1'
                },1000)
                $("#top-nav .right").animate({
                    right:'10.94%',
                    opacity:'1'
                },1000)
            }
            if(a>800)
            {
                /*$(".redian .wrap .box-nav a img ").fadeIn(3000);*/
                $("#bottom-nav .left").animate({
                    left:'10.94%',
                    opacity:'1'
                },1000);
                $("#bottom-nav .right").animate({
                    right:'10.94%',
                    opacity:'1'
                },1000);
            }
        });
        $("#zhuce").click(function(){
                $("h4").text("业主注册")
                $("#dl").css("display","none");
                $("#zc").css("display","block");
        });
        $("#denglu").click(function(){
                $("h4").text("业主登录")
                $("#dl").css("display","block");
                $("#zc").css("display","none");
        });
        var tt=60;//成功60s
    	$(".fasong").click(function() { //按钮的id名字是addButton
    			var phone=$("#lophone").val(); 
    			var phonetest=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
    			if(phone==""||phone==0){
    				sweetAlert({text:'手机号不能为空',type:'warning',timer:1500,showConfirmButton:false});
    			    return false;
    			}else if(!phonetest.test(phone)){
    				sweetAlert({text:'请输入正确格式的手机',type:'warning',timer:1500,showConfirmButton:false});
    			    return false;
    			}else{
    				datacenterController.selectOwnersphone(phone,function(data){
    					if(data!=0){
    						industryController.duanxin(phone,function(data){
    							if(data>0){
	    							$(".fasong").attr({"disabled":"disabled"});
	    	    					var anniu=setInterval(function ok(){
	    	    							tt--;
	    	    							$(".fasong").html("发送成功"+tt);
	    	    							if(tt==0){
	    	    								clearInterval(anniu);
	    	    								$(".fasong").html("点击发送验证码")
	    	    								$(".fasong").removeAttr("disabled");
	    	    								tt=60;
	    	    							}
	    	    					},1000);
    							}
    						})
    					}else{
    						sweetAlert({text:'该手机号码不存在',type:'warning',timer:1500,showConfirmButton:false});
    						return false;
    					}
    				})
    			}
    	});
});
 
function isphonelogin(form){
	var phonetest=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
	if(form.ownerphone.value==""||form.ownerphone.value.length==0){
		sweetAlert({text:'手机号不能为空',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else if(!phonetest.test(form.ownerphone.value)){
		sweetAlert({text:'请输入正确格式的手机',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else if(form.keywords.value==""||form.keywords.value.length==0){
		sweetAlert({text:'验证码不能为空',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else{
		industryController.isphonelogin({ownerphone:form.ownerphone.value,
			keywords:form.keywords.value},function(data){
				if(data>0){
					swal({
				          text: "登录成功",
				          type: "success",
				          confirmButtonText: 'OK',
				          confirmButtonColor: '#4cd964',
				          timer:2000,
			        })
			        window.setTimeout(function(){window.location.reload();},2000);
				}else{
					sweetAlert({text:'验证码有误',type:'warning',timer:1500,showConfirmButton:false});
				    return false;
				}
			})
		}
}
function ispasslogin(form){
	var phonetest=/^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/;
	if(form.ownerphone.value==""||form.ownerphone.value.length==0){
		sweetAlert({text:'手机号不能为空',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else if(!phonetest.test(form.ownerphone.value)){
		sweetAlert({text:'请输入正确格式的手机',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else if(form.opass.value==""||form.opass.value.length==0){
		sweetAlert({text:'密码不能为空',type:'warning',timer:1500,showConfirmButton:false});
	    return false;
	}else{
		datacenterController.selectOwnersphone(form.ownerphone.value,function(data){
			if(data!=0){
				industryController.ispasslogin({ownerphone:form.ownerphone.value,
					opass:form.opass.value},function(data){
						if(data>0){
							swal({
						          text: "登录成功",
						          type: "success",
						          confirmButtonText: 'OK',
						          confirmButtonColor: '#4cd964',
						          timer:2000,
					        })
					        window.setTimeout(function(){window.location.reload();},2000);
						}else{
							sweetAlert({text:'密码输入有误',type:'warning',timer:1500,showConfirmButton:false});
						    return false;
						}
					})
			}else{
				sweetAlert({text:'该手机号码不存在',type:'warning',timer:1500,showConfirmButton:false});
				return false;
			}
		});
	}
}
//显示图片
function showPicture(m, n) {
	var objUrl = getObjectURL(m.files[0]);
	if (objUrl) {
		var size = m.files[0].size;
		if (size > 2097152) {// 判断图片大小是否超过2M
			swal({
				text : "图片大小超过2M",
				type : "warning",
				confirmButtonText : 'OK',
				confirmButtonColor : '#f8bb86',
				timer : 1000,
			})
		} else {
			$("#span"+n).html("");//去掉“+”号
			$("#img" + n).attr("src", objUrl);
			$("#img" + n).removeClass("hide");
			//$("#file" + n).removeClass("hide");
		}
	}
}
function getObjectURL(file) {
	var url = null;
	if (window.createObjectURL != undefined) {
		// basic
		url = window.createObjectURL(file);
	} else if (window.URL != undefined) {
		// mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if (window.webkitURL != undefined) {
		// webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}