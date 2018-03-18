<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>启源物业管理系统</title>
    <style>
 /*联系我们*/
#content .main{
    position: relative;
    margin: 0 auto;
    width: 1200px;
    height: 600px;
}
.main #left{
    float: left;
    padding: 23px 23px 43px 0;
    width: 850px;
    border-right: 1px solid #eee;
}
#content .headline{
    height: 100px;
    background: url(/wyht/img/qtimg/c2.jpg) no-repeat 0 0;
}
#content .box{
    margin: 20px 0;
}
#content .box .summary {
    margin-left: 18px;
    margin-top: 18px;
    width: 640px;
    height: 100%;
    line-height: 18px;
    color: #746969;
}
#content .box .summary h1 {
    margin-bottom: 8px;
    line-height: 26px;
    color: #007cc3;
    
    margin:20px 0px;
}
#content .box .summary h4 {
    line-height: 26px;
    margin:20px 0px;
}
#content .box .summary p {
    line-height: 18px;
    color: #746969;
    overflow: hidden;
    margin:10px 0px;
}
input.more {
    display: block;
    width: 100%;
    height: 70px;
    background: #e1dede url(/wyht/img/qtimg/more.png) no-repeat right center;
    cursor: pointer;
    border-radius: 10px;
}
input.more:hover{
    background:#aaaaa6 url(/wyht/img/qtimg/more.png) no-repeat right center;
}
#content #right {
    float: left;
    margin-left: -1px;
    padding-top: 23px;
    padding-left: 22px;
    width: 300px;
    border-left: 1px solid #eee;
}
.main #right img{
    width: 400px;
}
    </style>
</head>
<body>

    <div id="content"> 
        <div id="banner">
            <div style="background:url(/wyht/img/qtimg/c1.jpg)"></div>
        </div>
        
        <div class="nav">
            <div class="wrap">
                <div class="crumbs">
                    <a href="index.html">首页</a>
                    <a class="on">联系我们</a>
                </div>
            </div>
        </div>

        <div class="main">

            <div id="left">
                <div class="headline"></div>
                <div class="box" style="height:340px;">
                    <div class="summary">
                        <h1>启源物业-集团总部</h1>
                        <h4>地址：广东省汕头市金平区硅谷学院401</h4>
                        <h4>负责人：廖先生</h4>
                        <h4>电话：150-1726-3266</h4>
                        <p>邮编：666666</p>
                        <p>电话：88888888</p>
                        <p>传真：0755-83997399</p>
                        <p>网址：http://www.qiyuan.cn</p>
                    </div>
                </div>
                <input title="点击查看更多" class="more" type="button">
            </div>
            
            <div id ="right">
                   <a href="##"><img src="/wyht/img/qtimg/c3.jpg" alt=""></a>
            </div>

        </div>
    </div>
</body>