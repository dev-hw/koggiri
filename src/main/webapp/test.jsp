<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>fhfhfhf</title>
<style>
.label_content {
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
}
.label_content input {
	display:none;
}
.label_content input + label {
	cursor:pointer;
}
.label_content input + label + div {
	width:300px;
	height:300px;
	background:#f5f5f5;
	border:1px solid #eee;
	position:absolute;
	top:100%;
	left:50%;
	transform:translate(-50%,-50%);
	transition:all .5s cubic-bezier(0.86, 0, 0.07, 1);
	opacity:0;
	visibility:hidden;
}
.label_content input + label + div > div {
	width:100%;
	height:100%;
	box-sizing:border-box;
	padding:20px;
	overflow-Y:scroll;
	}
.label_content input:checked + label + div {
	opacity:1;
	visibility:visible;
	top:50%;
}
.label_content input + label + div label {
	position:absolute;
	top:0;
	right:0%;
	transform:translate(50%,-50%);
	background:#333;
	color:#fff;
	padding:20px;
	border-radius:100%;
	cursor:pointer;
}
.label_content input + label + div label > span {
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	font-weight:900;
	font-size:20px;
}
</style>
</head>
<body>
<div class="label_content">
	<input type="checkbox" id="info">
	<label for="info">[약관보기]</label><!-- On 버튼 -->
	<div class="content"><!-- 컨텐츠 -->
		<div>
		
		</div>
		<label for="info"><span>x</span></label><!-- close 버튼 -->
	</div>
</div>
</body>
</html>