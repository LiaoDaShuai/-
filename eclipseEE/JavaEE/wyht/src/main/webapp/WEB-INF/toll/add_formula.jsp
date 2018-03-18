<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
        .gongshi span{
        	font-weight: bold;
        }
    </style>
    <script type="text/javascript" src="/wyht/js/toll/formula.js"></script>
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/tollController.js"></script>
    <script type="text/javascript">
        $(function () {
        	$(document).on('blur','.shuzhi_list .gs_list',function(){
                var num = $(this).index('.shuzhi_list .gs_list');
                var vvv = parseFloat($(this).val());
                if(isNaN(vvv)){
                    sweetAlert({title:'请输入数字',text: '',type: "warning",timer:1500,showConfirmButton: false});
					$(this).val("");
                    return false;
                }
                var idx=$(this).index(".shuzhi_list .gs_list");
                $(".shu"+(idx+1)).html($(this).val());
                $('.shuzhi_'+num).text(vvv);
            });
            //自定义公式里的解析xml代码
            $(".zi-formula").click(function () {
                for(var i=0;i<$(".zi-formula").length;i++){
                    if($(this).index()==i){
                        $(".zi-formula").eq(i).css({"background":"#f8f8f8"});
                    }else{
                        $(".zi-formula").eq(i).css({"background":"#fff"});
                    }
                }
                var id=this.id;
                $.ajax({
                    type:"get",
                    url:"../xml/formula.xml",
                    dataType:"xml",
                    timeout:1000,//设定超时
                    cache:false,//禁用延迟
                    success:function(xml){
                        $(xml).find("formula").each(function(i){
                            var ids=$(this).attr("id");
                            if(ids==id){
                            	$("input[name=formulanum]").val(id);
                                var content=$(this).children("formulacontent");
                                forcontent=content.text();
                                var gongshi=$(this).children("formulagongshi");
                                formulagaoshi=gongshi.text();
                                var count=$(this).children("formulacount");
                                formulacount=count.text();
                                $(".shuoming").html(forcontent);
                                $(".gongshi").html(formulagaoshi);
                                var textcount=$(".shuzhi_list").find(".layui-form-item").length;
                                if(formulacount>textcount) {
                                    for (var i = 1; i <=(formulacount - textcount); i++) {
                                        var textkuan="<div class='layui-form-item'>"+
            		                    		"<label for='' class='layui-form-label'>数值"+(textcount+i)+"&emsp;</label>"+
            		                    		"<div class='layui-input-inline'><input type='text' name="+(textcount+i)+" class='layui-input gs_list'></div>"+
            	                  				"</div>";
                                        $(".shuzhi_list").append(textkuan);
                                    }
                                }
                                if(formulacount<textcount){
                                    for(var i=textcount-1;i>=formulacount;i--){
                                        $(".shuzhi_list").find(".layui-form-item").eq(i).remove();
                                    }
                                }
                                var fcount=$('.shuzhi_list .gs_list').length;
                                for(var i=0;i<fcount;i++){
									$('.shuzhi_list .gs_list').eq(i).val("");
                                }
                            }
                        })
                    }
                })
            });
        });
    </script>
</head>
<body>
<form action="/wyht/toll/addformula" method="post" id="adfor">
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">添加公式</div>
        <div class="hr-solid"></div>
        <div class="col-sm-4 pad-form-div div-scroll">
        <div class="slimscroll" style="position: relative; overflow: hidden; height: 100%;">
            <div class="sidebar-inner" style="overflow: hidden; height: 100%;">
            <div class="a-form-hd">
                <span>选择已有信息</span>
            </div>
            <div class="row">
                <div class="col-sm-12 sousuoj">
                    <i class="fa fa-search"></i>
                    <input type="text" class="form-control">
                </div>
            </div>
            <div class="list-show">
                <ul>
                    <li class="zi-formula" id="8"><a href="javascript:;">8-按楼宇层数建筑面积五级阶梯计费</a></li>
                    <li class="zi-formula" id="7"><a href="javascript:;">7-按楼宇层数抄表用量五级阶梯计费</a></li>
                    <li class="zi-formula" id="6"><a href="javascript:;">6-按楼宇层数建筑面积四级阶梯计费</a></li>
                    <li class="zi-formula" id="5"><a href="javascript:;">5-按楼宇层数二级阶梯计费（封顶）</a></li>
                    <li class="zi-formula" id="4"><a href="javascript:;">4-按楼宇层数二级阶梯计费（不封顶）</a></li>
                    <li class="zi-formula" id="3"><a href="javascript:;">3-按车辆排量三级阶梯计费</a></li>
                    <li class="zi-formula" id="2"><a href="javascript:;">2-按抄表用量三级阶梯计费</a></li>
                    <li class="zi-formula" id="1"><a href="javascript:;">1-按抄表用量二级阶梯计费</a></li>
                </ul>
            </div>
            <div class="fenyes">共8条记录 1/1页</div>
        </div>
        </div>
        </div>

        <div class="col-sm-4 pad-form-div div-scroll" >
              <div class="a-form-hd">
                  <span>公式内容</span>
              </div>
              <div class="formula-content">
                  <h4>说明：</h4>
                  <p class="shuoming">
                      	按楼宇层数建筑面积五级阶梯计费<br/><br/>
                 	 如：<br/>
                  2（含2）层以下，(0*房屋建筑面积)元/月<br/>
                  2（不含2）-3（含3）层， (0.13*房屋建筑面积)元/月<br/>
                  3（不含3）-6（含6）层，(0.16*房屋建筑面积)元/月<br/>
                  6（不含3）-9（含9）层，(0.19*房屋建筑面积)元/月<br/>
                  10(含10)层以上(0.22*房屋建筑面积)元/月<br/>
                  </p>
                  <h4>具体规则：</h4>
                  <div class="gongshi">
		                        如果(《楼宇层数》大于等于0 且 《楼宇层数》小于等于 <span class="shu1">【数值1】</span>){<br>
		                        金额 等于 <span class="shu2">【数值2】</span> * 《房屋建筑面积》;<br>
		                        }  否则 如果 (《楼宇层数》大于<span class="shu1">【数值1】</span> 且 《楼宇层数》小于等于<span class="shu3">【数值3】</span>) {<br>
		                        金额 等于 <span class="shu4">【数值4】</span> * 《房屋建筑面积》;<br>
		                        }  否则 如果(《楼宇层数》大于<span class="shu3">【数值3】</span> 且 《楼宇层数》 小于等于 <span class="shu5">【数值5】</span>){<br>
		                        金额 等于 <span class="shu6">【数值6】</span> * 《房屋建筑面积》;<br>
		                        }  否则 如果(《楼宇层数》大于<span class="shu5">【数值5】</span> 且 《楼宇层数》 小于等于 <span class="shu7">【数值7】</span>){<br>
		                        金额 等于 <span class="shu8">【数值8】</span> * 《房屋建筑面积》;<br>
		                        } <br>
		                        否则 {<br>
		                        金额 等于 <span class="shu9">【数值9】</span> * 《房屋建筑面积》;<br>
		                        }
        		</div>
        	</div>
        </div>
        <div class="col-sm-4 pad-form-div div-scroll">
		              <div class="a-form-hd">
		                  <span>变量设置</span>
		              </div><br>
		              <div class="formula-content layui-form" style="margin-bottom: 60px;">
	                  	<div class="layui-form-item">
	                  		<label for="" class=" layui-form-label">公式名字&emsp;</label>
	             			<div class="layui-input-inline"><input type="text" name="formulaname" class="layui-input">
	                  			<input type="hidden" name="formulanum" value="8">
	                  		</div>
	       				</div>
		                <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">备注&emsp;</label>
		                  	<div class="layui-input-inline">
		                  		<input type="text" name="remark" class="layui-input">
		                  	</div>
		                </div>
                  <div class="shuzhi_list">
                      <div class="layui-form-item">
	                       <label for="" class="layui-form-label">数值1&emsp;</label>
	                       <div class="layui-input-inline"><input type="text" name="num1" class="layui-input gs_list"></div>
	                  </div>
                   	  <div class="layui-form-item">
		                   	<label for="" class="layui-form-label">数值2&emsp;</label>
		                   	<div class="layui-input-inline"><input type="text" name="num2" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                   	<label for="" class="layui-form-label">数值3&emsp;</label>
		                   	<div class="layui-input-inline"><input type="text" name="num3" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值4&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num4" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值5&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num5" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值6&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num6" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值7&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num7" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值8&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num8" class="layui-input gs_list"></div>
	                  </div>
	                  <div class="layui-form-item">
		                    <label for="" class=" layui-form-label">数值9&emsp;</label>
		                    <div class="layui-input-inline"><input type="text" name="num9" class="layui-input gs_list"></div>
	                  </div>
                  </div>
            	</div>
            	</div>
            	<div class="formula_bottom">
	                <button type="button" onclick="issubmit(this.form)" class="btn btn-success" style="width:96px;margin-right: 20px;">保存</button>
	                <button type="button" onclick="javascript:history.back(-1)" class="btn btn-default" style="width:96px;">返回</button>
	            </div>
        	</div>
</form>
</body>
</html>