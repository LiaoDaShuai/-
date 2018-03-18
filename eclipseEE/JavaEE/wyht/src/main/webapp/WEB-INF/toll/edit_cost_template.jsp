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
	<script src="/wyht/js-others/priceproject.js"></script>
	<script type="text/javascript" src="/wyht/dwr/engine.js"></script>
	<script type="text/javascript" src="/wyht/dwr/util.js"></script>
    <script type="text/javascript" src="/wyht/dwr/interface/tollController.js"></script>
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">修改收费项目</div>
        <div class="hr-solid"></div>
        <form action="/wyht/toll/priceupdate" method="post">
        <div class="layui-form col-sm-12 pad-form-div">
        	<input type="hidden" name="priceid" value="${price.priceid }"/>
        	<div class="a-form-hd">
                <span>基本信息</span>
            </div><br>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>*名称</label></div>
                <div class="layui-input-block"><input type="text" name="pricename" class="layui-input" value="${price.pricename }"></div>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>*类别</label></div>
                <div class="layui-input-block">
                   <select disabled="disabled" name="pricetype">
                   	<c:if test="${price.pricetype==1 }"> 
                    	<option value="周期性" selected="selected">周期性</option>
                    </c:if><c:if test="${price.pricetype==1 }"> 
                    	<option value="周期性">周期性</option>
                    </c:if><c:if test="${price.pricetype==2 }"> 
                    	<option value="临时性" selected="selected">临时性</option>
                    </c:if><c:if test="${price.pricetype==2 }"> 
                    	<option value="临时性">临时性</option>
                    </c:if><c:if test="${price.pricetype==3 }"> 
                    	<option value="押金性" selected="selected">押金性</option>
                    </c:if><c:if test="${price.pricetype==3 }"> 
                    	<option value="押金性">押金性</option>
                    </c:if>
                </select></div>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-label"><label>备注</label></div>
                <div class="layui-input-block"><input type="text" name="remark" value="${price.remark }" class="layui-input"></div>
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
                        <input class="form-control" name="latetian" type="text" value="${price.latetian }">
                        <span class="input-group-addon">天</span>
                    </div>
                    <span class="col-sm-7 col-sm-offset-3" style="color:#8d8d8d;padding-left: 27px;">
                        注：此处设置欠费多少天开始收取滞纳金。
                    </span>
                </div>
                <div class="row p-11">
                    <div class="col-sm-3 p-t-10"><label>收取比例(每天)</label></div>
                    <div class="col-sm-4 input-group" style="padding-left: 17px;">
                        <input class="form-control" name="latefee" type="text" value="${price.latefee }">
                        <span class="input-group-addon">%</span>
                    </div>
                </div>

                <div class="row p-11">
                    <div class="col-sm-4 block-h4">其他设置</div>
                </div>
                <div class="row p-11">
                	<div class="col-sm-3 p-t-10"><label>当费用不足一个周期时</label></div>
                	<div class="col-sm-4">
							<input type="radio" name="noweek" id="noweeks1" value="1" checked="checked">按周期计算 
							<input type="radio" name="noweek" id="noweeks2" value="2">按实际天数计算 
                	</div>
                </div>
                <div class="row p-11">
                    <div class="col-sm-3 p-t-10"><label>开启损耗</label></div>
                    <div class="col-sm-4" style="padding-left: 17px;">
                    	<c:if test="${price.sunhao==1 }">
                        	<input type="checkbox" name="sunhao" checked="checked" value="1"  class="hide">
                        	<span class="switch-on" onclick="status()"></span>
                    	</c:if>
                    	<c:if test="${price.sunhao!=1 }">
                    		<span class="switch-off" onclick="status()"></span>
                        	<input type="checkbox" name="sunhao" value="1" class="hide">
                    	</c:if>
                    </div>
                </div>
                <div class="row p-11 noheight">
                    <div class="col-sm-3 p-t-10" ><label>损耗计算方式</label></div>
                    <div class="col-sm-6 " style="">
                        <div class="row" >
                            <div class="col-sm-6">
                            	<input class="rad" type="radio" id="funs1" value="1" name="funs">固定值
                            </div>
                            <div class="col-sm-6 gud" style="display: none">
                            <input type="text" name="funcount" id="gud1" value="${price.funcount }" class="form-control"></div>
                        </div>
                        <div class="row" style="margin-top:10px;">
                            <div class="col-sm-6">
                                	<input class="rad" type="radio" id="funs2" value="2" name="funs">按用量的百分比
                            </div>
                            <div class="col-sm-5 input-group baif " style="display: none">
                                <input type="text" name="funcount" id="baif1"  value="${price.funcount }" class="form-control text-right-radius">
                                <span class="input-group-addon text-left-radius">%</span>
                            </div>
                        </div>
                </div>
                </div>
            </div>
            <div style="margin:0px 0 30px 0;text-align: center;">
                <button type="button" onClick="issubmit(this.form)" class="btn btn-success" style="width:96px;">保存</button>
                <!-- <button type="button" class="btn btn-success" style="background-color: #009688!important;">保存并返回</button> -->
                <button type="button" onclick="javascript:history.back(-1)" class="btn btn-default" style="width:96px;">返回</button>
            </div>
        </form>
    </div>
</body>
<script>
    $(function(){
    	layui.use('form',function(){
        	var form=layui.form;
        	form.render();
        });
        	if("${price.sunhao}"==1){
            	$(".noheight").animate({"height":"80px","opacity":1});
            }else{
            	$(".noheight").animate({"height":"0","opacity":0});
            }
            if("${price.noweek}"==$("#noweeks1").val()){
            	$("#noweeks1").prop('checked','checked');
            }else if("${price.noweek}"==$("#noweeks2").val()){
            	$("#noweeks2").prop('checked','checked');
            }
            if("${price.funs}"==$("#funs1").val()){
            	$("#funs1").prop('checked','checked');
            }else if("${price.funs}"==$("#funs2").val()){
            	$("#funs2").prop('checked','checked');
            }
            if('${price.funs}'==1){
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
        var ptype=$("select[name=pricetype]").val();
        if(ptype=="周期性"){
           $(".zhouqixing").animate({"height":"38%","opacity":"1"},1000);
            $(".zhouqixing").attr("disabled",false);
        }else{
            $(".zhouqixing").animate({"height":"0","opacity":"0"},1000);
            $(".zhouqixing").attr("disabled",true);
        }
        $("select[name=pricetype]").change(function(){
            var ptype=$(this).val();
            if(ptype=="周期性"){
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