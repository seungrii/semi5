$(function(){
    var movieNumber, cinemaName, moviePlayDate, moviePlayTime, theaterHall, adult, youth, senior, max;
    var moviePlay = moviePlayDate + " " +moviePlayTime

    $(".advance-movie").find("li").click(function(){
        // $(".advance-theater").css("color","red");
        // console.log($(this).text()); //text 확인

        movieNumber = $(this).data("no");
        // console.log($(this).data("no"));
        if(!movieNumber) return;

        $.ajax({
            url:"http://localhost:8888/rest/advance/cinemalist?movieNumber="+$(this).data("no"),//moiveNumber,
            method:"get",
            success:function(resp){
                // console.log(resp);// list값 제대로 넘어옴
                $(".advance-cinema").find("li").remove();
                $.each(resp, function(index, item){
                    $(".advance-cinema").find("ul").append("<li>"+item.cinemaName+"</li>");
                    
                });
                
            }
        }); //ajax end
        return movieNumber;
    }); //click function end


    $(document).on("click",".advance-cinema li",function(){
        // console.log(movieNumber); //movieNumber 확인
        // console.log($(this).text()); //text 확인

        $.ajax({
            url:"http://localhost:8888/rest/advance/datelist?movieNumber=" + movieNumber + "&cinemaName=" + $(this).text(),//moiveNumber,
            method:"get",
            success:function(resp){
                // console.log(resp);// list값 제대로 넘어옴
                $(".advance-date").find("li").remove();
                $.each(resp, function(index, item){
                    $(".advance-date").find("ul").append("<li>"+item.moviePlayStart+"</li>");
                    
                });
                // console.log("통신완료");
            }
        }); //ajax end
        cinemaName = $(this).text();
        return cinemaName;
    });// click function end

    
    $(document).on("click",".advance-date li", function(){
        
        $.ajax({
            url:"http://localhost:8888/rest/advance/timelist?movieNumber=" + movieNumber + "&cinemaName=" + cinemaName + "&moviePlayDate="+$(this).text(),//moiveNumber,
            method:"get",
            success:function(resp){
                // console.log(resp);// list값 제대로 넘어옴
                $(".advance-time").find("li").remove();
                $.each(resp, function(index, item){
                    $(".advance-time").find("ul").append("<li data-tsn>"+item.time+"</li>");
                    // $(".advance-time").find("ul").append("<li>"+"<sapn>"+item.theatertype+"</span>"+
                    //     "<sapn>"+item.theaterHall+"관"+"</span>"+
                    //     "<sapn>"+item.time+"</span>"+
                    //     "<sapn>"+item.theaterTotalSeat+"석"+"</span>"+
                    //     "</li>");
                    // $(".advance-time").find("ul").append("<li>"+item.theatertype+"</li>");
                    // $(".advance-time").find("ul").append("<li>"+item.theaterHall+"관"+"</li>");
                    // $(".advance-time").find("ul").append("<li>"+item.time+"</li>");
                    // $(".advance-time").find("ul").append("<li>"+item.theaterTotalSeat+"석"+"</li>");
                    
                });
                // console.log("통신완료");
            }
    });//ajax end
    moviePlayDate = $(this).text();
    return moviePlayDate, theaterHall;
    });// click function end

    $(document).on("click", ".advance-time li", function(){
        var moviePlayTime = $(this).text();
        // console.log(moviePlayTime);
        return moviePlayTime;

    });

    // 첫페이지의 선택사항을 모두 선택했을시 버튼 활성화 기능 구현중
    // if(movieNumber, cinemaName, moviePlayDate, moviePlayTime != null){
    //     $(".advance-next-btn").css("background-color","red");
    // }

    
    $(".advance-group").find("a").click(function(e){
        e.preventDefault();
        $(this).parent().addClass("selected");
        $(this).parent().siblings(".selected").removeClass("selected");

        
        var adult = $(".selected").text().charAt(0);
        var youth = $(".selected").text().charAt(1);
        var senior = $(".selected").text().charAt(2);
        var max = parseInt(adult) + parseInt(youth) + parseInt(senior);
        // console.log(max); //확인 완료
        // if(max >= 8) {
        //     $(".advance-group").find(".selected").siblings().addClass("impossible");
        // }
        // else{
        //     $(".advance-group").find(".selected").siblings().removeClass("impossible");
        // }

        $(".advance-group").find("a").each(function(){
            var fieldNum = $(this).text();
            var intFieldNum = Number(parseInt(fieldNum));
            var intMax = Number(max)
            // console.log("intFieldNum = "+intFieldNum);
            // console.log(intFieldNum+intMax);

            var a = intFieldNum + intMax;
            // console.log(a);
            if(a > 8) {
                $(this).not(a<8).parent().addClass("impossible");
                $(this).not(a<8).parent().siblings().addClass("impossible");
                $(".selected").removeClass("impossible");
                $(".selected").prevAll().removeClass("impossible");
            }
            else {
                $(this).parent().removeClass("impossible");
                $(this).parent().siblings().removeClass("impossible");
            }
        });
        return adult, youth, senior, max;

    });


    $(".advance-next-btn").click(function(e){
        e.preventDefault();
        // 좌석선택 버튼을 클릭해서 다음 div로 넘어왔을때 정보를 뿌려주기 위해 작성하던 코딩 미완성.
        // $(".user-select-info").find("ul").append("<li>"+cinemaName+"</li>").append("<li>"+theaterHall+"</li>");
        $(".user-select-info").find("li").remove();
        $(".user-select-info").find("ul").append("<li>"+cinemaName+"</li>");
        $(this).parent().prev().hide();
        $(this).parent().hide();
        $(this).parent().next().show();
        $(this).parent().next().next().show();
    });

    $(".advance-prev-btn").click(function(e){
        e.preventDefault();
        $(".user-select-info").find("li").remove();
        $(".user-select-info").find("ul").append("<li>"+cinemaName+"</li>");
        $(this).parent().prev().hide();
        $(this).parent().hide();
        $(this).parent().prev().prev().show();
        $(this).parent().prev().prev().prev().show();
    });

    $(".seat-line a").click(function(e){
        e.preventDefault();
        $(this).toggleClass("seat-select");
        var a = $(this).data("row");
        var b = $(this).data("line");
        console.log(a+" "+b);
        console.log(max);
        console.log(cinemaName);
        console.log(adult);

        var checked = $(".seat-line a").hasClass("seat-select").length;

        if(checked > max) {
            alert(max+"좌석까지 선택 가능");
            $(this).removeClass("seat-select");
        }

    });

    


});