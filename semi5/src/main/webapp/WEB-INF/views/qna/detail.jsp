<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="문의 게시판" name="title"/>
</jsp:include>
 
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">


<style>
	
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
//댓글 등록 처리
$(function(){
	$(".reply-insert-form").submit(function(e){
		//기본 이벤트를 차단한다(form을 사용하지 않을 예정)
		e.preventDefault();
		
		//댓글 입력값을 가져와서 검사 후 전송
		var text = $(this).find("[name=replyContent]").val();
		if(!text){
			alert("내용을 작성해주세요");
			return;
		}
		
		var form = this;
		
		//정상적으로 입력되었다면 비동기 통신으로 등록 요청
		$.ajax({
			url:"http://localhost:8888/rest/reply/insert",
			method:"post",
			//data:{
			//	replyOrigin:$(this).find("[name=replyOrigin]").val(),
			//	replyContent:text
			//},
			data:$(form).serialize(),//form을 전송 가능한 형태의 문자로 변환한다
			success:function(resp){
				listHandler(resp);
				
				//입력창 초기화(= 폼 초기화) - 자바스크립트로 처리
				form.reset();
			}
		});
	});
	
	//댓글 삭제버튼을 누르면 삭제 후 목록 갱신
	$(".delete-btn").click(deleteHandler);
	
	function deleteHandler(e){
		e.preventDefault();
		
		console.log(this);
		
		$.ajax({
			url:${pageContext.request.contextPath}+"/rest/reply/delete",
			method:"post",
			data:{
				replyOrigin:$(this).data("reply-origin"),
				replyNo:$(this).data("reply-no")
			},
			success:function(resp){
				listHandler(resp);
			}
//				success:listHandler
		});
	}
	function listHandler(resp){
		//원래 있던 댓글 삭제
		$(".table-reply-list").empty();//태그는 유지하고 내부를 삭제
		
		//헤더 생성
		var header = $("#reply-list-header").text();
		header = header.replace("{{size}}", resp.length);
		$(".table-reply-list").append(header);
		
		//바디 생성
		$(".table-reply-list").append("<tbody>");
		
		//현재 resp는 배열이다.
		//미리 댓글 형식을 만들어두고 값만 바꿔치기해서 댓글 목록에 추가하도록 구현
		for(var i=0; i < resp.length; i++){
			//console.log(resp[i]);
			var item = $("#reply-list-item").text();
			item = item.replace("{{memberNick}}", resp[i].memberNick);
			item = item.replace("{{replyWriter}}", resp[i].replyWriter);
			item = item.replace("{{memberGrade}}", resp[i].memberGrade);
			item = item.replace("{{replyContent}}", resp[i].replyContent);
			item = item.replace("{{replyWritetime}}", resp[i].replyWritetime);
			item = item.replace("{{replyNo}}", resp[i].replyNo);
			item = item.replace("{{replyOrigin}}", resp[i].replyOrigin);
			var result  = $(item);
			result.find(".delete-btn").click(deleteHandler);//개별 추가
			console.log("result", result.find(".delete-btn"));
			$(".table-reply-list").children("tbody").append(result);
		}
		
	}
});
</script>
    
<div class="container mt-40 mb-40">
	<div class="row center">
		<h1>문의글 보기</h1>
	</div>
	
	<div class="row center">
		<table class="table table-border">
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
		<table class="table table-border table-hover table-reply-list">
		<!-- 댓글 목록 -->
		<tbody>
			<tr class="view">
				<!-- 사용자에게 보여주는 화면 -->
				<td width="90%">
					<!-- 작성자 -->
					${qnaDto.adminId}
					<br><br>
					<pre>${qnaDto.qnaAnswer}</pre>					
					<br><br>
					<fmt:formatDate value="${qnaDto.qnaAnswerTime}" pattern="yyyy-MM-dd HH:mm"/>				
				</td>
				
			</tr>
		</tbody>
	</table>
</div>






<div class="row center">
		<%-- 회원일 경우와 아닐 경우 댓글 작성창이 다르게 보이도록 처리 --%>
			<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
		<c:choose>
			<c:when test="${admin}">
				<!-- 댓글 작성 -->
				<form action="qnaReply/write" method="post">
				<!-- <form class="reply-insert-form"> -->
				<input type="hidden" name="qnaNo" value="${qnaDto.qnaNo}">
				<table class="table table-border">
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
	