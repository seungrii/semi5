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
	/* position: absolute; */
}

.advance-theater {
	width: 265px;
	height: 100%;
	/* position: absolute; */
}

.advance-date {
	width: 91px;
	height: 100%;
	background-color: aqua;
	/* position: absolute; */
}

.advance-time {
	width: 340px;
	height: 100%;
	background-color: yellowgreen;
	/* position: absolute; */
}
</style>

<script type="text/javascript">
        $(function(){
            $(".advance-movie").find("li").click(function(){
                // $(".advance-theater").css("color","red");
                // console.log($(this).text()); //text 확인

                var moiveNumber = $(this).data("no");
                // console.log($(this).data("no"));
                if(!moiveNumber) return;

                $.ajax({
                    url:"http://localhost:8888/rest/advance/list?movieNumber="+$(this).data("no"),//moiveNumber,
                    method:"get",
                    success:function(resp){
                        $(".advance-theater").find("li").text(resp);
                        
                    }
                });

            });
        });

        
    </script>

<section class="w-980">

	<!-- 컨텐츠 -->
	<div class="advance-container">
<!-- 			<ul> -->
<%-- 				<c:forEach var="movieList" items="${movieList}"> --%>
<%-- 					<li>${movieList.movieName}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
<!-- 			<br><br><br> -->
<!-- 			<ul> -->
<%-- 				<c:forEach var="cinemaList" items="${cinemaList}"> --%>
<%-- 					<li>${cinemaList.cinemaPorin}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ul> -->
		<!-- 영화 고르는 박스 -->
		<!-- 284px -->
		<div class="advance-movie">
			<div>
				<ul>
					<li>영화</li>
					<br>
					<c:forEach var="movieList" items="${movieList}">
						<li>${movieList.movieName}</li>
					</c:forEach>
			</ul>
			</div>
		</div>
		<!-- 극장 고르는 박스 -->
		<!-- 265px -->
		<div class="advance-theater">
			<ul>
				<li>지점</li>
				<br>
				<c:forEach var="cinemaList" items="${cinemaList}">
					<li>${cinemaList.cinemaPorin}</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 날짜 고르는 박스 -->
		<!-- 91px -->
		<div class="advance-date">
			<ul>
				<li>날짜</li>
				<br>
				<c:forEach var="mPDL" items="${mPDL}">
					<li>${mPDL.il}</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 시간 고르는 박스 -->
		<!-- 340px -->
		<div class="advance-time">
			<ul>
				<li>상영시간</li>
				<br>
			</ul>
		</div>




	</div>
	<!-- 컨텐츠 -->
            <div class="advance-container">
                <!-- 영화 고르는 박스 -->
                <!-- 284px -->
                <div class="advance-movie">
                    <div>
                        <ul>
                            <li data-no="1">영화1</li>
                            <li data-no="2">영화2</li>
                            <li data-no="3">영화3</li>
                            <li data-no="4">영화4</li>
                            <li data-no="5">영화5</li>
                        </ul>
                    </div>
                </div>
                <!-- 극장 고르는 박스 -->
                <!-- 265px -->
                <div class="advance-theater">
                    <div>
                        <ul>
                            <li>지점1</li>
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
    </div>
</section>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>