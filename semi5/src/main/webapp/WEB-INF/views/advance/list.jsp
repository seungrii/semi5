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
</style>

<script type="text/javascript">
$(function(){
    var movieNumber;
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
                    // $(".advance-cinema").find("ul").append(item.ciName);
                    // $(".advance-cinema").find("ul").append("</li>");
                    
                });
                
            }
        }); //ajax end
        return movieNumber;
    }); //click function end


    $(document).on("click",".advance-cinema li",function(){
        // console.log(movieNumber); //movieNumber 확인
        // console.log($(this).text()); //text 확인
        console.log($(this).data("cinemaName"));
        console.log($(this).text());

        $.ajax({
            url:"http://localhost:8888/rest/advance/datelist?movieNumber=" + movieNumber + "&cinemaName=" + $(this).text(),//moiveNumber,
            method:"get",
            success:function(resp){
                // console.log(resp);// list값 제대로 넘어옴
                $(".advance-date").find("li").remove();
                $.each(resp, function(index, item){
                    $(".advance-date").find("ul").append("<li>"+item.moviePlayStart+"</li>");
                    // $(".advance-cinema").find("ul").append(item.ciName);
                    // $(".advance-cinema").find("ul").append("</li>");
                    
                });
                // console.log("통신완료");
            }
        }); //ajax end

        
    });// click function end


});
// text나 html로 뿌려줄때 리스트를 풀어서 찍어주면 됨

        
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
        </section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>