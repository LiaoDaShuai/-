$(function(){
        $(".n1").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n1 a").css("color","#fff");
            $("#subNav .item").css("top","-100%");
        },function(){
            $("#subNav .item").css("top","-100%");
            $(".n1").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n1 a").css("color","#fff");
        });

        $(".n0").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n0 a").css("color","#fff");

            $("#subNav .item").css("top","-100%");
            $("#subNav .about").css("top","0");
        },function(){
            $("#subNav .item").css("top","-100%");
            $("#subNav .about").css("top","0");

            $(".n0").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n0 a").css("color","#fff");
        });

        $(".n2").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n2 a").css("color","#fff");
            
            $("#subNav .item").css("top","-100%");
            $("#subNav .notice").css("top","0");
        },function(){
            $("#subNav .item").css("top","-100%");
            $("#subNav .notice").css("top","0");
            
            $(".n2").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n2 a").css("color","#fff");
        });
        $(".n3").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n3 a").css("color","#fff");

            $("#subNav .item").css("top","-100%");
            $("#subNav .news").css("top","0");
        },function(){
            $("#subNav .item").css("top","-100%");
            $("#subNav .news").css("top","0");
            
            $(".n3").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n3 a").css("color","#fff"); 
        });
        $(".n4").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n4 a").css("color","#fff");

            $("#subNav .item").css("top","-100%");
            $("#subNav .relation").css("top","0");
        },function(){
            $("#subNav .item").css("top","-100%");
            $("#subNav .relation").css("top","0");
            
            $(".n4").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n4 a").css("color","#fff"); 
        });
        $(".n5").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n5 a").css("color","#fff");

            $("#subNav .item").css("top","-100%");
            $("#subNav .service").css("top","0");
        },function(){
            $("#subNav .item").css("top","-100%");
            $("#subNav .service").css("top","0");
            
            $(".n5").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n5 a").css("color","#fff"); 
        });
        $(".n6").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n6 a").css("color","#fff");

            $("#subNav .item").css("top","-100%");
        },function(){
            $("#subNav .item").css("top","-100%");

            $(".n6").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n6 a").css("color","#fff");
        });
        $(".n7").hover(function(){
            $("#nav li").css("background","#fff");
            $("#nav li a").css("color","#666");
            $("#nav .n7 a").css("color","#fff");
            $("#subNav .item").css("top","-100%");
        },function(){
            $("#subNav .item").css("top","-100%");
            $(".n7").css("background-color","#003b96");
            $("#nav .li").css("color","#666");
            $("#nav .n7 a").css("color","#fff");
        });
});