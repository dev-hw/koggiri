<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>스터디조회</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Icon -->
<script src="https://kit.fontawesome.com/cc41398456.js"
	crossorigin="anonymous"></script>

<style type="text/css">/* Chart.js */
@
keyframes chartjs-render-animation {
	from {opacity: .99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms
}

.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1
}

.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0
}

.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0
}
.
</style>
</head>
<body id="page-top" class="">
	<%
		//로그인된 아이디가 있는지 확인
	String name = (String) session.getAttribute("namekey");
	int userNo = (Integer) session.getAttribute("userNo");
	%>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index.jsp">
				<div class="sidebar-brand-icon rotate-n-15"></div>
				<div class="sidebar-brand-text mx-3">KOGGIRI</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="javascript:void(0);" onclick="javascript:frm4.submit();">
					MY PAGE</a></li>
			<!-- 마이페이지 이동 -->
			<form action="mypage" method="post" name="frm4">
				<input type="hidden" name="userNo" value=${userNo}>
			</form>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">A</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <span>STUDY</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">우루롹끼</h6>
						<a class="collapse-item" href="javascript:void(0);"
							onclick="javascript:frm.submit();">스터디조회</a>
					</div>
				</div></li>

			<!-- 스터디 조회 페이지 이동 -->
			<form action="mystudyinfo" method="post" name="frm">
				<input type="hidden" name="userNo" value=${userNo}>
			</form>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">B</div>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <span>PROFILE</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">으갸갸갹</h6>
						<a class="collapse-item" href="check_password.jsp">회원정보수정</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">C</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <span>관리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">관리하거라</h6>
						<a class="collapse-item" href="javascript:void(0);" onclick="javascript:frm2.submit();">게시물관리</a> 
						<a class="collapse-item" href="javascript:void(0);" onclick="javascript:frm3.submit();">댓글관리</a> 
						<a class="collapse-item" href="alarmList?userNo=${userNo }">알림</a>
					</div>
				</div></li>

			<!-- 게시물 관리 페이지 이동 -->
			<form action="board" method="post" name="frm2">
				<input type="hidden" name="userNo" value=${userNo}> <input
					type="hidden" name="cpage" value=0>
			</form>

			<!-- 댓글 관리 페이지 이동 -->
			<form action="comments" method="post" name="frm3">
				<input type="hidden" name="userNo" value=${userNo}> <input
					type="hidden" name="cpage" value=0>
			</form>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<br>
			<br>
			<br>
			<br>
			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter"> <c:forEach
										var="tmp" items="${dto }">
										<c:set var="click" value="${tmp.click }" scope="session" />
										<c:choose>
											<c:when test="${click == 0}">
												<c:set var="i" value="${1+i }" />
											</c:when>
										</c:choose>
									</c:forEach> ${i }+
							</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">알림</h6>

								<c:forEach var="tmp" items="${dto }">
									<c:set var="click" value="${tmp.click }" scope="session" />
									<c:choose>
										<c:when test="${click == 0}">
											<div style="background-color: #cfe2ff;">
												<a class="dropdown-item d-flex align-items-center" href="#">
													<div class="mr-3">
														<div class="icon-circle bg-primary">
															<i class="fas fa-file-alt text-white"></i>
														</div>
													</div>
													<div>
														<span class="font-weight-bold"
															onclick="location.href='alarmform?formNo=${tmp.formNo}';">${tmp.name }님께서
															${tmp.studyName }에 가입 요청을 보냈습니다.</span>
													</div>
												</a>
											</div>
										</c:when>
										<c:otherwise>

											<div style="background-color: #e2e3e5;">
												<a class="dropdown-item d-flex align-items-center" href="#">
													<div class="mr-3">
														<div class="icon-circle bg-primary">
															<i class="fas fa-file-alt text-white"></i>
														</div>
													</div>
													<div>
														<span class="font-weight-bold"
															onclick='alert("이미 처리되었습니다.")'>${tmp.name }님께서
															${tmp.studyName }에 가입 요청을 보냈습니다.</span>
													</div>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<a class="dropdown-item text-center small text-gray-500"
									href="alarmList?userNo=${userNo }">Show All Alerts</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"><b><%=name%></b>
									님 환영합니다</span>&nbsp;

						</a> 
						
						 <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
						</li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">스터디 조회</h1>
					</div>
					<hr />

					<a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
						class="icon text-white-50"> </span> <span class="text"
						id="memberStudy">가입 스터디</span>
					</a> <a href="#" class="btn btn-primary btn-icon-split btn-lg"> <span
						class="icon text-white-50"> </span> <span class="text"
						id="managerStudy">운영 스터디</span>
					</a>
					<!--<button id="managerStudy" onclick = "location.href='mypageNew?userNo=${userNo}&memberOrManager=manager'">가입 중인 스터디</button>-->
					<hr />


					<script>

document.querySelector("#memberStudy").addEventListener("click",member)
document.querySelector("#managerStudy").addEventListener("click",manager)

 
function member(){
	 $("#showStudy").empty();
		member1();
	}
	
function member1(){
	let str="";
	$.ajax({
		type:"get",
		url:"mypageNew?userNo="+${userNo }+"&memberOrManager=member",
		dataType:"json",
		
		success:function(Data){
			console.log(Data);
			let count = 0;
			let list = Data.datalist;
			console.log(list);
			$(list).each(function(idx,obj){
				let href = 'studyboard?studyNo='+obj.studyNo+'&page=1'+"'"+'"';
				str+="<button onclick="+ '"location.href=' +"'"+href+">"+obj.studyName+obj.language+obj.nowPeopleNum+"/"+obj.maxPeopleNum+"</button><br/>";
				console.log(str);
				count++;				
			});
			if(count==0) str="가입 중인 스터디가 없습니다.";
			$("#showStudy").html(str);
		},
		error:function(){
			alert("error")
			$("#showStudy").text("error");
		}
	})
}
 
 function manager(){
		$("#showStudy").empty();
		manager1();
	} 
 
 function manager1(){
	 let str="";
		$.ajax({
			type:"get",
			url:"mypageNew?userNo="+${userNo }+"&memberOrManager=manager",
			dataType:"json",
			
			success:function(Data){
				console.log(Data);
				let count = 0;
				let list = Data.datalist;
				
				console.log(list);
				$(list).each(function(idx,obj){
					let href = 'studyboard?studyNo='+obj.studyNo+'&page=1'+"'"+'"';	
					str+="<button onclick="+ '"location.href=' +"'"+href+">"+obj.studyName+obj.language+obj.nowPeopleNum+"/"+obj.maxPeopleNum+"</button><br/>";
					console.log(str);
					count++;				
				});
				
				if(count==0) str="운영 중인 스터디가 없습니다.";
				$("#showStudy").html(str);
			},
			error:function(){
				alert("error")
				$("#showStudy").text("error");
			}
		})
 }
</script>
					<div id="showStudy"></div>
				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"
				style="display: none;"> <i class="fas fa-angle-up"></i>
			</a>

			<!-- Logout Modal-->
			<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">떠나실 건가요?</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button"
								data-dismiss="modal">아니요</button>
							<a class="btn btn-primary" href="logout">떠날게요</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Bootstrap core JavaScript-->
			<script src="resources/vendor/jquery/jquery.min.js"></script>
			<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="resources/js/sb-admin-2.min.js"></script>

			<!-- Page level plugins -->
			<script src="resources/vendor/chart.js/Chart.min.js"></script>

			<!-- Page level custom scripts -->
			<script src="resources/js/demo/chart-area-demo.js"></script>
			<script src="resources/js/demo/chart-pie-demo.js"></script>
</body>
</html>