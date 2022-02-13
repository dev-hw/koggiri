<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
	h2{ text-align: center; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let insertBtn=document.querySelector("#move");
	insertBtn.addEventListener("click", moveIndex);
}

function moveIndex(){ 
	document.index.submit();
}


</script>
</head>
<body>

<div style="text-align: center;">
<h2>스터디 가입 신청이 정상적으로 되었습니다.</h2><br />
※스터디장이 가입 수락시 가입이 완료됩니다.

<br /><br />
<button id="move" class="w-50 btn btn-lg btn-secondary">메인 페이지로 돌아가기</button>

	<!-- 인덱스 페이지로 가면서 알림을 주기 위함 -->
	<form action="ssindex" method="get" name="index">
		<input type="hidden" name="state" value="${dto.state }">
		<input type="hidden" name="studyNo" value="${dto.studyNo }">
		<input type="hidden" name="applicant" value="${dto.applicant }">
		<input type="hidden" name="content" value="${dto.content }">
	</form>
	</div>
</body>
</html>