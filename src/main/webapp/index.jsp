<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SEO Meta Tags -->
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

<!-- Favicon  -->
<link rel="icon" href="resources/images/favicon.png">
<!-- Icon -->
<script src="https://kit.fontawesome.com/cc41398456.js"
	crossorigin="anonymous"></script>
</head>

<body data-spy="scroll" data-target=".fixed-top">
	<a href="body" class="back-to-top page-scroll" style="display: none;">Back
		to Top</a>

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
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
					<li class="nav-item"><a class="nav-link page-scroll active"
						href="#header">HOME <span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link page-scroll"
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
						href="faq.jsp">FAQ</a>
					</li>
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


	<!-- 마이페이지 이동 -->
	<form action="mypage" method="post" name="frm">
		<input type="hidden" name="userNo" value=${userNo}>
	</form>

	<!-- Header -->
	<header id="header" class="header">
		<div class="header-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-xl-5">
						<div class="text-container">
							<h1>
								다같이 모여서 <br> 코딩해요!&nbsp;<i class="fa-solid fa-comments"></i>
							</h1>
							<p class="p-large">PICK UP YOUR STUDY</p>
							<a class="btn-solid-lg page-scroll" href="signup">코끼리 시작하기</a>
						</div>
						<!-- end of text-container -->
					</div>
					<!-- end of col -->
					<div class="col-lg-6 col-xl-7">
						<div class="image-container">
							<div class="img-wrapper">
								<div class="frame">
									<div class="center">
										<div class="circle">
											<div class="sky"></div>
											<div class="sun"></div>
											<div class="side-left"></div>
											<div class="side-right"></div>
											<div class="shadow"></div>
											<div class="ground"></div>
										</div>
									</div>
								</div>
							</div>
							<!-- end of img-wrapper -->
						</div>
						<!-- end of image-container -->
					</div>
					<!-- end of col -->
				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->
		</div>
		<!-- end of header-content -->
	</header>
	<!-- end of header -->
	<svg class="header-frame" data-name="Layer 1"
		xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"
		viewBox="0 0 1920 310">
        <defs>
            <style>
.cls-1 {
	fill: #185ADB;
}
</style>
        </defs>
        <title>header-frame</title>
        <path class="cls-1"
			d="M0,283.054c22.75,12.98,53.1,15.2,70.635,14.808,92.115-2.077,238.3-79.9,354.895-79.938,59.97-.019,106.17,18.059,141.58,34,47.778,21.511,47.778,21.511,90,38.938,28.418,11.731,85.344,26.169,152.992,17.971,68.127-8.255,115.933-34.963,166.492-67.393,37.467-24.032,148.6-112.008,171.753-127.963,27.951-19.26,87.771-81.155,180.71-89.341,72.016-6.343,105.479,12.388,157.434,35.467,69.73,30.976,168.93,92.28,256.514,89.405,100.992-3.315,140.276-41.7,177-64.9V0.24H0V283.054Z">
        </path>
    </svg>

    <!-- end of header -->


    <!-- Customers -->
    <div class="slider-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <!-- Image Slider -->
                    <div class="slider-container">
                        <div class="swiper-container image-slider swiper-container-horizontal">
                            <div class="swiper-wrapper"
                                style="transform: translate3d(-1670.4px, 0px, 0px); transition-duration: 0ms;">
                                <div class="swiper-slide swiper-slide-duplicate"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="1">
                                    <img class="img-fluid" src="resources/images/javascript02.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
                                    data-swiper-slide-index="2" style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/kotlin03.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                                    data-swiper-slide-index="3" style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/node.js04.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="4">
                                    <img class="img-fluid" src="resources/images/python05.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="5">
                                    <img class="img-fluid" src="resources/images/spring06.png" alt="alternative">
                                </div>
                                <div class="swiper-slide" style="width: 178.8px; margin-right: 30px;"
                                    data-swiper-slide-index="0">
                                    <img class="img-fluid" src="resources/images/java01.png" alt="alternative">
                                </div>
                                <div class="swiper-slide" style="width: 178.8px; margin-right: 30px;"
                                    data-swiper-slide-index="1">
                                    <img class="img-fluid" src="resources/images/javascript02.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="2"
                                    style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/kotlin03.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="3"
                                    style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/node.js04.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-next" style="width: 178.8px; margin-right: 30px;"
                                    data-swiper-slide-index="4">
                                    <img class="img-fluid" src="resources/images/python05.png" alt="alternative">
                                </div>
                                <div class="swiper-slide" style="width: 178.8px; margin-right: 30px;"
                                    data-swiper-slide-index="5">
                                    <img class="img-fluid" src="resources/images/spring06.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="0">
                                    <img class="img-fluid" src="resources/images/java01.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="1">
                                    <img class="img-fluid" src="resources/images/javascript02.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
                                    data-swiper-slide-index="2" style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/kotlin03.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                                    data-swiper-slide-index="3" style="width: 178.8px; margin-right: 30px;">
                                    <img class="img-fluid" src="resources/images/node.js04.png" alt="alternative">
                                </div>
                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"
                                    style="width: 178.8px; margin-right: 30px;" data-swiper-slide-index="4">
                                    <img class="img-fluid" src="resources/images/python05.png" alt="alternative">
                                </div>
                            </div> <!-- end of swiper-wrapper -->
                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        </div> <!-- end of swiper container -->
                    </div> <!-- end of slider-container -->
                    <!-- end of image slider -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of slider-1 -->
    <!-- end of customers -->


    <!-- Description -->
    <div class="cards-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="above-heading">DIRECTION</div>
                    <h2 class="h2-heading">NO PAIN NO GAIN</h2>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Card -->
                    <div class="card">
                        <div class="card-image">
                            <img class="img-fluid" src="resources/images/description-1.png" alt="alternative">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">소통</h4>
                            <p>알고있는 것과 모르는 것을 다른 사람들과 소통하면서 공유할 수 없을까?</p>
                        </div>
                    </div>
                    <!-- end of card -->

                    <!-- Card -->
                    <div class="card">
                        <div class="card-image">
                            <img class="img-fluid" src="resources/images/description-2.png" alt="alternative">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">능력</h4>
                            <p>개발자는 평생 공부하는 직업이라고 하는데 나의 능력을 더 키워보고 싶은걸...</p>
                        </div>
                    </div>
                    <!-- end of card -->

                    <!-- Card -->
                    <div class="card">
                        <div class="card-image">
                            <img class="img-fluid" src="resources/images/description-3.png" alt="alternative">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">커리어</h4>
                            <p>포트폴리오에 추가할 미니 프로젝트를 하고 싶은데 나혼자 하는 것 보다 
                                다른 사람들과 함께 해보고 싶은데...</p>
                        </div>
                    </div>
                    <!-- end of card -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->


    <!-- Features -->
    <div id="features" class="tabs">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="above-heading">FEATURES</div>
                    <h2 class="h2-heading">HOW?</h2>
                    <p class="p-heading">코끼리를 이용하는 방법을 소개합니다! <br>
                    </p>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Tabs Links -->
                    <ul class="nav nav-tabs" id="argoTabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab"
                                aria-controls="tab-1" aria-selected="true"><i class="fa-solid fa-desktop"></i>&nbsp; Hello World!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-2" data-toggle="tab" href="#tab-2" role="tab"
                                aria-controls="tab-2" aria-selected="false"><i class="fa-solid fa-magnifying-glass"></i>&nbsp; FINDING STUDY</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-3" data-toggle="tab" href="#tab-3" role="tab"
                                aria-controls="tab-3" aria-selected="false"><i class="fa-solid fa-door-open"></i>&nbsp; ENJOY KOGGIRI</a>
                        </li>
                    </ul>
                    <!-- end of tabs links -->

                    <!-- Tabs Content -->
                    <div class="tab-content" id="argoTabsContent">

                        <!-- Tab -->
                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="image-container">
                                        <img class="img-fluid" src="resources/images/Hello World-001.png" alt="alternative">
                                    </div> <!-- end of image-container -->
                                </div> <!-- end of col -->
                                <div class="col-lg-6">
                                    <div class="text-container">
                                        <h2>Hello Word!</h2>
                                        <p>코딩을 처음 하시는 분들이 처음으로 발자국을 찍게 되는 Hello World! 
                                            코끼리 홈페이지에 접속하시고 홈페이지에서 가이드를 읽으신 후<br> 
                                            코끼리 이용을 위한 로그인/회원가입을 해주세요.<br>
                                            <a class="blue page-scroll" href="signup">Sign Up Form</a> 
                                        </p>
                                        <ul class="list-unstyled li-space-lg">
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">홈페이지의 가이드 읽기</div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">로그인/회원가입
                                                </div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">스터디 이용</div>
                                            </li>
                                        </ul>
                                        <a class="btn-solid-reg popup-with-move-anim"
                                            href="#details-lightbox-1">CLICK</a>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->

                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="image-container">
                                        <img class="img-fluid" src="resources/images/Hello World-002.png" alt="alternative">
                                    </div> <!-- end of image-container -->
                                </div> <!-- end of col -->
                                <div class="col-lg-6">
                                    <div class="text-container">
                                        <h2>FINDING STUDY</h2>
                                        <p>로그인을 해주신 여러분 축하드립니다!<i class="fa-solid fa-hands-clapping"></i><br>
                                        공부를 위한 멋진 한 걸음을 내딛은 여러분은 이제 다른 분들과 함께 <br>스터디를
                                    진행하게 될 거예요! </p>
                                        <ul class="list-unstyled li-space-lg">
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">로그인 후 상단 카테고리 목록 중 스터디를 눌러주세요.</div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">원하시는 언어를 골라주세요! 직접 스터디를 만들 수도 있어요!</div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">스터디의 멤버나 리더가 되어서 스터디활동을 해보세요!</div>
                                            </li>
                                        </ul>
                                        <a class="btn-solid-reg popup-with-move-anim"
                                            href="#details-lightbox-2"> CLICK</a>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->

                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="image-container">
                                        <img class="img-fluid" src="resources/images/Hello-World-003.png" alt="alternative">
                                    </div> <!-- end of image-container -->
                                </div> <!-- end of col -->
                                <div class="col-lg-6">
                                    <div class="text-container">
                                        <h3>ENJOY KOGGIRI</h3>
                                        <p>스터디를 직접 만들어 보거나 가입 하셨나요? 훌륭합니다! <br>
                                        코끼리에서는 스터디 활동뿐만 아니라 취업을 위한 취업사이트를<br>
                                    살펴보거나, 스터디를 위해 주변의 스터디룸을 찾아볼 수 있습니다. <br>
                                    코끼리를 통하여 원하시는 목적 달성을 응원합니다!</p>
                                        <ul class="list-unstyled li-space-lg">
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">각종 취업사이트를 한 곳에서 바로 이동해보세요!
                                                    </div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">스터디원들과 만나기위한 스터디룸을 지도에서 찾아보세요!</div>
                                            </li>
                                            <li class="media">
                                                <i class="fas fa-square"></i>
                                                <div class="media-body">코끼리를 통하여 편리하고 즐거운 스터디를 해보세요!</div>
                                            </li>
                                        </ul>
                                        <a class="btn-solid-reg popup-with-move-anim"
                                            href="#details-lightbox-3">CLICK</a>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->

                    </div> <!-- end of tab content -->
                    <!-- end of tabs content -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of tabs -->
    <!-- end of features -->


    <!-- Details Lightboxes -->
    <!-- Details Lightbox 1 -->
    <div id="details-lightbox-1" class="lightbox-basic zoom-anim-dialog mfp-hide">
        <div class="container">
            <div class="row">
                <button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
                <div class="col-lg-8">
                    <div class="image-container">
                        <img class="img-fluid" src="resources/images/detail-001.png" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-4">
                    <h3>간편한 회원가입</h3>
                    <hr>
                    <h5>Core service</h5>
                    <p>코끼리에서는 간편한 회원가입을 통하여 스터디를 할 수 있습니다.<br>
                    회원가입시에는 개인정보를 요구하지 않으니 걱정말고 가입하세요! :)</p>
                    <ul class="list-unstyled li-space-lg">
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Automate user signup</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Quick formatting tools</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Fast email checking</div>
                        </li>
                    </ul>
                    <a class="btn-solid-reg mfp-close" href="signup">SIGN UP</a> <a
                        class="btn-outline-reg mfp-close as-button" href="#screenshots">닫기</a>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of lightbox-basic -->
    <!-- end of details lightbox 1 -->

    <!-- Details Lightbox 2 -->
    <div id="details-lightbox-2" class="lightbox-basic zoom-anim-dialog mfp-hide">
        <div class="container">
            <div class="row">
                <button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
                <div class="col-lg-8">
                    <div class="image-container">
                        <img class="img-fluid" src="resources/images/details-lightbox.png" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-4">
                    <h3>스터디 멤버 VS 스터디 리더</h3>
                    <hr>
                    <h5>Core service</h5>
                    <p>마음에 드는 스터디도 많지만 직접 원하는 스터디를 만들어서<br>
                    운영해보는 것도 또다른 성취일거예요!</p>
                    <ul class="list-unstyled li-space-lg">
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Automate user signup</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Quick formatting tools</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Fast email checking</div>
                        </li>
                    </ul>
                    <a class="btn-solid-reg mfp-close" href="signup">SIGN UP</a> <a
                        class="btn-outline-reg mfp-close as-button" href="#screenshots">닫기</a>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of lightbox-basic -->
    <!-- end of details lightbox 2 -->

    <!-- Details Lightbox 3 -->
    <div id="details-lightbox-3" class="lightbox-basic zoom-anim-dialog mfp-hide">
        <div class="container">
            <div class="row">
                <button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
                <div class="col-lg-8">
                    <div class="image-container">
                        <img class="img-fluid" src="resources/images/details-lightbox.png" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-4">
                    <h3>취업도 하고싶지만 공부도 하고싶다...!</h3>
                    <hr>
                    <h5>Core service</h5>
                    <p>다들 공부를 위하여 스터디에 가입하지만 개인마다 구체적인
                        목적이나 이유는 다를거예요. 모든이의 맘에 들기를 바라면서
                        채용이 목적이라면 채용사이트를, 소통을 원하면 스터디룸 찾기를
                        이용하면서 항상 즐거운 코딩을 하기를 바랍니다!
                    </p>
                    <ul class="list-unstyled li-space-lg">
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Automate user signup</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Quick formatting tools</div>
                        </li>
                        <li class="media">
                            <i class="fas fa-square"></i>
                            <div class="media-body">Fast email checking</div>
                        </li>
                    </ul>
                    <a class="btn-solid-reg mfp-close" href="signup">SIGN UP</a> <a
                        class="btn-outline-reg mfp-close as-button" href="#screenshots">닫기</a>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of lightbox-basic -->
    <!-- end of details lightbox 3 -->
    <!-- end of details lightboxes -->


    <!-- Details -->
    <div id="details" class="basic-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="text-container">
                        <h1>자, 시간이 되었습니다. <br>코끼리를 시작해봅시다!</h1>
                        <br><br>
                    <a class="btn-solid-reg page-scroll" href="signup">SIGN UP</a>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6">
                    <div class="image-container">
                        <img class="img-fluid" src="resources/images/start.png" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->


    <!-- Video -->
    <div id="video" class="basic-2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <!-- Video Preview -->
                    <div class="image-container">
                        <div class="video-wrapper">
                            <a class="popup-youtube" href="https://www.youtube.com/watch?v=fLCjQJCekTs"
                                data-effect="fadeIn">
                                <img class="img-fluid" src="resources/images/video.png" alt="alternative">
                                <span class="video-play-button">
                                    <span></span>
                                </span>
                            </a>
                        </div> <!-- end of video-wrapper -->
                    </div> <!-- end of image-container -->
                    <!-- end of video preview -->

                    <div class="p-heading"></div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-2 -->
    <!-- end of video -->



    <!-- Testimonials -->
    <div class="slider-2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="above-heading">FEATURES</div>
                    <h2 class="h2-heading" id="h2-center">TEAM</h2>
                    <br><br>

                    <!-- Text Slider -->
                    <div class="slider-container">
                        <div class="swiper-container text-slider swiper-container-horizontal">
                            <div class="swiper-wrapper"
                                style="transform: translate3d(-1886px, 0px, 0px); transition-duration: 0ms;">
                                <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3"
                                    style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/kakao.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">BackEnd Developer</div>
                                    </div> <!-- end of text-wrapper -->
                                </div>

                                <!-- Slide -->
                                <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="0"
                                    style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/naver.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">BackEnd Developer/Team Leader</div>
                                        <div class="testimonial-author">이유경</div>
                                    </div> <!-- end of text-wrapper -->
                                </div> <!-- end of swiper-slide -->
                                <!-- end of slide -->

                                <!-- Slide -->
                                <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="1"
                                    style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/carrot.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">BackEnd Developer</div>
                                        <div class="testimonial-author">임지윤</div>
                                    </div> <!-- end of text-wrapper -->
                                </div> <!-- end of swiper-slide -->
                                <!-- end of slide -->

                                <!-- Slide -->
                                <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="2"
                                    style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/kakao.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">FrontEnd Developer
                                        </div>
                                        <div class="testimonial-author">우혜지</div>
                                    </div> <!-- end of text-wrapper -->
                                </div> <!-- end of swiper-slide -->
                                <!-- end of slide -->

                                <!-- Slide -->
                                <div class="swiper-slide" data-swiper-slide-index="3" style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/woo-ah.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">BackEnd Developer</div>
                                        <div class="testimonial-author">이혜원</div>
                                    </div> <!-- end of text-wrapper -->
                                </div> <!-- end of swiper-slide -->
                                <!-- end of slide -->

                                <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev"
                                    data-swiper-slide-index="0" style="width: 943px;">
                                    <div class="image-wrapper">
                                        <img class="img-fluid" src="resources/images/naver.png" alt="alternative">
                                    </div> <!-- end of image-wrapper -->
                                    <div class="text-wrapper">
                                        <div class="testimonial-text">BackEnd Developer</div>
                                        <div class="testimonial-author">...</div>
                                    </div> <!-- end of text-wrapper -->
                                </div>
                            </div> <!-- end of swiper-wrapper -->

                            <!-- Add Arrows -->
                            <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"></div>
                            <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide">
                            </div>
                            <!-- end of add arrows -->

                            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                        </div> <!-- end of swiper-container -->
                    </div> <!-- end of slider-container -->
                    <!-- end of text slider -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of slider-2 -->
    <!-- end of testimonials -->


    <!-- Newsletter -->
    <div class="form">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                        <div class="above-heading"></div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of form -->
    <!-- end of newsletter -->



    <!-- Scripts -->
    <script src="resources/js/jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
    <script src="resources/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="resources/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="resources/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="resources/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="resources/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="resources/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="resources/js/scripts.js"></script> <!-- Custom scripts -->


</body>

</html>