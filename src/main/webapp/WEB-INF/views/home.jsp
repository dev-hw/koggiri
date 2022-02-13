<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head><meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description"
        content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
    <meta property="og:site_name" content=""> <!-- website name -->
    <meta property="og:site" content=""> <!-- website link -->
    <meta property="og:title" content=""> <!-- title shown in the actual shared post -->
    <meta property="og:description" content=""> <!-- description shown in the actual shared post -->
    <meta property="og:image" content=""> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content=""> <!-- where do you want your post to link to -->
    <meta property="og:type" content="article">

   
   <title>Home</title>
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="./resources/assets/css/main.css" />
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
        rel="stylesheet">
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/fontawesome-all.css" rel="stylesheet">
    <link href="resources/css/swiper.css" rel="stylesheet">
    <link href="resources/css/magnific-popup.css" rel="stylesheet">
    <link href="resources/css/styles.css" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="resources/images/favicon.png">
</head>
<style>
.disable{
   opacity: 0.3; 
   filter: alpha(opacity=30);
}
</style>
<body class="is-preload">
   <div id="wrapper">
   <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top" style="background-color:#185ADB; height:74px;">
        <div class="container">

            <!-- Text Logo - Use this if you don't have a graphic logo -->
            <!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Tivo</a> -->

            <!-- Image Logo -->
            <a class="navbar-brand logo-image" href="index.jsp"><img src="resources/images/logo-001.svg" alt="alternative"></a>

            <!-- Mobile Menu Toggle Button -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-awesome fas fa-bars"></span>
                <span class="navbar-toggler-awesome fas fa-times"></span>
            </button>
            <!-- end of mobile menu toggle button -->

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="index.jsp">HOME <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll active" href="home">스터디</a>
                    </li>

                    <!-- Dropdown Menu -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle page-scroll" href="#" id="navbarDropdown" role="button"
                            aria-haspopup="true" aria-expanded="false">채용</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="https://www.wanted.co.kr/"><span class="item-text">원티드</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="https://www.jobkorea.co.kr/"><span class="item-text">잡코리아</span></a>
                            <div class="dropdown-items-divide-hr"></div>
                            <a class="dropdown-item" href="https://www.saramin.co.kr"><span class="item-text">사람인</span></a>
                        </div>
                    </li>
                    <!-- end of dropdown menu -->

                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="studyCafeMap.jsp">지도</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="faq.jsp">FAQ</a>
                    </li>
                </ul>
                
                <%
                  //로그인된 아이디가 있는지 확인
                  String name=(String)session.getAttribute("namekey");
                  int userNo=(Integer)session.getAttribute("userNo");
                %>
                <%if(name==null){ %>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="login">로그인</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="signup">회원가입</a>
                </span>
                <%}else{ %>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="alarmList?userNo=${userNo }">알림</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="javascript:void(0);" onclick="javascript:frm.submit();">마이페이지</a>
                </span>
                <span class="nav-item">
                    <a class="btn-outline-sm" href="logout">로그아웃</a>
                </span>
                <%} %>
            </div>
        </div> <!-- end of container -->
    </nav> <!-- end of navbar -->
    <!-- end of navigation -->

   	<!-- 마이페이지 이동 -->
	<form action="mypage" method="post" name="frm">
	<input type="hidden" name="userNo" value=${userNo}>
	</form>
   
    <br /> <br />
   <div style="text-align:center;margin-top:50px;">
   
   
   <select name="searchOption" id="searchOption" class="form-select" aria-label="Default select example" style="display:inline-block;width:100px;"  >
      <option value="studyName">제목</option>
      <option value="language">언어</option>
   </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



      <input type="text" class="w-25" name="searchValue" id="searchValue"style="display:inline-block;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button value="검색" id="searchStudyBtn" style="display:inline-block;" >검색</button>
</div>
 <br /> <br />

   <div style="text-align:center">
      <img src="./resources/img/Language/NODEJS.png" class="img disable" id="NODEJS"/>
      <img src="./resources/img/Language/PYTHON.png" class="img disable" id="PYTHON"/>
      <img src="./resources/img/Language/JAVA.png" class="img disable" id="JAVA"/>
      <img src="./resources/img/Language/JAVASCRIPT.png" class="img disable" id="JAVASCRIPT"/>
      <img src="./resources/img/Language/SPRING.png" class="img disable" id="SPRING"/>
      <img src="./resources/img/Language/KOTLIN.png" class="img disable" id="KOTLIN"/>
   </div>
   <hr />
   <div style="float:right;margin:50px;">
     <%if(name!=null){ %>
      <button id="insertStudy" onclick="location.href='newStudyForm?userNo=${userNo}';">스터디 생성</button>
     <%}%>
     </div>
   
<script>
   
//스터디 정보 보여주기
function show(StudyData){
      
      let str=`<div id="main">
      <div class="inner">
      <section class="tiles">`;

      let count = 0;
      let list = StudyData.datas;
      $(list).each(function(index, obj){
         str+=`<article class='style`+(index%6+1)+`'>
               
                <span class='image'>`

            str +=`<img src="./resources/images/pic0`+(index%6+1)+`.jpg" alt=''/>
               </span>`
           str+=`<a href="studyDetail?studyNo=`+obj.studyNo +`";>
           <h2>`+obj.studyName+`</h2>`;
           str+=`<div class="content">`
         obj.language;
           `"<br />"
            인원:`+obj.nowPeopleNum +`/`+ obj.maxPeopleNum;
            str+=` </div></a></article>`
         count++;
      });
      str+=`
          </section>
          </div>
       </div>`;
      
      if(count==0) str = "검색된 스터디가 없습니다."
      $("#showStudy").html(str);
}
   
   
   
      //var path = "./resources/img/Language/JAVA.jpg" + "?" +Date.now();
      //$("#JAVA").attr('src', path);
   
//스터디 검색 버튼
$("#searchStudyBtn").click(function(){
         if ($("#searchValue").val()==""){
            alert('검색어를 입력해주세요.');
         }
         else{
            $("#showStudy").empty();
            // let str=""
            $.ajax({
               type:"get",
               url:"searchStudy?searchOption="+$('#searchOption option:selected').val()+ "&searchValue="+$('#searchValue').val(),
               dataType:"json",
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("searchStudyBtn click error");
                  $("#showStudy").text("에러");
               }
            });
            
            $(".img").each(function (index, item) {
               $(this).removeClass("able");
                $(this).addClass("disable");
            });   
            
            $(this).addClass("disable");
            langList.splice(0,langList.length);
            console.log(langList);
            
         }
});

let langList = new Array();
$(".img").click(function(){//이미지를 클릭했을때
         
         $("#searchValue").val('');
         
         var name =$(this).attr("id");
         if($(this).hasClass("able")){
            $(this).removeClass("able");
            $(this).addClass("disable");
            langList.splice(langList.indexOf(name),1);

         }
         else{
            $(this).addClass("able");
            $(this).removeClass("disable");
            langList.push(name);
         }
         
         if (langList.length != 0){
            let str="";
            $.ajax({
               type:"post",
               url:"imgBtnClick",
               dataType:"json",
               data:{
                  "langList":langList,
               },
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("버튼을 클릭해주세요.");
                  $("#showStudy").text("검색된 스터디가 없습니다.");
               }
            });
         }else{
            let str="";
            $.ajax({
               type:"get",
               url:"imgBtnClick",
               dataType:"json",
               success:function(StudyData){
                  show(StudyData)
               },
               error:function(){
                  alert("버튼을 클릭해주세요.");
                  $("#showStudy").text("검색된 스터디가 없습니다.");
               }
            });
         } 
      }); 
   </script>
   
   <div id="showStudy">
   

      <c:choose>

         <c:when test="${size  eq 0}">
            <div class="totalStudy">
               검색된 스터디가 없습니다.
            </div>
         </c:when>
         <c:otherwise>               
               <!-- Main -->
                  <div id="main">
                     <div class="inner">
                        <section class="tiles"> 
                           <c:choose>                                                      
                               <c:when test="${fn:length(study) == 0}">
                                         조회결과가 없습니다.
                               </c:when>
                               <c:otherwise>
                                   <c:forEach var="tmp" items="${study}"  varStatus="status">
                                    <article class="style${status.index%6+1}"> <script></script>
                                       <span class="image">
                                          <img src="./resources/images/pic0${status.index%6+1}.jpg" alt="" />
                                       </span>
                                       <a href="studyDetail?studyNo=${tmp.studyNo}">
                                          <h2>${tmp.studyName }</h2>
                                          <div class="content">
                                             ${tmp.language }
                                             <br/>
                                             인원: ${tmp.nowPeopleNum }/${tmp.maxPeopleNum }
                                       
                                       </div></a>
                                    </article>
                                 </c:forEach>   
                               </c:otherwise> 
                           </c:choose>


                  
                        </section>
                     </div>
                  </div>
               
         </c:otherwise>
      </c:choose>
      
   <script>
   
   </script>
   
   </div>
   
   </div>
   <!-- Scripts -->
         <script src="./resources/assets/js/jquery.min.js"></script>
         <script src="./resources/assets/js/browser.min.js"></script>
         <script src="./resources/assets/js/breakpoints.min.js"></script>
         <script src="./resources/assets/js/util.js"></script>
         <script src="./resources/assets/js/main.js"></script>

</body> 

</html>