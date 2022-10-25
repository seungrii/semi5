<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/user-login-template/loginHeader.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row center">
                <form action="" method="post">
                    <div class="row">
                        이름<input name="userId" type="text">
                    </div>
                    <div class="row">
                        생년월일<input name="userBirth" type="date">
                    </div>
                    <div class="row">
                        전화번호<input name="userTel" type="tel">
                    </div>
                    <div class="row">
                        이메일<input name="userEmail" type="email">
                    </div>
                    <div>
                        <button type="submit">찾기</button>
                    </div>
                </form>
            </div>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>