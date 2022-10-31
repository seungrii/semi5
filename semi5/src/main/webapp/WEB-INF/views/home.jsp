<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인화면" name="title"/>
</jsp:include>

<head>

	<link rel="stylesheet" type="text/css" href="./css/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/commons.css">
	
	<!-- swiper 의존성 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	
	<style>
        .swiper{
            width: 100%;
            height: 500px;
        }
        img{
        	height: 500px;
        }
        .swiper-button-prev, .swiper-button-next{
        	color: #DD5657;
        }
        .swiper-pagination{
        	color: #DD5657;
        }
        #chart{
        	float: left;
        	font-size: 40px;
        	font-weight:bold; 
        }
        .movie-btn{
        	size: 100px;
        }
        
        
        
    </style>
	
	<!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <script type="text/javascript">
            $(function(){
                var swiper = new Swiper('.swiper', {
                    direction: 'horizontal',//슬라이드 방향
                    loop: true,//반복여부
        
                    //페이징 옵션
                    pagination: {
                        el: '.swiper-pagination',//페이징 적용 대상
                        type: "bullets",//페이징 도구 모양
                        clickable:true,//클릭 가능 여부
                    },
        
                    // 좌우 이동 버튼
                    navigation: {
                        nextEl: '.swiper-button-next',
                        prevEl: '.swiper-button-prev',
                    },
                    
                    // 자동재생 옵션
                    autoplay : {
                        delay:3000,//자동재생 간격(ms)
                    },
        
                    // 페이지 전환 효과
                    effect:"slide",//슬라이드 방식(기본)
                });
            });
    
        </script>
	
</head>

<body>

	<div class="container mt-50 mb-50">
        <div class="row">
            <!-- Slider main container -->
            <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                   <!-- Slides -->
                   <div class="swiper-slide"><img src="https://biz.chosun.com/resizer/xkTEK-divyr381d3fJrMA0Z5toA=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/MJAZBYCG3JK3HZLVPT434FHUT4.jpg"></div>
                   <div class="swiper-slide"><img src="https://web-cf-image.cjenm.com/public/share/metamng/boards/kr/%ED%97%A4%EC%96%B4%EC%A7%88%20%EA%B2%B0%EC%8B%AC_STILL_%EC%A2%85%ED%95%A91.jpg?v=1653962290"></div>
                   <div class="swiper-slide"><img src="/image/normal.jpeg"></div> 
                </div>

                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>
            
                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
	
	<div class="container mt-50 mb-50">
		<div id="chart">무비차트</div>
	</div>
	<div class="row">
		<div class="w-33">1</div>
		<div class="w-33">2</div>
		<div class="w-33">3</div>
	</div>
</body>	
	
	
	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>