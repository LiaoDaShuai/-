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
	})
var datalist=[];
var sublist=[];
//初始化数据和数组
if("${toll.ztype}"!="" ){
	var type="${toll.ztype}";
	$("select[name=ztype]").val("${toll.ztype }");
}
var tollChart = echarts.init(document.getElementById('ytoll-chart'),'macarons');
tollChart.showLoading();//加载
	<c:forEach var="item" items="${datalist }">
		datalist.push("${item}");
	</c:forEach>
	<c:forEach var="item" items="${sublist }">
		sublist.push("${item}");
	</c:forEach>
window.setTimeout(function(){
	tollChart.hideLoading();//隐藏加载
	tollChart.setOption(option={
		title : {
	        text: "${list[0].district.dname}"+'小区统计',
            subtext:'总计：0',
            x:'center'
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {show: true, type: ['line', 'bar']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : datalist
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:"${list[0].district.dname}",
	            type:'line',
	            data:sublist,
	            markPoint : {
	                data : [
	                    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'}
	                ]
	            },
	            markLine : {
	                data : [
	                    {type : 'average', name: '平均值'}
	                ]
	            }
	        },
	    ]
	});
},1000);
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
				<h2>收入统计</h2>
			</div>
			<div class="hr-solid"></div>
			<div class="card-body card-padding">
				<form method="post" action="/wyht/report/UnpaidReport/"
					class="operation p-20">
					<div class="row actionBar">
						<div class="col-sm-3 pull-left">
						<div class="col-sm-4">
							<label for=""> 小区： </label>
						</div>
						<div class="col-sm-8">
							<select name="disid" class="form-control input-ll">
								<option value="">--请选择小区--</option>
								<c:forEach items="${dislist }" var="dlist">
									<c:choose>
									<c:when test="${dlist.disid==toll.disid }">
									<option value="${dlist.disid }" selected="selected">${dlist.dname }</option>
									</c:when><c:otherwise>
									<option value="${dlist.disid }">${dlist.dname }</option>
									</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						</div>
						<div class="col-sm-3 pull-left">
							<div class="col-sm-4">
								<label for=""> 周期选择： </label>
							</div>
							<div class="col-sm-8">
							<select name="ztype" class="form-control input-ll">
								<option value="">--请选择--</option>
								<option value="1">过去七天</option>
								<option value="2">过去一个月</option>
								<option value="3">过去三个月</option>
								<option value="4">过去半年</option>
							</select>
							</div>
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
							<button type="button" onclick="chaxun(this.form)" class="btn bgm-cyan">查询</button>
						</div>
					</div>
				</form>
				<div id="ytoll-chart" class="m-t-20" style="height: 500px;"></div>
			</div>
		</div>
	</div>
</body>
</html>