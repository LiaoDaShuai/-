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
var dname="";
var subtatol=0;
var disnamedata=[{'name':'房屋相关',value:0,'ztype':1},{'name':'车位相关',value:0,'ztype':2},
	{'name':'车辆相关',value:0,'ztype':3},{'name':'自定义金额',value:0,'ztype':4},
	{'name':'其他',value:0,'ztype':5},];
	<c:forEach var="item" items="${list }">
	subtatol+=parseFloat("${item.subtotal}");
	dname="${item.district.dname}";
	if("${item.ztype}"==1){
			disnamedata[0].value="${item.subtotal}";
		}else if("${item.ztype}"==2){
			disnamedata[1].value="${item.subtotal}";
		}else if("${item.ztype}"==3){
			disnamedata[2].value="${item.subtotal}";
		}else if("${item.ztype}"==4){
			disnamedata[3].value="${item.subtotal}";
		}else if("${item.ztype}"==5){
			disnamedata[4].value="${item.subtotal}";
		}
	</c:forEach>
window.setTimeout(function(){
	tollChart.hideLoading();//隐藏加载
	tollChart.setOption(option={
	title : {
        text: dname+"小区   欠费统计\t:\t"+subtatol+"元",
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
//echarts 绑定点击事件
tollChart.on("click", eventClick);
});
//监听事件
function eventClick(param) {
    if (typeof param.seriesIndex != 'undefined') {
		if (param.type == 'click') {
			window.location.href='/wyht/report/QtollReport/'+"${list[0].district.disid}"+'/'+param.data.ztype;
		}	          
	}
}
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
			<div class="card-body card-padding">
				<form method="post" action="/wyht/report/QtollReport/"
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
									<c:when test="${dlist.disid==list[0].district.disid }">
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
				<div id="qToll-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>