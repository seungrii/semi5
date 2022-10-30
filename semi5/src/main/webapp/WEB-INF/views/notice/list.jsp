<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>


<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">

<!-- 테스트용 데이터 출력 -->
<%-- <h3>${vo}</h3> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지사항 게시판" name="title"/>
</jsp:include>

    <style>
    .table {
            border-collapse: collapse;/*테두리 병합*/
            width:100%;
            font-size: 16px;
        }
        /* 방법 2 : .table 부터 시작하는 모든 경로를 제시하여 th와 td를 선택(자식선택자) */
        .table > thead > tr > th,
        .table > thead > tr > td,
        .table > tbody > tr > th,
        .table > tbody > tr > td,
        .table > tfoot > tr > th,
        .table > tfoot > tr > td {  
            padding:0.5em;
        }
        /* 확장스타일 : 옆트임 테이블 */
        .table.table-slit {
            border: 3px solid gray;
            border-left: none;
            border-right: none;
        }
        .table.table-slit > thead {
            border-bottom: 2px solid gray;
        }
        .table.table-slit > tfoot {
            border-top: 2px solid gray;
        }
    
	.table a {
		text-decoration: none;
		color:black;
	}
	.table a:hover {
		color:gray;
	}
    </style>

<div class="container mt-40">
	<div class="row center mt-40 mb-40">
		<h1>공지사항 💬</h1>
	</div>
	
	
	<div class="row center">	
	<table class="table table-slit">
		<thead>
			<td align="right" colspan="5">
				<a href="/">홈으로</a>
				
				<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
				<c:if test="${admin}">
				<a href="write">글쓰기</a>
				</c:if>
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
			<c:forEach var="noticeDto" items="${list}">
				<tr>
					<td>${noticeDto.noticeNo}</td>
					<td align="left">
						<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
						<a href="detail?noticeNo=${noticeDto.noticeNo}">
							${noticeDto.noticeTitle}
						</a>
					</td>
					<td>${noticeDto.adminId}</td>
					<td>${noticeDto.noticeWriteTime}</td>
					<td>${noticeDto.noticeRead}</td>
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
		<select class="input" name="type" required>
			<option value="notice_title" <c:if test="${vo.type == 'board_title'}">selected</c:if>>제목</option>
			<option value="notice_contents" <c:if test="${vo.type == 'board_contents'}">selected</c:if>>내</option>
	 	</select>
	 	
		<input class="input" type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
		<button class="btn btn-positive" type="submit">검색</button>
	 	
	 </form>
	</div>	 
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
