<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>

<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="특별관" name="title"/>
</jsp:include>

<style>
  .swiper{
      width: 100%;
      height: 450px;
      margin-top: 100px;
      position: absolute;
      z-index: 1;
  }
	img{
		width: 800px;
		height: 600px;
		
	}
	h1{
		margin: 100px;
	} 
	.btn-theater{
		width: 200px;
		height: 50px;
		font-size: 20px;
			
	}

</style>

<!-- swiper 의존성 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

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
                        delay:2000,//자동재생 간격(ms)
                    },
        
                    // 페이지 전환 효과
                    effect:"slide",//슬라이드 방식(기본)
                    
                });
            });
    
        </script>
        

</head>
<body>
	<div class="container">
		<h1>특별관</h1>
	</div>


	<div class="container">
            <!-- Slider main container -->
            <div class="swiper">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <!-- Slides -->
                    <div class="swiper-slide"><img src="/image/imax.jpeg"></div>
                    <div class="swiper-slide"><img src="/image/4d.jpeg"></div>
                    <div class="swiper-slide"><img src="/image/suite.jpeg"></div>
                    <div class="swiper-slide"><img src="/image/kids.jpeg"></div>     
                         
                </div>

                <!-- If we need pagination -->
                <div class="swiper-pagination"></div>
            
                <!-- If we need navigation buttons -->
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            
                
            </div>
            <div class="row">
            	<h1>VIC만의 특별함이 있는 영화관을 소개합니다</h1>
            </div>
            <div>
            	<button class="btn btn-theater"><a href="4d">4d</a></button>
            	<button class="btn btn-theater"><a href="imax">imax</a></button>
            	<button class="btn btn-theater"><a href="kids">kids</a></button>
            	<button class="btn btn-theater"><a href="suite">suite</a></button>
            	
            </div>
            
        </div>
        
        
	<div class="container mt-50">
		<div class="container">
			<img alt="" src="/image/4d.jpeg">
			<h1>4d</h1>
		</div>
		<div class="container">
			<img alt="" src="/image/suite.jpeg">
			<h1>스위트</h1>
		</div>
		<div class="container">
			<img alt="" src="/image/imax.jpeg">
			<h1>아이맥스</h1>
		</div>
		<div class="container">
			<img alt="" src="/image/kids.jpeg">
			<h1>키즈</h1>
		</div>
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>