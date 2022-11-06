<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
      .container-980 { width:980px; margin:0 auto; }
     .select{
        float:right;
        margin-right: 10px;
     }
     .table{
        width:980px;
        height:auto;
     }
     /* .box{
        display: block;
     } */
     
     .image{
     float: left;  
     display: inline-block; 
     width: 200px;
     height: 280px;
     /* margin: 0px 45px 0px 0px; */
     /* margin: 80px 22.5px 0px 22.5px;  */
     
     box-sizing: border-box;
     background-color: aqua;
     /* margin-bottom: 70px; */
     
    
     } 
    
     /* height를 20px뻄 */

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
    margin-bottom: 10px;
}

    .btn.btn-neutral {
    background-color: #6FB8FB;
    color: white;
     }
     .ranking{
       
        text-align: center;
       margin-bottom: 0px;
       height:20px
      
        
     }
      .big{
        width:980px;
        margin-top: 70px;
        

     } 
     ul{
     list-style:none;
     /* margin-top: 0px;
     margin-left:0px; */
      }
       .content{
        vertical-align: top;
        line-height: 1.5em;
        float:left;
        
      }  
      .small{
      margin-right:14px;
      display:inline-block;
      margin-top:70px;
     
      }
      
 
      /* .trs{
        padding-bottom: 10px;
        
      } */
   


    
     </style>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="자유 게시판" name="title"/>
</jsp:include>
	<section class="w-980">
		<div class="row left mt-50">
			<h1>영화 통합검색</h1>
		</div>
        <hr>
		<c:choose>
			<c:when test="${movieDto != null}">
		        <div class="center mb-50">   
				<c:forEach var="movieDto" items="${movieDto}" varStatus="status">
		            <table class="small center" >
		                <tr>
		                    <td>
		                    	<c:choose>
									<c:when test="${!attachments.isEmpty()}">
										<a href="${pageContext.request.contextPath}/movie/movieDetail?movieNumber=${movieDto.movieNumber}">
										<img src="${pageContext.request.contextPath}/attachment/download/${imageDto[status.index].fileNumber}" width="200px" height="280px">
										</a>
									</c:when>
									<c:otherwise>
			                        	<a href="${pageContext.request.contextPath}/movie/movieDetail?movieNumber=${movieDto.movieNumber}"><img class="image"></a>
			                        </c:otherwise>
		                        </c:choose>
		                    </td>
		                </tr>
		                <tr >
		                    <td class="content" >
		                        <ul>
		                            <li >${movieDto.movieName}</li>
		                            <li>개봉일:${movieDto.openingDate}</li>
		                           	<li>상영종료일:${movieDto.screeningEnd}</li>
		                            <a href="${pageContext.request.contextPath}/advance/list"><button class="btn btn-neutral" type="submit">예매하기</button></a>
		                        </ul>
		                    </td>
		                </tr>
		            </table> 
        		</c:forEach>
        		</div>  
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>