<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>rightBar</title>
<style>
.right {
	width: 15%;
	position: fixed;
	top: 60px;
	right: 0;
	text-align: center;
	padding: 10px;
	margin: 10px;
}

.right>.create_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px;
	border-radius: 20px;
}

.right>.create_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.right .divTable {
	border: 1px solid black;
	border-radius: 20px;
}

.right table {
	border-collapse: collapse;
	width: 100%;
	border-radius: 20px;
}

.right table tr {
	border-top: 1px solid black;
	vertical-align : top;
}

.right table td {
	height: 45px;
}

.right table th {
	font-size: large;
	background-color: rgb(254, 251, 191);
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
}
</style>
</head>

<body>
	<div class="right">
		<div class="create_btn" onClick="location.href='/meeting/irregular/create/form';">모임 만들기</div>

		<br>

		<div class="divTable">
			<table>
				<tr style="border:0px;">
					<th colspan="7">${myCalendar.month}월 일정</th>
				</tr>

				<c:set var="num" value="1"/>
				<c:forEach begin="1" end="${myCalendar.firstDay}" varStatus="status">
					<c:if test="${num % 7 == 1}">
						<tr>
					</c:if>
					<td> </td>
					<c:set var="num" value="${num + 1}" />
				</c:forEach>
				
				<c:forEach begin="1" end="${myCalendar.lastDate}" varStatus="status">
					<c:if test="${num % 7 == 1}">
						<tr>
					</c:if>
					<td>
						<font color='
							<c:choose>
								<c:when test="${num % 7 == 1}">red</c:when>
								<c:when test="${num % 7 == 0}">blue</c:when>
								<c:otherwise>black</c:otherwise>
							</c:choose>'>${status.index}</font>
						<br>
						<c:if test="${num % 7 == 3}">
							<font size="1">📌</font>
						</c:if>
					</td>
					<c:if test="${num % 7 == 0}">
						</tr>
					</c:if>
					<c:set var="num" value="${num + 1}" />
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>