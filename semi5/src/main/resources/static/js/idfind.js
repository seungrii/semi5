$(function(){
	$(".btn-login-move").click(function(){
		location.href="http://localhost:8888/user/login";
	});
	$(".login-page").hide();
    $(".login-page").first().show();
    
    $(".btn-back").click(function(){
		$(".login-page").hide();
    	$(".login-page").first().show();
	});
	$("#id-find").click(function(){
		var userName = $("[name=userName]");
		var userTel = $("[name=userTel]");
		
		if(!userName || !userTel) return;
		
		var userfind = "userName="+userName.val()+"&userTel="+userTel.val();
		$.ajax({
			url:root+"/http://localhost:8888/rest/user/userIdFind?"+userfind,
			method:"get",
			success:function(resp){
				if(resp != "NNNNY"){
					$(".success").text(resp);
					$(".login-page").hide();
					$(".success-page").show();
				}else{
					$(".login-page").hide();
					$(".fail-page").show();
				}
			}
		});
	});
	$("#pw-find").click(function(){
		var userId = $("[name=userId]");
		var userName = $("[name=userName]");
		var userTel = $("[name=userTel]");
		
		if(!userId || !userName || !userTel) return;
		
		var userfind = "userId="+userId.val()+"&userName="+userName.val()+"&userTel="+userTel.val();
		$.ajax({
			url:root+"/http://localhost:8888/rest/user/userPwFind?"+userfind,
			method:"get",
			success:function(resp){
				if(resp != "NNNNY"){
					$(".success").text(resp);
					$(".login-page").hide();
					$(".success-page").show();
				}else{
					$(".login-page").hide();
					$(".fail-page").show();
				}
			}
		});
	});
});





