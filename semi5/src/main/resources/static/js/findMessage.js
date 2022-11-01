$(function(){
    $("#change-pw").blur(checkPassword);
    $("#change-pw-find").blur(checkPasswordRe);

    function checkPassword(){
        var regex = /^(?=.*[!@#$])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9!@#$]{8,16}$/;
        $(this).removeClass("fail");
        if(regex.test($(this).val())){
			$(this).removeClass("fail");
        }else{
            $(this).addClass("fail");
        }
    }
    function checkPasswordRe(){
        $(this).removeClass("success fail");
        if($(this).val() == $("#change-pw").val()){
            $(this).addClass("success");
        }else{
            $(this).addClass("fail");
        }
    }
    $("#btn-qna-back").click(function(){
		
	});

});