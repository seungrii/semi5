<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관리자메뉴 사이드바 -->
       <aside class="sidebar-css">
          <div class="container-150">
             <%-- <div class="row">
                <h2>상태창</h2>
             </div>
             <div class="row">
                login : ${sessionScope.LoginId}
             </div>
             <div class="row">
                admin : ${sessionScope.loginGrade}
             </div> --%>
             <div class="row">
                <h2>관리자메뉴</h2>
             </div>
              <div class="row">
                <a href="${pageContext.request.contextPath}/admin/adminList">관리자 계정</a>
              </div>
              <div class="row">
                 <a href="${pageContext.request.contextPath}/admin/userList">회원 정보</a>
              </div>
              <div class="row">
                 <a href="${pageContext.request.contextPath}/admin/cinemaList">지점 관리</a>
              </div>
              <div class="row">
                 <a href="${pageContext.request.contextPath}/admin/movieList">영화정보 관리</a>
              </div>
              <div class="row">
                 <a href="${pageContext.request.contextPath}/admin/moviePlayList">상영스케쥴 관리</a>
              </div>
                <div class="row">
                 <a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
              </div>
               <div class="row">
                 <a href="${pageContext.request.contextPath}/qna/list">문의게시판</a>
              </div>
              <div class="row">
                 <a href="${pageContext.request.contextPath}/admin/askingList">1:1 문의내역</a>
            	</div>
          </div>
       </aside>