<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
	h2{ text-align: center; }
	div#wrapper{
		display: flex;
		height: 100vh;
		justify-content:center;
		align-items: center;
		
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
	 
	   let btnIns=document.querySelector("#btnIns");
	   btnIns.addEventListener("click", checkData);
	   
}
	   

function checkData(){
	if(frm.content.value==""){
		alert("내용을 입력해주세요");
	    frm.content.focus();
	    return;
	    event.preventDefault();
	    window.history.back();
	}else{
		frm.submit();
	}
}

</script>
</head>
<body>

<a href="javascript:history.back();">뒤로가기</a><br>

<div id="wrapper">

<form action="studysignup" method="post" name="frm" >
<!-- 가입신청하는 사람의 유저번호 받아서 파라미터로 넘기기 -->
<input type="hidden" name="namekey" value="${namekey }">
<input type="hidden" name="studyNo" value="${studyNo }">
<h2>스터디 가입하기</h2>
<br /><br />
<table>
   <tr>
      <td>본인을 어필해주세요~</td>
   </tr>
   
   <tr>
      <td style="text-align:top;">
      <!-- 텍스트를 왼쪽 상단부터 쓰고 싶은데 중간부터 작성하게 된다.. 추후에 고치면 될듯? -->
      	<textarea type="text" name="content" style="width:500px; height:100px;"></textarea>
      </td>
   </tr>
  
   <tr>
   
      <td ><br /><br />
         <br><input type="button" value="가입 신청하기" id="btnIns"  class="w-100 btn btn-lg btn-secondary" >
      </td>
   </tr>
</table>
</form>
</div>
</body>
</html>