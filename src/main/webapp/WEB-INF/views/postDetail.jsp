<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 스터디 상세보기</title>
<style>
textarea {
	border: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script>
window.onload=function(){
	
<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>

	let btnCom=document.querySelector("#btnCom");
	btnCom.addEventListener("click",move);
	
	//로그인 안했으면 댓글 작성 못함
	if("<%=name%>"==="null"){
		document.querySelector("#content").value="로그인 후 이용해주세요.";
		document.querySelector("#content").setAttribute("disabled",true);
		document.querySelector("#userName").value="";
		
	}
	
	if(document.querySelector("#userName").value==frm.userName.value){
		
	}else{
		document.querySelector(".deletecom").innerText="";
	}
}

	function move(){
		if("<%=name%>" === "null") {
			let result = confirm("로그인이 필요한 서비스입니다. \n로그인 하시겠습니까?");
			if (result) {
				//로그인 페이지 이동
				document.log.submit();
				return;
			} else {
				//현재 페이지 머물기
				return;
			}
		}

		//댓글 추가시 내용을 빈값으로 넣었을때 알림창 띄우기
		if (document.querySelector("#content").value === "") {
			alert("내용을 입력하세요.");
			return;
		}
		
		setTimeout(function(){
			frm.submit()
		},1500)

		
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
    <header id="header" class="ex-header" style="padding-bottom:100px; padding-top:130px;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>스터디 게시판</h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
    
    <div style="width:80%; margin:0 auto; padding-top:25px;">
	<p
		style="border-left: 10px solid #688FF4; padding: 0.5em; border-bottom: 2px solid #688FF4;">우리
		스터디 게시판</p>

	<table class="table table-hover">
		<tr>

			<td>작성자 : ${name }</td>
			<td>작성일 : ${pdata.postTime}</td>
			<td>조회수 : ${pdata.views }</td>
		</tr>
		<tr>
			<td colspan="3">제목 : ${pdata.title }</td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="10" style="width: 99%"
					style="border=none" readonly="readonly">내용 : ${pdata.content }</textarea></td>
		</tr>
	</table>
	<br>
	<br>
	<br>

	<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
	<form action="login" method="get" name="log"></form>

	<!-- 목록 버튼 -->
	<button onclick="location.href='studyboard?&studyNo=${studyNo }&page=1'">목록</button>

	
	<!-- 수정 -->
	<c:set var="u" value="${pdata.uNo }" /> 
	<c:set var="s" value="${userNo }" /> 
	<c:choose>
		<c:when test="${u eq s}">
			<a href ="updatePost?postNo=${pdata.postNo }&studyNo=${pdata.sNo }">수정</a>
		</c:when>
	</c:choose>
	
	
	<!-- 삭제 -->
	<c:set var="manager" value="${manager }" /> 
	<c:set var="u" value="${pdata.uNo }" /> 
	<c:set var="s" value="${userNo }" /> 
	<c:choose>
		<c:when test="${manager or u eq s}">
		 <a href ="deletePost?postNo=${pdata.postNo }&userNo=${userNo }&studyNo=${pdata.sNo }&page=1" onclick="return confirm('삭제된 게시글은 복구가 불가합니다.\n정말로 삭제하시겠습니까?');">삭제</a>
		 </c:when>
	</c:choose>
	
	

	<!-- 댓글 추가기능 -->
	<form action="insertcom" method="post" name="frm"
		class="row gx-3 gy-2 align-items-center">
		<!-- 게시글 상세보기 페이지로 돌아가기 위해 게시글번호 받기-->
		<input type="hidden" name="postNo" value="${postNo }">
		<input type="hidden" name="studyNo" value="${studyNo }">
		<input type="hidden" name="userNo" value="${userNo }">

		<table class="table table-hover">
			<tr>
				<!-- session 닉네임 불러오기!! -->
				<td><input type="text" name="userName" id="userName"
					value="<%=name%>"
					style="border: none; text-align: right; width: 100px;" disabled>
				</td>
				<td><input type="text" name="content" id="content"
					style="width: 500px;"></td>
				<td><input type="button" class="btn btn-outline-primary"
					id="btnCom" value="＋댓글 남기기"></td>
			</tr>
		</table>
	</form>

	<br>


	<!-- 댓글 목록!! -->
	<table class="table table-hover">
		<c:forEach items="${cdata }" var="c">
			<tr>
				<td width="30">${c.commentNo }</td>
				<td width="100">${c.userName }</td>
				<td width="500">${c.content }</td>
				<c:choose>
					<c:when test="${c.userName ==namekey }">
						<td width="35" class="deletecom"><a
							href="deletecom?commentNo=${c.commentNo }&postNo=${c.postNo }&studyNo=${studyNo }">삭제</a></td>
					</c:when>
					<c:otherwise>
						<td width="35"></td>
					</c:otherwise>
				</c:choose>
				<td width="70">${c.time }</td>

			</tr>
		</c:forEach>


		<tr style="text-align: center;">
			<td colspan="6"><c:forEach var="cpsu" begin="1"
					end="${cpageSu }">
					<c:if test="${cpsu == cpage }">
						<b><u>${cpsu }</u></b>
					</c:if>
					<c:if test="${cpsu != cpage }">
						<a href="postDetail?postNo=${postNo }&cpage=${cpsu}&studyNo=${studyNo }">${cpsu}</a>
					</c:if>
				</c:forEach></td>
		</tr>
	</table>


</div>
</body>
</html>