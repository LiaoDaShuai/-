<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript">
    layui.use('laydate', function(){
    	  var laydate = layui.laydate;
            laydate.render({
                elem:'#enddata',
                type:'datetime'
            });
    });
    </script>
    <style>
    td{
    text-align: center;
    }
    </style>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/toll/selectPredAll">
                <div class="navkuai">预存款管理</div></a>
            <a href="/wyht/toll/selectPredJiAll">
                <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">预存款明细</div></a>
        </div>
        <form action="/wyht/toll/selectPredJiAll" method="post" name="f1">
            <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-3" style="margin-top:8px;">小区：</label>
                        <select class="form-control-static col-sm-7 ">
                            <option>---请选择小区---</option>
                        </select></div>
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-4" style="margin-top:8px;">关键字：</label>
                        <input type="text" class="form-control-static col-sm-7" placeholder="请选择关键字">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-4" style="margin-top:8px;">结束时间：</label>
                        <input type="text" id="enddata" readonly class="form-control-static col-sm-7" placeholder="结束时间">
                    </div>
                </div>
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-3" style="margin-top:8px;">关键字：</label>
                        <input type="text" class="form-control-static col-sm-7" placeholder="请输入手机号/业主姓名">
                    </div>
                    <div><!-- 存放分页的数据 -->
                		<input type="hidden" name="pageNum" value="">
						<input type="hidden" name="pageSize" value="${page2.size }">
                	</div>
                    <div class="form-group col-sm-4">
                        <button class="col-sm-3 btn btn-success" style="margin:0 5px 0 10px;"><i
                                class="fa fa-search"></i> 搜索
                        </button>
                        <button class="col-sm-3 btn btn-default" style="margin-right:5px;"> 清空</button>
                        <button class="col-sm-3 btn btn-default"> 关闭</button>
                    </div>
                </div>
            </div>
            <div style="margin:10px 0 5px 15px;">
                <div class="pull-right">
                    <a href="javascript:" class="pull-left gaoji">
                        高级搜索</a>
                    <div class="suotext">
                        <input type="text" name="kw" value="" class="wentext" placeholder="请输入手机号/业主姓名">
                        <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
                    </div>
                    <a href="" class="btn-list" target="_blank" title="帮助中心">
                        <i class="fa fa-question"></i></a>
                </div>
            </div>
        </form>
        <div class="table-responsive col-sm-12">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>住户</th>
                    <th>手机号</th>
                    <th>金额</th>
                    <th>类型</th>
                    <th>来源</th>
                    <th>时间</th>
                    <th>备注</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list }" var="pl">
                <tr>
                    <td>${pl.district.dname }</td><td>${pl.owners.owername }</td>
                    <td>${pl.owners.ownerphone }</td><td class="c-red">
                     	￥${pl.predMoney}
                    </td>
                    <td><c:if test="${pl.predType==1 }">充值</c:if>
                    <c:if test="${pl.predType==2 }">退费</c:if>
                    <c:if test="${pl.predType==3 }">退预存款</c:if></td><td>管理员</td>
                    <td>${pl.dates }</td><td>${pl.predRemark }</td>
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

</body>
</html>