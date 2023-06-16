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
<title>reviewWrite</title>

<style>
.container {
	width: 65%;
	margin: 0 auto;
	margin-top: 10px;
	padding: 10px;
	position: absolute;
	top: 60px;
	left: 0;
	right: 0;
	border: 1px solid black;
	border-radius: 20px;
}

.container h2 {
	margin: 10px;
}

.container table {
	width: 100%;
}

.container table th {
	text-align: right;
	padding: 10px;
	width: 10%;
}

.container table td {
	padding: 10px;
}

.container table td textarea {
	width: 100%;
	border-radius: 10px;
	padding: 5px;
	resize: none;
}

input[type="text"] {
	width: 50%;
	border-radius: 20px;
	padding: 5px;
	border: 2px solid black;
}

input[type="submit"] {
	width: 100%;
	padding: 5px;
	border-radius: 20px;
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

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~label {
	-webkit-text-fill-color: cornflowerblue;
}

.star-rating label:hover, .star-rating label:hover ~label {
	-webkit-text-fill-color: cornflowerblue;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />
	<jsp:include page="/WEB-INF/view/reviewList.jsp" />

	<form:form action="/review/write" method="post"
		modelAttribute="reviewCommand" onsubmit="return create(this)">
		<div class="container">
			<h2>&lt;후기 작성하기&gt;</h2>
			<table>
				<tr>
					<th>모임이름</th>
					<td><input type="text" value="${regular.meetingTitle}"
						disabled></td>
				</tr>
				<tr>
					<th>별점</th>
					<td>
						<div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5stars" name="star" value="5"
								v-model="ratings" /> <label for="5stars" class="star pr-4">★</label>
							<input type="radio" id="4stars" name="star" value="4"
								v-model="ratings" /> <label for="4stars" class="star">★</label>
							<input type="radio" id="3stars" name="star" value="3"
								v-model="ratings" /> <label for="3stars" class="star">★</label>
							<input type="radio" id="2stars" name="star" value="2"
								v-model="ratings" /> <label for="2stars" class="star">★</label>
							<input type="radio" id="1stars" name="star" value="1"
								v-model="ratings" /> <label for="1stars" class="star">★</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>후기</th>
					<td><textarea name="reviewMemo" id="" rows="10" required></textarea></td>
				</tr>

				<tr>
					<td colspan="2"></td>
					<!-- td style="width: 20%;">
					<div class="review_back_btn" onclick="location.href='/meeting/regular/info'">뒤로가기</div>
					</td> -->
					<td style="width: 20%;"><input type="submit" value="제출하기">
					</td>
				</tr>
			</table>
		</div>

		<!-- reviewCommand에 들어가야할 5개의 값을 넘겨주기 위해서 hidden으로 데이터 안보이게 처리(reviewCommand에 모든 값이 넘어가야함) -->
		<input type="hidden" name="meetingId" value="${regular.meetingId}">
		<input type="hidden" name="id" value="${memberSession.memberId}">
	</form:form>

	<script>
		function create(form) {
			let star1 = document.getElementById('1stars');
			let star2 = document.getElementById('2stars');
			let star3 = document.getElementById('3stars');
			let star4 = document.getElementById('4stars');
			let star5 = document.getElementById('5stars');

			if (!star1.checked && !star2.checked && !star3.checked
					&& !star4.checked && !star5.checked) {
				alert("별점을 입력해주세요");

				return false;
			}

			return true;
		}
	</script>
</body>

</html>