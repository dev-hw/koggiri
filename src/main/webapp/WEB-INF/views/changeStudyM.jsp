<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Styles -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
    rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/fontawesome-all.css" rel="stylesheet">
<link href="resources/css/swiper.css" rel="stylesheet">
<link href="resources/css/magnific-popup.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet"/>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//닉네임 확인 했는지 확인하는 용도
let name=0;
let pwd1=0;

window.onload=function(){
	console.log(pwd);
	name=0;
	pwd1=0;
	
	let btnName=document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
	
	let btnPwd=document.querySelector("#btnPwd");
	btnPwd.addEventListener("click", checkPwd);
	
	let btnChange=document.querySelector("#btnChange");
	btnChange.addEventListener("click", changeName);
	
	//name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
	$("#name").keyup(function(){
		 name=0;
	})
	//pwd 이라는 id를 가진 pwd input에 keyup이벤트가 발생하면
	$("#pwd").keyup(function(){
		pwd1=0;
		console.log(pwd);
	})
	
}

function checkName(){
	
	   let useName=document.querySelector(".valueName").value;
	   if(useName==""){
           alert("닉네임을 입력하세요");
           frm.name.focus();
           return;
           }
		   //alert(useName);
		   $.ajax({
		      url:"useChangeName",
		      type:"post",
		      dataType:"json",
		      data:{"useName":useName, "studyNo":${studyNo}},
		      success: function(data){
		         name=0;
		         
	        	 if(data.result=="y"){
	        		 alert("유저가 존재합니다.\n위임을 계속하시려면 비밀번호 확인을 해주세요.");
	 	         	name=1;   
	 	         }else if(data.result=="n"){
	 	            alert("유저가 존재하지 않습니다.");
	 	            frm.name.focus();
	 	         }
	         },
	      error:function(){
	         alert("에러 발생");
	      }
	   });
	}
	
	
function checkPwd(){
	   let pwd=document.querySelector(".valuePwd").value;
	   if(pwd==""){
           alert("비밀번호를 입력하세요");
           frm.pwd.focus();
           return;
     	}
	   $.ajax({
	      url:"checkPwd",
	      type:"post",
	      dataType:"json",
	      data:{"pwd":pwd, "studyNo":${studyNo}},
	      success: function(data){
	         pwd=0;
	        	 if(data.result=="y"){
	        		 alert("비밀번호가 일치합니다.\n위임을 계속하시려면 스터디장 위임하기 버튼을 눌러주세요.");
	 	         	 pwd1=1;
	 	         	 console.log("성공!");
	 	         }else if(data.result=="n"){
	 	            alert("비밀번호가 틀렸습니다.");
	 	           	frm.pwd.focus();
	 	         }
	         },
	      error:function(){
	         alert("에러 발생");
	      }
	   });
	}
	
	
	
function changeName(){
	let useName=document.querySelector(".valueName").value;
	
	if(useName==""){
        alert("닉네임을 입력하세요");
        frm.name.focus();
        return;
  	}else{
  		if(name===0){
  	      alert("확인버튼을 눌러 존재하는 유저인지 확인해주세요.");
  	      return;
  	    }
  		if(pwd1===0){
    	      alert("비밀번호 확인을 해주세요.");
    	      return;
    	 }
  		if(confirm(useName+"님께 스터디장 권한을 위임하시겠습니까?")==true){
  			//스터디장 위임하기 버튼을 누르면 confirm이 뜨고 확인 버튼을 누르면 폼이 전송됨
  			frm.submit();
  		}else{
			console.log("취소");
			return false;
		}
  		
  	}
	
}



</script>
<body>

<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
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
    <header id="header" class="ex-header" style="padding-bottom:100px; padding-top:130px; margin-bottom:15px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>스터디장 위임</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->

<hr>

<div style="text-align: center;">
스터디장 위임을 하시면 바로 위임이 완료되며, 위임을 받게 되면 다시 스터디장이 될 수 있습니다.
<br><br>
스터디장으로 위임할 멤버 닉네임 입력<br>
※정확하게 적어주세요.※<br>
<form action="changeStudyM" method="post" name="frm">
<input type="hidden" name="studyNo" value="${studyNo}" />

<input type="text" id="name" name="name" class="valueName">
<input type="button" id="btnName" value="확인">

<br><br>
비밀번호 확인
<br>
<input type="text" id="pwd" name="pwd" class="valuePwd">
<input type="button" id="btnPwd" value="확인">
<br><br>

<input type="button" id="btnChange" value="스터디장 위임하기">
</form>
</div>
</body>
</html>