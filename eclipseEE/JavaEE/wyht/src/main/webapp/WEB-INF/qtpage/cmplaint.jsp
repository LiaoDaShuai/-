<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>启源物业管理系统</title>
</head>
<body>
<div id="content">
    <div id="banner">
        <div style="background:url(/wyht/img/qtimg/b2.jpg)"></div>
    </div>

    <div class="nav">
        <div class="wrap">
            <div class="crumbs">
                <a href="index.html">首页</a>
                <a class="on">业务领域</a>
                <a class="on">投诉</a>
            </div>
        </div>
    </div>

    <div id="business-3">
        <div id="main" class="clearfix g-wrap col-sm-10 col-sm-offset-1">
            <div id="left">
                <div class="editor">
                    <h1>Cmplaint</h1>
                    <span class="jf">投诉</span>
                    <div style="margin:10px;"></div>
                    <!--水平表单-->
                    <form class="layui-form" role="form" id="cmp" method="post" action="/wyht/qt/addcmplaint" enctype="multipart/form-data">
                    	<input type="hidden" name="cmpOwnersOid" value="${ownerid }">
                        <div class="layui-form-item">
                            <label for="name" class="layui-form-label">投诉类别</label>
                            <div class="layui-input-block">
                                <select name="cmptypeId" id="cmptypeId">
                                    <option value="0">请选择类别</option>
                                    <c:forEach items="${cmptypes}" var="cts">
                                    	<option value="${cts.cmptypeId }">${cts.cmptypeName }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
	                	<div class="layui-form-item">
	                     	<label class="layui-form-label">投诉图片</label>
	                     	<div class="layui-input-block">
	                     		<div class="source">
	                            	<label class="upload-picture-btn" title="选择图片" for="file0">
	            						<span id="span0">+</span><img src="" id="img0" class="hide">
	        						</label>
	        						<input type="file" id="file0" name="input_file" class="hide" onchange="showPicture(this,'0')">
	                            </div>
	                            <div class="upload-tips">注:该图片不可大于2M</div>
	                        </div>
	                    </div>
                        <div class="layui-form-item">
                            <label for="name" class="layui-form-label">投诉内容</label>
                            <div class="layui-input-block">
                                <textarea class="layui-textarea" id="cmpContent" name="cmpContent"></textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn verification" style="width:720px">提交请求</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div id ="right">
                <a href="##"><img src="/wyht/img/qtimg/b2-2.jpg" alt=""></a>
            </div>
        </div>
    </div>
</div>
</body>
<script>
$(function(){
	layui.use('form',function(){
		var form=layui.form;
		form.render();
	});
	$(".verification").click(function(){
		var ownerid=$("input[name='cmpOwnersOid']").val();
		var cmptypeId=$("#cmptypeId").val();
		var cmpContent=$("#cmpContent").val();
		if(ownerid==""){
			swal({
		          text: "请先登录",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      });
		}else if(cmptypeId==0){
			swal({
		          text: "请选择投诉类别",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      });
		}else if(cmpContent.length==0){
			swal({
		          text: "请填写投诉内容",
		          type: "warning",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#f8bb86',
		          timer:1000,
		      });
		}else{
			swal({
		          text: "提交成功",
		          type: "success",
		          confirmButtonText: 'OK',
		          confirmButtonColor: '#4cd964',
		          timer:1000,
	        })
	        setTimeout(function(){$("#cmp").submit();},1500);
		}
	});
})
</script>
</html>
