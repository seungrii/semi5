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

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="문의 게시판" name="title"/>
</jsp:include>

<style>
	.table {
            border-collapse: collapse;/*테두리 병합*/
            width:100%;
            font-size: 16px;
        }
        /* 
            방법 1 : .table 안에 있는 모든 th와 모든 td를 선택(후손선택자) 
            - 내부에 있는 모든 요소를 선택하므로 테이블이 중첩되는 경우 문제가 발생
        */
        .table th, 
        .table td {
            /* border: 1px solid black; */
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

        /* 확장스타일 : 테두리가 있는 테이블 */
        .table.table-border {
            border:1px solid gray;
        }
        .table.table-border > thead > tr > th,
        .table.table-border > thead > tr > td,
        .table.table-border > tbody > tr > th,
        .table.table-border > tbody > tr > td,
        .table.table-border > tfoot > tr > th,
        .table.table-border > tfoot > tr > td {  
            border: 1px solid gray;
        }

        /* 확장 스타일 : 줄무늬 테이블*/
        .table.table-stripe > thead > tr,
        .table.table-stripe > tbody > tr:nth-child(2n)
        {
            background-color: #dfe6e9;
        }

        /* 확장 스타일 : 마우스에 반응하는 테이블*/
        .table.table-hover > thead > tr:hover,
        .table.table-hover > tbody > tr:hover,
        .table.table-hover > tfoot > tr:hover {
            background-color: #dfe6e9;
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
		color:red;
	}
</style>

<div class="container mt-40 mb-40">
	<div class="row center mt-40 mb-40">
		<h1>문의 게시판</h1>
	</div>
	
	
	<c:if test="${LoginId != null}">
	<div class="row right">
		<a class="btn btn-neutral" href="write">글쓰기</a>
	</div>
	</c:if>
	
	<div class="row center">
		<table class="table table-slit">
			<thead>
				<tr>
					<th>번호</th>
					<th width="45%">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="qnaDto" items="${list}">
				<tr>
					<td>${qnaDto.qnaNo}</td>
					<td align="left">
						<!-- 제목을 누르면 상세 페이지로 이동하도록 처리 -->
						<a href="detail?qnaNo=${qnaDto.qnaNo}">
							${qnaDto.qnaTitle}
					</td>
					<td>${qnaDto.qnaWriter}</td>
					<td>
						<c:set var="current">
							<fmt:formatDate value="${qnaDto.qnaWriteTime}" pattern="yyyy-MM-dd"/>
						</c:set>
						<c:choose>
							<c:when test="${today == current}">
								<fmt:formatDate value="${qnaDto.qnaWriteTime}" 
															pattern="HH:mm"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${qnaDto.qnaWriteTime}" 
															pattern="yyyy-MM-dd"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${qnaDto.qnaRead}</td>
				</tr>
				</c:forEach>
			</tbody>
 		</table>
	</div>
	
	<c:if test="${loginId != null}">
	<div class="row right">
		<%-- 관리자일 경우만 삭제버튼을 추가 --%>
		<c:if test="${mg == '관리자'}">
			<button type="submit" class="btn btn-negative">삭제</button>
		</c:if>
		<a class="btn btn-neutral" href="write">글쓰기</a>
	</div>
	</c:if>
	
	<%-- 관리자일 경우만 form을 추가 --%>
	<c:if test="${mg == '관리자'}">
	</form>
	</c:if>
	
	<div class="row center">
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
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="list" method="get">
			<input type="hidden" name="size" value="${vo.size}">
			<select class="input" name="type" required>
				<option value="board_title" <c:if test="${vo.type == 'board_title'}">selected</c:if>>제목</option>
				<option value="board_writer" <c:if test="${vo.type == 'board_writer'}">selected</c:if>>작성자</option>
			</select>
			
			<input class="input" type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
			
			<button class="btn btn-positive" type="submit">검색</button>
		</form>
	</div>
</div>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





