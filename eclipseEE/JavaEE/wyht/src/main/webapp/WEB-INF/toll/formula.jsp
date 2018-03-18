<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<style>
table {
	border: 1px solid #e0e0e0;
}

th, td {
	border-bottom: 1px solid #E0E0E0;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
			<a href="/wyht/toll/priceAll">
				<div class="navkuai">收费项目</div>
			</a> <a href="/wyht/toll/formulaAll">
				<div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">自定义公式</div>
			</a>
		</div>
		<form action="/wyht/toll/formulaAll" name="f1" method="post" class="form-horizontal">
			<div style="margin: 10px 0 5px 15px;">
				<div class="pull-left">
					<a href="insertformula" class="btn btn-success">添加公式</a>
				</div>
				<div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
                </div>
				<div class="pull-right">
					<div class="suotext">
						<input type="text" name="keyword" value="${mohuselect.keyword }" a class="wentext"
							placeholder="请输入公式名称或备注">
						<button class="btn-list list-setting">
							<i class="fa fa-search"></i>
						</button>
					</div>
					<a href="" class="btn-list"
						target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
				</div>
			</div>
		</form>
		<div class="table-responsive col-sm-12">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>公式名称</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list }" var="fors">
						<tr>
							<td>${fors.formulaname }</td>
							<td>${fors.remark }</td>
							<td><a href="/wyht/toll/eidtformula?forid=${fors.formulaid}"
								class="a-opts"><i class="fa fa-edit"></i> 修改公式 </a>
								<a href="javascript:" id="${fors.formulaid }"
								class="a-opts m-l-10 del_formula"><i class="fa fa-trash"></i> 删除 </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="pull-left biao-er-wai">共${page.total }条记录 ${page.pageNum }/${page.lastPage }页</div>
            <c:if test="${page.total>page2.size }">
            <div class="col-sm-6 col-sm-offset-3">
           		<ul class="pagination pagination-sm">
           			<li><a href="javascript:Fenye(1)">
           			<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>     
           			<li><a href="javascript:Fenye(${page.pageNum-1},${page.lastPage })">
           			<i class="fa fa-angle-left"></i></a></li>     
           			<c:forEach begin="${page2.startPage }" end="${page2.endPage }" var="num">
           				<c:if test="${num==page.pageNum}">
           				<li class="active"><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li></c:if>
            			<c:if test="${num!=page.pageNum }">
            			<li><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li></c:if>
            		</c:forEach>
            		<li><a href="javascript:Fenye(${page.pageNum+1},${page.lastPage })">
            		<i class="fa fa-angle-right"></i></a></li> 
            		<li><a href="javascript:Fenye(${page.lastPage},${page.lastPage })">
            		<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>     
            	</ul>
            </div>
            </c:if>
            <div class="pull-right biao-er-wai">该页显示：
                <select style="width:100px;height:25px;" class="pagination">
                	<c:forEach items="${page2.selectnum }" var="selectsize">
                		<c:if test="${selectsize==page2.size }">
                			<option value="${selectsize }" selected="selected">${selectsize }条</option>
                		</c:if>
                		<c:if test="${selectsize!=page2.size }">
                			<option value="${selectsize }">${selectsize }条</option>
                		</c:if>
            		</c:forEach>
            	</select>
            	数据
            </div>
		</div>
		<script type="text/javascript">
	$(function() {
		$(".del_formula").click(function() {
			var forid = $(this).attr('id');
			swal({
				title : "你确定要该收费项目删除？",
				type : "info",
				showCancelButton : true,
				confirmButtonColor : "#AEDEF4",
				cancelButtonText : "取消",
				confirmButtonText : "确定",
				closeOnConfirm : false,
				closeOnCancel : true
			}).then(function(isConfirm) {
				if (isConfirm) {
					$.ajax({
						url : "deleteformula",
						type : "get",
						data : "forid=" + forid,
						dataType : "JSON",
						success : function(data) {
							if(data[0]=="success"){
							swal({
								text : "删除成功",
								type : "success",
								confirmButtonTest : "确认",
								confirmButtonColor : "#4cd964",
								timer : 1300
							})
							setTimeout(function() {window.location.reload();}, 1300)
							}else{
								swal({
									text : "请先删除收费项目下的收费标准",
									type : "warning",
									confirmButtonText : '确认',
									confirmButtonColor : '#3fc3ee',
									timer : 2000
								})
							}
						},
						error : function(data) {
							swal({
								text : "数据有问题，请稍后访问！",
								type : "warning",
								confirmButtonText : '确认',
								confirmButtonColor : '#3fc3ee',
								timer :2000
							})
						}
					})
				}
			});
		});
		$(".pagination").change(function(){
			var size=$(this).val();
			$("input[name=pageSize]").val(size);
			$("form[name=f1]").submit();
		});
	});
	
</script>
</body>
</html>