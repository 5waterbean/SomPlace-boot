<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
	width: 25%;
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

.noChange {
	background-color: rgb(235, 235, 235);
}

.updateTd {
	width: 15%;
}

.cancelTd {
	width: 15%;
}

input[type="submit"] {
	width: 100%;
	border: none;
	border: 2px solid black;
	color: black;
	background-color: rgb(226, 240, 217);
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

input[type="button"]:hover {
	background-color: rgb(174, 220, 175);
}
</style>

<script>
	function updateMember(form) {
		var pw = document.querySelector('input[name="pw"]').value;
		var pwConfirm = document.querySelector('input[name="pwConfirm"]').value;
		
		if (pw != pwConfirm) {
			alert("비밀번호를 다시 확인해주세요.");
			return false;
		}
	}	
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<div class="containerTitle">내정보</div>

		<form:form modelAttribute="memberCommand" action="/member/myInfo/update" onsubmit="return updateMember(this)">
			<table>
				<tr>
					<th><label for="">아이디 💻</label></th>
					<td colspan="5"><input class="noChange" type="text" name="memberId" value="${memberSession.memberId}" readonly></td>
					<td rowspan="9" width="5%"></td>
				</tr>

				<tr>
					<th><label for="">비밀번호 🔒</label></th>
					<td colspan="5"><input type="password" name="pw" value="${memberSession.pw}" placeholder="4자 이상 15자 이내로 입력해주세요" 
                    	pattern=".{4,15}" required title="4자 이상 15자 이내로 입력해주세요"></td>
				</tr>

				<tr>
					<th><label for="">비밀번호 확인🔒</label></th>
					<td colspan="5"><input type="password" name="pwConfirm" value="${memberSession.pw}" required></td>
				</tr>

				<tr>
					<th><label for="">이름 📰</label></th>
					<td colspan="5"><input type="text" name="name" value="${memberSession.name}" required></td>
				</tr>

				<tr>
					<th><label for="">학번 🏫</label></th>
					<td colspan="5"><input class="noChange" type="text" name="studentNumber" value="${memberSession.studentNumber}" readonly></td>
				</tr>

				<tr>
					<th><label for="">학과 📒</label></th>
					<td colspan="5">
						<select name="major">
                            <option disabled>선택해주세요</option>
                            <c:forEach var="major" items="${majorList}">
                            	<option value="${major}" <c:if test="${memberSession.major == major}">selected</c:if>>${major}</option>
                            </c:forEach>
                        </select>
                    </td>
				</tr>

				<tr class="phone">
					<th>폰번호 📱</th>
					<td colspan="5">
						<input type="text" name="phone" value="${memberSession.phone}" placeholder="- 빼고 숫자만 입력해주세요" 
							pattern="010([0-9]{8})" required title="예)01012341234">
					</td>
				</tr>

				<tr>
					<th><label for="">생년월일 🎂</label></th>
					<td colspan="5">
						<input class="noChange" type="date" name="birth" readonly
							value="<fmt:formatDate value='${memberSession.birth}' pattern='yyyy-MM-dd'/>">
					</td>
				</tr>

				<tr>
					<td colspan="4"></td>
					<td class="cancelTd"><input type="button" value="취소" onClick="location.href='/member/myInfo'"></td>
					<td class="updateTd"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>

</html>