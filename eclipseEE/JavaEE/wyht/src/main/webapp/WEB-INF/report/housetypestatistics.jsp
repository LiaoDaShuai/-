<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script src="/wyht/js/echarts.min.js"></script>
<script src="/wyht/js/macarons.js"></script>
<script type="text/javascript" src="/wyht/dwr/engine.js"></script>
<script type="text/javascript" src="/wyht/dwr/util.js"></script>
<script type="text/javascript" src="/wyht/dwr/interface/reportController.js"></script>
<script type="text/javascript">
$(function(){
var houseChart = echarts.init(document.getElementById('housetype-chart'),'macarons');
houseChart.showLoading();//加载
var housetypedata=[{name:'住宅',value:0},{name:'公寓',value:0},{name:'办公',value:0},
	{name:'厂房',value:0},{name:'仓库',value:0},{name:'商铺',value:0},{name:'酒店',value:0},
	{name:'别墅',value:0},{name:'其他',value:0},];
if("${list}"!=null){
	<c:forEach var="item" items="${list }">
		dname="${item.dis.dname}";
		if("${item.utype}"==1){
			housetypedata[0].value="${item.louceng}";
		}else if("${item.utype}"==2){
			housetypedata[1].value="${item.louceng}";
		}else if("${item.utype}"==3){
			housetypedata[2].value="${item.louceng}";
		}else if("${item.utype}"==4){
			housetypedata[3].value="${item.louceng}";
		}else if("${item.utype}"==5){
			housetypedata[4].value="${item.louceng}";
		}else if("${item.utype}"==6){
			housetypedata[5].value="${item.louceng}";
		}else if("${item.utype}"==7){
			housetypedata[6].value="${item.louceng}";
		}else if("${item.utype}"==8){
			housetypedata[7].value="${item.louceng}";
		}else if("${item.utype}"==9){
			housetypedata[8].value="${item.louceng}";
		}
    </c:forEach> 
}
//获取数据
window.setTimeout(function(){
	houseChart.hideLoading();//隐藏加载
houseChart.setOption(option={
	title : {
        text:dname+'小区  房屋统计',
        x:'center'
   	},
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:housetypedata//把信息数组给他
    },//右边的三个功能
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'房屋统计',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:housetypedata,
	        itemStyle: {
	            emphasis: {
	                shadowBlur: 10,
	                shadowOffsetX: 0,
	                shadowColor: 'rgba(0, 0, 0, 0.5)'
	            }
	        }
        }
    ]
});
},1000)
});
function chaxun(form){
	if(form.disid.value==""){
		sweetAlert({text:'请输入选择小区',type:'warning',timer:1500,showConfirmButton:false});
	}else{
		form.action=form.action+form.disid.value;
		form.submit();
	}
}
</script>
</head>
<body>
	<div class="container col-sm-11" style="margin: 80px 0 0 90px;">
		<div class="card">
			<div class="card-header">
				<h2>房屋统计</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body card-padding">
				<form method="post" action="/wyht/report/housereport/"
					class="operation p-20">
					<div class="row actionBar p-15">
						<div class="p-t-10 pull-left">
							<label for=""> 小区： </label>
						</div>
						<div class="col-sm-4  pull-left">
							<select name="disid" class="form-control input-ll">
								<option value="">--请选择小区--</option>
								<c:forEach items="${dislist }" var="dlist">
									<c:choose>
									<c:when test="${dlist.disid==list[0].dis.disid }">
									<option value="${dlist.disid }" selected="selected">${dlist.dname }</option>
									</c:when><c:otherwise>
									<option value="${dlist.disid }">${dlist.dname }</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="m-l-15">
							<button type="button" onclick="chaxun(this.form)" class="btn bgm-cyan">查询</button>
						</div>
					</div>
				</form>
				<div id="housetype-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>