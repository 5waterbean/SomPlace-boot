<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
* {
	box-sizing: border-box;
}

html {
	height: 100%;
}

body {
	margin: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

h1 {
	text-align: center;
}

.container {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	border-radius: 20px;
	background-color: rgb(254, 251, 191);
	height: 330px;
	width: 50%;
}

form {
	width: 50%;
}

table {
	width: 100%;
}

th {
	font-size: xx-large;
}

td {
	font-size: large;
	padding: 10px;
	text-align: right;
}

input {
	width: 100%;
	border-radius: 20px;
	padding: 7px;
	font-size: large;
}

input[type="submit"], input[type="button"] {
	border: none;
	background-color: rgb(114, 182, 91);
	color: white;
}

input:hover {
	cursor: pointer;
}

input[type="submit"]:hover, input[type="button"]:hover {
	background-color: rgb(148, 227, 149);
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function login() {
		if (loginFrm.memberId.value == "") {
			alert("ID를 입력하십시오.");
			loginFrm.customerId.focus();
			return false;
		}
		if (loginFrm.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			loginFrm.password.focus();
			return false;
		}
		loginFrm.submit();
	}
</script>
</head>

<body>
	<h1>솜솜이 놀이터</h1>

	<div class="container">
		<img src="../img/somsom.png" alt="" width="200px" height="200px">
		<form:form name="loginFrm" action="/member/login" method="post">
			<table>
				<tr>
					<th colspan="3">LOGIN</th>
				</tr>

				<tr>
					<td><label for="">아이디</label></td>
					<td colspan="2"><input type="text" id="memberId"
						name="memberId" /></td>
				</tr>

				<tr>
					<td><label for="">비밀번호</label></td>
					<td colspan="2"><input type="password" id="password"
						name="password" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="button" value="회원가입"></td>
					<td><input type="button" value="로그인" onClick="login()"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>

</html>