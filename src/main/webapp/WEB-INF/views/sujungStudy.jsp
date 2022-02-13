<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
window.onload = function(){
	
	let btnSujung = document.querySelector("#btnSujung");
	btnSujung.addEventListener("click", checkData);
}
function checkData(){
	if(frm.content.value === ""){
		alert("스터디 소개를 적어주세요");
		frm.content.focus();
		return;
	}
	if($('input[name=languageChk]:checked').length==0){
		alert("스터디 언어를 선택해주세요");
		return;
	}
	
	if(frm.maxPeopleNum.value === ""){
		alert("모집인원을 입력하세요");
		frm.maxPeopleNum.focus();
		return;
	}else{
		let str=frm.maxPeopleNum.value;
		let cond=/[^0-9]/g;
		let result=cond.test(str);
		if(result){
			alert("숫자를 입력하세요")
			frm.maxPeopleNum.focus();
			return;
		}
	}
	if(frm.maxPeopleNum.value>20){
		alert("최대 모집인원은 20명 입니다");
		frm.maxPeopleNum.focus();
		return;
	}
	
	if(frm.maxPeopleNum.value < document.querySelector("#nowPeopleNum").value){
		alert("현재인원보다 모집인원이 적습니다.");
		frm.maxPeopleNum.focus();
		return;
	}
	
	
	var str = $('#content').val();
	str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	$('#content').val(str);
	
	frm.submit()
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


 <!-- Navigation -->
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
<!-- Header -->
    <header id="header" class="ex-header" style="padding-bottom:100px; padding-top:130px; margin-bottom:20px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>스터디 수정</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    


 
<div id="wrapper" style="width:60%; margin:0 auto;height: 1000px;">
<form action="sujungStudy" method="post" name="frm">
	<input type="hidden" name="studyNo" value=${studyNo }>

	<div class="form-floating">
		<label for="studyName">스터디명</label>
		<input type="text" name="studyName" value="${sdto.studyName }" class="form-control" id="studyName" disabled>
		
	</div>
	<br />
	<div class="form-floating">
		<label for="textarea">스터디소개</label>
		<textarea class="form-control" name="content" id="textarea" style="height: 287px">${sdto.content }</textarea>
		
	</div>
	<br />
	스터디 언어 선택
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk1" value="NODEJS">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">node.js</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk2" value="PYTHON">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">파이썬</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk3" value="JAVA">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk4" value="JAVASCRIPT">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바스크립트</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk5" value="SPRING">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">스프링</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk6" value="KOTLIN">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">코틀린</label>
	</div>
	<br />
	<div class="form-floating mb-3">
		<label for="nowPeopleNum">현재인원</label>
		<input type="text"  class="form-control" id="nowPeopleNum" value=${sdto.nowPeopleNum } disabled>
		
	</div>
	<div class="form-floating mb-3">
		<label for="nowPeopleNum">모집인원</label>
		<input type="text"  class="form-control" id="maxPeopleNum " value=${sdto.maxPeopleNum  }>
		
	</div>
	
	
	<br />
	<input type="button" value="수 정" id="btnSujung" class="w-25 btn btn-lg btn-secondary" style="display: block; margin: auto;">
	<br />
	<center><a href="history.back()"> 취소 </a></center>
	
	</form>
</div>

<script>
let str="${sdto.content }";
str = str.replaceAll("<br/>", "\n");
document.querySelector("#content").value = str;
</script>

</body>
</html>