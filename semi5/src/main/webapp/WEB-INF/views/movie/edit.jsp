<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 수정</title>
</head>
<body>
<form action="edit" method="post">
<input type="hidden" name="movieNumber" required value="${dto.movieNumber}"><br><br>
영화이름<input type="text" name="movieName" required value="${dto.movieName}"><br><br>
개봉일<input type="date" name="openingDate" required value="${dto.openingDate}"><br><br>
상영종료일<input type="date" name="screeningEnd" required value="${dto.screeningEnd}"><br><br>
줄거리<input type="text" name="movieSummary"required value="${dto.movieSummary}"><br><br>
연령등급<input type="number" name="movieAgeLimit"required value="${dto.movieAgeLimit}"><br><br>
재생시간<input type="number" name="moviePlayTime"required value="${dto.moviePlayTime}"><br><br>
<button type="submit">수정하기</button>

</form>

</body>
</html>