<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//로그인된 아이디가 있는지 확인
	int userNo = (Integer) session.getAttribute("userNo");
%>
<script>
alert("수정이 완료되었습니다!");
location.href="index.jsp";
</script>
</head>
<body>

</body>
</html>