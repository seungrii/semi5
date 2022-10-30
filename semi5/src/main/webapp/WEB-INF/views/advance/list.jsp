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
}

.advance-movie {
    width: 284px;
    height: 100%;
    /* background-color: blue; */
    /* position: absolute; */
}

.advance-cinema {
    width: 265px;
    height: 100%;
    /* background-color: green; */
    /* position: absolute; */
}

.advance-date {
    width: 91px;
    height: 100%;
    /* background-color: aqua; */
    /* position: absolute; */
}

.advance-time {
    width: 340px;
    height: 100%;
    /* background-color: yellowgreen; */
    /* position: absolute; */
}
.advance-btn-box {
    display: flex;
    justify-content: right;
}

.advance-next-btn {
    width: 100px;
    height: 100px;
}

.advance-next-btn > i {
    font-size: 50px;
}

.advance-person-screen {
    display: flex;
    height: 140px;
    padding-top: 20px;
    background-color: green;
}

.group-box, .user-select-info {
    background-color: red;
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
                    $(".advance-time").find("ul").append("<li>"+item.time+"</li>");
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
                $(this).not(a<8).addClass("impossible");
                $(".selected").removeClass("impossible")
                $(".selected").prevAll().removeClass("impossible");
            }
            else {
                $(this).removeClass("impossible");
            }
        });

    });


    $(".advance-next-btn").click(function(){
        // 좌석선택 버튼을 클릭해서 다음 div로 넘어왔을때 정보를 뿌려주기 위해 작성하던 코딩 미완성.
        // $(".user-select-info").find("ul").append("<li>"+cinemaName+"</li>").append("<li>"+theaterHall+"</li>");
        $(".user-select-info").find("li").remove();
        $(".user-select-info").find("ul").append("<li>"+cinemaName+"</li>");
    });


});

        
    </script>

<section class="w-980">
            <!-- 컨텐츠 -->
            <div class="advance-container">
                <!-- 영화 고르는 박스 -->
                <!-- 284px -->
                <div class="advance-movie">
                    <div>
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
                        <ul>
                            <li>날짜1</li>
                            <li>날짜2</li>
                            <li>날짜3</li>
                            <li>날짜4</li>
                            <li>날짜5</li>
                        </ul>
                    </div>
                </div>
                <!-- 시간 고르는 박스 -->
                <!-- 340px -->
                <div class="advance-time">
                    <div>
                        <ul>
                            <li>시간1</li>
                            <li>시간2</li>
                            <li>시간3</li>
                            <li>시간4</li>
                            <li>시간5</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="advance-btn-box">
                <button class="advance-next-btn">
                    <i class="fa-sharp fa-solid fa-circle-arrow-right"></i>
                    <span>좌석석택</span>
                </button>
            </div>


            <div class="advance-container second" style="background-color: blue;">
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

                <div>
                    <div>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
            
        </section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>