<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script> 
<script src="/wyht/dwr/interface/datacenterController.js"></script>
<title>启源后台管理系统</title>
    	
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/toll/selectyijiluAll"><div class="navkuai">按缴费记录</div></a>
            <a href="/wyht/toll/unpaidXiangAll">
                <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">按缴费明细</div></a>
            <a href="/wyht/toll/recyclebin"><div class="navkuai">回收站</div></a>
        </div>
        <form action="/wyht/toll/unpaidXiangAll" name="f1" method="post"> 
            <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-3" style="margin-top:8px;">类型：</label>
                        <select class="form-control-static col-sm-7" name="ztype">
                            <option value="">---请选择费用类型---</option>
							<option value="1">房屋相关</option>
							<option value="2">车位相关</option>
							<option value="3">车辆相关</option>
							<option value="4">自定义金额</option>
							<option value="5">租金</option>
							<option value="6">其他</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-4" style="margin-top:8px;">小区：</label>
                        <select class="form-control-static col-sm-7" name="disid">
                            <option value="">---请选择小区---</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">收费项目：</label>
                        <select class="form-control-static col-sm-7" name="priceid" >
                            <option value="">---请选择项目---</option>
                        </select>
                    </div>
                </div>
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-3" style="margin-top:8px;">支付起始时间：</label>
                        <input type="text" name="sdate" value="${mohuselect.simsdate }" class="form-control-static col-sm-7" readonly id="startdata" placeholder="请选择日期">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-4" style="margin-top:8px;">支付截止时间：</label>
                        <input type="text" name="edate" value="${mohuselect.simedate }" class="form-control-static col-sm-7" readonly id="enddata" placeholder="请选择日期">
                    </div>
                    <div class="form-group col-sm-4">
                        <label for class="col-sm-3 " style="margin-top:8px;">关键字：</label>
                        <input type="text" class="form-control-static col-sm-7" name="keyword" value="${mohuselect.keyword }" id="advanced"  placeholder="房号/车位号/车牌号/住户">
                    </div>
                </div>
                <div class="row p-t-10">
                    <div class="form-group col-sm-4">
                        <button class="col-sm-3 btn btn-success" style="margin:0 5px 0 10px;"><i
                                class="fa fa-search"></i> 搜索
                        </button>
                        <button class="col-sm-3 btn btn-default" style="margin-right:5px;"> 清空</button>
                        <button class="col-sm-3 btn btn-default"> 关闭</button>
                    </div>
                </div>
            </div>
            <div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
            </div>
            <div style="margin:10px 0 5px 15px;">
                <div class="pull-right">
                    <a href="javascript:" class="pull-left gaoji">
                        高级搜索</a>
                    <div class="suotext">
                        <input type="text" name="keyword" id="ordinary" value="${mohuselect.keyword }" class="wentext" placeholder="房号/车位号/车牌号/住户">
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
                    <th>类型</th><th>小区</th>
                    <th><div style="width:100px;">房号/车位号/车牌/住户</div></th>
                    <th>费用名称</th><th>开始/结束时间</th>
                    <th>单价</th><th>数量</th><th>应收金额</th>
                    <th>优惠</th><th>滞纳金</th>
                    <th>实收合计</th><th>缴费人</th><th>手机号</th>
                    <th>支付时间</th><th>状态</th><th>备注</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
					<c:when test="${!empty page.list!='' }">
                <c:forEach items="${page.list }" var="uall">
                <c:forEach items="${uall.tolllist }" var="tlist">
                <tr>
                    <td><c:choose>
                      <c:when test="${tlist.ztype==1 }">房屋</c:when>
                      <c:when test="${tlist.ztype==2 }">车位</c:when>
                      <c:when test="${tlist.ztype==3 }">车辆</c:when>
                      <c:when test="${tlist.ztype==4 }">自定义金额</c:when>
                    </c:choose></td>
                    <td>${uall.district.dname }</td>
                    <td>${tlist.housefan.hnum}
                        ${tlist.parkingspace.pnum }
                        ${tlist.vehiclemanager.carnum }
                        ${tlist.temporary.owners.owername}	</td>
                    <td>${tlist.priceproject.pricename }</td>
                    <td>${tlist.simsdate }<br>
						${tlist.simedate }</td>
                    <td class="c-red">￥${tlist.priceing==null?'--':tlist.priceing }</td>
					<td>${tlist.count==null?'--':tlist.count }</td>
					<td class="c-red">￥<span class="subtotal">${tlist.subtotal }</span></td>
					<td class="c-red">￥<span class="youhui">${tlist.youfei }</span></td>
					<td class="c-red">￥<span class="zhina">${tlist.zhina }</span></td>
					<td class="c-red">￥ <span class="yjiao">${tlist.subtotal-tlist.youfei+tlist.zhina }</span>
					</td>
                    <td><c:choose>
                    		<c:when test="${(uall.oid!=null)}">${uall.owners.owername }</c:when>
                    		<c:otherwise>${uall.onames }</c:otherwise>
                    	</c:choose>
                    	</td><td><c:choose>
                    	<c:when test="${(uall.oid!=null)}">${uall.owners.ownerphone }</c:when>
                    	<c:otherwise>${uall.ophone }</c:otherwise>
                    </c:choose></td>
                    <td>${uall.zfdate }</td>
                    <td><c:if test="${uall.status==0 }">已缴</c:if>
						<c:if test="${uall.status==1 }">退费</c:if>
						<c:if test="${uall.status==2 }">已退</c:if>
					</td>
                    <td>${tlist.remark==null?'-':tlist.remark }</td>
                </tr>
                </c:forEach>
                </c:forEach>
                <tr>
                    <td colspan="7">小计：</td>
                    <td class="c-red totalMoney"></td>
                    <td class="c-red totalYh"></td>
                    <td class="c-red totalZnj"></td>
                    <td class="c-red totalYjmoney" colspan="6"></td>
                </tr>
                <tr>
                    <td colspan="7">合计：</td>
                    <td class="c-red totalMoney"></td>
                    <td class="c-red totalYh"></td>
                    <td class="c-red totalZnj"></td>
                    <td class="c-red totalYjmoney" colspan="6"></td>
                </tr>
                </c:when>
				<c:otherwise>
                        	<tr><td colspan='16' style="text-align:center;"><h3>暂无缴费明细</h3></td></tr>
                </c:otherwise>
                </c:choose>
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
    <script>
    layui.use('laydate', function(){
    	  var laydate = layui.laydate;
            //日期时间选择器
            laydate.render({
                elem: '#startdata'
                ,type: 'datetime'
            });
            laydate.render({
                elem:'#enddata',
                type:'datetime'
            })
    });
  		$(function(){
  			 //加载小区的值，高级查询
  	  		datacenterController.selectAll(function(data){
  				var disid="${mohuselect.disid}";
  	  			for(var i=0;i<data.length;i++){
  	  	  			if(data[i].disid==disid){
  	  					$("select[name=disid]").append("<option value=\""+data[i].disid+"\" selected='selected'>"+data[i].dname+"</option>");
  	  	  			}else{
  	  	  			    $("select[name=disid]").append("<option value=\""+data[i].disid+"\">"+data[i].dname+"</option>");
  	  	  	  		}
  	  	  		}
  	  		});
  	  	var priceid="${mohuselect.priceid}";//获取收费的id，高级查询
	  		tollController.yipriceAll(function(data){
	  			for(var i=0;i<data.length;i++){
	  				if(data[i].priceid==priceid){
	  					$("select[name=priceid]").append("<option value=\""+data[i].priceid+"\" selected='selected'>"+data[i].pricename+"</option>");
	  				}else{
	  					$("select[name=priceid]").append("<option value=\""+data[i].priceid+"\">"+data[i].pricename+"</option>");
	  				}
	  			}
	  		});
  		if("${mohuselect.ztype}"!="" ){
			$("select[name=ztype]").val("${mohuselect.ztype }");
  	  	}
  			var subcount=$(".subtotal").length;
			var zongsub=0,zongyou=0,zongzhi=0,zongyu=0,zongyin=0;
			for(var i=0;i<subcount;i++){
				zongsub+=parseFloat($(".subtotal").eq(i).text());
				zongyou+=parseFloat($(".youhui").eq(i).text());
				zongzhi+=parseFloat($(".zhina").eq(i).text());
				zongyin+=parseFloat($(".yjiao").eq(i).text());
			}
			$(".totalMoney").eq(0).html("￥"+zongsub.toFixed(2));
			$(".totalYh").eq(0).html("￥"+zongyou.toFixed(2));
			$(".totalZnj").eq(0).html("￥"+zongzhi.toFixed(2));
			$(".totalYjmoney").eq(0).html("￥"+zongyin.toFixed(2));
			$(".totalMoney").eq(1).html("￥"+zongsub);
			$(".totalYh").eq(1).html("￥"+zongyou);
			$(".totalZnj").eq(1).html("￥"+zongzhi);
			$(".totalYjmoney").eq(1).html("￥"+zongyin);
  	  	})
    </script>
</body>
</html>