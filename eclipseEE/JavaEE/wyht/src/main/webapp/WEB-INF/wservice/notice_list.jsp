<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/datacenterController.js"></script>
<script src="/wyht/dwr/interface/announceController.js"></script>
<style>
td {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container col-sm-11 container-bianju">
		<div class="row header">
			<div class="col-sm-12">小区公告</div>
		</div>
		<div class="hr-solid"></div>
		<div class="list-action-grid">
			<form method="post" class="form-horizontal" name="f1" 
				action="/wyht/lifeservice/show_announce" >
				<div style="margin: 20px 0 10px 15px;">
					<a href="/wyht/lifeservice/InsertOrUpdate/1"
						class="btn btn-success"><i class="fa fa-plus"></i>添加小区公告</a>
					<div class="pull-right">
						<div class="suotext">
							<input type="text" name="key" value="${key }" class="wentext"
								placeholder="请输入公告名称">
							<button class="btn-list list-setting" onclick="PageSub(1,1)">
								<i class="fa fa-search"></i>
							</button>
							<div><!-- 存放分页的数据 -->
                				<input type="hidden" name="pageNum" value="">
								<input type="hidden" name="pageSize" value="${page2.size }">
                			</div>
						</div>
						<a href="https://www.weixiaoqu.com/faqs" class="btn-list"
							target="_blank" title="帮助中心"> <i class="fa fa-question"></i></a>
					</div>
				</div>
			</form>
				<div class="layui-form table-responsive col-sm-12">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="padding-left: 15px;">公告名称</th>
								<th>添加时间</th>
								<th>是否置顶</th>
								<th>已关联小区</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list }" var="announce">
								<tr>
									<td><c:out value="${announce.annName }" /></td>
									<td><c:out value="${announce.adddate }" /></td>
									<c:choose>
										<c:when test="${announce.annZhiding eq '1'}">
											<td><input type="checkbox" lay-filter="iszhid" class="isZhiding" checked value="${announce.annId }"/></td>
										</c:when>
										<c:otherwise>
											<td><input type="checkbox" lay-filter="iszhid" class="isZhiding" value="${announce.annId }" /></td>
										</c:otherwise>
									</c:choose>
									<td><c:if test="${announce.district[0].disid!=null }">
											<a data-toggle="modal" class="selectDis onClickhand"
											 id="${announce.annId }"
												data-target="#findDis">查看小区</a>
										</c:if> <c:if test="${announce.district[0].disid==null }">
	                            	未关联小区
	                            </c:if></td>
									<td><a href="<%=request.getContextPath() %>/lifeservice/show_all?id=${announce.annId}"
										class="pianyil"><i class="fa fa-search"></i> 查看详情</a> <a
										href="javascript:banAnnid('${announce.annId }');"
										class="select_guanli"><i class="fa fa-plus"></i> 关联小区</a> 
										<a href="<%=request.getContextPath() %>/lifeservice/InsertOrUpdate/2?id=${announce.annId}"
										class="pianyil"><i class="fa fa-edit"></i> 编辑</a> 
										<a href="#" class="pianyil" onClick="DeleteSure(${announce.annId})"><i
											class="fa fa-trash"></i>删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pull-left biao-er-wai">共${page.total }条记录
					${page.pageNum }/${page.lastPage }页</div>
				<c:if test="${page.total>page2.size }">
					<div class="col-sm-6 col-sm-offset-3">
						<ul class="pagination pagination-sm">
							<li><a href="javascript:Fenye(1)"> <i
									class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
							<li><a
								href="javascript:Fenye(${page.pageNum-1},${page.lastPage })">
									<i class="fa fa-angle-left"></i>
							</a></li>
							<c:forEach begin="${page2.startPage }" end="${page2.endPage }"
								var="num">
								<c:if test="${num==page.pageNum}">
									<li class="active"><a
										href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li>
								</c:if>
								<c:if test="${num!=page.pageNum }">
									<li><a href="javascript:Fenye(${num },${page.lastPage })">${num }</a></li>
								</c:if>
							</c:forEach>
							<li><a
								href="javascript:Fenye(${page.pageNum+1},${page.lastPage })">
									<i class="fa fa-angle-right"></i>
							</a></li>
							<li><a
								href="javascript:Fenye(${page.lastPage},${page.lastPage })">
									<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>
							</a></li>
						</ul>
					</div>
				</c:if>
				<div class="pull-right biao-er-wai">
					该页显示： <select style="width: 100px; height: 25px;"
						class="pagination">
						<c:forEach items="${page2.selectnum }" var="selectsize">
							<c:if test="${selectsize==page2.size }">
								<option value="${selectsize }" selected="selected">${selectsize }条</option>
							</c:if>
							<c:if test="${selectsize!=page2.size }">
								<option value="${selectsize }">${selectsize }条</option>
							</c:if>
						</c:forEach>
					</select> 数据
				</div>
		</div>
	</div>
	<div class="modal fade" style="margin-top: 12%;" id="daochu"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<form action="/cost/export_chaobiao.jsp">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">公告详情</h4>
					</div>
					<div class="modal-body">
						<div class="row p-10">
							<p>这里是公告内容</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="user_info">
		<ul class="tab-nav ">
			<li class="active"><a href="">关联小区</a></li>
		</ul>
		<a class="close_side closediv">×</a>
		<div style="overflow: hidden; height: 90%">
			<form action="BanAnnDis" method="post">
				<input type="hidden" name="adsAnnid">
				<ul class="tree-list" style="margin: 20px;">
					<li><label><input type="checkbox" class="checkall">
							全选/取消</label></li>
				</ul>
				<div class="fake-box">
					<button type="submit" class="btn btn-primary btn-w-m fake-save">保存</button>
					<button type="button"
						class="btn btn-default btn-w-m m-l-10 closediv">返回</button>
				</div>
			</form>
		</div>
	</div>
	<div class="user_bg"></div>
	<div class="modal fade" id="findDis" tabindex="-1" role="dialog" aria-hidden="false">
		<div class="modal-dialog modal-lg" style="margin-top:6%;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title bt">已关联的小区</h4>
				</div>
				<input type="hidden" name="annid">
				<div class="modal-body GuanDis">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default " data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		 layui.use('laydate', function(){
			 	var laydate=layui.laydate;
			 	laydate.render({
		            elem: '#startdata'
		        });
		        laydate.render({
		            elem: '#enddata'
		        });
			});
	    	layui.use('form', function(){
			 	var form=layui.form;
			 	form.on("checkbox",function(data){
					var annid=data.value;
		            if(data.checked=data.elem.checked){
						announceController.UpdateZhiding({annId:annid,annZhiding:1},function(data){
							swal({
		                    	text: "开启置顶成功！",
		                    	type: "success",
		                    	confirmButtonText: '确认',
		                    	confirmButtonColor: '#4cd964',
		                    	timer:2000
		                	})
						});
		            }else{
		            	announceController.UpdateZhiding({annId:annid,annZhiding:0},function(data){
							swal({
		                    	text: "关闭置顶成功！",
		                    	type: "success",
		                    	confirmButtonText: '确认',
		                    	confirmButtonColor: '#4cd964',
		                    	timer:2000
		                	})
						});
		            }
		        });
	    		form.render();
			});
		$(".select_guanli").click(function () {
	        $(".user_info").animate({right:'0px'});
	        $(".user_bg").css("display","block");
	    })
		datacenterController.selectAll(function(data){
			for(var i=0;i<data.length;i++){
				$(".tree-list").append(
		   	 	"    <li id=\"dis"+data[i].disid+"\">\n" +
		    	"       <label><input type='checkbox' class='disname' name='adsDids' value='"+data[i].disid+"' >"+data[i].dname+"</label>" +
		    	"    </li>\n");
			}
  		});
  		$(".checkall").click(function(){
  	  		var count=$(".disname").length;
			if($(".checkall").is(':checked')){
				for(var i=0;i<count;i++){
					$(".disname").eq(i).attr("checked",true);
				}
			}else{
				for(var i=0;i<count;i++){
					$(".disname").eq(i).attr("checked",false);
				}
			}
  	  	});
  		$(".selectDis").on("click",function(){
  			var id=this.id;
  			announceController.selectAnnid(id,function(data){
  				var btns="";
  				for(var i=0;i<data.length;i++){
  					btns+="<button class='btn btn-success btn-sm m-5'"
  					+"title='"+data[i].dname+"'>"
  					+"<i class='fa fa-home' style='font-size:18px;padding:0 8px 0 0'></i>"
  					+"<span>"+data[i].dname+"</span><a href='javascript:delDis("+id+","+data[i].disid+")' class='rebind'>"
  					+"<i class='fa fa-times' style='font-size:18px;color: #fff;padding:0 0 0 8px'></i></a></button>";
  				}
  				$(".GuanDis").html(btns);
  			})
  		});
	});
	
	function delDis(annid,disid){
		announceController.delDisAnn({adsAnnid:annid,adsDid:disid},function(data){
			swal({
                text: "删除成功！",
                type: "success",
                confirmButtonText: '确认',
                confirmButtonColor: '#4cd964'
            })
            setTimeout(function(){
				window.location.reload();
			}, 2000);
		})
	}
	function banAnnid(id){
		$("input[name=adsAnnid]").val(id);
	}
	function DeleteSure(id){
        swal({
            text: "您确定要删除当前内容？",
            type: "info",
            confirmButtonText: '确认',
            confirmButtonColor: '#3fc3ee',
            reverseButtons:true,
            focusCancel:true,
            showCancelButton:true,
            cancelButtonText:'取消'
        }).	then(function(isConfirm) {
           if(!isConfirm) {
                swal({
                    text: "取消了！",
                    type: "error",
                    confirmButtonText: '确认',
                    confirmButtonColor: '#f27474'
                })
            } else {
                swal({
                    text: "删除成功！",
                    type: "success",
                    confirmButtonText: '确认',
                    confirmButtonColor: '#4cd964'
                })
                setTimeout(function(){
                	$(location).attr("href","/wyht/lifeservice/delete_announce/"+id);
				}, 2000);
            }
        });
    }
 </script>

</body>
</html>