// 네비게이터 js (수정 필요)

$(function(){
    $(".nav-title-box").hover(function(e){
        e.stopPropagation();
        $(".nav-list-box").slideToggle(200);
    });

    $(window).scroll(function(){
        var height = $(document).scrollTop();
        if($(document).scrollTop() > $("header").height()) {
            $("nav").addClass("nav-fix");
            $(".nav-title").find("a").css("display", "flex");
        }
        else {
            $("nav").removeClass("nav-fix");
            $(".nav-title").find("a").first().css("display", "none");
        }
    });
    $(".btn-search").click(function(){
		
	});
});