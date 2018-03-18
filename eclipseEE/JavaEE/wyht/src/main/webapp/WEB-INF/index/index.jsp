<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>启源后台管理系统</title>
    <style>
        .container {
            width: 100%;
            margin-right: auto;
            margin-left: auto;
            padding-left: 15px;
            padding-right: 15px;
        }
        .search-area {
	    display: none;
	    width: 100%;
	    position: absolute;
	    top: 50px;
	    left: 0;
	    z-index: 999;
	    background: #f6f6f6;
	    border: 1px solid #ddd;
	    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.16), 0 2px 10px rgba(0, 0, 0, 0.12);
	}
	.search-title {
	    background: transparent;
	    padding: 10px 15px;
	}
	.search-row {
	    background: #fff;
	    padding: 10px 15px;
	    transition: all 0.5s;
	}
	<!--公告-->
	.notice {width:100%;padding:0 20px;line-height:35px;margin-bottom:20px;font-size:12px;color:red;background:#fae2e1;}
	.notice_active {height:4rem;margin-left:25px;margin-bottom:20px;font-size:12px;padding:0 20px;color:red;background:#fae2e1;overflow:hidden;}
	.notice_active li{list-style-type:none;line-height:3.8rem;overflow:hidden;}
    </style>
    <script src="/wyht/dwr/engine.js"></script>
	<script src="/wyht/dwr/util.js"></script>
	<script src="/wyht/dwr/interface/indexController.js"></script>
</head>
<body>
<!-- 头部 -->
    <section id="content">
        <!-- 公告 -->
        <!-- 公告 -->
        <div class="notice_active">
			<ul>
				<%-- <c:forEach items="${announces}" var="anno">
					<li class="notice_active_ch">
						<span><i class="fa fa-volume-up"></i>&emsp;公告：${anno.annContext }</span>                
					</li>
				</c:forEach> --%>
				<li class="notice_active_ch">
					<span><i class="fa fa-volume-up"></i>&emsp;公告：公告1---------------</span>                
				</li>
				<li class="notice_active_ch">
					<span><i class="fa fa-volume-up"></i>&emsp;公告：公告2---------------</span>                
				</li>
				<li class="notice_active_ch">
					<span><i class="fa fa-volume-up"></i>&emsp;公告：公告3---------------</span>                
				</li>
				<li class="notice_active_ch">
					<span><i class="fa fa-volume-up"></i>&emsp;公告：公告4---------------</span>                
				</li>
				<li class="notice_active_ch">
					<span><i class="fa fa-volume-up"></i>&emsp;公告：公告5---------------</span>                
				</li>
			</ul>   
        </div>

        <!-- 图标 -->
        <div class="dash-head">
            <h4>
                <div class="userInfo m-l-15">
                    <a href=""><i class="fa fa-mobile"></i></a>
                    <a href="" class="wrz"><i class="fa fa-envelope"></i></a>
                    <a href="" class="wrz"><i class="fa fa-user"></i></a>
                    <a href="" class="wrz"><i class="fa fa-qq"></i></a>
                    <a href="" class="wrz"><i class="fa fa-wechat"></i></a>
                    <a href="" class="wrz"><i class="fa fa-photo"></i></a>
                    <a href="" class="wrz"><i class="fa fa-qrcode"></i></a>
                    <a href="" class="wrz"><i class="fa fa-gift"></i></a>
                </div>
            </h4>
        </div>
        <!-- 左边的层 -->
        <div class="col-sm-12 col-md-9">
            <!--3个-->
            <div class="dash-userInfo">
                <!-- 搜索 -->
                <div class="col-sm-4">
                    <div class="dash-item-wrap card">
                        <div class="dash-item-title">快速搜索</div>
                        <div class="dash-item-area">
                            <div class="dash-searchBox">
                                <form action="" style="overflow:hidden">
                                    <input type="text" id="sousuo" oninput="quickfind()">
                                    <button type="button">搜索</button>
                                    <div class="search-area" style="display:none;">
                                    	
                                    </div>
                                </form>
                            </div>
                            <div class="dash-searchDesc">
                                	搜索说明:输入姓名、手机、房号、车牌即可快速搜索
                            </div>
                        </div>
                    </div>
                </div>
               <!-- 小区数  -->
                <div class="col-sm-4">
                    <div class="dash-item-wrap card">
                        <div class="dash-item-title">启源小区</div>
                        <div class="dash-item-area">
                            <div class="dash-xq-num">
                                <p>可添加小区</p>
                                <p><font style="font-size: 26px;font-weight:500">不限</font></p>
                            </div>
                            <div class="dash-xq-num">
                                <p>已添加小区</p>
                                <p><font style="font-size: 26px;font-weight:500">${index.disyjcount }</font>
                                    <a href="/wyht/xiaoqu/all">查看</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 服务商 -->
                <div class="col-sm-4">
                    <div class="dash-item-wrap card">
                        <div class="dash-item-title">启源服务商</div>
                        <div class="dash-panle-bd">
                            <div class="dash-fws-info ">
                                <label for="">服务商名称:</label>
                                <span class="c-orange">启源科技有限公司</span>
                            </div>
                            <div class="dash-fws-info ">
                                <label for="">联系人:</label>
                                <span>张三</span>
                            </div>
                            <div class="dash-fws-info ">
                                <label for="">联系电话:</label>
                                <span>15017263266</span>
                            </div>
                            <div class="dash-fws-info ">
                                <label for="">地址:</label>
                                <span>广东省汕头市</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 账单 -->
            <div class="dash-cost m-b-10">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="dash-item-title">收费统计</div>
                        <div class="dash-item-bd">
                            <ul>
                                <li>
                                    <h5><a href="${pageContext.request.contextPath }/toll/selectWeiAll">${index.wjtollcount }</a></h5>
                                    <h6>未交账单</h6>
                                </li>
                                <li>
                                    <h5><a href="${pageContext.request.contextPath }/toll/unpaidXiangAll">${index.yjtollcount }</a></h5>
                                    <h6>已缴费账单数量</h6>
                                </li>
                                <li>
                                    <h5><a href="${pageContext.request.contextPath }/toll/selectyijiluAll">￥${index.totalsrcount }</a></h5>
                                    <h6>收入统计金额</h6>
                                </li>
                                <li>
                                    <h5><a href="${pageContext.request.contextPath }/toll/selectWeiAll">￥${index.totalqfcount }</a></h5>
                                    <h6>欠费统计金额</h6>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 功能 -->
             <div class="dash-gn">
                <div class="col-sm-12">
                    <div class="card dash-data">
                        <div class="dash-item-title">常用功能</div>
                        <ul class="dash-data-list">
                            <li>
                                <a href="/wyht/louyu/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-building"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">楼宇</p>
                                        <p>
                                            <b class="m-r-10">${index.floorcount }</b>
                                            <span>栋</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/house/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-home"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">房屋</p>
                                        <p>
                                            <b class="m-r-10">${index.fancount }</b>
                                            <span>套</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/yezhu/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">住户</p>
                                        <p>
                                            <b class="m-r-10">${index.ownercount }</b>
                                            <span>人</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/parking/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-product-hunt"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">车位</p>
                                        <p>
                                            <b class="m-r-10">${index.prakcount }</b>
                                            <span>人</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/car/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-car"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">车辆</p>
                                        <p>
                                            <b class="m-r-10">${index.vehiccount }</b>
                                            <span>辆</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/staff/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-id-card"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">员工</p>
                                        <p>
                                            <b class="m-r-10">${index.empcount }</b>
                                            <span>人</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/lifeservice/show_announce" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-bullhorn"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">小区公告</p>
                                        <p>
                                            <b class="m-r-10">${index.anncount }</b>
                                            <span>条</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/wyht/express/all" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-truck"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">快递</p>
                                        <p>
                                            <b class="m-r-10">${index.storagecount }</b>
                                            <span>已取</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-institution"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">房屋租赁</p>
                                        <p>
                                            <b class="m-r-10">0</b>
                                            <span>条</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="" class="data-item">
                                    <div class="data-icon">
                                        <i class="fa fa-newspaper-o"></i>
                                    </div>
                                    <div class="data-inner">
                                        <p class="data-title">广告</p>
                                        <p>
                                            <b class="m-r-10">0</b>
                                            <span>天</span>
                                        </p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右边部分 -->
        <div class="col-md-3 col-sm-12">
            <div class="col-md-12">
                <div class="card">
                    <div class="dash-panle-hd" >
                        	系统消息
                    </div>
                    <div class="dash-panle-bd">
                        <!-- 暂无消息 -->
                        <ul class="dash-panle-smg">
                            <li>
                                <a href="##" style="text-align:center"><span>暂无消息</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="card">
                    <a href="" class="dash-gd">
                        <div class="dash-panle-bd">
                            <i class="fa fa-list-alt"></i>
                            <label for="">咨询及建议</label>
                            <span>每个声音都值得倾听</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
$(function(){
	$(document).click(function(){
		if(this.id==undefined){
			$(".search-area").slideUp();
		}
	});
		//公告轮播
		var num=$(".notice_active").find('li').length;
		if(num>1){
			var time=setInterval('timer(".notice_active")',3500);
		}
})
	function timer(obj){
		$(obj).find('ul').animate({marginTop:"-3rem"},500,function(){
			$(this).css({marginTop:"0rem"}).find("li:first").appendTo(this);
		});
	}
function quickfind(){
	var sousuo=$("#sousuo").val();
	$(".search-area div").remove();
	if(sousuo!=""){
		indexController.quickfind(sousuo,function(data){
			var div="";
			if(data.os!=""||data.hfs!=""||data.vs!=""){
				if(data.os!=""){
					div+="<div class=\"search-title\"><b>住 户</b><a class=\"m-l-10\" href=\"/wyht/yezhu/all\">查看全部</a></div>";
					for(var i=0;i<data.os.length;i++){
						div+="<div class=\"search-row s-xq\"><a href=\"/wyht/fandetail/owid/"+data.os[i].oid+"\">"+
						"<span class=\"m-l-10\"><span class=\"text-danger\">"+data.os[i].owername+"</span>-"+data.os[i].ownerphone+"</span></a></div>";
					}
				}
				if(data.hfs!=""){
					div+="<div class=\"search-title\"><b>房 屋 </b><a class=\"m-l-10\" href=\"/wyht/house/all\">查看全部</a></div>";
					for(var i=0;i<data.hfs.length;i++){
						div+="<div class=\"search-row s-xq addbg\"><a href=\"/wyht/fandetail/fwid/"+data.hfs[i].fanid+"\">"+
						"<span class=\"m-l-10\"><span class=\"text-danger\">"+data.hfs[i].hnum+"</span></span></a></div>";
					}
				}
				if(data.vs!=""){
					div+="<div class=\"search-title\"><b>车 辆 </b><a class=\"m-l-10\" href=\"/wyht/car/all\">查看全部</a></div>";
					for(var i=0;i<data.vs.length;i++){
						div+="<div class=\"search-row s-xq\"><a href=\"/wyht/fandetail/clid/"+data.os[i].vehicid+"\">"+
						"<span class=\"m-l-10\">"+data.vs[i].cname+"-<span class=\"text-danger\">"+data.vs[i].carnum+"</span>-"+data.vs[i].cphone+"</span></a></div>";
					}
				}
			}else{
				div+="<div class=\"search-row s-xq\"><b>暂无匹配内容</b></div>";
			}
			$(".search-area").append(div);
			$(".search-area").css("display","block");
		});
	}else{
		$(".search-area").css("display","none");
	}
}
</script>
</html>