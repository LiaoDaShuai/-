<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/courier/courier.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                <ul class="tab-nav">
                    <!-- <li >
                        <a href="worker.jsp">维修人员</a>
                    </li> -->
                    <li class=" active">
                        <a href="/wyht/express/courier">快递员</a>
                    </li>
                </ul>
                <div class="card-body">
                    <div class="col-md-12" style="background:#fff; margin-bottom:10px;">
                        <div class="pull-left">
                            <a type="button" class="btn btn-success" href="/wyht/express/addcourier">
                                <i class="fa fa-comment-o"></i>&nbsp;添加快递员
                            </a>
                            <a class="btn btn-success m-t-10" href="/wyht/express/company">
                                <i class="fa fa fa-cog"></i>&nbsp;快递公司
                            </a>
                        </div>
                        <form action="/wyht/express/courierByC" name="f1" method="post">
                        	<input type="hidden" name="pageNum" value=""> 
							<input type="hidden" name="pageSize" value="${page2.size }">
							<input type="hidden" name="couExpgsId" value="${cer.couExpgsId }">
	                        <div class="pull-right">
	                            <div class="suotext">
	                                <input type="text" name="keywords" value="${cer.keywords }" class="wentext" placeholder="快递员/手机号">
	                                <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
	                            </div>
	                            <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
	                                <i class="fa fa-question"></i></a>
	                        </div>
                        </form>
                    </div>
                    <div class="com-md-12">
                        <table class="table table-hover text-center">
                            <thead>
                            <tr class="active">
                                <th>快递员</th>
                                <th>手机号</th>
                                <th>所属公司</th>
                                <th>余额</th>
                                <th>费用(每单)</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="co">
                            <tr>
                            	<td>${co.couName }</td>
                            	<td>${co.couPhone }</td>
                            	<td>${co.epcy.expgsName }</td>
                            	<td>${co.couBalance }</td>
                            	<td><div>小：${co.couCostsmall }元</div><div>大：${co.couCostbig }元</div></td>
                            	<td>
                            		<a data-toggle="modal" href="#chongzhi" class="btn btn-sm btn-default c_chongzhi" onclick="recharge(${co.couId })"><i class="fa fa-dollar"></i>充值</a>
                            		<a href="/wyht/express/funds/${co.couId }?keywords=0" class="btn btn-sm btn-default"><i class="fa fa-money"></i>资金明细</a>
                            		<a href="/wyht/express/editcourier?couId=${co.couId }" class="btn btn-sm btn-default"><i class="fa fa-edit"></i>编辑</a>
                            		<button type="button" class="btn btn-sm btn-default" onclick="delete_courier('${co.couId }')"><i class="fa fa-trash"></i>删除</button>
                            	</td>
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
        </div>
    </div>
<!-- 充值 -->
<div class="modal fade" id="chongzhi" data-backdrop="static">
    <div class="modal-dialog" style="margin-top:150px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close ref" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" >充值</h4>
            </div>
             <form class="layui-form" action="/wyht/express/courier_recharge" name="f2" id="f2">
            	<input type="hidden" name="couId" id="couId2">
	            <div class="modal-body">
	            	<div class="layui-form-item">
                        <label class="layui-form-label">快递员:</label>
                        <div class="layui-input-block">
                            <span class="layui-form-label" id="couName2"></span>
                        </div>
                    </div>
	                <div class="hr-dashed"></div>
	                <div class="layui-form-item">
                        <label class="layui-form-label">充值金额:(元)</label>
                        <div class="layui-input-block">
                            <input type="text" id="couBalance2" name="couBalance" class="layui-input" placeholder="0">
                        </div>
                    </div>
	            </div>
	            <div class="modal-footer">
					<div class="layui-form-item">
						<label class="layui-form-label"></label>
						<div class="layui-input-block">
							<button type="button" class="layui-btn verification">确定</button>
							<button class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
						</div>
					</div>
	            </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>