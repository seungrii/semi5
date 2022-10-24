<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include> --%>
    
<div class="container-800 mt-40 mb-40">
	<div class="row center">
		<h1>게시글 보기</h1>
	</div>
	
<div class="row center">
		<table class="table table-border">
			<tbody>
				<tr>
					<th width="25%">번호</th>
					<td>${boardDto.boardNo}</td>
				</tr>
				<tr>
					<th>말머리</th>
					<td>${boardDto.boardHead}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${boardDto.boardTitle}</td>
				</tr>	
				<tr>
					<th>작성자</th>
					<td>${boardDto.boardWriter}</td>
				</tr>
				<tr height="200" valign="top">
					<th>내용</th>
					<td>
						${boardDto.boardContents}
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${boardDto.boardRead}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${boardDto.boardWriteTime}" pattern="y년 M월 d일 E요일 a h시 m분 s초"/>
					</td>
				</tr>
		
				<c:if test="${boardDto.boardUpdateTime != null}">
				<tr>
					<th>수정일</th>
					<td>
						<fmt:formatDate value="${boardDto.boardUpdateTime}" pattern="y년 M월 d일 E요일 a h시 m분 s초"/>
					</td>
				</tr>
				</c:if>
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="2" align="right">
						
						<c:if test="${loginId != null}">
						<a class="btn btn-positive" href="write">글쓰기</a>
						<a class="btn btn-positive" href="write?boardParent=${dto.boardNo}">답글쓰기</a>
						</c:if>
						
						<%--
							관리자는 삭제만, 회원은 자신의 글만 수정/삭제 가능하도록 처리
						 --%>
						<c:set var="owner" value="${LoginId == boardDto.boardWriter}"></c:set>
						<c:set var="admin" value="${mg == '관리자'}"></c:set>
						
						<c:if test="${owner}">
						<a class="btn btn-negative" href="edit?boardNo=${boardDto.boardNo}">수정하기</a>
						<a class="btn btn-negative" href="delete?boardNo=${boardDto.boardNo}">삭제하기</a>
						</c:if>
						
						<c:if test="${admin}">
						<a class="btn btn-negative" href="delete?boardNo=${dto.boardNo}">삭제하기</a>
						</c:if>
						
						<a class="btn btn-neutral" href="list">목록으로</a>
					</td>
				</tr>
			
			</tfoot>
		</table>		
	</div>
	
	<div class="row">
						<h2>상태창</h2>	
					</div>
					<div class="row">
					loginId : ${sessionScope.LoginId}
					</div>
					<div class="row">
						로그인 : ${sessionScope.LoginId != null}
					</div>
					<div class="row">
						mg : ${sessionScope.ug}
					</div>
					<div class="row">
						관리자 : ${sessionScope.ug == '관리자'}
					</div>