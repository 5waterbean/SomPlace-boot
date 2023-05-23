<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myMeetingList</title>
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

.container td {
	text-align: center;
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
</head>

<body>
<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
<jsp:include page="/WEB-INF/view/rightBar.jsp" />
	<div class="container">
		<table>
			<tr>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart1" oninput="addLike(this)">
							<label for="heart1">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>1/9</div>
						<img src="./img/lifestyle.png" alt="">
						<div>그림 같이 그리실 분</div>
						<div>취미</div>
						<div>예술</div>
						<div>
							<input type="checkbox" id="heart2" oninput="addLike(this)">
							<label for="heart2">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>6/8</div>
						<img src="./img/read.png" alt="">
						<div>자격증 같이 공부해요</div>
						<div>스터디</div>
						<div>자격증</div>
						<div>
							<input type="checkbox" id="heart3" oninput="addLike(this)">
							<label for="heart3">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart4" oninput="addLike(this)">
							<label for="heart4">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>1/9</div>
						<img src="./img/lifestyle.png" alt="">
						<div>그림 같이 그리실 분</div>
						<div>취미</div>
						<div>예술</div>
						<div>
							<input type="checkbox" id="heart5" oninput="addLike(this)">
							<label for="heart5">🤍</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<div>6/8</div>
						<img src="./img/read.png" alt="">
						<div>자격증 같이 공부해요</div>
						<div>스터디</div>
						<div>자격증</div>
						<div>
							<input type="checkbox" id="heart6" oninput="addLike(this)">
							<label for="heart6">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>1/9</div>
						<img src="./img/lifestyle.png" alt="">
						<div>그림 같이 그리실 분</div>
						<div>취미</div>
						<div>예술</div>
						<div>
							<input type="checkbox" id="heart7" oninput="addLike(this)">
							<label for="heart7">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>6/8</div>
						<img src="./img/read.png" alt="">
						<div>자격증 같이 공부해요</div>
						<div>스터디</div>
						<div>자격증</div>
						<div>
							<input type="checkbox" id="heart8" oninput="addLike(this)">
							<label for="heart8">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart9" oninput="addLike(this)">
							<label for="heart9">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart10" oninput="addLike(this)">
							<label for="heart10">🤍</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart11" oninput="addLike(this)">
							<label for="heart11">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>1/9</div>
						<img src="./img/lifestyle.png" alt="">
						<div>그림 같이 그리실 분</div>
						<div>취미</div>
						<div>예술</div>
						<div>
							<input type="checkbox" id="heart12" oninput="addLike(this)">
							<label for="heart12">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart13" oninput="addLike(this)">
							<label for="heart13">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>2/3</div>
						<img src="./img/english-breakfast.png" alt="">
						<div>같이 밥 먹을 사람~!</div>
						<div>식사</div>
						<div>일식</div>
						<div>
							<input type="checkbox" id="heart14" oninput="addLike(this)">
							<label for="heart14">🤍</label>
						</div>
					</div>
				</td>
				<td>
					<div>
						<div>1/9</div>
						<img src="./img/lifestyle.png" alt="">
						<div>그림 같이 그리실 분</div>
						<div>취미</div>
						<div>예술</div>
						<div>
							<input type="checkbox" id="heart15" oninput="addLike(this)">
							<label for="heart15">🤍</label>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>