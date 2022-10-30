<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지게시판" name="title"/>
</jsp:include>
 
 
<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">


<style>
	.heart {
		text-decoration: none;
		color:red;
	}
	.attachment-list {
		margin:0;
		padding:0;
		list-style:none;
	}
	
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
</style> 
   
   

<div class="container mt-40 mb-40">
	<div class="row center">
		<h1>공지사항</h1>
	</div>
	
	<div class="row center">
		<table class="table table-slit">
			<tbody>
				<tr>
					<th width="25%">번호</th>
					<td>${noticeDto.noticeNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${noticeDto.noticeTitle}</td>
				</tr>	
			
				<tr height="200" valign="top">
					<th>내용</th>
					<td>
					<!-- pre태그는 엔터가 들어감 -->
						<pre>${noticeDto.noticeContents}</pre>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${noticeDto.noticeRead}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${noticeDto.noticeWriteTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
		
				<c:if test="${noticeDto.noticeUpdateTime != null}">
				<tr>
					<th>수정일</th>
					<td>
						<fmt:formatDate value="${noticeDto.noticeUpdateTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
				</c:if>
				
				<!-- 첨부파일 -->
				
				
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="2" align="right">
						<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
						<c:if test="${admin}">
							<a class="btn btn-positive" href="write">글쓰기</a>
							<a class="btn btn-positive" href="edit?noticeNo=${noticeDto.noticeNo}">수정하기</a>
						</c:if>		
							
						<%-- <a class="btn btn-negative" href="delete?noticeNo=${noticeDto.noticeNo}">삭제하기</a> --%>
						<a class="btn btn-neutral" href="list">목록으로</a>
					</td>
				</tr>
			
			</tfoot>
		</table>		
	</div>
</div>



	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>