<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht./dwr/util.js"></script>
	<script type="text/javascript" src="/wyht/dwr/interface/datacenterController.js"></script>
	<script type="text/javascript" src="/wyht/js/datacenter/zhuhu.js"></script>
</head>
<body>
<div class="container col-sm-11 container-bianju">
    <div class="row" style="box-shadow: inset 0 -2px 0 0 #eee;">
        <a href="/wyht/yezhu/all?status=2"><div class="navkuai">已迁入</div></a>
        <a href="/wyht/yezhu/all?status=0"><div class="navkuai">待审核</div></a>
        <a href="/wyht/yezhu/all?status=1">
            <div class="navkuai" >未通过</div></a>
        <a href="/wyht/yezhu/all?status=3">
            <div class="navkuai" style="border-bottom: 2px solid #7a7a7a;">已迁出</div></a>
    </div>
    <div class="col-sm-12 toggaoji" style="border-top: 0;border-bottom: 1px solid #E0E0E0">
    	<form action="" id="f1" name="f1" method="post">
    		<input type="hidden" name="status" value="3">
    		<input type="hidden" name="pageNum" value=""> 
			<input type="hidden" name="pageSize" value="${page2.size }">
            <div class="row p-t-10">
                <div class="form-group col-sm-4">
                    <label class="col-sm-3" style="margin-top:8px;">所属小区：</label>
                    <select class="form-control-static col-sm-7" id="disid1" name="disid">
                        <option value="0">---请选择小区---</option>
                    </select>
                </div>
                <div class="form-group col-sm-4">
                    <label class="col-sm-3" style="margin-top:8px;">关键字：</label>
                    <input type="text" id="advanced" value="${owner.keywords }" name="keywords" class="form-control-static col-sm-7" placeholder="请输入关键字">
                </div>
                <div class="form-group col-sm-4">
                    <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> 搜索</button>
                    <button type="button" class="btn btn-default" onclick="clear_form()"> 清空</button>
                    <button type="button" class="btn btn-default"> 关闭</button>
                </div>
            </div>
        </form>    
	</div>
	<div style="margin:10px 0 5px 15px;">
        <div class="pull-left">
        	<button type="button" class="btn btn-success" id="del" disabled>删除</button>&emsp;删除后无法恢复，请谨慎操作。
        </div>
        <div class="pull-right">
            <a href="javascript:" class="pull-left gaoji">高级搜索</a>
            <div class="suotext">
            	<input type="text" id="ordinary" value="${owner.keywords }" class="wentext" placeholder="姓名/门牌号/手机号/业主卡号">
                <button class="btn-list list-setting" onclick="sousuo()"><i class="fa fa-search"></i></button>
            </div>
            <a href="https://www.weixiaoqu.com/faqs" class="btn-list" target="_blank" title="帮助中心">
                <i class="fa fa-question"></i>
            </a>
        </div>
	</div>
    <div class="layui-form table-responsive col-sm-12">
        <table class="table table-hover">
            <thead>
                <tr style="font-size: 18px;">
                    <th><input type="checkbox" class="quan" lay-filter="allChoose"></th>
                    <th>住户编号</th>
                    <th>姓名</th>
                    <th>小区</th>
                    <th>手机</th>
                    <th>迁入申请</th>
                    <th>注册时间</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody style="text-align:center;">
            	<c:forEach items="${page.list}" var="yz">
                <tr style="font-size: 14px;">
                   <td><input type="checkbox" class="dan" lay-filter="itemChoose"></td>
                    <td>${yz.oid }</td>
                    <td>${yz.owername }</td>
                    <td>${yz.dis.dname }</td>
                    <td>${yz.ownerphone }</td>
                    <td>${yz.hl.floorname },${yz.ut.unitname },${yz.hf.hnum },${yz.owername },
                    <c:choose>
                    	<c:when test="${yz.cardid==1 }">
                    		业主本人
                    	</c:when>
                    	<c:when test="${yz.cardid==2 }">
                    		亲属
                    	</c:when>
                    	<c:when test="${yz.cardid==3 }">
                    		租客
                    	</c:when>
                    	<c:when test="${yz.cardid==4 }">
                    		其他
                    	</c:when>
                    	<c:otherwise>
                    		无
                    	</c:otherwise>
                    </c:choose>
                    </td>
                    <td>${yz.mdate }</td>
                    <td>
                        <a href="/wyht/fandetail/owid/${yz.oid }" class="onClickhand"><i class="fa fa-search"></i> 查看详情</a>
                        <a class="onClickhand" onclick="update_status('再次迁入','${yz.oid}','2')"><i class="fa fa-sign-in"></i> 再次迁入</a>
                    </td>
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
</body>
<script>
	$(function(){
		layui.use('form', function(){
			var form=layui.form;
			//全选
			form.on('checkbox(allChoose)', function(data){
			    var child=$(data.elem).parents('table').find('tbody input[type="checkbox"]');
			    child.each(function(index, item){
			      item.checked=data.elem.checked;
			    });
			    form.render('checkbox');
			    var sib=$(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    if(sib==0){
			    	$('#del').attr('disabled', true);
			    }else{
			    	$('#del').attr('disabled', false);
			    }
			});
			//单选
			form.on('checkbox(itemChoose)',function(data){
			    var sib=$(data.elem).parents('table').find('tbody input[type="checkbox"]:checked').length;
			    var total=$(data.elem).parents('table').find('tbody input[type="checkbox"]').length;
			    if(sib==0){
			    	$('#del').attr('disabled', true);
			    }else if(sib==total){
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",true);
			        $('#del').attr('disabled', false);
			    }else{
			        $(data.elem).parents('table').find('thead input[type="checkbox"]').prop("checked",false);
			        $('#del').attr('disabled', false);
			    }
			    form.render();
			});
		});
		//初始化小区下拉框
		datacenterController.selectdis(0,function(data){
			for(var i=0;i<data.length;i++) {  
				$("#disid1").append("<option value='"+data[i].disid+"'>"+data[i].dname+"</option>");
			}
			var ds="${owner.disid}";
    	    if(ds!=0){
    	    	$("#disid1").find("option[value="+ds+"]").attr("selected",true);
    	    }
		})
	})
</script>
</html>