<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

window.onload=function(){
	let btnName=document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
}

function checkName(){
	   let useName=document.querySelector(".nName").value;
	   //alert(useName);
	   $.ajax({
	      url:"useName",
	      type:"post",
	      dataType:"json",
	      data:{useName:useName},
	      success: function(data){
	         name=0;
	         if(data.result=="y"){
	        	 if(document.querySelector("#nName").value.length>document.querySelector("#nName").size){
	            	   alert("닉네임을 20글자 이내로 입력해주세요");
	            	      frm.nName.focus();
	            	      return;
	               }
	            if(useName==""){
	               alert("닉네임을 입력하세요");
	               frm.nName.focus();
	            }else{
	               if(confirm("사용할 수 있는 닉네임입니다.\n사용하시겠습니까?")===true){
	            	   
	            	   let nName=document.frm.nName.value;
	            	   window.opener.inputName(nName);
	            	   self.close();
	               }
	                 
	            }
	         }else if((data.result=="n")){
	            alert("사용할 수 없는 닉네임입니다.");
	         }
	      },
	      error:function(){
	         alert("에러 발생");
	      }
	      
	   });
	   
	}



</script>
</head>
<body>
<%
	//로그인된 아이디가 있는지 확인
	int userNo = (Integer) session.getAttribute("userNo");
%>
<center style="margin-top:150px;">
	<h2>닉네임 변경</h2>
	<br><br>
	<!-- 닫기버튼 클릭시 아래 폼을 전송함 -->
	<form action="close.jsp" method="post">
	</form>
	
	
	<!-- 팝업창에 닉네임을 사용하겠냐는 질문 confirm에서 확인 클릭시 아래 폼을 전송함. -->
	<form id="modify2" method="post" action="modify2" name="frm">
	<input type="hidden" name="userNo" value=<%=userNo %>>
		닉네임
		<input type="text" name="nName" id="nName" class="nName">
		<input type="button" value="중복확인" id="btnName">
		
	</form>
	<br>
	
	<input type="button" value="닫기" onclick="location.href='close.jsp'"></button>
	</center>
</body>
</html>