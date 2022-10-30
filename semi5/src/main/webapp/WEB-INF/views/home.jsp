<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>

<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/commons.css">

<!-- swiper 의존성 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
    
    $("document").ready(function () {
    // 문서의 dom이 준비되면
    // .mySwiper 클래스를 swiper 슬라이더로 만듦
    // 이후에 swiper변수에 할당했기 때문에 스크립트로 제어할 수도 있음.
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 'auto',
        spaceBetween: 80,
        loop: true,

        // pagination 기본은 bullet
        pagination: {
            el: ".swiper-pagination"
        },

        // 좌우 화살표 navigation element 지정
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev"
        },
        // 반응형
        breakpoints: {
            // 600px 이하가 되면 슬라이드 간 간격을 0으로
            600: {
                spaceBetween: 0
            },
        },

        on: {
            init: function() {
                $('.swiper-slide').addClass('changed');

                // fraction에 현재 인덱스와 전체 인덱스 표시
                // this.loopedSlides는 loop, slidesPerView: 'auto'일 때 제대로 동작
                $('.custom-fraction .current').text(this.realIndex + 1);
                $('.custom-fraction .all').text(this.loopedSlides);
                // console.log(this);
                // console.log(this.loopedSlides)
            },

            slideChangeTransitionStart: function() {
                // 기본적으로 제공하는 swiper-slide-active 클래스를 이용해
                // css transition 애니메이션 작성 가능하다.
                // 다만 루프 모드일 때에는 루프 픽스를 하며 slide를 바꿔치기를 하는데,
                // 이 때 플리커링이 발생할 수 있다.
                // css transition을 서로 다르게 설정한 changed, changing 클래스를 이용
                $('.swiper-slide').addClass('changing');
                $('.swiper-slide').removeClass('changed');

                // 페이지 넘어갈 때마다 fraction 현재 인덱스 변경
                $('.custom-fraction .current').text(this.realIndex + 1);
            },

            slideChangeTransitionEnd: function() {
                // changing : transition O
                // changed : transition X
                $('.swiper-slide').removeClass('changing');
                $('.swiper-slide').addClass('changed');
            }
        },
    });

    // 슬라이더 할당한 swiper로 슬라이더 제어
    $(".auto-start").on("click", function() {
        // 기본 설정으로 autoplay 시작
        console.log("autoplay start");
        swiper.autoplay.start();
    });

    $(".auto-stop").on("click", function() {
        console.log("autoplay stop");
        swiper.autoplay.stop();
    });
});
 </script>

<style>
html,body {
   position: relative;
   height: auto
}

body {
   background: #eee;
   font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
   font-size: 14px;
   color: #000;
   margin: 0;
   padding: 0;
   overflow-x: hidden;
}

.wrapper {
   max-width:1200px;
   width:75%;
   margin:0 auto;
}

.swiper {
   max-width: 480px;
   width:100%;
   height: 360px;
   position: relative;
   overflow: visible;
}

.swiper-slide {
   max-width: 480px;
   width:100%;
   height:360px;
   text-align: center;
   font-size: 18px;
   background: #fff;
   border-radius: 10px;

   /* Center slide text vertically */
   display: -webkit-box;
   display: -ms-flexbox;
   display: -webkit-flex;
   display: flex;
   -webkit-box-pack: center;
   -ms-flex-pack: center;
   -webkit-justify-content: center;
   justify-content: center;
   -webkit-box-align: center;
   -ms-flex-align: center;
   -webkit-align-items: center;
   align-items: center;
}

.swiper-slide img {
   display: block;
   width: 100%;
   width: 480px;
   height: 100%;
   object-fit: cover;
}

/**/

.swiper-slide {opacity:0.5; transition:opacity 0.5s;}
.swiper-slide-active {opacity:1;}

.changing {
    transition:opacity 0.3s;
    pointer-events:none;
  }
  
  .changed {  
    transition:none;
  }


/* pagination */
.mySwiper .swiper-pagination {
    position: absolute;
    bottom: -30px;
    text-align:left;
    
}

/* nav btn*/
.mySwiper .swiper-button-next,
.mySwiper .swiper-button-prev {
    top: 50%;
}

.mySwiper .swiper-button-prev {
    transform:translateX(-200%);
}
.mySwiper .swiper-button-next {
    transform:translateX(200%);
}

.custom-fraction {text-align:right; margin:15px 5px 0 0;}
.btn-wrapper {
    margin-top:50px;
}

</style>

</head>

<body>

<div class="swiper-container">
  <div class="swiper-wrapper">
    <div class="swiper-slide">Slide 1</div>
    <div class="swiper-slide">Slide 2</div>
    <div class="swiper-slide">Slide 3</div>
  </div>
  <div class="swiper-pagination"></div>
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>





<div class="container">	
	<div class="row">
		<h2>
			최근에 작성된 게시글
			<small><a href="board/list">더보기</a></small>
		</h2>	
	</div>
			
			<div class="row">
				<table class="table table-slit">
					<thead>
						<tr>
							<th width="50%">제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody align="center">
						<c:forEach var="boardDto" items="${boardList}">
						<tr>
							<td align="left">
								<a href="board/detail?boardNo=${boardDto.boardNo}">
									${boardDto.boardTitle}	
								</a>
							</td>
							<td>${boardDto.boardWriter}</td>
							<td>${boardDto.boardRead}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
</div>	
	
	
</body>	
	
	
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>