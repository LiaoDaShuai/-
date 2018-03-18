<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <script type="text/javascript">
        $(function(){
	        $("#b1").on("click",function(){
	        	$("#myform").attr("action","show_announce")
	  		   	$("#myform").submit();
	        })
	        layui.use('laydate', function(){
				var laydate=layui.laydate;
				laydate.render({
		            elem: '#startdata'
		        });
		        laydate.render({
		            elem: '#enddata'
		        });
			});
        })
    </script>
    <style>
        .row-adds{
            text-align: center;
            margin-top:20px;
            padding:20px 0 20px 150px;
            border-top: 1px solid #E0E0E0;
            /*border-bottom:1px solid #e0e0e0;*/
        }
    </style>
</head>
<body>
    <div class="container col-sm-11 container-bianju" >
        <div class="row header">
            <div class="col-sm-12"><h3>公告详情</h3></div>
        </div>
        <div class="table-responsive col-sm-12">
        	 <form action="" method="post" id="myform">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="padding-left:15px;">发布者</th>
                            <th>公告名称</th>
                            <th>公告内容</th>
                            <th>是否置顶</th>
                            <th>置顶结束时间</th>
                            <th>发布时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<tr>
                        	    <td align="center">${ann.annAnnouncer }</td>
	                            <td align="center">${ann.annName }</td>
	                            <td align="center">${ann.annContext }</td>
	                           	<c:choose>
									<c:when test="${ann.annZhiding eq '1'}">
										<td align="center"><c:out value="是"/></td>
									</c:when>
									<c:otherwise>
										<td align="center"><c:out value="否"/></td>
									</c:otherwise>
								</c:choose>
	                            <td align="center">${ann.zhidingDate==null?'--':ann.zhidingDate }</td>
	                            <td align="center">${ann.adddate }</td>
	                     </tr>
                    </tbody>
               </table>
               <div class="row row-adds">
	        		<button type="button" id="b1" class="btn btn-default" style="width: 96px;">返回</button>
	 		   </div>
            </form>
         </div>
     </div>
     
<div class="modal fade" style="margin-top:12%;" id="daochu" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog"><form  action="/cost/export_chaobiao.jsp">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">公告详情</h4></div>
            <div class="modal-body">
                <div class="row p-10">
                    <p>这里是公告内容</p>
                </div>
            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
        	</div>
        </div></form>
    </div>
</div>

</body>
</html>