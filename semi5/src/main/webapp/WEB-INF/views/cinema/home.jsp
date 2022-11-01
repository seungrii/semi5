<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.favorite-wrap .sect-city > ul {
    	position: relative;
	}
	.sect-city  li{
		float:left;
		margin: 0 8px;
	}
	.favorite-wrap{
	    position: relative;
	    width: 100%;
	    height: 100%;
	    padding: 60px 53px 0;
	    background: url(https://img.cgv.co.kr/r2014/images/common/bg/bg_showtimes_favorite.gif) no-repeat 0 0;
    }
    .favorite-wrap .sect-city {
    	height: 42px;
	    margin-top: 18px;
	    border-top: 2px solid #727171;
	    border-bottom: 2px solid #727171;
}
    .favorite-wrap .sect-city > ul > li > a {
	    padding: 0 20px;
	    color: #dbdbdb;
	    font-size: 14px;
	    line-height: 40px;
	    text-align: center;
}
	.sect-city {
    	line-height: 40px;
	}
	.sect-city > a {
		display: block;
	}

</style>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row mt-50 mb-50 center">
			<h1>지점 안내</h1>
		</div>
		<div class="favorite-wrap">
			<div class="sect-city">
				<ul>
					<li class="">
						<a href="#">서울</a>
						<div>
						</div>
					</li>
					<li class="">
						<a href="#">경기</a>
					</li>
					<li class="">
						<a href="#">인천</a>
					</li>
					<li class="">
						<a href="#">강원</a>
					</li>
					<li class="">
						<a href="#">대전/충정</a>
					</li>
					<li class="">
						<a href="#">대구</a>
					</li>
					<li class="">
						<a href="#">부산/울산</a>
					</li>
					<li class="">
						<a href="#">경상</a>
					</li>
					<li class="">
						<a href="#">광주/전라/제주</a>
					</li>
				</ul>
			</div>
		</div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>