<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
<script src="/wyht/dwr/engine.js"></script>
<script src="/wyht/dwr/util.js"></script>
<script src="/wyht/dwr/interface/tollController.js"></script> 
<script type="text/javascript">
	$(function(){
		$(document).click(function(){
			if(this.id==undefined){
				$(".search-area").slideUp();
			}
		});
		layui.use('form', function(){
			var form=layui.form;
			form.render();
		});
	})
	function oninputs(){
		var owers="<div class='search-title'><b>业 主 </b><a class='m-l-10' href='/wyht/yezhu/all'>查看全部</a></div>";
		var houses="<div class='search-title'><b>房 屋 </b><a class='m-l-10' href='/wyht/house/all'>查看全部</a></div>";
		var parks="<div class='search-title'><b>车 位 </b><a class='m-l-10' href='/wyht/parking/all'>查看全部</a></div>";
		var vehics="<div class='search-title'><b>车 辆 </b><a class='m-l-10' href='/wyht/car/all'>查看全部</a></div>";
		if($("#sousuo").val()!=""){
			$(".search-area").html("<div class='search-title'><b>正在搜索中。。</b></div>");
		tollController.shouyisuo($("#sousuo").val(),function(data){
			if(data.length>0){
				for(var i=0;i<data.length;i++){
					if(data[i].ztype==1){
						houses+="<div class='search-row'><a href='/wyht/toll/checkoutids/1/"+data[i].fanId+"'><span class='m-l-10'>"+data[i].district.dname+"<span class='text-danger' style='margin-left:15px;'>"+data[i].housefan.hnum+"</span></span></a></div>";
					}else if(data[i].ztype==2){
						parks+="<div class='search-row'><a href='/wyht/toll/checkoutids/2/"+data[i].parkId+"'><span class='m-l-10'>"+data[i].district.dname+"<span class='text-danger' style='margin-left:15px;'>"+data[i].parkingspace.pnum+"</span></span></a></div>";
					}else if(data[i].ztype==3){
						vehics+="<div class='search-row'><a href='/wyht/toll/checkoutids/3/"+data[i].vehicleId+"'><span class='m-l-10'>"+data[i].district.dname+"<span class='text-danger' style='margin-left:15px;'>"+data[i].vehiclemanager.carnum+"</span></span></a></div>";
					}else if(data[i].ztype==4){
						owers+="<div class='search-row'><a href='/wyht/toll/checkoutower/"+data[i].oid+"'><span class='m-l-10'>"+data[i].district.dname+"<span class='text-danger' style='margin-left:15px;'>"+data[i].owner.owername+" </span> "+data[i].owner.ownerphone+"</span></a></div>";
					}
				}
			}
			if(owers.length==92){
				owers="";
			}if(houses.length==92){
				houses="";
			}if(parks.length==94){
				parks="";
			}if(vehics.length==90){
				vehics="";
			}
			var zong=owers+houses+parks+vehics;
			if(zong==""){
				$(".search-area").html("");
			}else{
				$(".search-area").html(zong);
				$(".search-area").slideDown();
			}
		});
		}
	}
</script>
</head>
<body>
    <div class="container col-sm-11" style="margin:90px 0 0 100px;background: #fff;">
        <div class="row header">
            <div class="col-sm-11">收银台</div>
            <button data-toggle="modal" data-target="#shoufei" class="col-sm-1 btn btn-success">新增其他收费</button>
        </div>
            <div class="row small">
                <div class="col-sm-10"><i class="fa fa-question-circle"></i>
                功能说明：可根据住户姓名、住户手机号、房号、车位号、车牌号，快速搜索对应的未缴费用，
                修改未缴费用的优惠及滞纳金金额，完成对未缴费用的收取。
                </div>
            </div>
        <div class="hr-solid"></div>
        <div class="col-sm-12">
            <div class="chenkai">
            <div class="sousuokuan">
            <form action="" class="form-horizontal">
                <input type="text" id="sousuo" oninput="oninputs()" class="col-sm-9" style="height:40px;border:0;font-size:17px;">
                <button type="button" class="col-sm-3" style="height:40px;border:0;background:#fff;
                border-left: 1px solid #e0e0e0;font-size:17px; outline: none">
                    搜索
                </button>
            </form>
            </div>
             <div class="search-area" id="searchs">
             </div>
               <div style="color: #a2a2a2;font-size: 14px;margin-top:20px;width:500px;">
                  	 搜索说明：输入姓名、手机、房号、车牌等即可快速搜索</div>
            </div>
        </div>
    </div>
<div class="modal fade" id="shoufei" style="margin-top:6%;" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <form class="layui-form" action="#">
        <div class="modal-content">
            <div class="modal-header">
<!--                 <h4 class="modal-title">新增其他收费</h4> -->
		</div>
            <div class="modal-body">
                <div class="layui-form-item">
                    <div class="layui-form-label" >
                        项目
                    </div>
                    <div class="layui-input-block">
                        <input readonly type="text" class="layui-input"/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label">
                        小区
                    </div>
                    <div class="layui-input-block">
                        <select>
                            <option>--请选择小区--</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label">手机号码</div>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-form-label">缴费人</div>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input">
                    </div>
				</div>
                <div class="layui-form-item">
                    <div class="layui-form-label">金额</div>
                    <div class=" layui-input-block">
						<input type="text" class="layui-input">
					</div>
                </div>
             <div class="layui-form-item">
                <div class="layui-form-label">备注</div>
                <div class=" layui-input-block">
                    <input type="text" class="layui-input">
                </div>
            </div>
            </div>
            <div class="modal-footer">
				<div class="layui-form-item">
					<div class="layui-input-block">
					  <button type="submit" class="layui-btn">导入</button>
					  <button type="button" class="layui-btn layui-btn-primary ref" data-dismiss="modal">关闭</button>
					</div>
				</div>
            </div>
        </div>
    </form>
    </div>
</div>

</body>
</html>