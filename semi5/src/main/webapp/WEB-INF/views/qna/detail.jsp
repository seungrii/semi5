<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="문의 게시판" name="title"/>
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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(function(){
	//목표 : 
	//1. edit-btn을 누르면 view를 숨기고 editor를 보여준다
	//2. cancel-btn을 누르면 editor를 숨기고 view를 보여준다
	//3. 처음에는 view만 보여준다
	//1
	$(".edit-btn").click(function(){
		$(this).parents(".view").hide();
		$(this).parents(".view").next(".editor").show();
	});
	//2
	$(".cancel-btn").click(function(){
		$(this).parents(".editor").hide();
		$(this).parents(".editor").prev(".view").show();
	});
	//3
	$(".editor").hide();
});

</script>
    
<div class="container mt-40 mb-40">
	<div class="row center">
		<h1>문의글 보기</h1>
	</div>
	
	<div class="row center">
		<table class="table table-slit">
			<tbody>
				<tr>
					<th width="25%">번호</th>
					<td>${qnaDto.qnaNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${qnaDto.qnaTitle}</td>
				</tr>	
				<tr>
					<th>작성자</th>
					<td>${qnaDto.qnaWriter}</td>
				</tr>
				<tr height="200" valign="top">
					<th>내용</th>
					<td>
					<!-- pre태그는 엔터가 들어감 -->
						<pre>${qnaDto.qnaContents}</pre>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${qnaDto.qnaRead}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${qnaDto.qnaWriteTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
		
				
				
				<!-- 첨부파일 -->
				
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan="2" align="right">
					
						<c:if test="${LoginId != null}">
						<a class="btn btn-positive" href="write">글쓰기</a>
						</c:if>
						
						<%--
							관리자는 삭제만, 회원은 자신의 글만 수정/삭제 가능하도록 처리
						 --%>
						<c:set var="owner" value="${LoginId == qnaDto.qnaWriter}"></c:set>
						<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
						
						<c:if test="${owner}">
						<a class="btn btn-negative" href="edit?qnaNo=${qnaDto.qnaNo}">수정하기</a>
						<a class="btn btn-negative" href="delete?qnaNo=${qnaDto.qnaNo}">삭제하기</a>
						</c:if>
						
						<c:if test="${admin}">
						<a class="btn btn-negative" href="delete?qnaNo=${qnaDto.qnaNo}">삭제하기</a>
						</c:if>
						
						<a class="btn btn-neutral" href="list">목록으로</a>
					</td>
				</tr>
			</tfoot>
		</table>		
	</div>
	
	<div class="row left">
		<table class="table table-slit table-hover table-reply-list">
		<!-- 댓글 목록 -->
		

		
		<tbody>
			<c:forEach var="qnaDto" items="${qnaAnswerList}">
			
			<!-- 사용자에게 보여주는 화면 -->
			<tr class="view">
				<td width="90%">
				<!-- 작성자 -->
					${qnaDto.adminId}
					<c:if test="${qnaDto.adminId ==  adminDto.adminId}">
						(작성자)
					</c:if>
					<!-- 회원등급은 자유게시판에 안씀 위화감 조성ㅋ -->
					<br>
					
					
					
					<br><br>
					<fmt:formatDate value="${qnaDto.qnaWriteTime}" pattern="yyyy-MM-dd HH:mm"/>				
				</td>


				<th>
					<!-- 수정과 삭제는 현재 사용자가 남긴 댓글에만 표시 -->
						<c:if test="${LoginId == qnaDto.adminId}">
							<a style="display:block; margin:10px 0px;" class="edit-btn">수정</a>
							<a style="display:block; margin:10px 0px;" class="delete-btn" data-reply-origin="${qnaDto.qnaNo}" data-reply-no="${qnaDto.qnaNo}">삭제</a>
						</c:if>
					
					<c:if test="${admin}">
							<!-- 블라인드 여부에 따라 다르게 표시 -->
							<c:choose>
								<c:when test="${replyDto.replyBlind}">
									<a style="display:block; margin:10px 0px;" href="reply/blind?replyNo=${replyDto.replyNo}&replyOrigin=${replyDto.replyOrigin}">블</a>
								</c:when>
								<c:otherwise>
									<a style="display:block; margin:10px 0px;" href="reply/blind?replyNo=${replyDto.replyNo}&replyOrigin=${replyDto.replyOrigin}">블</a>
								</c:otherwise>
							</c:choose>
							
					</c:if>
				</th>
			</tr>
			
			
			
			<c:if test="${LoginId ==  replyDto.replyWriter}">
				<!-- 수정하기 위한 화면 : 댓글 작성자 본인에게만 출력 -->
				<tr class="editor">
					<th colspan="2">
						<form action="qnaReply/write" method="post">
							<input type="hidden" name="replyNo" 
														value="${replyDto.replyNo}">
							<input type="hidden" name="replyOrigin"
														value="${replyDto.replyOrigin}">
							<textarea name="replyContent" rows="5" cols="50" 
									required>${replyDto.replyContent}</textarea>
							<button type="submit">변경</button>
							<a class="cancel-btn">취소</a>
						</form>
					</th>
				</tr>
			</c:if>
				
				
				
			</c:forEach>
		</tbody>
	</table>
</div>






<div class="row center">
		<%-- 회원일 경우와 아닐 경우 댓글 작성창이 다르게 보이도록 처리 --%>
			<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
		<c:choose>
			<c:when test="${admin}">
				<!-- 댓글 작성 -->
				<form action="/qna/reply/write" method="post">
				<!-- <form class="reply-insert-form"> -->
				<input type="hidden" name="qnaNo" value="${qnaDto.qnaNo}">
				<table class="table table-slit">
					<tbody>

						<tr>
							<th>
								<textarea class="input w-100 fix-size" name="qnaAnswer" rows="5" cols="55" 
												placeholder="댓글 작성.." required></textarea>
							</th>
							<th valign="bottom">
								<button class="btn btn-positive" type="submit">등록</button>
							</th>
						</tr>
					</tbody>
				</table>
				</form>
			</c:when>
			
			
			<c:otherwise>
				<table class="table">
					<tbody>
						<tr>
							<th>
								<textarea class="input input-line" name="qnaAnswer" rows="5" cols="55" 
									placeholder="관리자만 댓글 작성이 가능합니다" disabled></textarea>
							</th>
							<th>
								<button type="submit" disabled>등록</button>
							</th>
						</tr>
					</tbody>
				</table>
			
			</c:otherwise>
		</c:choose>
</div>
</div>
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	