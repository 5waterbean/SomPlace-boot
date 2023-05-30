<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<style>
.container {
	width: 65%;
	border: 1px solid black;
	border-radius: 20px;
	position: absolute;
	top: 170px;
	overflow-y: scroll;
	overflow-x: hidden;
	height: 500px;
}

.container table {
    width: 100%;
}

.container tr {
    display: flex;
    flex-wrap: wrap;
}

.container td {
    text-align: center;
    width: 20%;
}

.container td>div {
	width: 90%;
	margin: 10px auto;
	border: 1px solid black;
	border-radius: 20px;
	transition: 0.7s ease all;
}

.container td>div:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.container td div>div:nth-child(1) {
	text-align: right;
	color: gray;
	padding: 10px;
}

.container td div>div:nth-child(3) {
	font-weight: bold;
	font-size: small;
	/* padding: 10px; */
}

.container td div>div:nth-child(4) {
	font-weight: bold;
	font-size: x-small;
}

.container td div>div:nth-child(5) {
	font-size: x-small;
}

.container td div>div:nth-child(6) {
	text-align: right;
	padding: 10px;
	font-size: x-large;
}

.container td img {
	width: 40%;
}

.container td input {
	display: none;
}

.container td label:hover {
	cursor: pointer;
}
</style>

<script>
	function addLike(like) {
		const heartLabel = like.nextElementSibling;

		console.log(heartLabel)
		if (like.checked) {
			heartLabel.innerHTML = "❤️";
		} else {
			heartLabel.innerHTML = "🤍";
		}
	}
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/searchBox.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />
	<div class="container">
		<table>
			<tr>
			<c:set var="study" value="../../img/read.png" />
			<c:set var="meal" value="../../img/english-breakfast.png" />
			<c:set var="hobby" value="../../img/lifestyle.png" />
			<c:forEach var="meeting" items="${meetingList}">
				<td>
					<div>
						<div>${meeting.numOfPeople}<font>/</font>${meeting.maxPeople}</div>
						<c:choose>
							<c:when test="${meeting.meetingInfo eq '식사'}">
								<img src='<c:out value="${meal}"/>' alt="">
							</c:when>
							<c:when test="${meeting.meetingInfo eq '스터디'}">
								<img src='<c:out value="${study}"/>' alt="">
							</c:when>
							<c:otherwise>
								<img src='<c:out value="${hobby}"/>' alt="">
							</c:otherwise>
						</c:choose>
						<div>${meeting.meetingTitle}</div>
						<div>${meeting.meetingInfo}</div>
						<div>${meeting.meetingInfoDetail}</div>
						<div>
							<input type="checkbox" id="heart1" oninput="addLike(this)">
							<label for="heart1">🤍</label>
						</div>
					</div>
				</td>
		    </c:forEach>
		    </tr>
		</table>
	</div>
</body>

</html>