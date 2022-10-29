<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>
 
 
<link rel="stylesheet" type="text/css" href="/css/semi-commons.css">


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
				url:"/rest/reply/delete",
				method:"post",
				data:{
					replyOrigin:$(this).data("reply-origin"),
					replyNo:$(this).data("reply-no")
				},
				success:function(resp){
					listHandler(resp);
				}
// 				success:listHandler
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

<!-- 자바스크립트 템플릿 생성 -->
<script type="text/template" id="reply-list-header">
	<thead>
		<tr>
			<td colspan="2">
				총 {{size}}개의 댓글이 있습니다.
			</td>
		</tr>
	</thead>
</script>

<script type="text/template" id="reply-list-item">
				<tr class="view">
					<td width="90%">
						<!-- 작성자 -->
						{{memberNick}}
						({{replyWriter}})
						(작성자)
						
						({{memberGrade}}) 
						<br>
						
						<pre>{{replyContent}}</pre>
						
						<br><br>
						{{replyWritetime}}

					</td>
					<th>
						<!-- 수정과 삭제는 현재 사용자가 남긴 댓글에만 표시 -->
						<a style="display:block; margin:10px 0px;" class="edit-btn"><img src="/image/edit.png" width="20" height="20"></a>
						<a style="display:block; margin:10px 0px;" class="delete-btn" data-reply-origin="{{replyOrigin}}" data-reply-no="{{replyNo}}"><img src="/image/delete.png" width="20" height="20"></a>
					</th>
				</tr>	
</script>
    
<div class="container mt-40 mb-40">
	<div class="row center">
		<h1>게시글 보기</h1>
	</div>
	
	<div class="row center">
		<table class="table table-slit">
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
					<th>작성자</th>
					<td>${boardDto.boardWriter}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${boardDto.boardTitle}</td>
				</tr>	
				<tr height="200" valign="top">
					<th>내용</th>
					<td>
					<!-- pre태그는 엔터가 들어감 -->
						<pre>${boardDto.boardContents}</pre>
					</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${boardDto.boardRead}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<fmt:formatDate value="${boardDto.boardWriteTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
		
				<c:if test="${boardDto.boardUpdateTime != null}">
				<tr>
					<th>수정일</th>
					<td>
						<fmt:formatDate value="${boardDto.boardUpdateTime}" pattern="yyyy-MM-dd HH:mm"/>
					</td>
				</tr>
				</c:if>
				
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
						<c:set var="owner" value="${LoginId == boardDto.boardWriter}"></c:set>
						<c:set var="admin" value="${loginGrade == '관리자'}"></c:set>
						
						<c:if test="${owner}">
						<a class="btn btn-negative" href="edit?boardNo=${boardDto.boardNo}">수정하기</a>
						<a class="btn btn-negative" href="delete?boardNo=${boardDto.boardNo}">삭제하기</a>
						</c:if>
						
						<c:if test="${admin}">
						<a class="btn btn-negative" href="delete?boardNo=${boardDto.boardNo}">삭제하기</a>
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
		<thead>
			<tr>
				<td colspan="2">
					총 ${replyList.size()}개의 댓글이 있습니다.
				</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="replyDto" items="${replyList}">
			
			<!-- 사용자에게 보여주는 화면 -->
			<tr class="view">
				<td width="90%">
				<!-- 작성자 -->
					${replyDto.replyWriter}
					<c:if test="${boardDto.boardWriter ==  replyDto.replyWriter}">
					(작성자)
					</c:if>
					
					<!-- 블라인드 여부에 따라 다르게 표시 -->
					<c:choose>
						<c:when test="${replyDto.replyBlind}">
							<pre>블라인드 처리된 게시물입니다</pre>
						</c:when>
						<c:otherwise>
							<pre>${replyDto.replyContent}</pre>
						</c:otherwise>
					</c:choose>
					
					
					<br>
					<fmt:formatDate value="${replyDto.replyWriteTime}" pattern="yyyy-MM-dd HH:mm"/>				
				</td>

				<th>
					<!-- 수정과 삭제는 현재 사용자가 남긴 댓글에만 표시 -->
					<c:if test="${LoginId == replyDto.replyWriter}">
						<a style="display:block; margin:10px 0px;" class="edit-btn">수정</a>
						<a style="display:block; margin:10px 0px;" class="delete-btn" data-reply-origin="${replyDto.replyOrigin}" data-reply-no="${replyDto.replyNo}">삭제</a>
					</c:if>
					
					<c:if test="${admin}">
					<!-- 블라인드 여부에 따라 다르게 표시 -->
					<c:choose>
						<c:when test="${replyDto.replyBlind}">
							<a style="display:block; margin:10px 0px;" href="reply/blind?replyNo=${replyDto.replyNo}&replyOrigin=${replyDto.replyOrigin}">블라인드 해제</a>
						</c:when>
						<c:otherwise>
							<a style="display:block; margin:10px 0px;" href="reply/blind?replyNo=${replyDto.replyNo}&replyOrigin=${replyDto.replyOrigin}">블라인드</a>
						</c:otherwise>
					</c:choose>
							
						</c:if>						
						
				</th>
			</tr>
			
			
			
			<c:if test="${LoginId ==  replyDto.replyWriter}">
				<!-- 수정하기 위한 화면 : 댓글 작성자 본인에게만 출력 -->
				<tr class="editor">
					<th colspan="2">
						<form action="reply/edit" method="post">
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
		<c:choose>
			<c:when test="${LoginId != null}">
				<!-- 댓글 작성 -->
			<form action="reply/write" method="post">
				<input type="hidden" name="replyOrigin" value="${boardDto.boardNo}">
				<table class="table table-slit">
					<tbody>
						<tr>
							<th>
								<textarea class="input w-100 fix-size" name="replyContent" rows="5" cols="55" 
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
				<table class="table table-slit">
					<tbody>
						<tr>
							<th>
								<textarea name="replyContent" rows="5" cols="55" 
									placeholder="로그인 후 댓글 작성이 가능합니다" disabled></textarea>
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

	
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	