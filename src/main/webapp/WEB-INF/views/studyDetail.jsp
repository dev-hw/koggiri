<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description"
	content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
<meta name="author" content="Inovatik">

<!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
<meta property="og:site_name" content="">
<!-- website name -->
<meta property="og:site" content="">
<!-- website link -->
<meta property="og:title" content="">
<!-- title shown in the actual shared post -->
<meta property="og:description" content="">
<!-- description shown in the actual shared post -->
<meta property="og:image" content="">
<!-- image link, make sure it's jpg -->
<meta property="og:url" content="">
<!-- where do you want your post to link to -->
<meta property="og:type" content="article">

<!-- Website Title -->
<title>Koggiri-studymate</title>

<!-- Styles -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&amp;display=swap&amp;subset=latin-ext"
	rel="stylesheet">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/fontawesome-all.css" rel="stylesheet">
<link href="resources/css/swiper.css" rel="stylesheet">
<link href="resources/css/magnific-popup.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>스터디 상세보기</title>

<!-- bootstrap 세팅 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script>
window.onload=function(){
	let insertBtn=document.querySelector("#insertBtn");
	insertBtn.addEventListener("click", moveSign);


}
function copyToClipboard(val) {
    var t = document.createElement("textarea");
    document.body.appendChild(t);
    t.value = val;
    t.select();
    document.execCommand('copy');
    document.body.removeChild(t);
    alert('주소를 복사하였습니다');
 }
function moveSign(){
	
	
	if(sign.namekey.value==''){
		let result=confirm("로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?");
		if(result){
			//로그인 페이지 이동
			document.log.submit();
			return;
		}else{
			//현재 페이지 머물기
			return;
		}
	  }else{
		//만약에 이미 가입이 되어있으면 가입된 스터디라고 알림창 띄우고 마이페이지로 이동
			if(${result==""}){
				alert("이미 가입된 스터디 입니다.");
				location.href=`home`;
				
				return;
			}
			if(${result2==""}){
				alert("이미 가입 신청을 했습니다.");
				return;
			} 
	  }
	if(${result3==""}){
		alert("가입 불가합니다.\n인원이 다 모집된 스터디입니다.")
		return;
	}
	
	document.sign.submit();
}
</script>
</head>
<body data-spy="scroll" data-target=".fixed-top">

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top"
		style="background-color: #185ADB; height: 74px;">
		<div class="container">

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<!-- <a class="navbar-brand logo-text page-scroll" href="index.html">Tivo</a> -->

			<!-- Image Logo -->
			<a class="navbar-brand logo-image" href="index.jsp"><img
				src="resources/images/logo-001.svg" alt="alternative"></a>

			<!-- Mobile Menu Toggle Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-awesome fas fa-bars"></span> <span
					class="navbar-toggler-awesome fas fa-times"></span>
			</button>
			<!-- end of mobile menu toggle button -->

			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link page-scroll"
						href="index.jsp">HOME <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link page-scroll active"
						href="home">스터디</a></li>

					<!-- Dropdown Menu -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle page-scroll" href="#"
						id="navbarDropdown" role="button" aria-haspopup="true"
						aria-expanded="false">채용</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="https://www.wanted.co.kr/"><span
								class="item-text">원티드</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="https://www.jobkorea.co.kr/"><span
								class="item-text">잡코리아</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="https://www.saramin.co.kr"><span
								class="item-text">사람인</span></a>
						</div></li>
					<!-- end of dropdown menu -->

					<li class="nav-item"><a class="nav-link page-scroll"
						href="studyCafeMap.jsp">지도</a></li>

					<li class="nav-item"><a class="nav-link page-scroll"
						href="faq.jsp">FAQ</a></li>
				</ul>

				<%
                  //로그인된 아이디가 있는지 확인
                  String name=(String)session.getAttribute("namekey");
                  int userNo=(Integer)session.getAttribute("userNo");
                %>
				<%if(name==null){ %>
				<span class="nav-item"> <a class="btn-outline-sm"
					href="login">로그인</a>
				</span> <span class="nav-item"> <a class="btn-outline-sm"
					href="signup">회원가입</a>
				</span>
				<%}else{ %>
				<span class="nav-item"> <a class="btn-outline-sm"
					href="alarmList?userNo=${userNo }">알림</a>
				</span> <span class="nav-item"> <a class="btn-outline-sm"
					href="javascript:void(0);" onclick="javascript:frm.submit();">마이페이지</a>
				</span> <span class="nav-item"> <a class="btn-outline-sm"
					href="logout">로그아웃</a>
				</span>
				<%} %>
			</div>
		</div>
		<!-- end of container -->
	</nav>
	<!-- end of navbar -->
	<!-- end of navigation -->

	<!-- Header -->
	<header id="header" class="ex-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>스터디소개</h1>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->


	<!-- Breadcrumbs (홈-현재페이지)-->
	<div class="ex-basic-1">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs">
						<a href="index.jsp">Home</a><i class="fa fa-angle-double-right"></i><span>스터디소개</span>
					</div>
					<!-- end of breadcrumbs -->
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of ex-basic-1 -->
	<!-- end of breadcrumbs -->




	<div class="container">

		<br>
		<div class="card border-primary col-mb-3"
			style="max-width: 40rem; float: none; margin: 0 auto;">


			<h5>
				<div class="card-header">스터디 소개</div>
			</h5>
			<div class="card-body">
				<h4 class="card-title">
					<b>${dto.studyName }</b>
				</h4>
				<h5 class="card-title">${dto.content }</h5>
				<p class="card-text">
					사용언어 : <span class="badge rounded-pill bg-warning text-dark">
						${dto.language } </span> <br> 스터디장 : ${dto.name } <br> 모집인원 :
					${dto.nowPeopleNum }/${dto.maxPeopleNum } <br> 개설일 : <b>${time }</b>
					<br>
					<b> <!-- <font color="orange">${result }</font></b> -->
				</p>
			</div>

			<!-- 스터디 회원가입 페이지로 이동하기 위함 -->
			<form action="studysignup" method="get" name="sign">
				<input type="hidden" name="studyNo" value=${studyNo }> <input
					type="hidden" name="namekey" value="${namekey }">
			</form>
			<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
			<form action="login" method="get" name="log"></form>



		</div>
	</div>
	<br>
	<div class="btn-group float-middle text-center gap-2 d-md-block"
		role="group" aria-label="Basic example"
		style="float: none; margin: 0 auto;">
		<button type="button" class="badge rounded-pill bg-primary"
			id="backBtn" onclick="location.href='home'">목록보기</button>
		<button type="button" class="badge rounded-pill bg-light text-dark"
			id="copybtn"
			onclick="copyToClipboard('http://localhost/koggiri/studyDetail?studyNo=' + ${dto.studyNo });">복사하기</button>
		<button type="button" class="badge rounded-pill bg-primary"
			id="insertBtn">가입하기</button>
	</div>
</body>
</html>