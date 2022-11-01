<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param name="title" value="예매" />
</jsp:include>

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
                    <input type="text" name="userId" value= ${session.loginId} readonly>
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