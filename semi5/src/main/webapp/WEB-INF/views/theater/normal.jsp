<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">


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
	float: left;
	margin-left: 100px;
	margin-bottom: 100px;
	}
	h1{
	display: inline;
	}
	.img{
		margin-top: 50px;
	}
</style>

</head>
<body>

	<div class="container mt-50">
		<div>
			<button class="btn btn-theater"><a href="home">&#60; 상영관 종류 보기</a></button>
		</div>
		<div class="container img">
			<img alt="" src="${pageContext.request.contextPath}/image/normal.jpeg">
		</div>
		<div class="container mt-50 mb-50">
			<p id="p-normal">일반관</p>
			<p id="p-normal">2d 일반 영화 상영관입니다.</p>
					
		</div>
		
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>