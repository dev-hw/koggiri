<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta property="og:type" content="article" />

	<!-- Website Title -->
    <title>Sign Up</title>
    
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
        rel="stylesheet">
    <link href="resources/css/bootstrap.css" rel="stylesheet">
    <link href="resources/css/fontawesome-all.css" rel="stylesheet">
    <link href="resources/css/swiper.css" rel="stylesheet">
    <link href="resources/css/magnific-popup.css" rel="stylesheet">
    <link href="resources/css/styles.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
	crossorigin="anonymous">
	
	<!-- Favicon  -->
    <link rel="icon" href="images/favicon.png">

<script type="text/javascript">
//아이디, 닉네임 중복확인 했는지 확인하는 용도
let id=0;
let name=0;

window.onload=function(){
   
   id=0;
   name=0;
   answer=0;
   
   let btnIns=document.querySelector("#btnIns");
   btnIns.addEventListener("click", checkData);
   
   let btnId=document.querySelector("#btnId");
   btnId.addEventListener("click", checkId);
   
   let btnName=document.querySelector("#btnName");
   btnName.addEventListener("click", checkName);
   
   //id 라는 id를 가진 id input에 keyup이벤트가 발생하면
   $("#id").keyup(function(){
	  	console.log('입력!!');
	   id=0;
   })
   
   //name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
   $("#name").keyup(function(){
	   name=0;
   })
   
   
}

function checkId(){
   let useId=document.querySelector(".valueId").value;
   //alert(useId);
   $.ajax({
      url:"useId",
      type:"post",
      dataType:"json",
      data:{useId:useId},
      success: function(data){
         id=0;
         if(document.querySelector("#id").value.length>document.querySelector("#id").size){
      	   alert("아이디를 20글자 이내로 입력해주세요");
      	      frm.id.focus();
      	      return;
         }
         if(data.result=="y"){
            if(useId==""){
               alert("아이디를 입력해주세요");
               frm.id.focus();
            }else{
               alert("사용할 수 있는 아이디입니다.");
               id=1;
            }
         }else if((data.result=="n")){
            alert("사용할 수 없는 아이디입니다.");
         }
      },
      error:function(){
         alert("에러 발생");
      }
      
   });
   
}

function checkName(){
   let useName=document.querySelector(".valueName").value;
   //alert(useName);
   $.ajax({
      url:"useName",
      type:"post",
      dataType:"json",
      data:{useName:useName},
      success: function(data){
         name=0;
         if(data.result=="y"){
        	 if(document.querySelector("#name").value.length>document.querySelector("#name").size){
            	   alert("닉네임을 20글자 이내로 입력해주세요");
            	      frm.name.focus();
            	      return;
               }
            if(useName==""){
               alert("닉네임을 입력하세요");
               frm.name.focus();
            }else{
               alert("사용할 수 있는 닉네임입니다.");
                 name=1; 
            }
         }else if((data.result=="n")){
            alert("사용할 수 없는 닉네임입니다.");
         }
      },
      error:function(){
         alert("에러 발생");
      }
      
   });
   
}


function checkData(){
   
   if(frm.id.value===""){
      alert("아이디를 입력하세요");
      frm.id.focus();
      return;
   }
   
   
   if(frm.password.value===""){
      alert("비밀번호를 입력하세요");
      frm.password.focus();
      return;
   }
   
   if(document.querySelector("#password").value.length>document.querySelector("#password").size){
  	   alert("비밀번호를 20글자 이내로 입력해주세요");
  	      frm.password.focus();
  	      return;
   }
   
   if(frm.password.value!=document.querySelector("#password2").value){
	      alert("비밀번호가 일치하지 않습니다");
	      frm.password2.focus();
	      return;
	}
   
   if(frm.name.value===""){
      alert("닉네임을 입력하세요");
      frm.name.focus();
      return;
   }
   
   if(frm.answer.value===""){
	   alert("비밀번호 확인 답변 항목은 필수 입력값입니다.");
	   frm.answer.focus();
	   return;
   }
   
   if(document.querySelector("#answer").value.length>20){
  	   alert("비밀번호 확인 답변을 20글자 이내로 입력해주세요");
  	      frm.answer.focus();
  	      return;
   }
  

   if(id===0){
      alert("아이디 중복확인을 해주세요.");
      return;
   }

   if(name===0){
      alert("닉네임 중복확인을 해주세요.");
      return;
   }
   
  
   
   frm.submit();
   
}

</script>
</head>
<body data-spy="scroll" data-target=".fixed-top">
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
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
                        <a class="nav-link page-scroll active" href="#header">HOME <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href="home">스터디</a>
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
    
    
    <!-- Header -->
    <header id="header" class="ex-2-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Sign Up</h1>
                   <p>이미 가입하셨나요?<a class="white" href="login"><br>Log In</a></p> 
                    <!-- Sign Up Form -->
                    <div class="form-container">
                        <form form action="signup" method="post" name="frm" id="signUpForm" data-toggle="validator" data-focus="false">
                            <div class="form-group">
                                <input type="text" class="form-control-input valueId" name="id" id="id" id="semail" required>
                                <label class="label-control" for="semail" >아이디</label>
                                <div class="help-block with-errors"></div>
                                <br>
                                <button type="button" class="form-control-submit-button" id="btnId">
                                    중복확인</button>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control-input" name="password" id="password" id="spassword" required>
                                <label class="label-control" for="spassword">비밀번호</label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control-input" id="password2" required>
                                <label class="label-control" for="spassword">비밀번호 확인</label>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control-input valueName" name="name" id="name" id="sname" required>
                                <label class="label-control" for="sname">닉네임</label>
                                <div class="help-block with-errors"></div>
                                <br>
                                 <button type="button" class="form-control-submit-button" id="btnName">
                                    중복확인</button>
                            </div>
                            <div class="form-group">
                            <label>비밀번호 확인 질문</label>
						   	<select name="hint" class="hint" >
						   		<option value="hint_01">자신의 인생 좌우명은?</option>
						   		<option value="hint_02">자신의 보물 제1호는?</option>
						   		<option value="hint_03">가장 기억에 남는 선생님 성함은?</option>
						   		<option value="hint_04">받았던 선물 중 기억에 남는 독특한 선물은?</option>
						   		<option value="hint_05">유년시절 가장 생각나는 친구 이름은?</option>
						   		<option value="hint_06">인상 깊게 읽은 책 이름은?</option>
						   		<option value="hint_07">자신이 두번째로 존경하는 인물은?</option>
						   		<option value="hint_08">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
						   		<option value="hint_09">다시 태어나면 되고 싶은 것은?</option>
						   		<option value="hint_10">내가 좋아하는 캐릭터는?</option>
						   	</select>
							</div>
							
							<div class="form-group">
							<label>비밀번호 확인 답변</label>
							<br>
						   	<input type="text" name="answer" id="answer">
                            </div>
                            
                            
                           
                            <div class="form-group">
                                <button type="button" id="btnIns" class="form-control-submit-button">SIGN UP</button>
                            </div>
                            
                        </form>
                    </div> <!-- end of form container -->
                    <!-- end of sign up form -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    
    
   <!-- Scripts -->
    <script src="resources/js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
    <script src="resources/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="resources/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="resources/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="resources/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="resources/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="resources/js/scripts.js"></script> <!-- Custom scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
	crossorigin="anonymous"></script>
   

</form>
</main>
</body>
</html>