<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="./resources/assets/css/main.css" />
<noscript><link rel="stylesheet" href="./resources/assets/css/noscript.css" /></noscript>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
<!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
<title>스터디 게시판</title>
<%
	//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
%>
<script type="text/javascript">

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
<style>
.tablewrapper{
margin: 50px;
}
.all-wrapper{
	padding:100px;
}
</style>

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
                    <h1><a href="studyboard?studyNo=${studyNo}&page=1">스터디 게시판</a></h1>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->
	
 	

<div class="all-wrapper" style="padding-top:10px;">
<br/><br /><br />

<div style="text-align:center">
	<select name="searchPostOption" id="searchPostOption" class="form-select" aria-label="Default select example" style="display:inline-block;width:100px;">
		<option value="title">제 목</option>
		<option value="name">작성자</option>
	</select>

	<input type="text" id="searchPostValue" class="w-25" style="display:inline-block;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button value="검색" id="searchPostBtn" style="display:inline-block;">검색</button>
</div>

		<div>
 	<br><br>
	
	
	&nbsp;&nbsp;
	<button onclick="location.href='studyDetail?studyNo=${studyNo }'">스터디정보</button>
	&nbsp;&nbsp;
	<c:set var="manager" value="${manager }" />
	<c:choose>
		<c:when test="${manager }">
			<!-- 스터디 삭제 -->
			<button id="withdrawFromStudy" onclick="javascript:btnSujung_event()">스터디수정</button>
		</c:when>
	</c:choose>
	
	
	<!-- <div style="float:right;margin:50px;">
	</div> -->
	</div>
	
<section>

	<div class="tablewrapper" id="boardTable">
	<a href="studyboard?&studyNo=${studyNo }&page=1" class="section-subheading text-muted" style="display:inline-block; font-size:1.5em">[최근목록 보기]</a>&nbsp;
	<br />
	<br />
		<table class="table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<!-- <div id="showList"> -->
			<c:choose>
			<c:when test="${not empty data}">
			<c:forEach var="tmp" items="${data}">
				<tr>
					<td>${tmp.postNo }</td>
					<td><a href="postDetail?postNo=${tmp.postNo }&cpage=0&studyNo=${studyNo }" class= "section-subheading text-muted">${tmp.title }</a></td>
					<td>${tmp.name }</td>
					<td>${tmp.postTime }</td>
					<td>${tmp.views }</td>
					<td><c:set var="u" value="${tmp.userNo }" /> 
					<c:set var="s" value="${userNo }" /> <c:choose>
							<c:when test="${u eq s}">
								<%-- <button
									onclick="location.href='updatePost?postNo=${tmp.postNo }&userNo=${userNo }&studyNo=${studyNo }'">수정</button> --%>
								<a href ="updatePost?postNo=${tmp.postNo }&studyNo=${studyNo }" class= "section-subheading text-muted">수정</a>
							</c:when>
						</c:choose></td>
					
					<td><c:set var="manager" value="${manager }" /> 
					<c:set var="u" value="${tmp.userNo }" /> 
					<c:set var="s" value="${userNo }" /> <c:choose>
							<c:when test="${manager or u eq s}">
								<%-- <button
									onclick="location.href='deletePost?postNo=${tmp.postNo }&userNo=${userNo }&studyNo=${studyNo }&page=1'">삭제</button>
							 --%>
							 <a href ="deletePost?postNo=${tmp.postNo }&userNo=${userNo }&studyNo=${studyNo }&page=1" class= "section-subheading text-muted" onclick="return confirm('삭제된 게시글은 복구가 불가합니다.\n정말로 삭제하시겠습니까?');">삭제</a>
							 </c:when>
						</c:choose></td>

				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>
			</c:otherwise>
			
			</c:choose>
			<!-- </div> -->
			<!-- PAGING -->
			<tr style="text-align: center;">
				<td colspan="7"><c:forEach var="p" begin="1"
						end="${totalPageNum }">
						<c:if test="${p ==page}">
							<b>${p}</b>
						</c:if>
						<c:if test="${p!=page }">
							<!-- 들어오는 studyNo 넣어주어야 함-->
							<a
								href="studyboard?userNo=${userNo }&studyNo=${studyNo }&page=${p }" class= "section-subheading text-muted">${p }</a>
						</c:if>
					</c:forEach></td>
			</tr>
			</tbody>
		</table>
		
		
		
	</div>
	<div style="float:left ;margin:50px">
	<button onclick="location.href='write?studyNo=${studyNo }'">새글 작성</button>
</div>
</section> 

<c:set var="manager" value="${manager }" />
	<c:choose>
		<c:when test="${manager }">
			<!-- 스터디 삭제 -->
			<button id="withdrawFromStudy" onclick="javascript:btnRemove_event()" style="float:right;margin:50px">스터디 폐쇄</button>
		</c:when>
		<c:otherwise>
			<button id="withdrawFromStudy" onclick="javascript:btnWD_event()">스터디탈퇴하기</button>
			
		</c:otherwise>
	</c:choose>
	 
	 
	 
	<script>
	//if(document.querySelector("#showList").innerText==''){
	//	console.log("True");
	//	document.querySelector("#showList").innerHTML="<tr><td colspan='7'>작성된 글이 없습니다.</td></tr>";
	//}
	
	
	</script>
	
	<!-- 스터디 수정 버튼을 누르면 폼이 전송됨 -->
	<form id="sujungStudy" method="get" action="sujungStudy">
		<input type="hidden" name="studyNo" value="${studyNo}" />
	</form>
	
	<script>
		function btnSujung_event(){
			document.getElementById("sujungStudy").submit();
		}
	</script>



	<!-- 삭제버튼 클릭 후 confirm에서 확인 누르면 아래 폼을 전송함. -->
	<form id="removeStudy" method="post" action="removeStudy">
		<input type="hidden" name="studyNo" value="${studyNo}" />
		<input type="hidden" name="userNo" value="${userNo}" />
	</form>

	<script>
		function btnRemove_event(){
			if(confirm("정말 삭제하시겠습니까?")==true){//확인
				console.log("확인");
				document.getElementById("removeStudy").submit();
			
			
				
			}else{
				console.log("취소");
				return false;
			}
		}
	</script>

<!-- 스터디 탈퇴 -->
	<form id="DoWithdrawal" method="post" action="withdraw">
		<input type="hidden" name="userNo" value="${userNo}" />
		<input type="hidden" name="studyNo" value="${studyNo}" />
		<input type="hidden" name="name" value=<%=name %> />
	</form>
	
	<script>
		function btnWD_event(){
			if(confirm("정말 탈퇴 하시겠습니까?\n탈퇴시 작성한 게시글과 댓글은 자동으로 삭제됩니다.")==true){//확인
				console.log("확인");
				document.getElementById("DoWithdrawal").submit();
			
			
				
			}else{
				console.log("취소");
				return false;
			}
		}
	</script>


<!-- <br /><br /><br /><br /> -->


	<script>
	
	$("#searchPostBtn").click(function(){
		$("#showData").empty();
		let str=""
		$.ajax({
			type:"get",
			url:"searchPost?userNo"+${userNo}+"&studyNo="+${studyNo}+"&page=1&searchPostOption="+$('#searchPostOption option:selected').val()+"&searchPostValue="+$('#searchPostValue').val(),
			datatype:"JSON",
			success:function(resultData){
				
				console.log(resultData);
				str="<table>";
				str+="<tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>수정</th><th>삭제</th></tr>";
				let count = 0;
				let list = resultData.datalist;
				str+="<div id='showList'>"
				$(list).each(function(idx,obj){
					console.log(obj.postNo);
					str+="<tr>";
					str+="<td>"+obj.postNo+"</td>";
					console.log(obj.postNo);
					
					str+="<td><a href="+'"'+"postDetail?postNo="+obj.postNo+"&cpage=1"+'"'+">"+obj.title+"</a href></td>";
					
					str+="<td>"+obj.name+"</td>";
		            str+="<td>"+obj.postTime+"</td>";
		            str+="<td>"+obj.views+"</td>";
		            
		            str+="</tr>";
		            console.log(str);
		            count++;
				});
				
				str+="</div></table>";
				console.log(str);
				if(count==0) {
					str="검색 결과가 없습니다";
					console.log("count:0");
				}
				
				$("#boardTable").html(str);
			},
			error:function(){
				alert("error")
				$("#showData").text("error");

			}
		})
		
	});
	
	
	
	</script>
	

	<div id="showData"></div>
</div>
</body>
</html>