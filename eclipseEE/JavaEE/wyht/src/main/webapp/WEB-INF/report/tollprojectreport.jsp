<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
var tollChart = echarts.init(document.getElementById('qToll-chart'),'macarons');
tollChart.showLoading();//加载
var subtotal=0;
var disnamedata=[];
	<c:forEach var="item" items="${list }">
	subtotal+=parseFloat("${item.subtotal}");
	disnamedata.push({name:"${item.priceproject.pricename}",value:"${item.subtotal}"});
	</c:forEach>
window.setTimeout(function(){
	tollChart.hideLoading();//隐藏加载
	tollChart.setOption(option={
	title : {
        text: "欠费总计\t:\t"+subtotal,
        x:'center'
   	},
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:disnamedata//把信息数组给他
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
            name:'欠费统计',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:disnamedata,
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
				<h2>欠费统计</h2>
			</div>
			<div class="hr-solid"></div>
				<div id="qToll-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>