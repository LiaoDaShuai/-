<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/wyht/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/wyht/css/font-awesome.min.css">
<style>
.four-zero-content {
	background: #fff;
	padding: 20px;
}

.four-zero-content:before {
	height: 50%;
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background: #edecec;
	content: ""
}

.four-zero {
	background: #00bcd4;
	box-shadow: 0 1px 11px rgba(0, 0, 0, .27);
	border-radius: 2px;
	position: absolute;
	top: 50%;
	margin-top: -150px;
	color: #fff;
	text-align: center;
	padding: 15px;
	height: 300px;
	width: 500px;
	left: 50%;
	margin-left: -250px
}

.four-zero p {
	position: absolute;
	right: 10px;
	bottom: 50px
}

.four-zero h2 {
	font-size: 40px
}

@media ( max-width :767px) {
	.four-zero {
		width: calc(100% - 40px);
		left: 20px;
		margin-left: 0;
		height: 260px;
		margin-top: -130px
	}
	.four-zero h2 {
		font-size: 40px
	}
}

.four-zero h2 {
	line-height: 100%;
	color: #fff;
	font-weight: 100
}

.four-zero small {
	display: block;
	font-size: 18px;
	margin-top: 40px
}

.four-zero footer {
	background: rgba(0, 0, 0, .13);
	position: absolute;
	left: 0;
	bottom: 0;
	width: 96%;
	padding: 10px
}

.four-zero footer>a {
	font-size: 21px;
	display: inline-block;
	color: #FFF;
	margin: 0 1px;
	width: 40px;
	height: 40px;
	background: rgba(0, 0, 0, .09);
	border-radius: 50%;
	text-align: center;
	-webkit-transition: all;
	-o-transition: all;
	transition: all;
	-webkit-transition-duration: .3s;
	transition-duration: .3s
}

.four-zero footer>a:hover {
	background: rgba(0, 0, 0, .2)
}

.four-zero footer>a>i {
	margin-top: 9px
}
</style>
</head>
<body class="four-zero-content">
	<div class="four-zero animated bounceInDown">
		<h2>操作错误</h2>
		<small>没有该权限</small>
		<p>
			<b id="wait">2</b> 秒后跳转
		</p>
		<footer> <a href="javascript:history.back(-1);"><i
			class="fa fa-arrow-left"></i></a> <a href="/dashboard/index.html"><i
			class="fa fa-home"></i></a> </footer>
	</div>
	<script type="text/javascript">
		(function() {
			var href = 'javascript:history.back(-1);';
			var wait = document.getElementById('wait');
			var interval = setInterval(function() {
				var time = --wait.innerHTML;
				if (time <= 0) {
					clearInterval(interval);
					window.location.href = href;
				}
				;
			}, 2000);
		})();
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?5c3d91fb2521e466a760e026e0771bab";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>
</html>