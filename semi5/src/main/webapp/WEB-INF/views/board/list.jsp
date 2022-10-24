<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>


<div class="container-900 mt-40 mb-40">
	<div class="row center">
		<h1>자유 게시판</h1>
	</div>

	<a class="btn btn-neutral" href="write">글쓰기</a>
	
<div class="container-900 mt-40 mb-40">
		${list.boardNo}
		${list.boardHead}
		
	
</div>











<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
