<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.movieNumber}번 영화</title>
</head>
<body>
<div align="center">
	<h1>${dto.movieNumber}번 영화 보기</h1>
</div>
<div class="row center">
<table border="1" width="400">
<tbody>
	<tr>
		<th width="25%">영화이름</th>
		<td>${dto.movieName}</td>
	</tr>
	<tr>
		<th width="25%">개봉일</th>
		<td>${dto.openingDate}</td>
	</tr>
	<tr>
		<th width="25%">상영종료일</th>
		<td>${dto.screeningEnd}</td>
	</tr>
	<tr height="250" valign="top">
		<th>줄거리</th>
		<td>${dto.movieSummary}</td>
	</tr>
	<tr>
		<th width="25%">연령등급</th>
		<td>${dto.movieAgeLimit}</td>
	</tr>
	<tr>
		<th width="25%">재생시간</th>
		<td>${dto.moviePlayTime}</td>
	</tr>
	
</tbody>
</table>
<h2><a href="list">목록보기</a></h2>
<h2><a href="insert">영화정보 넣기</a></h2>
<h2><a href="edit?movieNumber=${dto.movieNumber}">수정하기</a></h2>









</div>

</body>
</html>