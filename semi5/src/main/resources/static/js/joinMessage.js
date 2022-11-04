$(function(){
    $("[name=userId]").blur(checkId);
    $("[name=userPw]").blur(checkPassword);
    $("#password-check").blur(checkPasswordRe);

    function checkId(){
		var userId = $(this);
        var regex = /^[a-z][a-z0-9]{5,20}$/;

		if(!userId) return;
		userId.removeClass("success fail");
		$.ajax({
			url:root+"/http://localhost:8888/rest/user/id?userId="+userId.val(),
			method:"get",
			success:function(resp){
				if(resp=="NNNNY"){
					if (regex.test(userId.val())) {
						userId.addClass("success");
					} else {
						userId.addClass("fail");
					}
				}else{
					userId.addClass("fail");
				}
			}
		});
    }
    function checkPassword(){
        var regex = /^(?=.*[!@#$])(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9!@#$]{8,16}$/;
        $(this).removeClass("success fail");
        if(regex.test($(this).val())){
            $(this).addClass("success");
        }else{
            $(this).addClass("fail");
        }
    }
    function checkPasswordRe(){
        $(this).removeClass("success fail");
        if($(this).val() == $("input[name=userPw]").val()){
            $(this).addClass("success");
        }else{
            $(this).addClass("fail");
        }
    }

});