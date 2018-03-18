<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        }
    </style>
	<script>
	var subcount=$(".subtotal").length;
	var zongsub=0,zongyou=0,zongzhi=0,zongyu=0,zongyin=0;
	for(var i=0;i<subcount;i++){
		zongsub+=parseInt($(".subtotal").eq(i).text().replace("￥",''));
		zongyou+=parseInt($(".youhui").eq(i).text().replace("￥",''));
		zongzhi+=parseInt($(".zhina").eq(i).text().replace("￥",''));
		zongyin+=parseInt($(".yjiao").eq(i).text().replace("￥",''));
	}
	$(".totalMoney").eq(0).html("￥"+zongsub.toFixed(2));
	$(".totalYh").html("￥"+zongyou.toFixed(2));
	$(".totalZnj").html("￥"+zongzhi.toFixed(2));
	$(".totalYj").html("￥"+zongyin.toFixed(2));
	$(".totalMoney").eq(1).html("￥"+zongsub);
	</script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="javascript:window.history.back(-1);">
                <div class="navkuai">收银台</div>
            </a>
            <a href="javascript:window.location.reload();">
                <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">历史缴费</div>
            </a>
        </div>
        <form name="f1" action="#" method="post">
        	<!-- 存放分页的数据 -->
            <input type="hidden" name="pageNum" value="">
			<input type="hidden" name="pageSize" value="${page2.size }">
        </form>
        <div class="table-responsive col-sm-12 ">
            <table class="table table-cost">
                <thead>
                <tr>
                    <th>类型</th><th>小区</th><th><div style="width:100px;">房号/车位号/车牌/住户</div></th>
                    <th>费用名称</th><th>开始时间</th><th>结束时间</th>
                    <th>单价</th><th>数量</th><th>应收金额</th>
                    <th>优惠</th><th>滞纳金</th><th>应收合计</th>
                    <th>缴费人</th><th>手机号</th><th>支付时间</th>
                    <th>状态</th><th>备注</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
					<c:when test="${!empty page.list!='' }">
                <c:forEach items="${page.list }" var="jt">
                <tr><td><c:choose>
                      <c:when test="${jt.ztype==1 }">房屋</c:when>
                      <c:when test="${jt.ztype==2 }">车位</c:when>
                      <c:when test="${jt.ztype==3 }">车辆</c:when>
                      <c:when test="${jt.ztype==4 }">自定义金额</c:when>
                    </c:choose></td>
                    <td>${jt.district.dname }</td><td>
                    	${jt.housefan.hnum}
                        ${jt.parkingspace.pnum }
                        ${jt.vehiclemanager.carnum }
                        ${jt.temporary.owners.owername}</td><td>${jt.priceproject.pricename}</td>
                    <td>${jt.simsdate }</td><td>${jt.simedate }</td>
                    <td>${jt.priceing==null?'--':jt.priceing }</td>
                    <td>${jt.count==null?'--':jt.count }</td>
                    <td class="c-red">￥<span class="subtotal">${jt.subtotal }</span></td>
					<td class="c-red">￥<span class="youhui">${jt.youfei }</span></td>
					<td class="c-red">￥<span class="zhina">${jt.zhina }</span></td>
					<td class="c-red">￥ <span class="yjiao">${jt.subtotal-jt.youfei+jt.zhina }</span>
					<td><c:choose>
                    		<c:when test="${(jt.oid!=null)}">${jt.ownerlist[0].owername }</c:when>
                    		<c:otherwise>${jt.temporary.onames }</c:otherwise>
                    	</c:choose>
                    	</td><td><c:choose>
                    	<c:when test="${(jt.oid!=null)}">${jt.ownerlist[0].ownerphone }</c:when>
                    	<c:otherwise>${jt.temporary.ophone }</c:otherwise>
                    </c:choose></td>
                    <td>${jt.unpaidbills.zfdate }</td>
                    <td><c:if test="${jt.status==0 }">未缴</c:if>
						<c:if test="${jt.status==1 }">已缴</c:if>
						<c:if test="${jt.status==2 }">已退</c:if>
					</td>
                    <td>${jt.remark==null?'--':jt.remark }</td>
                </tr>
                </c:forEach>
                 </c:when>
				<c:otherwise>
                        	<tr><td colspan='16' style="text-align:center;"><h3>暂无未缴信息</h3></td></tr>
                </c:otherwise>
                </c:choose>
                <tr>
                    <td colspan="7">小计：</td>
                    <td class="c-red totalMoney"></td>
                    <td class="c-red totalYh"></td>
                    <td class="c-red totalZnj"></td>
                    <td class="c-red totalYjmoney" colspan="7"></td>
                </tr>
                <tr>
                    <td colspan="7">合计：</td>
                    <td class="c-red totalMoney"></td>
                    <td class="c-red totalYh"></td>
                    <td class="c-red totalZnj"></td>
                    <td class="c-red totalYjmoney" colspan="7"></td>
                </tr>
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