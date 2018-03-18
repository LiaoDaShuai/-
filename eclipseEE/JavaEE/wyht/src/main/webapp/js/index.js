$(function() {
	//滚动条
	$("body,.modal").niceScroll({
		scrollspeed: 70,// 滚动速度
	    mousescrollstep: 38,// 鼠标滚轮的滚动速度
	    cursorwidth: '8px',//宽度
	    cursorborder: 0,// CSS方式定义滚动条边框
	    cursorcolor: '#CFCFCF',//滚动条颜色
	    cursorborderradius: 0,
	    autohidemode: false,//不隐藏滚动条
	    background:"#999999",
	    horizrailenabled: false// nicescroll可以管理水平滚动，false不可以
	});
	//公式和绑定住户的滚动条
	$(".toggled,.r-content").niceScroll({
		 cursorcolor: '#CFCFCF',
		 horizrailenabled: false,
		 hidecursordelay: 0,
		 autohidemode: false,//不隐藏滚动条
	})
	// 显示高级搜索
	$(".gaoji").click(function() {
		var count = $(".toggaoji .row").length;
		if (this.innerText == "高级搜索") {
			$(".toggaoji").animate({
				"height" : count * 60,
				"opacity" : 1
			}, 1000);
			this.innerText = "普通搜索";
			$("#ordinary").attr("disabled", true);
			$("#advanced").removeAttr("disabled");// 將高級里面的文本框解禁
		} else {
			$(".toggaoji").animate({
				"height" : 0,
				"opacity" : 0
			}, 1000);
			this.innerText = "高级搜索";
			$("#advanced").attr("disabled", true);
			$("#ordinary").removeAttr("disabled");// 将普通搜索的文本框解禁
		}
	});
	$(".pagination").change(function() {// 用于下拉框改变分页条数
		var size = $(this).val();
		$("input[name=pageSize]").val(size);
		$("form[name=f1]").submit();
	});
	$(".closes").click(function() {
		var count = $(".toggaoji .row").length;
		$(".toggaoji").animate({
			"height" : 0,
			"opacity" : 0
		}, 1000);
		$(".gaoji").text("高级搜索");
	});

	$(".main-menu>li>a").click(
			function() { // 注意用的是 子选择器 ( > )
				var $ul = $(this).siblings("ul");
				if ($ul.is(":visible")) {
					$(this).children("i.pull-right").attr("class",
							"fa fa-angle-left pull-right");
					$ul.slideUp("slow");
				} else {
					$(this).children("i.pull-right").attr("class",
							"fa fa-angle-down pull-right");
					$ul.slideDown("slow");
					;
				}
				return false;
			})
	$(".sidebar-inner").slimScroll({
		height : "100%",
		size : "3px",
		color : "#666"
	});
	$('body').on('mouseenter', '#sidebar', function() {
		$("#sidebar").addClass('open');
	});
	$('body').on('mouseleave', '#sidebar', function() {
		$("#sidebar").removeClass('open');
	});
	// 高级搜索
	$(".sousuo").click(function() {
		$(".gjss").fadeToggle();
	})
	$(".ss_close").click(function() {
		$(".gjss").fadeToggle();
	})
	// 显示用户信息
	$(".user-info").click(function() {
		$(".user_info1").animate({
			right : '0px'
		});
		$(".user_bg").css("display", "block");
	})
	// 隐藏信息
	$(".user_bg").click(function() {
		$(".user_info1").animate({
			right : '-420px'
		});
		$(".user_info input[type=checkbox]").prop({
			"checked" : false
		});
		$(".user_bg").css("display", "none");
	})

	$("#select_zhuhu").click(function() {
		$(".user_info").animate({
			right : '0px'
		});
		$(".user_bg").css("display", "block");
	})
	$(".user_bg").click(function() {
		$(".user_info").animate({
			right : '-420px'
		});
		$(".user_info input[type=checkbox]").prop({
			"checked" : false
		});
		$(".user_bg").css("display", "none");
	})

	$(".closediv").click(function() {
		$(".user_info").animate({
			right : '-420px'
		});
		$(".user_bg").css("display", "none");
	})
	// 删除用户信息 开
	// $(".user-del").click(function(){
	// $(".del_bg").fadeIn("slow");
	// $(".user_del").fadeIn("slow");
	// })
	// 删除用户信息 关
	// $(".del_close").click(function(){
	// $(".del_bg").fadeOut("slow");
	// $(".user_del").fadeOut("slow");
	// })
	$(".user-del").click(function() {
		swal({
			title : '你确定要删除吗?',
			type : 'warning',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			confirmButtonText : '是的!',
			cancelButtonText : '取消'
		}).then(function() {
			swal('删除成功', ' ', 'success')
		})
	});
	// 填入收费标准的
	$('#js_type').change(function() {
		var _val = $(this).val();
		_val++;
		if (_val == 1) {
			$("select[name=priceunit]").attr("disabled", false);
		} else {
			$("select[name=priceunit]").attr("disabled", true);
		}
		for (var i = 1; i < 5; i++) {
			if (i == _val && i != 2) {
				$(".js_type-" + i).show();
			} else {
				$(".js_type-" + i).hide();
			}
		}
	});
	// 刷新数据
	$(".ref").click(function() {
		setTimeout("location.reload()", 100);
	})
	// 房屋、车位、车辆（批量删除、全选与全不选）
	$('.quan').click(function() {
		if ($(this).is(':checked')) {
			$('.dan').prop('checked', true);
			$('#del').prop('disabled', false);// 业主->删除
			$('#moveout').prop('disabled', false);// 业主->迁出
		} else {
			$('.dan').prop('checked', false);
			$('#del').prop('disabled', true);
			$('#moveout').prop('disabled', true);
		}
	});
	$('.dan').click(function() {
		if ($('.dan:checked').length == 0) {
			$('#del').attr('disabled', true);
			$('#moveout').prop('disabled', true);
		} else {
			$('#del').attr('disabled', false);
			$('#moveout').prop('disabled', false);
		}
	});
	$("#wu").click(function() {
		if ($(this).is(':checked')) {
			$("#over").hide();
		} else {
			$("#over").show();
		}
	});
});
function Fenye(num, total) {// 设置设置分页参数
	if (num < 1) {
		num = 1;
	}
	if (num > total) {
		num = total;
	}
	$("input[name=pageNum]").val(num);
	$("form[name=f1]").submit();
}

// 迁入迁出房屋
function update_status(str, oid, status) {
	swal({
		text : "您是否要" + str + "房屋？",
		type : "info",
		confirmButtonText : '确认',
		confirmButtonColor : '#3fc3ee',
		reverseButtons : true,
		focusCancel : true,
		showCancelButton : true,
		cancelButtonText : '取消',
	}).then(function() {
		datacenterController.updateyzstatus(oid, status, function(data) {
			if (data != 0) {
				swal({
					text : "" + str + "成功！",
					type : "success",
					confirmButtonText : '确认',
					confirmButtonColor : '#4cd964',
					timer : 1000,
				})
			}
			// 延时刷新页面
			setTimeout("location.reload()", 1500);
		})
	}, function(dismiss) {
		if (dismiss = 'cancel') {
			swal({
				text : "取消了！",
				type : "error",
				confirmButtonText : '确认',
				confirmButtonColor : '#f27474',
				timer : 1000,
			})
		}
	})
}
// 显示图片
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