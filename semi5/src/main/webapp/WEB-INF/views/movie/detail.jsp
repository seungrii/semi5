<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${dto.movieNumber}번 영화 정보" name="title"/>
</jsp:include>


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
                <td ><h1>${moviedto.movieName}</h1></td>
                <td >상영여부</td>
                
            </tr>
            <tr>
                
                <td>예매율</td>
                <td>별점</td>
            </tr>
            <tr>
                
                <td>감독:${charaterdto.charaterName}</td>
                <td>배우:${characterdto.charaterName}${characterdto.charaterName3}${characterdto.charaterName4}${characterdto.charaterName5}</td>
            </tr>
            <tr>
                
                <td>장르:${genredto.movieName}</td>
                <td>기본:${moviedto.moviePlayTime}</td>
            </tr>
            <tr>
               
                <td>개봉:${moviedto.openingDate}</td>
                
            </tr>
            <tr>
                 <td><a href="#"><button class="btn btn-neutral" type="submit">예매하기</button></a></td>
            </tr>

          </table>

          <table>
          <tr>
            ${moviedto.movieSummary}
            </tr>
	      </table>
          
      </div>
      

 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>