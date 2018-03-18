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
var parkChart = echarts.init(document.getElementById('house-chart'),'macarons');
parkChart.showLoading();//加载
var dname="";
var disnamedata=[{'name':'出售',value:0},{'name':'出租',value:0},{'name':'空置',value:0},{'name':'自用',value:0},];
	<c:forEach var="item" items="${list }">
	dname="${item.dis.dname}";
	if("${item.status}"==0){
			disnamedata[0].value="${item.tollcount}";
		}else if("${item.status}"==1){
			disnamedata[1].value="${item.tollcount}";
		}else if("${item.status}"==2){
			disnamedata[2].value="${item.tollcount}";
		}else if("${item.status}"==3){
			disnamedata[3].value="${item.tollcount}";
		}
	</c:forEach>
window.setTimeout(function(){
	parkChart.hideLoading();//隐藏加载
parkChart.setOption(option={
	title : {
        text: dname+'小区   车位统计',
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
            name:'车位统计',
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
				<h2>车位统计</h2>
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
				<div id="house-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>