<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param name="title" value="예매" />
</jsp:include>

<style>
.advance-container {
    height: 720px;
    display: flex;
    /* position: relative; */
    /* padding: 5px; */
    background-color: #F9E7BA;
    border: 1px solid #888;
}

.advance-movie {
    width: 284px;
    height: 100%;
    /* background-color: blue; */
    /* position: absolute; */
    border-right: 1px solid #888;
}

.advance-cinema {
    width: 265px;
    height: 100%;
    /* background-color: green; */
    /* position: absolute; */
    border-right: 1px solid #888;
}

.advance-date {
    width: 131px;
    height: 100%;
    /* background-color: aqua; */
    /* position: absolute; */
    border-right: 1px solid #888;
}

.advance-time {
    width: 300px;
    height: 100%;
    /* background-color: yellowgreen; */
    /* position: absolute; */
}

.advance-movie span,
.advance-cinema span, 
.advance-date span, 
.advance-time span 
{
    width: 100%;
    height: 30px;
    color: #F9E7BA;
    background-color: #511517;
    display: block;
    text-align: center;
    line-height: 30px;
}
.advance-btn-box {
    display: flex;
    justify-content: right;
    height: 130px;
    background-color: #511517;
    align-items: center;
    padding: 10px;
}
.advance-btn-box.second {
    display: flex;
    justify-content: space-between;
}

.advance-next-btn,
.advance-prev-btn
 {
    width: 100px;
    height: 100px;
    font-weight: 600;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    border-radius: 10px;
    background-color: #F9E7BA;
    color: #511517;
}

.advance-next-btn > i,
.advance-prev-btn > i
 {
    font-size: 50px;
}

.advance-payment-btn {
    width: 160px;
    height: 100px;
    font-size: 20px;
    font-weight: 600;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    border-radius: 10px;
    background-color: #F9E7BA;
    color: #511517;
}
.advance-payment-btn > i {
    font-size: 40px;
}

.advance-person-screen {
    display: flex;
    height: 140px;
    padding-top: 20px;
    /* background-color: green; */
}

.group-box, .user-select-info {
    /* background-color: red; */
    display: flex;
    flex-direction: column;
    width: 50%;
}

.advance-group, .advance-group ul {
    display: flex;
    margin-bottom: 3px;
}

.advance-group li {
    margin-left: 5px;
    width: 20px;
    height: 20px;
    border: 1px solid #d6d3ce;
    background-color: #f2f0e5;
    
}

.advance-group li > a {
    display: block;
    height: 100%;
    text-align: center;
    font-weight: bold;
    line-height: 20px;
}

.advance-group li.selected {
    border-color: black;
    background-color: #333;
    color: white;
}

.advance-group li.selected >a {
    color: white;
}

.advance-group span {
    width: 60px;
}

.advance-group .impossible {
    background-color: #777;
}

.advance-container.second {
    flex-direction: column;
}

.seat-box {
    text-align: center;
    /* background-color: gold; */
    width: 300px;
    margin: 200px auto 0 auto;

}

.seat-row {
    width: 200px;
    margin: 0 auto;
}

/* #ad1712 */
.seat-line {
    display: flex;
    justify-content: center;
}

.seat-line li {
    width: 20px;
    height: 20px;
    background-color: #666;
}
.seat-line li:hover {
    background-color: #511517;
}
/* 예매를 하기 위해 사용자가 선택한 좌석 표시에 사용 */
.seat-select {
    background-color: #511517;
}
/* 예매가 완료된 좌석에 사용 */
.seat-advance-complete {
    background-color: #e6e6e6;
}
.seat-line li>a {
    display: block;
    color: white;
}

.seat-line span {
    width: 20px;
}

.advance-seat > div {
    float: left;
}
.advance-seat > div:nth-child(1) {
    width: 830px;
}
.advance-seat > div:nth-child(2) {
    width: 130px;
    height: 100%;
}

.screen {
    width: 780px;
    height: 30px;
    text-align: center;
    margin: 10px auto 0 auto;
    line-height: 30px;
    background-color: #e6e6e6;
}

.seat-choice-info>div {
    margin-top: 195px;
}

.seat-choice-info p:nth-child(1)>i {
    color: #511517;
}
.seat-choice-info p:nth-child(2)>i {
    color: #e6e6e6;
}

</style>

<script type="text/javascript">
$(function(){
    var movieNumber, cinemaName, moviePlayDate, moviePlayTime, theaterHall;
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

        
        var num1 = $(".selected").text().charAt(0);
        var num2 = $(".selected").text().charAt(1);
        var num3 = $(".selected").text().charAt(2);
        var max = parseInt(num1) + parseInt(num2) + parseInt(num3);
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
            console.log("intFieldNum = "+intFieldNum);
            console.log(intFieldNum+intMax);

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
    });
    


});

        
    </script>

<section class="w-980">
            <!-- 컨텐츠 -->
            <form action="advance" method="post">
            <div class="advance-container">
                <!-- 영화 고르는 박스 -->
                <!-- 284px -->
                <div class="advance-movie">
                    <div>
                        <span>영화</span>
                        <ul>
                        <c:forEach var="movieList" items="${movieList}">
                            <li data-no="${movieList.movieNumber}">${movieList.movieName}</li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- 극장 고르는 박스 -->
                <!-- 265px -->
                <div class="advance-cinema">
                    <div>
                        <span>지점</span>
                        <ul>
                        <c:forEach var="cinemaList" items="${cinemaList}">
                            <li>${cinemaList.cinemaPorin}</li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- 날짜 고르는 박스 -->
                <!-- 91px -->
                <div class="advance-date">
                    <div>
                        <span>날짜</span>
                        <ul>
                        <c:forEach var="dateList" items="${dateList}">
                            <li>${dateList.sysdate}</li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- 시간 고르는 박스 -->
                <!-- 340px -->
                <div class="advance-time">
                    <div>
                        <span>시간</span>
                        <ul>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="advance-btn-box">
                <button class="advance-next-btn">
                    <i class="fa-sharp fa-solid fa-circle-arrow-right"></i>
                    <p>좌석석택</p>
                </button>
            </div>


            <div class="advance-container second" style="display: none;">
                <div class="advance-person-screen w-100">
                    <div class="group-box">
                        <div class="advance-group adult">
                            <span>일반</span>
                            <ul>
                                <li class="selected"><a href="#">0</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">8</a></li>
                            </ul>
                        </div>
                        <div class="advance-group youth">
                            <span>청소년</span>
                            <ul>
                                <li class="selected"><a href="#">0</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">8</a></li>
                            </ul>
                        </div>
                        <div class="advance-group senior">
                            <span>경로</span>
                            <ul>
                                <li class="selected"><a href="#">0</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">8</a></li>
                            </ul>
                        </div>
                    </div> <!--group box end-->
                    <div class="user-select-info">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>

                <div class="advance-seat">
                    <div>
                        <div class="screen"><span>SCREEN</span></div>
                        <!-- ul > li 행(row), ul > li > ul 열(line) -->
                        <ul class="seat-box">
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>A</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="A" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>B</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="B" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>C</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="C" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>D</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="D" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>E</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="E" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>F</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="F" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>G</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="G" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>H</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="H" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>I</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="I" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
							<li class="seat-row">
                                <ul class="seat-line">
                                    <span>J</span>
                                    <c:forEach var="i" begin="1" end="8">
                                    	<li><a href="#" data-row="J" data-line="${i}">${i}</a></li>
                                    </c:forEach>
                                </ul>
                            </li>
						</ul>
                    </div>
                    <div class="seat-choice-info">
                        <div>
                            <p><i class="fa-solid fa-square"></i>선택</p>
                            <p><i class="fa-solid fa-square"></i>예매완료</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="advance-btn-box second" style="display: none;">
                <button class="advance-prev-btn">
                    <i class="fa-sharp fa-solid fa-circle-arrow-left"></i>
                    <p>영화선택</p>
                </button>
                <button class="advance-next-btn">
                    <i class="fa-sharp fa-solid fa-circle-arrow-right"></i>
                    <p>결제선택</p>
                </button>
            </div>

            <div style="display: none;">
                <div>
                    <h1>예매내역</h1>
                    <input type="text" name="userId" value="userId" readonly>
                    <input type="text" name="moviePlayNum" value="moviePlayNum" readonly>
                    <input type="text" name="seatNum" value="seatNum" readonly>
                    <input type="text" name="priceTotal" value="priceTotal" readonly>
                </div>
                <div>

                </div>
            </div>
            <div class="advance-btn-box second" style="display: none;">
                <button class="advance-prev-btn">
                    <i class="fa-sharp fa-solid fa-circle-arrow-left"></i>
                    <p>좌석선택</p>
                </button>
                <button class="advance-payment-btn" type="submit">
                    <i class="fa-solid fa-coins"></i>
                    <p>결제하기</p>
                </button>
            </div>
        </form>
            
        </section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>