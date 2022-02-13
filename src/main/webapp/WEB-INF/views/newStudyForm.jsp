<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<style>
	h2,btn{ text-align: center; }
#wrapper{ margin: 50px;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>

//스터디 중복 확인하기 위함
let name=0;

window.onload = function(){
	
	name=0;
	
	let btnIns = document.querySelector("#btnIns");
	btnIns.addEventListener("click", checkData);
	
	//스터디 중복확인하기
	let btnName = document.querySelector("#btnName");
	btnName.addEventListener("click", checkName);
		
	//목록으로 가기
	let moveHome=document.querySelector("#moveHome");
	moveHome.addEventListener("click", moveHome1);
	
	//name 이라는 id를 가진 name input에 keyup이벤트가 발생하면
	$("#studyName").keyup(function(){
	   name=0;
	})
		
}
	
function checkName(){
	   let studyName=document.querySelector("#studyName").value;
	   //alert(useName);
	   $.ajax({
	      url:"usestudyName",
	      type:"post",
	      dataType:"json",
	      data:{studyName:studyName},
	      success: function(data){
	         name=0;
	         if(data.result=="y"){
	        	 if(document.querySelector("#studyName").value.length>document.querySelector("#studyName").size){
	            	   alert("스터디명을 30글자 이내로 입력해주세요");
	            	      frm.name.focus();
	            	      return;
	               }
	        	 
	        	 
	            if(studyName==""){
	               alert("스터디명을 입력하세요");
	               frm.name.focus();
	            }else{
	               alert("사용할 수 있는 스터디명 입니다.\n스터디명은 변경이 불가합니다.");
	                 name=1; 
	            }
	         }else if(data.result=="n"){
	            alert("사용할 수 없는 스터디명 입니다.");
	         }
	      },
	      error:function(){
	         alert("에러 발생");
	      }
	      
	   });
	   
	}
	
	function moveHome1(){
		document.home.submit();
		return;
	}
	
	function checkData(){
		if($('input[name=languageChk]:checked').length==0){
			alert("스터디 언어를 선택해주세요");
			return;
		}
		if(frm.studyName.value === ""){
			alert("스터디명을 입력하세요");
			frm.studyName.focus();
			return;
		}
		
		if(name===0){
		      alert("스터디명 중복확인을 해주세요.");
		      return;
		}
		
		if(frm.content.value === ""){
			alert("스터디 소개를 적어주세요");
			frm.content.focus();
			return;
		}
		
		if(frm.maxPeopleNum.value === ""){
			alert("모집인원을 입력하세요");
			frm.maxPeopleNum.focus();
			return;
		}else{
			let str=frm.maxPeopleNum.value;
			let cond=/[^0-9]/g;
			let result=cond.test(str);
			if(result){
				alert("숫자를 입력하세요")
				frm.maxPeopleNum.focus();
				return;
			}
		}
		if(frm.maxPeopleNum.value>20){
			alert("최대 모집인원은 20명 입니다");
			frm.maxPeopleNum.focus();
			return;
		}
		
		var str = $('#textarea').val();
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#textarea').val(str);
		
		frm.submit()
	}
	
</script>
</head>
<body>
<!-- 
<input type="button" value="목 록" id="moveHome" class="w-10 btn btn-lg btn-secondary">
<br /><br />
<form action="newStudyForm" method="post" name="frm">
	<input type="hidden" id="manager_userNo" name="manager_userNo" value="${manager_userNo }"/>
		<table >
			<tr>
				<td>스터디명</td>
				<td><input type="text" name="studyName"></td>
			</tr>
			<tr>
					<td>스터디 언어 선택</td>
					<td>
					<input type="checkbox" name="languageChk" id="languageChk1" value="NODEJS">node.js
					<input type="checkbox" name="languageChk" id="languageChk2" value="PYTHON">파이썬
					<input type="checkbox" name="languageChk" id="languageChk3" value="JAVA">자바
					<input type="checkbox" name="languageChk" id="languageChk4" value="JAVASCRIPT">자바스크립트
					<input type="checkbox" name="languageChk" id="languageChk5" value="SPRING">스프링
					<input type="checkbox" name="languageChk" id="languageChk6" value="KOTLIN">코틀린
					</td>
			</tr>
			<tr>
				<td>모집인원</td>
				<td><input type="text" name="maxPeopleNum"></td>
			</tr>
			<tr>
				<td>스터디소개</td>
				<td><textarea rows="5" cols="50" name="content"  style="height: 100px" id="textarea"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><br />
					<input type="button" value="등 록" id="btnIns" class="w-100 btn btn-lg btn-secondary">
				</td>
			</tr>
		</table>
	</form>
	 -->
	 
<div id="wrapper">
<input type="button" value="목 록" id="moveHome" class="w-10 btn btn-lg btn-secondary">
<br /><br />

<h2>스터디 생성</h2>
<br />
<form action="newStudyForm" method="post" name="frm">
	<input type="hidden" id="manager_userNo" name="manager_userNo" value="${manager_userNo }"/>
	<div class="form-floating">
		<input type="text" name="studyName" class="form-control" id="studyName" >
		<label for="studyName">스터디명</label>
		<input type="button" id="btnName" value="중복확인">
	</div>
	<br />
	<div class="form-floating">
		<textarea class="form-control" name="content" placeholder="스터디 설명을 적어주세요." id="textarea" style="height: 100px"></textarea>
		<label for="textarea">스터디소개</label>
	</div>
	<br />
	스터디 언어 선택
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk1" value="NODEJS">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">node.js</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk2" value="PYTHON">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">파이썬</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk3" value="JAVA">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk4" value="JAVASCRIPT">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">자바스크립트</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk5" value="SPRING">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">스프링</label>
	</div>
	<div class="form-check">
		<input type="checkbox" name="languageChk" id="languageChk6" value="KOTLIN">
		<label class="form-check-label checkbox-inline" for="flexCheckDefault">코틀린</label>
	</div>
	<br />
	<div class="form-floating mb-3">
		<input type="text" name="maxPeopleNum"  class="form-control" id="maxPeopleNum">
		<label for="maxPeopleNum">모집인원</label>
	</div>
	<br />
	<input type="button" value="등 록" id="btnIns" class="w-25 btn btn-lg btn-secondary" style="display: block; margin: auto;">
	</form>
</div>
	<!-- 로그인 안되어있을때 로그인 페이지로 이동하기 위함 -->
	<form action="home" method="get" name="home">
	</form>
	
</body>
</html>