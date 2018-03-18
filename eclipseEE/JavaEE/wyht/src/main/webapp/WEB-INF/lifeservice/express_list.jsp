<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/js/express/express_list.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/express/action/1/${ex.expId }">
                <div class="navkuai">取快递</div></a>
            <a href="/wyht/express/action/2/${ex.expId }"><div class="navkuai" >快递入库</div></a>
            <a href="#"><div class="navkuai" style="border-bottom: 2px solid #37a10b;">快递列表</div></a>
        </div>
        <form action="" name="f1" id="f1" method="post">
        	<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
        	<input type="hidden" name="eid" value="${ex.expId }">
            <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">快递公司：</label>
                        <select class="form-control-static col-sm-7" name="company" id="company">
                            <option value="0">---请选择---</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-4" style="margin-top:8px;">状态：</label>
                        <select class="form-control-static col-sm-7" style="margin-left: -35px;" name="storIsstatus" id="stor_status">
                        	<option value="">---请选择---</option>
                            <option value="1">已取</option>
                            <option value="0">未取</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">手机号：</label>
                        <input type="text" class="form-control-static col-sm-7" placeholder="手机号" name="storReceiverphone" value="${stor.storReceiverphone }">
                    </div>
                </div>
                <div class="row p-t-10">
                	<div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">关键字：</label>
                        <input type="text" class="form-control-static col-sm-7" placeholder="请输入关键字" id="advanced" name="keywords" value="${stor.keywords }">
                    </div>
                    <div class="form-group col-sm-4">
                        <button type="submit" class="btn btn-success">
                        	<i class="fa fa-search"></i> 搜索
                        </button>
                        <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                        <button type="button" class="btn btn-default"> 关闭</button>
                    </div>
                </div>
            </div>
        </form>    
            <div style="margin:10px 0 5px 15px;">
                <div class="pull-right">
                    <a href="javascript:" class="pull-left gaoji">高级搜索</a>
                    <div class="suotext">
                        <input type="text" id="ordinary" value="${stor.keywords }" class="wentext" placeholder="收件人/快递单号">
                        <button type="button" onclick="sousuo()" class="btn-list list-setting"><i class="fa fa-search"></i></button>
                    </div>
                    <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
                        <i class="fa fa-question"></i></a>
                </div>
            </div>
        <div class="table-responsive col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>收件人</th>
                    <th>手机号</th>
                    <th>快递单号</th>
                    <th>快递员</th>
                    <th>快递公司</th>
                    <th>小区</th>
                    <th>取件点</th>
                    <th>状态</th>
                    <th>取件时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody style="text-align:center;">
                <c:choose>
						<c:when test="${!empty page.list }">
                	<c:forEach items="${page.list}" var="sto">
                		<tr>
                			<td>${sto.storReceivername }</td>
                			<td>${sto.storReceiverphone }</td>
                			<td>${sto.storNum }</td>
                			<td>${sto.cer.couName }</td>
                			<td>${sto.epcy.expgsName }</td>
                			<td>${sto.district.dname }</td>
                			<td>${sto.ex.expAddress }</td>
                			<c:choose>
                				<c:when test="${sto.storIsstatus eq 0 }">
                					<td>未取</td>
                					<td></td>
                					<td>
										<a href="/wyht/express/editstorage?eid=${ex.expId }&storId=${sto.storId }"><i class="fa fa-edit"></i> 编辑</a>
										<a onclick="deleteStorage(${sto.storId})"><i class="fa fa-trash"></i> 删除</a>
	                                </td>
                				</c:when>
                				<c:otherwise>
                					<td>已取</td>
                					<td><fmt:formatDate value="${sto.storQjdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                					<td></td>
                				</c:otherwise>
                			</c:choose>
                		</tr>
                	</c:forEach>
                	</c:when>
						<c:otherwise>
                        	<tr><td colspan='10' style="text-align:center;"><h3>暂无快递信息</h3></td></tr>
                </c:otherwise>
                </c:choose>
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
<script>
	$(function(){
		expressController.selectECAll(function(data){
			for(var i=0;i<data.length;i++) {  
				$("#company").append("<option value='"+data[i].expgsId+"'>"+data[i].expgsName+"</option>");
				if("${stor.company}!=0"){
					$("#company").find("option[value='${stor.company}']").attr("selected",true);
				}
			}
		})
		if("${stor.storIsstatus}!=null"){
			$("#stor_status").find("option[value='${stor.storIsstatus}']").attr("selected",true);
		}
	})
</script>
</html>