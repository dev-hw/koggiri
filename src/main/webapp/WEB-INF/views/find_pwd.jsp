<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload=function(){
	let chkId=document.querySelector("#chkId");
	chkId.addEventListener("click", chkUser);
}

function chkUser(){
	let id=document.querySelector(".valueId").value;
	let hint=document.querySelector(".hint").value;
	let answer=document.querySelector(".answer").value;
	if(id==""){
        alert("아이디를 입력해주세요");
        frm.id.focus();
        return;
	 }
	 if(answer==""){
        alert("비밀번호 확인 답변을 입력해주세요");
        frm.answer.focus();
        return;
	 }
  	if(document.querySelector("#answer").value.length>20){
	   alert("비밀번호 확인 답변을 20글자 이내로 입력해주세요");
	 	  frm.answer.focus();
	      return;
  	}
  	
	$.ajax({
	      url:"chkAnswer",
	      type:"post",
	      dataType:"json",
	      data:{hint:hint, answer:answer, id:id},
	      success: function(data){
	    	 
	         if(data.result=="n"){
             alert("아이디 혹은 비밀번호 확인 답변이 틀렸습니다.");
             return;
	         }else{
	        	 frm.submit();
	         }
	    },
	    error:function(){
	       alert("에러 발생");
	    }
	 });
	
}

</script>
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
<body>

<%
   //로그인된 아이디가 있는지 확인
   String name=(String)session.getAttribute("namekey");
   int userNo=(Integer)session.getAttribute("userNo");
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
    <header id="header" class="ex-header" style="padding-bottom:100px; padding-top:130px; margin-bottom:100px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>비밀번호 찾기</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->



<center>
<form action="find_pwd" method="post" name="frm" onsubmit="return false">
<table>
<tr>
	<td>아이디</td> 
 	<td><input type="text" name="id" class="valueId" id="id"></td>
</tr>
<tr>
	<td>비밀번호 확인 질문</td>
	<td>
	<select name="hint" class="hint" style="width:209px; height:34px;">
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
	</td>
</tr>
<tr>
	<td>비밀번호 확인 답변</td>
	<td><input type="text" name="answer" id="answer" class="answer"></td>
</tr>	
<tr>
	<td colspan="2" style="text-align:center;">
	<input type="button" value="확인" id="chkId" style="margin-top:40px;">
	</td>
</tr>
</table>
</form>
</center>

</body>
</html>