<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
	<link rel="stylesheet" href="/wyht/css/jquery-ui.min.css"/>
    <script src="/wyht/js/jquery-ui.min.js"></script>
    <script src="/wyht/js/toll/priceproject.js"></script>
     <script src="/wyht/js/toll/cost_shoufei.js"></script>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
    <script type="text/javascript" src="/wyht/dwr/interface/tollController.js"></script>
    <style>
        table {
            border: 1px solid #e0e0e0;
        }
        th, td {
            border-bottom: 1px solid #E0E0E0;
            text-align:center;
        }
    </style>
    <script>
$(function(){
	if("${mohuselect.pricetype}"!="" ){
		$("select[name=pricetype]").val("${mohuselect.pricetype }");
	}
	layui.use('form',function(){
    	var form=layui.form;
    	form.on('select(shouidSelect)',function(data){
    		var _val=data.value;
    		_val++;
    		if (_val==1) {
    			$("select[name=priceunit]").attr("disabled", false);
    		} else {
    			$("select[name=priceunit]").attr("disabled", true);
    		}
    		for(var i=1;i<5;i++) {
    			if (i==_val&&i!=2) {
    				$(".js_type-"+i).show();
    			} else {
    				$(".js_type-"+i).hide();
    			}
    		}
    		form.render();
    	});
    });
})
</script>
</head>
<body>
    <div class="container col-sm-11 container-bianju">
        <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
            <a href="/wyht/toll/priceAll">
                <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">收费项目</div>
            </a>
            <a href="/wyht/toll/formulaAll">
                <div class="navkuai">自定义公式</div>
            </a>
        </div>
        <form action="/wyht/toll/priceAll" method="post" name="f1" class="form-horizontal">
            <div style="margin:10px 0 5px 15px;">
                <div class="pull-left">
                    <a href="/wyht/toll/priceinsert" 
                    class="btn btn-success">添加收费项目</a>
                </div>
                <div class="pull-right">
                    <div class="suotext">
                        <select name="pricetype" class="wentext" style="margin-right:5px;">
                            <option value="" selected="selected">项目类别</option>
                            <option value="1">周期性</option>
                            <option value="2">押金性</option>
                            <option value="3">临时性</option>
                        </select>
                        <input type="text" name="pricename" value="${mohuselect.pricename }" class="wentext" placeholder="请输入关键字">
                        <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
                    </div>
                    <a href="" class="btn-list" target="_blank" title="帮助中心">
                        <i class="fa fa-question"></i></a>
                </div>
            </div>
            <div><!-- 存放分页的数据 -->
                	<input type="hidden" name="pageNum" value="">
					<input type="hidden" name="pageSize" value="${page2.size }">
               	 	</div>
        </form>
        <c:forEach items="${page.list }" var="pe">
        <div class="table-responsive col-sm-12 ">
        <table class="table table-cost">
            <thead>
            <tr>
                <th colspan="6">
                    <div class="pull-left" style="margin-top:4px;">
                        <label for="">${pe.pricename }</label>
                        <span class="m-l-15">
                            	类别：
                            <c:if test="${pe.pricetype==1 }">
                            	<small style="color: #f44336!important">周期性</small>
                            </c:if><c:if test="${pe.pricetype==2 }">
                            	<small style="color: #ffc107!important">临时性</small>
                            </c:if><c:if test="${pe.pricetype==3 }">
                            	<small style="color:#00bcd4!important">押金性</small>
                            </c:if>
                        </span></div>
                    <div class="pull-right">
                        <ul class="actions">
                            <li><a href="#addshoufei" id="${pe.priceid }" name="${pe.pricename}" class="addbiao" data-toggle="modal" title="添加收费标准"><i
                                    class="fa fa-plus"></i></a></li>
                            <li><a href="/wyht/toll/priceedit?priceid=${pe.priceid}" title="编辑收费项目"><i
                                    class="fa fa-edit"></i></a></li>
                            <li><a href="javascript:" class="del_pro" id="${pe.priceid }" name="${pe.chargslist[0].chargname }" title="删除收费项目"><i
                                    class="fa fa-trash"></i></a></li>
                        </ul>
                    </div>
                </th>
            </tr>
            <tr>
                <th> 收费标准 </th>
                <th> 单价</th>
                <th>计量方式</th>
                <th> 计算方式</th>
                <th> 收费周期</th>
                <th> 操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${pe.chargslist!=null }">
            <c:forEach items="${pe.chargslist }" var="cglist"> 
            <tr>
                <td>${cglist.chargname }</td>
                <td>${(cglist.pricing==null)?"-":cglist.pricing }</td>
                <td><c:choose>
                <c:when test="${(cglist.priceunit==null)}">-</c:when>
                <c:when test="${(cglist.priceunit==1)}">房屋建筑面积(㎡)</c:when>
                <c:when test="${(cglist.priceunit==2)}">房屋套内面积(㎡)</c:when>
                <c:when test="${(cglist.priceunit==3)}">房屋公摊面积(㎡)</c:when>
                <c:when test="${(cglist.priceunit==4)}">用量（止度-起度）</c:when>
                <c:when test="${(cglist.priceunit==5)}">车位面积(㎡)</c:when>
                <c:when test="${(cglist.priceunit==6)}">车辆排量</c:when>
                </c:choose></td>
                <td><c:choose>
                <c:when test="${(cglist.shouid==0)}">单价*数量</c:when>
                <c:when test="${(cglist.shouid==1)}">每户单独输入</c:when>
                <c:when test="${(cglist.shouid==2)}">固定金额:${cglist.fixedprice }</c:when>
                <c:when test="${(cglist.shouid==3)}">自定义公式</c:when>
                </c:choose></td>
                <td>${cglist.priceweek}</td>
                <td><a class="a-opts "><i class="fa fa-search"></i>
                    查看
                </a><a href="#ceshi" data-toggle="modal" class="a-opts ceshi m-l-15"><i
                        class="fa fa-calculator"></i>
                    测试
                </a><a href="#addshoufei" id="${cglist.chargid }" name="${pe.pricename}" data-toggle="modal" class="a-opts m-l-15 editbiao"><i
                        class="fa fa-edit"></i>
                    编辑
                </a><a href="javascript:" class="del" id="${cglist.chargid }"><i class="fa fa-trash"></i>
                    删除
                </a></td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${empty pe.chargslist }">
            	<tr><th colspan="6" style="padding:60px 80px;background-color:#fff!important;">
            	<span>该收费项目还未添加收费标准。</span><br/>
            	<a href="#addshoufei" id="${pe.priceid }" name="${pe.pricename}" data-toggle="modal" class="btn btn-success addbiao"
                    style="margin-top:20px;">添加收费标准</a></th></tr>
            </c:if>
            </tbody>
        </table>
        </div>
        </c:forEach>
      
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
<div class="modal fade" tabindex="-1" id="addshoufei" role="dialog" aria-hidden="true"
     style="margin-top:4%">
    <form class="layui-form" action="/wyht/toll/chargadd" method="get" id="form1" name="form1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="price-header">添加收费标准</h4>
            </div>
            <div class="modal-body">
            		<input type="hidden" name="chargid" value="">
                    <input type="hidden" name="price_id" value="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">收费项目:</label>
                        <div class="layui-input-block"><input type="text" class="layui-input" id="addpricename" value="" readonly></div>
                    </div>
                    <div class=" layui-form-item"><label class="layui-form-label">标准名称:</label>
                        <div class="layui-input-block"><input type="text" class="layui-input" name="chargname" id="" value=""></div>
                    </div>
                    <div class=" layui-form-item"><label class="layui-form-label">金额计算方式:</label>
                        <div class="layui-input-block">
                            <select name="shouid" id="js_type" lay-filter="shouidSelect">
                                <option value="0">单价*数量</option>
                                <option value="1">每户单独输入</option>
                                <option value="2">固定金额</option>
                                <option value="3">自定义公式</option>
                            </select>
                        </div>
                    </div>
                    <section class="js_type-1">
                        <div class="layui-form-item"><label class="layui-form-label">单价:</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="pricing">
                                <div class="m-t-10">注意:收费单价为一个月的单价。</div>
                            </div>
                        </div>
                        <div class="layui-form-item"><label class="layui-form-label">计量方式:</label>
                            <div class="layui-input-block">
                                <select name="priceunit">
                                    <option value="1">房屋建筑面积(㎡)</option>
                                    <option value="2">房屋套内面积(㎡)</option>
                                    <option value="3">房屋公摊面积(㎡)</option>
                                    <option value="4">用量（止度-起度）</option>
                                    <option value="5">车位面积(㎡)</option>
                                    <option value="6">车辆排量</option>
                                </select>
                            </div>
                        </div>
                    </section>
                    <section class="js_type-3" style="display: none">
                        <div class="layui-form-item"><label class="layui-form-label">固定金额(元):</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" name="fixedprice" value="">
                            </div>
                        </div>
                    </section>
                    <section class="js_type-4" style="display: none">
                        <div class="layui-form-item"><label class="layui-form-label">选择公式:</label>
                            <div class="layui-input-block">
                            <a id="select_zhuhu" class="select_formula">选择公式</a>
                                <span id="formula_name"></span>
                                <input id="formulaid" name="formula_id" value="" type="hidden">
                            </div>
                        </div>
                    </section>
                    <div class="layui-form-item"><label class="layui-form-label">收费周期(月):</label>
                            <div class="layui-input-block" >
                                <input type="text" class="layui-input" name="priceweek" value="1">
                            </div>
                    </div>
                    <div class="layui-form-item"><label class="layui-form-label">备注:</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input" name="remark" id="" value="">
                        </div>
                    </div>
            	</div>
                <div class="modal-footer">
					<div class="layui-form-item">
						<div class="layui-input-block">
						  <button type="button" class="layui-btn" onClick="isChargsubmit(this.form)">保存</button>
						  <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
						</div>
					</div>
                </div>
        </div>
    </div>
    </form>
     <!-- 选择公式 -->
    <div class="user_info">
    <ul class="tab-nav ">
        <li class="active">
            <a>选择公式</a>
        </li>
    </ul>
    <a class="close_side closediv">×</a>
    <div style="padding: 20px;height: 9%">
        <input type="text" class="chat-search">
    </div>
    <div id="scrollcediv">
    	<ul class="tree-list data-list"></ul>
    </div>
</div>
<div class="user_bg"></div>
</div>

</body>
</html>