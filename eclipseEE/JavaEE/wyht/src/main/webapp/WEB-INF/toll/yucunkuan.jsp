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
	<script src="/wyht/js/toll/yucunkuan.js"></script>
    <style>
    	td{
    		text-align: center;
    	}
    </style>
    <script>
    </script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/toll/selectPredAll">
                <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">预存款管理</div></a>
            <a href="/wyht/toll/selectPredJiAll"><div class="navkuai" >预存款明细</div></a>
        </div>
        <form action="/wyht/toll/selectPredAll" method="post" name="f1">
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
<!--                 <button class="btn btn-success" type="button" data-toggle="modal" data-target="#daoru">预存款导入</button> -->
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#chongzhi">预存款充值</button>
                <div class="pull-right">
                    <a href="javascript:" class="pull-left gaoji">
                        高级搜索</a>
                    <div class="suotext">
                        <input type="text" name="kw" value="" a class="wentext" placeholder="请输入手机号/业主姓名">
                        <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
                    </div>
                    <a href="" class="btn-list" target="_blank" title="帮助中心">
                        <i class="fa fa-question"></i></a>
                </div>
            </div>
        </form>
        <div class="table-responsive col-sm-12" >
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>住户</th>
                    <th>手机号</th>
                    <th>类型</th>
                    <th>预存金额</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list }" var="prd">
                <tr>
                    <td>${prd.district.dname }</td><td>${prd.owners.owername}</td>
                    <td>${prd.owners.ownerphone }</td>
                    <td>通用预存款</td><td class="c-red">￥<span class="or${prd.predOid }">${prd.predMoney }</span></td>
                    <td><a href="findpredoid/${prd.predOid }" class="a-opts" >查看</a>
                        <a data-toggle="modal" id="ds${prd.predDisId }" name="or${prd.predOid }"  href="#tuiku" class="tuikuns">退款</a>
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

<div class="modal fade" id="print_template" tabindex="-1" role="dialog" aria-hidden="true">
    <form method="post" action="/cost/print_sj.jsp" style="margin-top:8%;" target="_blank" class="print_zd">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header"><h4 class="modal-title">选择打印模板</h4></div>
                <div class="modal-body">
                    <div class="row p-10">
                        <div class="col-sm-3 p-t-10"><label for="">
                            模板
                        </label></div>
                        <div class="col-sm-6">
                            <select name="print_id" class="form-control">
                                <option value="1942">微小区缴费收据（默认）</option>
                            </select></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="none ids"><input name="tid" id="tid" type="hidden" value="34536"></div>
                    <button type="submit" id="" class="btn btn-primary">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 预存款退款 -->
<div class="modal fade" id="tuiku" role="dialog" aria-hidden="true" >
  <div class="modal-dialog"  style="margin-top:8%;">
    <form class="layui-form" method="post" action="/wyht/toll/PredTuiKuan"
     class="print_zd">
            <div class="modal-content">
                <div class="modal-header"><h4 class="modal-title">预存款退款</h4></div>
                <div class="modal-body">
                    <div class="layui-form-item">
                        <div class="layui-form-label">
                        <label for="">退款人</label>
                        </div>
                        <div class="layui-input-block">
                           <input type="text" name="predTuiname" class="layui-input">
                    	</div>
                	</div>
                	 <div class="layui-form-item">
                        <div class="layui-form-label">
                        <label for="">手机号</label>
                        </div>
                        <div class="layui-input-block">
                           <input type="text" name="predTuiphone"  class="layui-input">
                    	</div>
                	</div>
                	 <div class="layui-form-item">
                        <div class="layui-form-label">
                        <label for="">退款金额(元)</label>
                        </div>
                        <div class="layui-input-block">
                        	<input type="text" class="layui-input" name="predMoney" value="">
                    	</div>
                	</div>
                	 <div class="layui-form-item">
                        <div class="layui-form-label">
                        <label for="">退款说明</label>
                        </div>
                        <div class="layui-input-block">
                           <input type="text" name="predTuiremark" class="layui-input">
                    	</div>
                	</div>
                </div>
                <div class="modal-footer">
					<div class="layui-form-item">
					    <div class="layui-input-block">
						<div class="none ids">
						  <input name="predDisId" id="did2" type="hidden" value="">
						  <input name="predOid" id="oid2" type="hidden" value=""></div>
					      <button type="button" class="layui-btn" onClick="isSubmit(this.form)">确定</button>
					      <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
					    </div>
				  	</div>
                </div>
            </div>
    </form>
        </div>
</div>
<!-- 预存款充值 -->
<div class="modal fade" id="chongzhi"  role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:8%;">
    <form class="layui-form" action="/wyht/toll/PredAdd" method="post">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">预存款充值</h4></div>
            <div class="modal-body">
                <div class="layui-form-item">
                    <div class="layui-form-label"><label for="" >
                        选择住户</label></div>
                        <div class="layui-input-block">
                            <input type="text" readonly id="select_zhuhu" class="layui-input layui-input-k yes" >
                            <input type="hidden" name="predDisId" id="did1">
                            <input type="hidden" name="predOid" id="oid1" >
                        </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label"><label for="">
                        充值类型
                    </label></div>
                    <div class="layui-input-block">
                        <input type="radio" name="pred_type" checked="checked" value="1"><span style="margin-left:-22px;">通用存款充值</span>
<!--                         <input type="radio" class="" value="">专用预存款充值 -->
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label"><label for="">
                        充值金额(元)
                    </label></div>
                    <div class="layui-input-block">
                            <input type="text" name="predMoney" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label"><label for="">
                        备注
                    </label></div>
                    <div class="layui-input-block">
                    <input type="text" name="predRemark" class="layui-input"></div>
                </div>
            </div>
        <div class="modal-footer">
			<div class="layui-form-item">
				<div class="layui-input-block">
				  <button type="submit" class="layui-btn">确定</button>
				  <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
				</div>
			</div>
        </div></div>
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
        <div class="r-content" >
           <div class="FanNumresult" id="scrollcediv"></div>
        </div>
        <div class="fake-box">
             <button type="button" class="btn btn-sm btn-primary btn-w-m fake-save">保存</button>
             <a class="btn btn-sm btn-default btn-w-m m-l-10 closediv">返回</a>
        </div>
    </div>
</div>
<div class="user_bg"></div>
</div>

<div class="modal fade" id="daoru" tabindex="-1" role="dialog"
     aria-hidden="true">
        <div class="modal-dialog"  style="margin-top:8%;">
        <form method="post" action="/cost/print_sj.jsp" target="_blank">
            <div class="modal-content">
                <div class="modal-header"><h4 class="modal-title">导入预存款</h4></div>
                <div class="modal-body">
                    <div class="row p-10">
                        <div class="col-sm-3 p-t-10"><label for="">
                            所选小区
                        </label></div>
                        <div class="col-sm-6">
                            <select name="print_id" class="form-control">
                                <option value="1942">--请选择小区--</option>
                            </select></div>
                    </div><div class="row p-10">
                    <div class="col-sm-3 p-t-10"><label for="">
                        选择类型
                    </label></div>
                    <div class="col-sm-6">
                        <select name="print_id" class="form-control">
                            <option value="1942">通过手机号</option>
                        </select></div>
                </div><div class="row p-10">
                    <div class="col-sm-3 p-t-10"><label for="">
                        选择excel文件
                    </label></div>
                    <div class="col-sm-3">
                        <input type="file">
                    </div>
                </div>
                    <div class="row p-10" >
                        <div class="col-sm-6 col-sm-offset-3">
                            <i class="fa fa-warning text-danger"></i>
                            如何导入预存款
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="none ids"><input name="tid"  type="hidden" value="34536"></div>
                    <button type="submit" id="" class="btn btn-primary">导入</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
    	</form>
    </div>
</div>
</body>
<script>
$(function(){
	layui.use('form',function(){
		var form=layui.form;
		form.render();
	});
})
</script>
</html>