<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 입력</title>
</head>
<body>
<h1>영화 정보 입력</h1>
<form action="insert" method="post">
<%--순위,예매율,별점,상영여부는 따로 받아옴 --%>

영화이름<input name="movieName" type="text"required><br><br>

개봉일<input name="openingDate" type="date"required><br><br>
상영종료일<input name="screeningEnd" type="date"required><br><br>
줄거리<input name="movieSummary" type="text"required><br><br>
연령등급 <input name="movieAgeLimit" type="number"required><br><br>
재생시간 <input name="moviePlayTime" type="number"required><br><br>

<%--영화포스터! --%>
감독<input name="charaterName" type="text"required><br><br>
배우<input name="charaterName" type="text"required><br><br>
배우<input name="charaterName" type="text"><br><br>
배우<input name="charaterName" type="text"><br><br>
배우<input name="charaterName" type="text"><br><br>
장르<input name="genreName" type="text" required><br><br>
<%--
파일 이름 <input name="FileName" type="text"required><br><br>
파일 타입<input name="FileType" type="text"required><br><br>
파일 사이즈<input name="FileSize" type="text"required><br><br>
저장 시간<input name="FileTime" type="date"required><br><br>
--%>
<%-- 장르--%>


<button input type="submit" value="전송" >등록</button>
</body>
</html>