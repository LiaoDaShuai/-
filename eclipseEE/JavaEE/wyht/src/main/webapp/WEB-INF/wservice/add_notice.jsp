<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script src="/wyht/ueditor-utf8/ueditor.config.js"></script>
    <script src="/wyht/ueditor-utf8/ueditor.all.js"></script>
    <style>
        .row-adds{
            text-align: center;
            margin-top:20px;
            padding:20px 0 20px 150px;
            border-top: 1px solid #E0E0E0;
            /*border-bottom:1px solid #e0e0e0;*/
        }
    </style>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
    function load() {
        var ue = UE.getEditor('editor', {
            toolbars: [
                ['fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertframe', 'insertcode', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts']
            ],
            autoHeightEnabled: false,
            autoFloatEnabled: true,
            allowDivTransToP: false//阻止div标签自动转换为p标签
        });
        ue.ready(function(){
   	 		ue.setContent('${announce.annContext}');
   	 	});
   	 	return ue;
    } 
        $(function(){
        	var ue=load();
        	layui.use('laydate', function(){
        		 var laydate=layui.laydate;
	        	 laydate.render({
	        	    	elem : '#annZhidingend',
	        			type : 'datetime'
	        	 });
        	});
        	layui.use('form', function(){
       		 	var form=layui.form;
       		 	form.on("checkbox(zhiding)",function(data){
						if(data.elem.checked){
							$(".zhidingdate").removeClass("hide");
		 					$("input[name=annZhidingend]").prop("disabled",false);
						}else{
							$(".zhidingdate").addClass("hide");
		 					$("input[name=annZhidingend]").prop("disabled",true);
						}
           		 });
	        	form.render();
       		});
            $("#b1").on("click",function(){
     		   $("#editor").val(ue.getContent());//getContentTxt()
     		   $("#myform").submit();
            })
     		$("#b2").on("click",function(){
     		   $("#editor").val(ue.getContent());
     		   $("#myform").attr("action","/wyht/lifeservice/InsertOrUpdate/${type}/2");
     		   $("#myform").submit();
        	})
        	if("${type}"==2){
            	if($("input[name=annZhiding]").is(":checked")){
        			$(".zhidingdate").removeClass("hide");
                }
        		$("#myform").attr("action","/wyht/lifeservice/InsertOrUpdate/2/1");
            }
        })
    </script>
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">
            <div class="col-sm-12"><c:if test="${type==1 }">添加公告</c:if>
            <c:if test="${type==2 }">编辑公告</c:if></div>
        </div>
        <form class="layui-form" action="/wyht/lifeservice/InsertOrUpdate/1/1" method="post" id="myform">
        	<c:if test="${type==2}">
        		<input type="hidden" name="annId" value="${announce.annId }">
        	</c:if>
	        <div class="layui-form-item">
	            <div class="layui-form-label"><label>标题：</label></div>
	            <div class="layui-input-block"><input type="text" name="annName" value="${announce.annName }" class="layui-input" placeholder="请输入论坛公告标题"></div>
	        </div>
	        <div class="layui-form-item">
	            <div class="layui-form-label"><label>内容</label></div>
	            <div class="layui-input-block"><div id="editor" name="annContext" value="" style="width:720px;height:400px;"></div></div>
	        </div>
	        <div class="layui-form-item">
	            <div class="layui-form-label">推荐置顶:</div>
	            <div class="layui-input-block"><input type="checkbox" name="annZhiding" value="1" lay-filter="zhiding" <c:if test="${announce.annZhiding eq '1' }">checked="checked"</c:if>>
	            <div class="col-sm-3 zhidingdate hide">
	            	<input type="text" disabled="disabled" name="annZhidingend" id="annZhidingend" readonly class="layui-input" value="${announce.annZhiding==1?announce.zhidingDate:'' }">
	            </div>
	            </div>
	        </div>
	        <div class="layui-form-item">
				<div class="layui-form-item">
					<div class="layui-input-block">
					  <button type="button" class="layui-btn" id="b1">保存</button>
					  <button type="button" class="layui-btn layui-btn-normal" id="b2">保存并返回</button>
					  <a href="/wyht/lifeservice/show_announce" class="layui-btn layui-btn-primary" id="b3">关闭</a>
					</div>
				</div>
	        </div>
        </form>
    </div>
</body>
</html>