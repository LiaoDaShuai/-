<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
</head>
<body>
	<!--主要内容 -->
    <div class="container col-sm-11 container-bianju">
            <div class="card">
                    <ul class="tab-nav">
                        <li class="waves-effect active">
                            <a href="#">任务详情</a>
                        </li>
                    </ul>
                    <div class="card-body">
                     <div class="col-sm-12 ">
						                <div class="row p-t-10">
						                            <div class="form-group col-sm-4">
							                            <label class="col-sm-3" style="margin-top:8px;">名称：</label>
							                           <span class="col-sm-6" style="margin-top:8px;">${task.taskName}</span>
						                            </div>
						                       		<div class="form-group col-sm-4">
							                              <label class="col-sm-3" style="margin-top:8px;">种类：</label>
							                           	  <span class="col-sm-6" style="margin-top:8px;">${task.taskType.tasktypeName }</span>
						                      		 </div>
									                 <div class="form-group col-sm-4">
									                        <label class="col-sm-3" style="margin-top:8px;">频率：</label>
									                         <span class="col-sm-6" style="margin-top:8px;">
																		<c:choose>
																			<c:when test="${task.taskFrequency==1}">
																					每日一次
																			</c:when>
																			<c:when test="${task.taskFrequency==7}">
																					每周一次
																			</c:when>
																			<c:when test="${task.taskFrequency==14}">
																					两周一次
																			</c:when>
																			<c:when test="${task.taskFrequency==30}">
																					每月一次
																			</c:when>
																			<c:otherwise>
																					每${task.taskFrequency}天一次
																			</c:otherwise>
																		</c:choose>
															 </span>
									                  </div>
						                 </div>
						                  <div class="row p-t-10">
						                            <div class="form-group col-sm-4">
							                            <label class="col-sm-3" style="margin-top:8px;">开始日期：</label>
							                           <span class="col-sm-6" style="margin-top:8px;"><fmt:formatDate value="${task.taskStartdate }" pattern="yyyy-MM-dd"/></span>
						                            </div>
						                       		<div class="form-group col-sm-4">
							                              <label class="col-sm-3" style="margin-top:8px;">循环次数：</label>
							                           	  <span class="col-sm-6" style="margin-top:8px;">${task.taskFrequency}/${task.taskWcount}</span>
						                      		 </div>
									                 <div class="form-group col-sm-4">
									                        <label class="col-sm-3" style="margin-top:8px;">责任人：</label>
									                        <span class="col-sm-6" style="margin-top:8px;">${task.department.depName}/${task.employee.empName }</span>
									                 </div>
						                 </div>
						                 <div class="row p-t-10">
						                            <div class="form-group col-sm-4">
							                            <label class="col-sm-3" style="margin-top:8px;">任务说明：</label>
							                           <span class="col-sm-6" style="margin-top:8px;">${task.reskRemark}</span>
						                            </div>
						                            <div class="from-group col-sm-offset-4  col-sm-4">
						                            	<a  class="btn btn-primary" href="javascript:history.go(-1)">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
						                            </div>
						                 </div>
						                 <ul class="tab-nav">
					                        <li class="waves-effect active">
					                            <a href="#">执行记录</a>
					                        </li>
					                    </ul>
					                    <div class="com-md-12" style="margin-top:10px;">
				                            <table class="table table-hover text-center">
				                                <thead>
					                                <tr class="active">
					                                    <th>名称</th>
					                                    <th>责任人</th>
					                                    <th>时间</th>
					                                    <th>操作</th>
					                                </tr>
				                                </thead>
				                              </table>
					                	</div>
					          </div>
                    </div>
             </div>
    </div>
</body>
</html>