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
<form action="insert"method="post">
<%--순위,예매율,별점,상영여부는 따로 받아옴 --%>
영화포스터
영화이름<input name="movieName" type="text"required><br><br>

개봉일<input name="openingDate" type="date"required><br><br>
상영종료일<input name="screeningEnd" type="date"required><br><br>
줄거리<input name="movieSummary" type="text"required><br><br>
연령등급 <input name="movieAgeLimit" type="number"required><br><br>
재생시간 <input name="moviePlayTime" type="number"required><br><br>

영화포스터
감독
배우
장르


<button input type="submit" value="전송" >등록</button>
</body>
</html>