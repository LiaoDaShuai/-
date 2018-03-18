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
	layui.use('laydate',function(){
		var laydate=layui.laydate;
		laydate.render({
			elem:'#begintime',
			type:'date'
		});
		laydate.render({
			elem:'#endtime',
			type:'date'
		});
	});
//初始化数据
if("${toll.ztype}"!="" ){
	$("select[name=ztype]").val("${toll.ztype }");
}
	
var tollChart = echarts.init(document.getElementById('ytoll-chart'),'macarons');
tollChart.showLoading();//加载
var subtotal=0;
var disnamedata=[];
	<c:forEach var="item" items="${list }">
		subtotal+=parseFloat("${item.totalYjmoney}");
		disnamedata.push({name:"${item.district.dname}",value:"${item.totalYjmoney}",disid:"${item.district.disid}"});
	</c:forEach>
window.setTimeout(function(){
	tollChart.hideLoading();//隐藏加载
tollChart.setOption(option={
	title : {
        text: '总计\t:\t'+subtotal,
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
            name:'收入统计',
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
//echarts 绑定点击事件
tollChart.on("click", eventClick);
});
//监听事件
function eventClick(param) {
    if (typeof param.seriesIndex != 'undefined') {
		if (param.type == 'click') {
			window.location.href='/wyht/report/UnpaidReport/'+param.data.disid;
		}	          
	}
}
</script>
</head>
<body>
	<div class="container col-sm-11" style="margin: 80px 0 0 90px;">
		<div class="card">
			<div class="card-header">
				<h2>收入统计</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body card-padding">
				<form method="post" action="/wyht/report/UnpaidReport"
					class="operation p-20">
					<div class="row actionBar p-15">
						<div class="p-t-10 pull-left">
							<label for=""> 周期选择： </label>
						</div>
						<div class="col-sm-3  pull-left">
							<select name="ztype" class="form-control input-ll">
								<option value="">--请选择--</option>
								<option value="1">过去七天</option>
								<option value="2">过去一个月</option>
								<option value="3">过去三个月</option>
								<option value="4">过去半年</option>
							</select>
						</div>
						<div class="col-sm-3 pull-left">
						<div class="col-sm-1">
						<label>从</label>
						</div>
						<div class="col-sm-10">
						<input type="text" class="form-control form-control-k" readonly name="sdate" id="begintime" value="${toll.simsdate==null?'':toll.simsdate }"></div>
	                   </div>
	                   <div class="col-sm-3 pull-left"> 
	                   <div class="col-sm-1">
	                   		<label>到</label>
	                   </div>
	                   <div class="col-sm-10">
	                   		<input type="text" class="form-control form-control-k" readonly name="edate" id="endtime" value="${toll.simedate==null?'':toll.simedate }">
	                   </div>
						</div>
						<div class="m-l-15">
							<button type="submit" class="btn bgm-cyan">查询</button>
						</div>
					</div>
				</form>
				<div id="ytoll-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>