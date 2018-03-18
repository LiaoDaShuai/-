<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/tollController.js"></script>  
	<script src="/wyht/dwr/interface/datacenterController.js"></script>
	<script src="/wyht/js/toll/data_entry.js"></script>
    <style type="text/css">
    td{
		text-align: center;    
    }
    td input{width:80px;}
    </style>
	<script type="text/javascript">
	$(function(){
		layui.use('form',function(){
			var form=layui.form;
			form.on('select(price2Select)',function(da){
				$("#charg2 option[value!='0']").remove();
 		 		tollController.chargyiid(da.value,function(data){
					for(var i=0;i<data.length;i++){
						$("#charg2").append("<option value=\""+data[i].chargid+"\">"+data[i].chargname+"</option>");
					}
					form.render('select');
 			 	});
			});
		});
		 //加载小区的值，高级查询
  		datacenterController.selectAll(function(data){
			var disid="${mohuselect.tabDisId}";
  			for(var i=0;i<data.length;i++){
  	  			if(data[i].disid==disid){
  					$("select[name=tabDisId]").append("<option value=\""+data[i].disid+"\" selected='selected'>"+data[i].dname+"</option>");
  	  			}else{
  	  			    $("select[name=tabDisId]").append("<option value=\""+data[i].disid+"\">"+data[i].dname+"</option>");
  	  	  		}
  	  		}
  		});
  		var priceid="${mohuselect.tabPriceId}";//获取收费的id，高级查询
  		tollController.yipriceAll(function(data){
  			for(var i=0;i<data.length;i++){
  				if(data[i].priceid==priceid){
  					$("select[name=tabPriceId]").append("<option value=\""+data[i].priceid+"\" selected='selected'>"+data[i].pricename+"</option>");
  				}else{
  					$("select[name=tabPriceId]").append("<option value=\""+data[i].priceid+"\">"+data[i].pricename+"</option>");
  				}
  			}
  		});
  		if(priceid!=''){//如果收费项目id不为空，则判断标准id，高级查询
  			tollController.chargyiid(priceid,function(data){
  				var chargid="${mohuselect.tabChargId}";
  				for(var i=0;i<data.length;i++){
  					if(chargid==data[i].chargid){
  						$("#charg1").append("<option value=\""+data[i].chargid+"\" selected='selected'>"+data[i].chargname+"</option>");
  					}else{
  						$("#charg1").append("<option value=\""+data[i].chargid+"\">"+data[i].chargname+"</option>");
  					} 		
  				}
  			});
  		}
	});
	</script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row header">
            <div class="col-sm-12">抄表录入</div>
        </div>
        <div class="row small">
            <div class="col-sm-12"><i class="fa fa-question-circle"></i>
                功能说明：可根据住户姓名、住户手机号、房号、车位号、车牌号，快速搜索对应的未缴费用，
                修改未缴费用的优惠及滞纳金金额，完成对未缴费用的收取。
            </div>
        </div>
        <div class="hr-solid"></div>
        <div class="list-action-grid">
            <form method="post" name="f1" action="/wyht/toll/tableAll" class="form-horizontal" >
                <div class="col-sm-12 toggaoji" >
                <div class="row p-t-10">
                            <div class="form-group col-sm-4">
                            <label class="col-sm-3" style="margin-top:8px;">小区：</label>
                            <select class="form-control-static col-sm-7" name="tabDisId">
                                <option value=''>---请选择小区---</option>
                            </select></div>
                        <div class="form-group col-sm-4">
                             <label class="col-sm-3" style="margin-top:8px;">所在月份：</label>
                                <input type="text" name="tabMonths" class="form-control-static col-sm-7" value="${mohuselect.dateType }" readonly id="tabMonths1" placeholder="请选择日期">
                            </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">收费项目：</label>
                        <select class="form-control-static col-sm-7" id="price1" name="tabPriceId">
                            <option value=''>---请选择收费项目---</option>
                        </select>
                    </div>
                </div>
                <div class="row p-t-10" >
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">收费标准：</label>
                        <select class="form-control-static col-sm-7" id="charg1" name="tabChargId">
                            <option value="0">---请选择收费标准---</option>
                        </select></div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-3" style="margin-top:8px;">关键字：</label>
                        <input type="text" class="form-control-static col-sm-7" id="advanced" disabled value="${mohuselect.keywords }" name="keywords" placeholder="小区/房号/收费项目/收费标准">
                    </div>
                    <div class="form-group col-sm-4">
                        <button class="col-sm-3 btn btn-success" type="submit" style="margin:0 5px 0 10px;"><i class="fa fa-search"></i> 搜索 </button>
                        <button class="col-sm-3 btn btn-default" type="reset" style="margin-right:5px;"> 清空</button>
                        <button class="col-sm-3 btn btn-default closes" type="button" > 关闭</button>
                    </div>
                </div>
                </div>
                <div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
                </div>
           <div style="padding:11px;margin-top:6px;">
            <div class="action pull-left">
                <a class="btn btn-success" data-toggle="modal" href="#luru">
            录入数据</a>
<!--                 <a class="btn btn-success " href="*" -->
<!--                         data-toggle="modal" data-target="#daochu"> -->
<!--             导出抄表单</a> -->
<!--                 <a class="btn btn-success " href="*" -->
<!--                    data-toggle="modal" data-target="#daoru"> -->
<!--                     导入抄表单</a> -->
                <button type="button" id="del" disabled class="btn btn-success">
            批量删除</button>
        </div>
            <div class="pull-right">
                <a href="javascript:" class="pull-left gaoji">
            高级搜索</a>
                <div class="suotext">
                    <input type="text" name="keywords" id="ordinary" value="${mohuselect.keywords }" class="wentext" placeholder="小区/房号/收费项目/收费标准">
                    <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
                </div>
                    <a href="" class="btn-list" target="_blank" title="帮助中心">
                        <i class="fa fa-question"></i></a>
                </div>
              </div>
            </form>
        </div>
        <div class="layui-form table-responsive col-sm-12" >
                <table class="table table-hover">
                    <thead>
                <tr>
                <th  style="width:20px;"><input type="checkbox" class="quan" lay-filter="allChoose"/></th><th>小区</th>
                <th>房号</th><th>收费项目</th>
                <th>收费标准</th><th>月份</th>
<!--                 <th>单价</th> -->
                <th>起度</th>
                <th>止度</th><th>倍率</th>
                <th>公摊</th>
<!--                 <th>损耗</th> -->
                <th>用量</th><th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            	<c:choose>
					<c:when test="${!empty page.list }">
           		<c:forEach items="${page.list }" var="tab"> 
                <tr>
                    <td><input type="checkbox" name="checks" lay-filter="itemChoose" class="dan"></td><td>${tab.district.dname }</td>
                    <td>${tab.housefan.hnum}</td><td>${tab.priceproject.pricename }</td>
                    <td>${tab.chargs.chargname}</td><td>${tab.dateType }</td>
<%--                     <td>${tab.chargs.pricing==null?'--':tab.chargs.pricing }</td> --%>
                    <td><input type="text" name="tabStartnum${tab.tabId }" class="wuye-input-sm edit${tab.tabId }" readonly value="${tab.tabStartnum }"></td>
                    <td><input type="text" name="tabEndnum${tab.tabId }" class="wuye-input-sm edit${tab.tabId }" readonly value="${tab.tabEndnum }"></td>
                    <td><input type="text" name="beilv${tab.tabId }" class="wuye-input-sm edit${tab.tabId }" readonly value="${tab.tabBeilv }"></td>
                    <td><input type="text" name="gongtan${tab.tabId }" class="wuye-input-sm edit${tab.tabId }" readonly value="${tab.tabGongtan }"></td>
<%--                     <td>${tab.priceproject.sunhao==null?'--':tab.priceproject.sunhao}</td> --%>
                    <td id="bcount">${tab.tabEndnum-tab.tabStartnum}</td>
                    <td><input type="text" name="tabRemark${tab.tabId }" class="wuye-input-sm edit${tab.tabId }" readonly value="${tab.tabRemark==''?'--':tab.tabRemark }"></td>
                    <td><c:if test="${tab.tabStatus==0 }"><a class="updateedit onClickhand"  name="edit${tab.tabId }" ><i class="fa fa-edit"></i> 修改编辑</a></c:if></td>
                </tr>
                </c:forEach>
               </c:when>
				<c:otherwise>
                        <tr><td colspan='15' style="text-align:center;"><h3>暂无未缴信息</h3></td></tr>
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

<div class="modal fade" id="daochu" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:12%;">
    <form action="/cost/export_chaobiao.jsp">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">导出抄表单</h4></div>
            <div class="modal-body">
                <div class="row p-10"><div class="col-sm-3 p-t-10"><label for="">小区</label>
            </div><div class="col-sm-6">
                <input type="text" readonly="" class="form-control" placeholder="点击过后再右侧选择">
            </div></div>
                <div class="row p-10">
                <div class="col-sm-3 p-t-10">
                <label for="">收费项目</label></div>
                <div class="col-sm-6">
                <select name="projectid" class="form-control biaozhun">
                    <option value="">---请选择收费项目---</option>
                </select></div>
            </div>
                <div class="row p-10">
                    <div class="col-sm-3 p-t-10"><label for="">
                        收费标准
                    </label></div>
                <div class="col-sm-6">
                <select name="tabChargId" class="form-control biaozhun" >
                    <option value="">---请选择收费标准---</option>
                </select></div></div>
            </div><div class="modal-footer" style="background-color: rgba(0,0,0,0.1);">
                <input type="hidden" name="xiaoquid" class="xiaoquid">
                <input type="hidden" name="xq_name" class="xq_name">
                <button type="submit" id="" class="btn btn-success ">导出</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div></div></form>
    </div></div>
<!-- 录入数据 -->
<div class="modal fade" id="luru"  tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" >
        <form class="layui-form" action="/wyht/toll/tableadd" method="post">
            <div class="modal-content">
                <div class="modal-header"><h4 class="modal-title">录入数据</h4></div>
                <div class="modal-body">
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                            <label for="">房号</label>
                        </div>
                        <div class="layui-input-block">
                            <input type="text" readonly value="" id="select_zhuhu" class="layui-input layui-input-k yes" placeholder="点击过后在右侧选择">
                        	<input type="hidden" name="tabDisId" value="">
                        	<input type="hidden" name="tabFanId" value="">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                            <label for="">月份</label>
                        </div>
                        <div>
                            <div class="layui-input-block">
                                <input type="text" id="tabMonths2" readonly class="layui-input" placeholder="请输入月份">
                            	<input type="hidden" name="tabMonths" id="addtabMonth" value="">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                            <label for="">收费项目</label>
                        </div>
                        <div>
                            <div class="layui-input-block">
                               <select id="price2" name="tabPriceId" lay-filter="price2Select">
                                    <option value="0">--请选择收费项目--</option>
                               </select>
                            </div>
                        </div>
                    </div><div class="layui-form-item">
                    <div class="layui-form-label">
                        <label for="">收费标准</label>
                    </div>
                        <div class="layui-input-block">
                            <select id="charg2" name="tabChargId">
                                <option value="0">--请选择收费标准--</option>
                            </select>
                        </div>
                </div><div class="layui-form-item">
                    <div class="layui-form-label">
                        <label for="">起度</label>
                    </div>
                        <div class="layui-input-block">
                            <input type="text" name="tabStartnum" value="0" class="layui-input">
                        </div>
                </div>
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                            <label for="">止度</label>
                        </div>
                            <div class="layui-input-block">
                                <input type="text" name="tabEndnum" value="0" class="layui-input">
                            </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                            <label for="">倍率</label>
                        </div>
                        <div class="layui-input-block">
                            <input type="text" name="TabBeilv" value="1" class="layui-input">
                        </div>
                    </div>
                <div class="layui-form-item">
                    <div class="layui-form-label">
                        <label for="">公摊</label>
                    </div>
                        <div class="layui-input-block">
                            <input type="text" name="tabGongtan" value="0" class="layui-input">
                        </div>
                </div><div class="layui-form-item">
                    <div class="layui-form-label">
                        <label for="">备注</label>
                    </div>
                    <div class="layui-input-block">
                        <input type="text" name="tabRemark" value="" class="layui-input">
                    </div>
                </div>
                </div>
				<div class="modal-footer">
					<div class="layui-form-item">
						<div class="layui-input-block">
						  <button type="button" class="layui-btn" onClick="daoru_submit(this.form)" >确定</button>
						  <button type="button" class="layui-btn layui-btn-primary " data-dismiss="modal">关闭</button>
						</div>
					</div>
                </div>
            </div>
        </form>
    </div>
    <div class="user_info">
    <ul class="tab-nav ">
        <li class="active">
            <a href="">绑定住户</a>
        </li>
    </ul>
    <a class="close_side closediv">×</a>
    <div class="layui-form" style="padding: 20px;height: 95%">
        <input type="text" class="chat-search" placeholder="姓名或手机">
        <div class="r-content">
           <div class="FanNumresult" id="scrollcediv" style="overflow: auto"></div>
        </div>
        <div class="fake-box">
             <button type="button" class="btn btn-sm btn-primary btn-w-m fake-save">保存</button>
             <a class="btn btn-sm btn-default btn-w-m m-l-10 closediv">返回</a>
        </div>
    </div>
</div>
<div class="user_bg"></div>
</div>
<div class="modal fade" id="daoru" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog"  style="margin-top:12%;">
    <form action="#">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">导入抄表单</h4></div>
            <div class="modal-body">
                <div class="row p-10">
                    <div class="col-sm-3 p-t-10" >
                        <label for="">月份</label>
                    </div>
                    <div class="col-sm-6">
                        <input readonly type="text" id="tabMonths"  class="form-control form-control-k"/>
                    	<input type="hidden" name="tabMonths" value="">
                    </div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-3 p-t-10">
                        <label>选择excel文件</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="file" name="">
                    </div>
                </div>
                <div class="row p-01">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">如果要导入的抄表数据在本系统中已经存在，则做如下处理:</div>
                </div>
                <div class="row p-10">
                    <div class="col-sm-3"></div>
                    <div class=" col-sm-6">   跳过重复数据</div></div>
                <div class="row p-10">
                    <div class="col-sm-3"></div>
                    <div class=" col-sm-6">   替换重复数据</div></div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" type="submit">导入</button>
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </form></div>
</div>

</body>
</html>