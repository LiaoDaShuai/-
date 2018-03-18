<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <style>
        table td,th{border:1px solid #e1e6eb;}
    </style>
    <script type="text/javascript" src="/wyht/js/express/express.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/expressController.js"></script>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
        <div class="row header">
            <div class="col-sm-12">快递取件点</div>
        </div>
        <div class="row small">
            <div class="col-sm-12"><i class="fa fa-question-circle"></i>
                	请先添加快递取件点，方可进入快递入库、取件等操作。
            </div>
        </div>
        <div class="hr-solid"></div>
        <div class="list-action-grid">
            <form action="" method="post" name="f1" id="f1">
                <input type="hidden" name="pageNum" value=""> 
				<input type="hidden" name="pageSize" value="${page2.size }">
                <div class="col-sm-12 toggaoji">
                    <div class="row p-t-10">
                        <div class="form-group col-sm-4">
                            <label class="col-sm-3" style="margin-top:8px;">选择小区：</label>
                            <select class="form-control-static col-md-7" id="disid1" name="expDisid">
                                <option value="0">--请选择小区--</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-4">
                            <label class="col-sm-3 " style="margin-top:8px;">关键字：</label>
                            <input type="text" id="advanced" name="keywords" value="${express.keywords }" class="form-control-static col-sm-7">
                        </div>
                        <div class="form-group col-sm-4">
                            <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> 搜索 </button>
                            <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                            <button type="button" class="btn btn-default"> 关闭</button>
                        </div>
                    </div>
                </div>
            </form>
                <div style="margin:20px 0 10px 15px;">
                    <a class="btn btn-success" href="/wyht/express/qujian">添加取件点</a>
                    <div class="pull-right">
                        <a href="javascript:" class="pull-left gaoji">高级搜索</a>
                        <div class="suotext">
                            <input type="text" id="ordinary" value="${express.keywords }" class="wentext" placeholder="取件点地址/服务电话">
                            <button type="button" class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
                        </div>
                        <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
                            <i class="fa fa-question"></i>
                        </a>
                    </div>
                </div>
                <div class="table-responsive col-sm-12">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>取件点地址</th>
                            <th>所属小区</th>
                            <th>服务电话</th>
                            <th>验证方式</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody style="text-align:center;">
                        <c:choose>
						<c:when test="${!empty page.list }">
                        <c:forEach items="${page.list}" var="ex">
                        <tr>
                            <td>${ex.expAddress }</td>
                            <td>${ex.dis.dname }</td>
                            <td>${ex.expServicephone }</td>
                            <c:choose>
                            	<c:when test="${ex.expIsvalis eq 0 }">
                            		<td>不需要验证码</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>需要验证码</td>
                            	</c:otherwise>
                            </c:choose>
                            <td>
                                <a href="/wyht/express/action/1/${ex.expId }"><i class="fa fa-tumblr-square"></i> 取件</a>
                                <a href="/wyht/express/action/2/${ex.expId }"><i class="fa fa-car"></i> 入库</a>
                                <a href="/wyht/express/action/3/${ex.expId }"><i class="fa fa-list"></i> 列表</a>
                                <a href="/wyht/express/editexpress?expId=${ex.expId }"><i class="fa fa-edit"></i> 编辑</a>
                                <a onclick="deleteEpress(${ex.expId })"><i class="fa fa-trash"></i> 删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                        </c:when>
						<c:otherwise>
                        	<tr><td colspan='5' style="text-align:center;"><h3>暂无快递取件点</h3></td></tr>
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
    </div>
</body>
<script>
	$(function(){
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
	            var ds="${express.expDisid}";
	    	    if(ds!=0){
	    	    	$("#disid1").find("option[value="+ds+"]").attr("selected",true);
	    	    }
			}
		})
	})
</script>
</html>