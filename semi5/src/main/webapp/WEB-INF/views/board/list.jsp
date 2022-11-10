<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">

<!-- 테스트용 데이터 출력 -->
<%-- <h3>${vo}</h3> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>

<style>
</style>

<div class="container mt-40">
	<div class="row center mt-40 mb-40">
		<h1>자유게시판 💬</h1>
	</div>
	
	
	<div class="row center">	
	<table class="table table-slit">
		<thead>
			<td align="right" colspan="5">
			
			<!-- 회원만 글쓰기 -->
			<c:if test="${LoginId != null}">
				<a href="write">글쓰기</a>
			</c:if>
				<a href="${pageContext.request.contextPath}/">홈으로</a>
			</td>
		
			<tr>
				<th>번호</th>
				<th width="45%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		
		<tbody align="center">
			<c:forEach var="boardDto" items="${list}">
				<tr>
					<td>${boardDto.boardNo}</td>
					<td align="left">
						<!-- 말머리 출력(있을 경우에만) -->
						<c:if test="${boardDto.boardHead != null}">
							[${boardDto.boardHead}]
						</c:if>	

						<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
						<a href="detail?boardNo=${boardDto.boardNo}">
							${boardDto.boardTitle}
						</a>
						
						 <!-- 댓글 개수 출력 -->
						<c:if test="${boardDto.replyCount > 0}">
							[${boardDto.replyCount}]
						</c:if>
					</td>
					<td>${boardDto.boardWriter}</td>
					<td>${boardDto.boardWriteTime}</td>
					<td>${boardDto.boardRead}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		
		
		
		
		</tfoot>
	</table>
</div>	
	
	
	 <!-- 페이지 네비게이터 -->
	 <div class="center mt-40">
		<ul class="pagination">
		
			<!-- 이전 -->
			<c:choose>
				<c:when test="${not vo.isFirst()}">
					<li><a href="list?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&laquo;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${vo.hasPrev()}">
					<li><a href="list?p=${vo.prevBlock()}&${vo.parameter()}">&lt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&lt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- 숫자 -->
			<c:forEach var="i" begin="${vo.startBlock()}" end="${vo.endBlock()}" step="1">
				<c:choose>
					<c:when test="${vo.p == i}">
						<li class="on"><a href="#">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="list?p=${i}&${vo.parameter()}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<!-- 다음을 누르면 다음 구간의 첫 페이지로 안내 -->
			<c:choose>
				<c:when test="${vo.hasNext()}">
					<li><a href="list?p=${vo.nextBlock()}&${vo.parameter()}">&gt;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&gt;</a></li>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${not vo.isLast()}">
					<li><a href="list?p=${vo.lastBlock()}&${vo.parameter()}">&raquo;</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="#">&raquo;</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	 
	 
	 <!-- 검색 -->
	<div class="row center mt-20">
	<form action="list" method="get">
		<input type="hidden" name="size" value="${vo.size}">
		<select class="input input-line" name="type" required>
			<option value="board_title" <c:if test="${vo.type == 'board_title'}">selected</c:if>>제목</option>
			<option value="board_writer" <c:if test="${vo.type == 'board_writer'}">selected</c:if>>작성자</option>
	 	</select>
	 	
		<input class="input input-line" type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
		<button class="btn btn-positive" type="submit">검색</button>
	 	
	 </form>
	</div>	 
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>