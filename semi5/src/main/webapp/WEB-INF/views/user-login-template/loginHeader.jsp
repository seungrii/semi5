<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
		<c:choose>
			<c:when test="${param.title != null}">
				${param.title}
			</c:when>
			<c:otherwise>
				VIC
			</c:otherwise>
		</c:choose>
	</title>

    <!-- 글꼴 Noto Sans Korean -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- css파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-commons.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/semi-layout.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userChange.css">
    <!-- <link rel="stylesheet" type="text/css" href="/css/login.css">  login.css 어디..? -->


    <!-- 폰트어썸 -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <!-- jquery 사용 위한 라이브러리 파일 불러옴 -->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

    <!-- js 파일 -->
    <script src="${pageContext.request.contextPath}/js/navigator.js"></script>
    <script src="${pageContext.request.contextPath}/js/idfind.js"></script>
    <script src="${pageContext.request.contextPath}/js/findMessage.js"></script>
    <script type="text/javascript">

        
    </script>
</head>
<body>
    <!-- HTML 화면 -->
    <main>
    <header>
        <!-- 헤더 영역 -->
        <div class="flex-container">
            <div class="left">
                <a href="${pageContext.request.contextPath}/" id="logo">
                    <img id="logo" src="${pageContext.request.contextPath}/image/logo.png">
                </a>
            </div>
            <div class="right header-menu">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/login">
                            <i class="fa-solid fa-arrow-right-to-bracket"></i>
                            <span>로그인</span>
                        </a>
                	</li>
                	<li>
                        <a href="${pageContext.request.contextPath}/user/join">
                            <i class="fa-solid fa-user-plus"></i>
                            <span>회원가입</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/user/mypage">
                            <i class="fa-solid fa-gear"></i>
                            <span>마이페이지</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <nav>
        <div class="container">
            <div class="nav-title-box">
                <ul class="nav-title">
                    <a href="${pageContext.request.contextPath}/">
                        <li>
                            <img id="nav-logo" src="${pageContext.request.contextPath}/image/logo.png">
                        </li>
                    </a>
                    <a href="${pageContext.request.contextPath}/movie/list">
                        <li>영화</li>
                    </a>
                    <a href="${pageContext.request.contextPath}/advance/list">
                        <li>예매</li>
                    </a>
                    <a href="${pageContext.request.contextPath}/theater/home">
                        <li>극장</li>
                    </a>
                    <a href="${pageContext.request.contextPath}/notice/list">
                        <li>커뮤니티</li>
                    </a>
                    <li>
                    	<form action="keywordSearch">
    	                	<input name="movieName" class="input search-input-keyword">
	                    	<button type="submit" class="btn btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                    	</form>
                	</li>
                </ul>
            </div>
            <!-- 네이게이터 영역 -->
            <div class="nav-list-box">
                <div>
                    <ul class="nav-list">
                        <li>
                            <ul>
                                <a href="${pageContext.request.contextPath}/movie/list">
                                    <li>영화</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/movie/list">
                                    <li>무비차트</li>
                                </a>
                            </ul>
                        </li>
                        <li>
                            <ul>
                                <a href="${pageContext.request.contextPath}/advance/list">
                                    <li>예매</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/advance/list">
                                    <li>예매하기</li>
                                </a>
                            </ul>
                        </li>
                        <li>
                            <ul>
                                <a href="${pageContext.request.contextPath}/theater/home">
                                    <li>극장</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/theater/home">
                                    <li>상영관 종류</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/cinema/home">
                                    <li>지점 안내</li>
                                </a>
                            </ul>
                        </li>
                        <li>
                            <ul>
                                <a href="${pageContext.request.contextPath}/notice/list">
                                    <li>공지사항</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/qna/list">
                                    <li>문의게시판</li>
                                </a>
                                <a href="${pageContext.request.contextPath}/board/list">
                                    <li>자유게시판</li>
                                </a>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <div>