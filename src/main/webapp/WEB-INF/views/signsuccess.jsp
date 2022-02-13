<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- sign-in -->
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/style.css" rel="stylesheet" />

<!-- css login -->
<link href="resources/css/log_sign.css" rel="stylesheet" />

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

.div {
	margin: 15px;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>

</head>
<body class="text-center">
	<main class="form-signin">
		<img class="mb-4" src="resources/img/logo/파랑코끼리.png" alt=""
			width="100" height="100">

		<h1 class="h3 mb-3 fw-normal">환영합니다!</h1>

		${name }님, 회원가입을 축하합니다. <br> 코끼리의 새로운 아이디는 <br> ${id }입니다.

		<br><br><br><br>
		<div class="form-floating" style="line-height: 60%">
		<a href="index.jsp">
			<button class="w-100 btn btn-lg btn-primary" type="button"
				value="시작하기">
				시작하기
			</button>
		</a>
		</div>
</body>
</html>