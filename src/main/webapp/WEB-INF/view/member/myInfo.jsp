<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myInfo</title>
<style>
.container {
	width: 45%;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 20px;
}

.containerTitle {
	background-color: rgb(254, 251, 191);
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
	padding: 10px;
	padding-left: 20px;
	font-weight: bold;
}

form {
	width: 100%;
	padding: 10px;
}

form table {
	width: 100%;
	border-collapse: collapse;
}

form th {
	text-align: right;
	width: 20%;
	padding: 10px;
}

form td {
	padding: 10px;
}

input {
	width: 100%;
	border-radius: 20px;
	padding: 5px;
	border: 2px solid black;
}

select {
	width: 100%;
	padding: 5px;
	border-radius: 20px;
	border: 2px solid black;
}

.phone td {
	font-size: x-large;
}

.buttonTd {
	width: 15%;
}

.lastTd {
	width: 25%;
}

input[type="button"] {
	width: 100%;
	border: none;
	border: 2px solid black;
	color: black;
	background-color: rgb(226, 240, 217);
}

input:hover {
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: rgb(174, 220, 175);
}
</style>
<script>
function deleteMember() {
	if (confirm("정말로 탈퇴하시겠습니까?")) {
    	location.href="/member/delete";
    }
}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<div class="containerTitle">내정보</div>

		<form>
			<table>
				<tr>
					<th><label for="">아이디 💻</label></th>
					<td colspan="5"><input type="text"
						value="${memberSession.memberId}" disabled></td>
					<td rowspan="7" width="5%"></td>
				</tr>

				<tr>
					<th><label for="">이름 📰</label></th>
					<td colspan="5"><input type="text"
						value="${memberSession.name}" disabled></td>
				</tr>

				<tr>
					<th><label for="">학번 🏫</label></th>
					<td colspan="5"><input type="text"
						value="${memberSession.studentNumber}" disabled></td>
				</tr>

				<tr>
					<th><label for="">학과 📒</label></th>
					<td colspan="5"><select name="major" disabled>
							<option value="${memberSession.major}">${memberSession.major}</option>
					</select></td>
				</tr>

				<tr class="phone">
					<th>폰번호 📱</th>
					<td colspan="5"><input type="text"
						value="${memberSession.phone}" disabled></td>
				</tr>

				<tr>
					<th><label for="">생년월일 🎂</label></th>
					<td colspan="5"><input type="date" disabled
						value="<fmt:formatDate value='${memberSession.birth}' pattern='yyyy-MM-dd'/>">
					</td>
				</tr>

				<tr>
					<td colspan="3"></td>
					<td class="buttonTd"><input type="button"
						style="background-color: rgb(255, 186, 173);" value="탈퇴하기"
						onClick="deleteMember()"></td>
					<td class="buttonTd"><input type="button" value="뒤로 가기"
						onClick="location.href='/meeting/sort/all'"></td>
					<td class="lastTd"><input type="button" value="내 정보 수정하기📝"
						onClick="location.href='/member/myInfo/update'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>