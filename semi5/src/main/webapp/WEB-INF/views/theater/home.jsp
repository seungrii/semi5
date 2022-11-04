<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">

<head>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="상영관 메인" name="title"/>
</jsp:include>
<style>
	h1{
		font-size: 40px;
		margin-top:100px;
		margin-bottom: 50px;
	}
	#name{
		font-size: 30px;
	}
	#normal{
		margin-top:10px;
		margin-bottom:50px;
		float: left;
		width:50%;
		height:300px;
	}
	#special{
		margin-top:10px;
		margin-bottom:50px;
		float: right;
		width:50%;
		height:300px;
		
	}
	.bottom-left {
	  position: absolute;
	  bottom: 5px;
	  left: 12px;
	}
</style>

</head>
<body>
	<div class="container mt-50 mt-50">
		<div class="row">
			<h1>상영관 종류 안내</h1>
				<div class="container">
					<div class="container">
						<a href="normal">
						<img id="normal" src="${pageContext.request.contextPath}/image/normal.jpeg">
						</a>
					</div>
					<div class="container">
						<a href="special">
						<img id="special" src="${pageContext.request.contextPath}/image/imax.jpeg"><div class="bottom-left">특별관으로 이동</div>
						</a>
					</div>
					<div class="container" id="name">
						<a href="normal" id="normal">일반관으로 이동</a>
						<a href="special" id="special">특별관으로 이동</a>
					</div>		
					<div class="container">
						<a href="${pageContext.request.contextPath}/">home</a>
					</div>
				</div>
		</div>
	</div>	
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>