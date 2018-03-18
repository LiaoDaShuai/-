<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>启源后台管理系统</title>
</head>
<script>
$(function(){
	if('${keywords}'!=0){
		$("#types").find("option[value='${keywords}']").attr("selected",true);
	}
})
</script>
<body>
<div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
    <div class="row header">
        <div class="col-sm-12">快递员资金明细</div>
    </div>
    <div class="hr-solid"></div>
    <div style="margin:20px 0 10px 15px;">
    <form action="/wyht/express/funds/${cer.couId }" name="f1">
    	<%-- <input type="hidden" name="couId" value="${cer.couId }"> --%>
    	<input type="hidden" name="pageNum" value=""> 
		<input type="hidden" name="pageSize" value="${page2.size }">
        <div class="pull-right">
            <div class="suotext">
                <select class="wentext" style="margin-right:5px;" name="keywords" id="types">
                    <option value="0" selected>全部</option>
                    <option value="1">充值</option>
                    <option value="2">花费</option>
                </select>
                <button type="submit" class="btn-list list-setting"><i class="fa fa-search"></i></button>
            </div>
            <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
                <i class="fa fa-question"></i></a>
        </div>
    </form>
    </div>
    <div class="table-responsive col-sm-12">
        <div class="all-jifen"> 快递员：<b>${cer.couName }</b>&emsp;&emsp;<em class="m-l-15">余额：</em><span>${cer.couBalance }</span></div>
        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th>快递员</th>
                <th>手机号</th>
                <th>金额</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.list}" var="fd">
                <tr>
                    <td>${fd.cer.couName }</td>
                    <td>${fd.cer.couPhone }</td>
                    <c:choose>
                    	<c:when test="${fd.fundingRemark eq '花费' }">
                    		<td><p class="text-danger"><i class='fa fa-minus'></i>${fd.fundingPrice }</p></td>
                    	</c:when>
                    	<c:otherwise>
                    		<td><p class="text-danger"><i class='fa fa-plus'></i>${fd.fundingPrice }</p></td>
                    	</c:otherwise>
                    </c:choose>
                    <td>${fd.fundingRemark }</td>
                </tr>
            </c:forEach>    
            </tbody>
        </table>
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
</div>
</body>
</html>