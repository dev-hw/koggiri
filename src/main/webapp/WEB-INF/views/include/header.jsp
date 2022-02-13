<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
<title>Insert title here</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"><img
				src="resources/logo/img/노랑코끼리.png" alt="..." /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<!-- index페이지에서만 네비바에 home, study, developer .. 탭이 보이고 다른 페이지로 이동하면 study, developer는 없애고 home만 만들어서 home 을 누르면 index 페이지로 이동하게끔!!! -->
					<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#portfolio">STUDY</a></li>
					<li class="nav-item"><a class="nav-link" href="#Developer">Developer</a></li>
					<li class="nav-item"><a class="nav-link" href="home">스터디찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="info.jsp">채용정보</a></li>
					<li class="nav-item"><a class="nav-link" href="faq.jsp">FAQ</a></li>
					<%
						//로그인된 아이디가 있는지 확인
					String name = (String) session.getAttribute("namekey");
					int userNo = (Integer) session.getAttribute("userNo");
					%>
					<%
						if (name == null) {
					%>
					<li class="nav-right"><a class="nav-link" href="login">로그인</a></li>
					<li class="nav-right"><a class="nav-link" href="signup">회원가입</a></li>
					<%
						} else {
					%>
					<li class="nav-right"><a class="nav-link"
						href="alarmList?userNo=${userNo }">알림</a></li>
					<li class="nav-right"><a class="nav-link"
						href="mypage?userNo=${userNo }">마이페이지</a></li>
					<li class="nav-right"><a class="nav-link" href="logout">로그아웃</a><br></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>