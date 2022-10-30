<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--JSTL 사용 선언(자바코드를 태그로)--%>  

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>




    <link rel="stylesheet" type="text/css" href="./css/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/semi-commons.css">
    <link rel="stylesheet" type="text/css" href="./css/semi-layout.css">
    <script type="text/javascript">
        //자바스크립트 코드

    </script>
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
    

</head>
<body>
    
    <div class="container-980">
       
        <div class="row left">
            <h1>무비차트</h1>
        </div>
        <hr>
        <select class="select"  >
            <option value="popular" selected><a href="#">예매율순</a></option>
            <option value="reservation"><a href="#">별점순</a></option>
            <option value="star"><a href="#">관람객순</a></option>
        </select>

       
        
            	<c:forEach var="dto" items="${list}">
              
                
                    <table class="small" >
                        <tr>
                           <td class="ranking" style="background-color: red;"> 순위</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#"><img src="./image/$[dto.fileName].png" class="image"> </a>
                            </td>
                        </tr>
                        <tr >
                            <td class="content" >
                                <ul >
                                    <li >${dto.movieName}</li>
                                    <li>예매율:%<span ></span></li>
                                    <li>개봉일:${dto.openingDate}</li>
                                     <a href="#"><button class="btn btn-neutral" type="submit">예매하기</button></a>
                                </ul>
                            </td>
                        </tr>
                    </table> 
                   
                
                  </c:forEach>   
            
               
                 
                







            

          
         
         <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
         
          </div>
    
     <!-- HTML 화면 -->
     </html>