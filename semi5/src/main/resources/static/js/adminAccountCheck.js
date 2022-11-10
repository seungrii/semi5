$(function(){

    //AJAX 이용시 주의사항
    //- 기존처럼 즉시 검사가 불가능하므로 상태(검사결과)를 저장할 객체 필요
    //  (ajax 안에서 이루어지므로, return값을 밖에서 알 수 없기 때문)
    //- ex) form 보낼지 여부에서, 아이디 검사결과(true,flase)가 필요할 경우
    var AccountCheck = {
        IdValid:false
    };

    //아이디 입력창을 만들고 blur 상황에서 중복 검사를 실시하도록 구현
    //- 반환된 결과에 따라 메세지 출력
    $("input[name=adminId]").blur(function(){

        //작성된 닉네임을 불러온다.
        var Id = $(this).val();

        //형식 검사를 실시한다.
        var regex = /^[a-z0-9]{5,10}$/;         
        var judge = regex.test(Id);

        //형식 검사 결과에 따라 다른 처리를 수행한다
        // - 성공 : ajax 통신으로 닉네임 중복검사 실시
        // - 실패 : 실패 메세지 처리
        $(this).removeClass("fail NNNNN NNNNY");
        if(judge){  //정규표현식 성공 -> 중복검사

            var that = this;//this(입력창)을 that에 보관

            $.ajax({
                //url:"http://localhost:8888/rest/member/nick?memberNick="+memberNick,
                //method:"get",

                url:root+"/rest/admin/id",
                method:"post",
                data:{//POST일 경우만 생성 가능한 파라미터 객체
                    //왼쪽이 파라미터 이름, 오른쪽이 전달될 값의 변수명
                    adminId:Id
                },
                success:function(resp){
                    //(+주의) 이곳에서의 this는 입력창이 아니다 (this=ajax 객체이다),
                    //그러므로 밖에서 this(=입력창)를 보관한 that 사용
                    if(resp == "NNNNN"){
                        $(that).addClass("NNNNN");
                        AccountCheck.IdValid = false;
                    }
                    else if(resp == "NNNNY"){
                        $(that).addClass("NNNNY");
                        AccountCheck.IdValid = true;
                    }
                },
                error:function(){}//통신 오류 발생 시
            });

        }
        else {  //정규표현식 실패
            $(this).addClass("fail");
            AccountCheck.IdValid = false;
        }
    });

    $("input[name=adminPw]").blur(function(){
        //작성된 닉네임을 불러온다.
        var Pw = $(this).val();

        //형식 검사를 실시한다.
        var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/;      
        var judge = regex.test(Pw);

        $(this).removeClass("fail NNNNN NNNNY");
        if(judge){
            $(this).addClass("NNNNY");
            return true;
        }
        else {
            $(this).addClass("fail");
            return false;
        }
    });

});