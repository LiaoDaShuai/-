<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <style>
        table td,th{
            border:1px solid #e1e6eb;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">
            <div class="col-sm-12">缴费通知</div>
        </div>
        <div class="row small">
            <div class="col-sm-12"><i class="fa fa-question-circle"></i>
                功能说明：未缴的费用帐单方可发送微信或短信通知，已缴账单请在交易管理中打印收据
            </div>
        </div>

        <div class="hr-solid"></div>
        <div style="margin:20px 0 10px 15px;">
            <button class="btn btn-success" data-toggle="modal" data-target="#dayin">打印收费通知单</button>
            <button class="btn btn-success">发短信</button>
            <button class="btn btn-success">发微信</button>
            <div class="pull-right">
                <div class="suotext">
                    <select class="wentext" style="margin-right:5px;">
                        <option>全部小区</option>
                    </select>
                    <input type="text" name="kw" value="" class="wentext" placeholder="请输入关键字">
                    <button class="btn-list list-setting"><i class="fa fa-search"></i></button>
                </div>
                <a href="" class="btn-list" target="_blank" title="帮助中心">
                    <i class="fa fa-question"></i></a>
            </div></div>
        <div class="table-responsive col-sm-12" >
            <table class="table table-hover text-center">
                <thead>
                <tr>
                    <th style="padding-left:15px;"><input type="checkbox"></th><th>住户</th><th>手机号</th>
                    <th>小区</th><th>应收金额</th><th>短信通知</th>
                    <th>微信通知</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="checkbox"></td><td>1</td>
                    <td>2</td><td>2</td>
                    <td>3</td><td>4</td>
                    <td>5</td>
                </tr>
                </tbody>
            </table>
            <div class="pull-left biao-er-wai">共n条记录 n/n页</div>
            <div class="pull-right biao-er-wai">该页显示：
                <select style="width:100px;height:25px;">
                    <option>10条</option>
                    <option>8条</option>
                    <option>5条</option>
                </select>数据</div>
        </div>
    </div>
<div id="dayin" class="modal fade" role="dialog" tabindex="-1" aria-modal="true" aria-hidden="true" style="margin-top:8%;">
    <form class="layui-form">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header"><h4 class="modal-title">选择打印模板</h4></div>
            <div class="modal-body">
                <div class="layui-form-item">
	                <div class="layui-form-label"><label>模板</label></div>
	                <div class="layui-input-block">
	                    <select>
	                        <option>--启源缴费通知单(默认)--</option>
	                    </select>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
            	<div class="layui-form-item">
					<div class="layui-input-block">
					  <button type="button" class="layui-btn">确定</button>
					  <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
					</div>
				</div>
            </div>
        </div>
    </div>
    </form>
</div>
<script>
$(function(){
	layui.use('form',function(){
		var form=layui.form;
		form.render();
	});
})
</script>
</body>
</html>