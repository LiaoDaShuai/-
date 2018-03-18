<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源物业系统</title>
<!-- 图标样式    -->
</head>
<body>
	<form name="f1" method="post" action="#">
		<div>
			<!-- 存放分页的数据 -->
			<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
		</div>
	</form>
	<div class="container col-sm-11 container-bianju">
		<div class="card">
			<div class="card-header">
				<h2>预存款详情</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body card-padding">
				<div class="all-jifen m-b-10">
					<p>
						预存款余额： <span class="totalMoney c-red">${page.prePage }</span>
					</p>
				</div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>金额</th>
								<th>类型</th>
								<th>来源</th>
								<th>住户</th>
								<th>手机号</th>
								<th>记录</th>
								<th>日期</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list }" var="prd">
								<tr>
									<td class="c-red">￥<span class="moneys">${prd.predMoney }</span></td>
									<td><c:if test="${prd.predType==1 }">充值</c:if> <c:if
											test="${prd.predType==2 }">抵扣</c:if> <c:if
											test="${prd.predType==3 }">退预存款</c:if></td>
									<td>管理员</td>
									<td>${prd.owners.owername }</td>
									<td>${prd.owners.ownerphone }</td>
									<td>${prd.predRemark }</td>
									<td>${prd.dates }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pull-left biao-er-wai">共${page.total }条记录
					${page.pageNum }/${page.lastPage }页</div>
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
				<div class="pull-right biao-er-wai">
					该页显示： <select style="width: 100px; height: 25px;"
						class="pagination">
						<c:forEach items="${page2.selectnum }" var="selectsize">
							<c:if test="${selectsize==page2.size }">
								<option value="${selectsize }" selected="selected">${selectsize }条</option>
							</c:if>
							<c:if test="${selectsize!=page2.size }">
								<option value="${selectsize }">${selectsize }条</option>
							</c:if>
						</c:forEach>
					</select> 数据
				</div>
			</div>
		</div>
	</div>
</body>
</html>