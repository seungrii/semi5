<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">


<head>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="일반관" name="title"/>
</jsp:include>
<style>
	#p-normal{
		font-size: 23px;
		margin: 30px;
	}
	.btn-theater{
	width: 200px;
	height: 50px;
	font-size: 20px;
		
}
</style>

</head>
<body>

	<div class="container mt-50">
		<div>
			<button class="btn btn-theater"><a href="home">&#60; 상영관 종류 보기</a></button>
		</div>
	
		<div class="container mt-50">
			<h1>일반관</h1>
		</div>
		<div class="container mt-50">
			<img alt="" src="/image/normal.jpeg">
		</div>
		<div class="container mt-50 mb-50">
			<p id="p-normal">2d 일반 영화입니다.</p>
					
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>