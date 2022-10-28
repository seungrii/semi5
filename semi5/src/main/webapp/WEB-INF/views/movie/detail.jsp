<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="영화정보" name="title"/>
</jsp:include>


<title>${dto.movieNumber}번 영화 정보</title>
<style>

	.container-980 { width:980px; margin:0 auto; }
    .container-450 { width:450px; margin:0 auto; }
    
    .btn {
    border: none;
    font-size: 14px;
    font-weight: 600;
    padding: 0.4em 0.75em 0.4em 0.75em;/*글자 크기의 0.75배*/
    cursor: pointer;
    /* a 태그를 버튼으로 만들기 위해 추가 */
    display: inline-block;
    text-align: center;
    text-decoration: none;
    border-radius: 20px;
    }

    .btn.btn-neutral {
    background-color: #6FB8FB;
    color: white;
    }



 
      .image{
    
 
      width: 200px; 
      height: 280px; 

     background-color: aqua;
     margin-right:25px;
     
    }
	 .whole {
        margin-top: 70px;
    }
    
    .whole, .whole td, .whole th {
        vertical-align: middle;
    }
    .content{
        margin-top: 90px;
        
    }
    
</style>

   <div class="container-980">
        <table class="whole">
         
        
            <tr>
                <td rowspan="6" ><a href="#"><img src="./image/insta.png" class="image"></a> </td>
                <td ><h1>${dto.movieName}</h1></td>
                <td >상영여부</td>
                
            </tr>
            <tr>
                
                <td>예매율</td>
                <td>별점</td>
            </tr>
            <tr>
                
                <td>감독:${dto.charaterName1}</td>
                <td>배우:${dto.charaterName2},${dto.charaterName3},${dto.charaterName4},${dto.charaterName5}</td>
            </tr>
            <tr>
                
                <td>장르:${dto.movieName}</td>
                <td>기본:${dto.moviePlayTime}</td>
            </tr>
            <tr>
               
                <td>개봉:${dto.openingDate}</td>
                
            </tr>
            <tr>
                 <td><a href="#"><button class="btn btn-neutral" type="submit">예매하기</button></a></td>
            </tr>

          </table>

          <p class="content">
            “부서진 차… 손에 묻은 피… 권총 한 자루… 내가 왜 여기에 있는 거지?”
            뇌종양 말기, 80대 알츠하이머 환자인 한필주. 일제강점기 때 친일파들에게 가족을 모두 잃었다.
            아내가 세상을 떠나자 필주는 60여 년을 계획해 온 복수를 감행하려고 한다.
            그는 알바 중인 패밀리 레스토랑에서 절친이 된 20대 알바생 인규에게
            일주일만 운전을 도와 달라 부탁한다.
            
            “원래 이런 사람이었어요? 정체가 뭐예요 도대체?! 같이 접시 닦던 사람 맞아요?”
            이유도 모른 채 필주를 따라나선 인규는 첫 복수 현장의 CCTV에 노출되어 유력 용의자로 지목된다.
            경찰은 수사망을 좁혀오고 사라져가는 기억과 싸우며 필주는 복수를 이어가는데…
            
            60년의 계획, 복수를 위한 위험한 동행이 시작된다!


          </p>
      </div>
      

 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
