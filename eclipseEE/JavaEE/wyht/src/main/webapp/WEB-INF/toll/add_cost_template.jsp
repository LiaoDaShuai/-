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
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/tollController.js"></script>  
	<script src="/wyht/js-others/priceproject.js"></script>
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">添加收费项目</div>
        <div class="hr-solid"></div>
        <form action="/wyht/toll/priceadd" method="get">
        <div class="layui-form col-sm-12 pad-form-div">
            <div class="a-form-hd">
                <span>基本信息</span>
            </div><br>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>*名称</label></div>
                <div class="layui-input-block"><input type="text" name="pricename" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>*类别</label></div>
                <div class="layui-input-block">
                    <select name="pricetype" lay-filter="pricetypeSelect">
                    <option value="1">周期性</option>
                    <option value="2">临时性</option>
                    <option value="3">押金性</option>
                </select></div>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>备注</label></div>
                <div class="layui-input-block"><input type="text" name="remark" class="layui-input"></div>
            </div>
        </div>
            <div class="col-sm-12 pad-form-div zhouqixing" style="margin-bottom: 30px;">
                <div class="a-form-hd">
                    <span>周期性设置</span>
                </div>
                <div class="row p-11">
                    <div class="col-sm-4 block-h4">滞纳金设置</div>
                </div>
                <div class="row p-11">
                    <div class="col-sm-3 p-t-10"><label>天数</label></div>
                    <div class="col-sm-4 input-group" style="padding-left: 17px;">
                        <input class="form-control text-right-radius" name="latetian" type="text" value="0">
                        <span class="input-group-addon text-left-radius">天</span>
                    </div>
                    <span class="col-sm-7 col-sm-offset-3" style="color:#8d8d8d;padding-left: 27px;">
                        注：此处设置欠费多少天开始收取滞纳金。
                    </span>
                </div>
                <div class="row p-11">
                    <div class="col-sm-3 p-t-10"><label>收取比例(每天)</label></div>
                    <div class="col-sm-4 input-group" style="padding-left: 17px;">
                        <input class="form-control text-right-radius" name="latefee" type="text" value="0">
                        <span class="input-group-addon text-left-radius">%</span>
                    </div>
                </div>

                <div class="row p-11">
                    <div class="col-sm-4 block-h4">其他设置</div>
                </div>
                <div class="row p-11">
                	<div class="col-sm-3 p-t-10"><label>当费用不足一个周期时</label></div>
                	<div class="col-sm-4">
						<input type="radio" name="noweek" value="1" checked="checked">按周期计算 
						<input type="radio" name="noweek" value="2">按时间天数计算
                	</div>
                </div>
                <div class="row p-11">
                    <div class="col-sm-3 p-t-10"><label>开启损耗</label></div>
                    <div class="col-sm-4" style="padding-left: 17px;">
                        <span class="switch-off" onclick="status()"></span>
                      	<input type="checkbox" name="sunhao" value="1" class="hide">
                    </div>
                </div>
                <div class="row p-11 noheight">
                    <div class="col-sm-3 p-t-10" ><label>损耗计算方式</label></div>
                    <div class="col-sm-6 " style="">
                        <div class="row" >
                            <div class="col-sm-6"><input class="rad" type="radio" value="1" name="funs">固定值</div>
                            <div class="col-sm-6 gud" style="display: none">
                            <input type="text" name="funcount" disabled id="gud1" class="form-control"></div>
                        </div>
                        <div class="row" style="margin-top:10px;">
                            <div class="col-sm-6">
                                <input class="rad" type="radio" value="2" name="funs">按用量的百分比</div>
                            <div class="col-sm-5 input-group baif" style="display: none">
                                <input type="text" name="funcount" disabled id="baif1" class="form-control">
                                <span class="input-group-addon">%</span>
                            </div>
                        </div>
                </div>
                </div>
            </div>
            <div style="margin:0px 0 30px 0;text-align: center;">
                <button type="button" onClick="issubmit(this.form)" class="btn btn-success" style="width:96px;">保存</button>
<!--                 <button class="btn btn-success" style="background-color: #009688!important;">保存并返回</button> -->
                <button type="button" onclick="javascript:history.back(-1)" class="btn btn-default" style="width:96px;">返回</button>
            </div>
        </form>
    </div>
</body>
<script>
    $(function(){
    	layui.use('form',function(){
        	var form=layui.form;
        	form.on('select(pricetypeSelect)',function(data){
        		if(data.value==1){
                    $(".zhouqixing").animate({"height":"38%","opacity":"1"},1000);
                     $(".zhouqixing").attr("disabled",false);
                 }else{
                     $(".zhouqixing").animate({"height":"0","opacity":"0"},1000);
                     $(".zhouqixing").attr("disabled",true);
                 }
        	});
        });
        $(".checkbox").click(function(){
            if($(this).is(':checked')){
                $(".noheight").animate({"height":"60px","opacity":1});
            }else{
                $(".noheight").animate({"height":"0","opacity":0});
            }
        });
        $(".rad").click(function(){
            if($(this).val()==1){
                $(".gud").show(1000);
                $(".baif").hide(1000);
                $("#gud1").attr("disabled",false);
                $("#baif1").attr("disabled",true);
           }else{
                $(".baif").show(1000);
                $(".gud").hide(1000);
                $("#gud1").attr("disabled",true);
                $("#baif1").attr("disabled",false);
            }
        })
        $("select[name=pricetype]").change(function(){
            var ptype=$(this).val();
            if(ptype==1){
               $(".zhouqixing").animate({"height":"38%","opacity":"1"},1000);
                $(".zhouqixing").attr("disabled",false);
            }else{
                $(".zhouqixing").animate({"height":"0","opacity":"0"},1000);
                $(".zhouqixing").attr("disabled",true);
            }
        })
    });
    function status(sta){
    	if($($("input[name=sunhao]")).is(':checked')){
            $(".noheight").animate({"height":"0","opacity":0});
            $("input[name=sunhao]").attr("checked",false);
        }else{
            $(".noheight").animate({"height":"80px","opacity":1});
            $("input[name=sunhao]").attr("checked",true);
        }
    }
</script>

</html>