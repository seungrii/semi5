$(function(){
    var count = 0;
    $(".btn-positive").prop("disabled", true);
    $(".ck-required").on("change", ckRequired);
    $(".ck-all").change(function(){
        if($(this).prop("checked") == false){count = 0;}
        else{count = $(".ck").length;}
        $(".ck").prop("checked", $(this).prop("checked"));
        ckRequired();
    });

    $(".ck").change(function(){
        if($(this).prop("checked") == false){count--;}
        else{count++;}
        if(count == $(".ck").length){
            $(".ck-all").prop("checked", true);
        }else{
            $(".ck-all").prop("checked", false);
        }
    });
    function ckRequired(){
        var required = 0;
        $(".ck-required").each(function(){
            if($(this).prop("checked")){
                required++;
            }
        });
        var judge = $(".ck-required").length == required;
        if(judge){ //모두 체크 - 버튼 비활성화 해제
            $(".btn-positive").prop("disabled", false);
        }else{ // 버튼 비활성화 설정
            $(".btn-positive").prop("disabled", true);
        }
    }
});