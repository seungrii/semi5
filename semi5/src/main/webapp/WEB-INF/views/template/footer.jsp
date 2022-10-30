<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
    <footer class="container">
        <!-- 풋터 영역 -->
        
<div class="left">	
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
		loginGrade : ${sessionScope.loginGrade}
	</div>
	<div class="row">
		관리자 : ${sessionScope.loginGrade == '관리자'}
	</div>
</div>
        
        
        
        
        
        
        
        <ul class="policy-list">
            <li>
                <a href="#">이용약관</a>
            </li>
            <li>
                <a href="#">편성기준</a>
            </li>
            <li>
                <a href="#">개인정보처리방침</a>
            </li>
            <li>
                <a href="#">법적고지</a>
            </li>
            <li>
                <a href="#">이메일주소무단수집거부</a>
            </li>
            <li>
                <a href="#">윤리경영</a>
            </li>
        </ul>
        
        <div class="info">
            <p style="margin-bottom: 2px;">주소: 서울 영등포구 선유동 2로 57, 이레빌딩 19층 C-class</p>
                <p style="margin-bottom: 2px;">호스팅사업자: Victory&nbsp&nbsp&nbsp대표 이메일: Victory@kh.co.kr&nbsp&nbsp&nbsp고객센터: 555-5959-5959</p>
                <p style="margin-bottom: 2px;">© CJ CGV. All Rights Reserved</p>
        </div>
    </footer>
    </main>
</body>
</html>