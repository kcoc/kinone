<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 찾기</title>
</head>
<style>
* {
	box-sizing: border-box;
}
.pagetitle {
	width: 100%;
	height: 100px;
	/* border: 1px solid red; */
	text-align: left;
	margin-top: 20px;
	padding: 0 20px;
	font-family: Jua;
}
.pagetitle > span {
	color: white;
	font-size: 25pt;
	line-height: 120px;
}

body {
	background-color: #f1f1f1;
}

#regForm {
	background-color: #ffffff;
	margin: 100px auto;
	font-family: Righteous;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input {
	padding: 10px;
	width: 100%;
	font-size: 17px;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}


#prevBtn {
	background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbbbbb;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #4CAF50;
}

.pagetitle {
	background-color: green;
}
hr {
	margin: 20px 0 30px 0;
}
</style>
<body>

<div class="pagetitle"><span>K In One 이메일 찾기</span></div>
<br>

<form action="/kinone/emailfind.do" method="post">
	<div class="tab2">
		<h3>가입 정보 입력</h3>
		<p>
			<input placeholder="가입당시 이름을 입력해주세요" id="register_email"
				 name="mname">
		</p>
		<p>
			<input type=date	 name="mbirthdate1" >
		</p>
	</div>

<input type="submit" id="prevBtn3" value="확인">
<input type="button" id="nextBtn3" value="취소" onclick="close()">
</form>

</body>
</html>

