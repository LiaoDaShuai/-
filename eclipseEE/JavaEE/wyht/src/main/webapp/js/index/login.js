$(function() {
	$("#register").click(function() {
		$(".login").css("transform", "rotateY(-90deg)");
		$(".register").css("transform", "rotateY(0deg)");
	});
	$(".fh").click(function() {
		$(".login").css("transform", "rotateY(0deg)");
		$(".register").css("transform", "rotateY(-90deg)");
	});
	$("#getYzm").click(function() {
		var url = "/wyht/auth/getYzm?t=" + Math.random();
		this.src = url;
	}).click().show();
});
function isubmit(form) {
	if (form.userName.value == "" || form.userName.value.length == 0) {
		sweetAlert({
			text : '用户不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else if (form.userPass.value == "" || form.userPass.value.length == 0) {
		sweetAlert({
			text : '密码不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else if (form.yzm.value == "" || form.yzm.value.length == 0) {
		sweetAlert({
			text : '验证码不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else {
		autoController.islogin({
			userName : form.userName.value,
			userPass : form.userPass.value,
			yzm : form.yzm.value
		}, function(data) {
			if (data == "0") {
				sweetAlert({
					text : '您输入的密码错误',
					type : 'warning',
					timer : 1500,
					showConfirmButton : false
				});
			} else if (data == "1") {
				sweetAlert({
					text : '该用户不存在',
					type : 'warning',
					timer : 1500,
					showConfirmButton : false
				});
			} else if (data == "2") {
				sweetAlert({
					text : '登录失败多次，账户锁定10分钟',
					type : 'warning',
					timer : 1500,
					showConfirmButton : false
				});
			} else if ("3" == data) {
				sweetAlert({
					text : '验证码输入有误',
					type : 'warning',
					timer : 1500,
					showConfirmButton : false
				});
				return false;
			} else {
				$("#pwd").val(data);
				sweetAlert({
					text : "登录成功",
					type : "success",
					confirmButtonText : '确认',
					confirmButtonColor : '#4cd964',
				});
				window.setTimeout(function() {
					form.submit();
				}, 1500);
			}
		});
	}
}
function iregin(form) {
	if (form.userName.value == "" || form.userName.value.length == 0) {
		sweetAlert({
			text : '用户不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else if (form.userPass.value == "" || form.userPass.value.length == 0) {
		sweetAlert({
			text : '密码不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else if ($("#qued").val() == "" || $("#qued").val().length == 0) {
		sweetAlert({
			text : '确认密码不能为空',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else if (form.userPass.value != $("#qued").val()) {
		sweetAlert({
			text : '确认密码与密码不相同',
			type : 'warning',
			timer : 1500,
			showConfirmButton : false
		});
		return false;
	} else {
		sweetAlert({
			text : "添加成功",
			type : "success",
			confirmButtonText : '确认',
			confirmButtonColor : '#4cd964',
		});
		window.setTimeout(function() {
			form.submit();
		}, 1500);
	}
}