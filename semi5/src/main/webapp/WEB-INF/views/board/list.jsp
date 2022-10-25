<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 현재 시간 구하기 -->
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<c:set var="today">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
</c:set>

<!-- 테스트용 데이터 출력 -->
<%-- <h3>${vo}</h3> --%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
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
	
        /*
            Pagination 디자인
            - ul 혹은 ol 을 개조하여 구조를 설계
        */
        ul.pagination {
            list-style: none;
            margin: 0;
            padding: 0;
            font-size: 16px;
            text-align: center;
        }
        ul.pagination > li {
            display: inline-block;
            border: 1px solid transparent;
            padding: 0.5em;
            line-height: 1em;/*글자 표시 높이 설정 */
            min-width: 2em;
            text-align: center;
            cursor: pointer;
        }
        ul.pagination > li.on,
        ul.pagination > li:hover {
            border-color: #b2bec3;
            color: #d63031;
        }
        ul.pagination > li > a {
            display: block;
            width:100%;
            color: inherit;
            text-decoration: none;
        }

        /* 확장 스타일 : 글자 크기를 다르게 하여 다양한 크기 옵션을 제공 */
        ul.pagination.pagination-big {
            font-size: 1.25em;
        }
        ul.pagination.pagination-small {
            font-size: 0.75em;
        }
    </style>

<div class="container-900 mt-40 mb-40">
	<div class="row center">
		<h1>자유 게시판</h1>
	</div>
	
	
	<div class="row center">	
	<table class="table table-border table-hover">
		<thead>
			<td align="right" colspan="5">
				<a href="write">글쓰기</a>
				<a href="/">홈으로</a>
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
	 <div class="center">
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
	<div class="row center">
	<form action="list" method="get">
	 	<select name="type">
			<option value="board_title" <c:if test="${vo.type == 'board_title'}">selected</c:if>>제목</option>
			<option value="board_writer" <c:if test="${vo.type == 'board_writer'}">selected</c:if>>작성자</option>
	 	</select>
	 	
	 	<input type="search" name="keyword" placeholder="검색어" required value="${vo.keyword}">
	 	<button type="submit">검색</button>
	 	
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
