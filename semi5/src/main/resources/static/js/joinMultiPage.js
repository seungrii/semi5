$(function(){

    // 2. 1페이지만 남기고 다 숨김 처리
    $(".join-page").hide();
    $(".join-page").first().show();

    // 3. 남은 버튼에 클릭 이벤트를 설정
    // - 다음 버튼을 누르면 해당 페이지의 뒷 페이지 표시 및 나머지 숨김
    // - 이전 버튼을 누르면 해당 페이지의 앞 페이지 표시 및 나머지 숨김

    $(".next").click(function(){
        var target = $(this).parents(".join-page").next();
        // console.log(target);

        // 모든 페이지 숨기거 target만 표시
        $(".join-page").hide();
        target.show();
    });

    $(".prev").click(function(){
        var target = $(this).parents(".join-page").prev();

        $(".join-page").hide();
        target.show();
    });
});