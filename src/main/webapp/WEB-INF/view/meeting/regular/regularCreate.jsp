<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>regularCreate</title>
<style>
.container {
	width: 65%;
	border-radius: 20px;
	position: absolute;
	top: 70px;
	padding: 20px;
	border: 1px solid black;
}

h3, h4 {
	margin: 10px;
}

.container form {
	width: 100%;
	padding: 10px;
}

.container form>div:nth-child(1) {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.container form table {
	width: 100%;
}

.container form th {
	padding: 10px;
	width: 10%;
}

.container form td {
	padding: 10px;
}

.container form input[type="text"] {
	width: 80%;
	border-radius: 20px;
	padding: 7px;
	border: 1px solid black;
}

.container form input[type="date"] {
	width: 40%;
	border-radius: 20px;
	padding: 7px;
	border: 1px solid black;
}

.container form textarea {
	border: 1px solid black;
}

.container form .regular_create_first {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.creator {
	display: flex;
	align-items: center;
}

.creator_info {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 5px;
	background-color: beige;
}

.regular_memo {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 15px;
	overflow-y: scroll;
	height: 175px;
	width: 100%;
	resize: none;
}

.meeting_info_detail_td {
	border: 1px solid black;
	border-radius: 20px;
	padding: 20px;
	width: 100%;
}

.meeting_info_detail_td>div {
	padding: 5px;
}

.regular_dayTime {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 15px;
}

.container form table tr:nth-child(7)>td:nth-child(3), .container form table tr:nth-child(7)>td:nth-child(4)
	{
	width: 20%;
}

.regular_create_btn, .regular_back_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.regular_create_btn:hover, .regular_back_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<form action="" method="post">
			<div>
				<h2>정기적 모임 만들기</h2>
			</div>

			<hr>

			<div class="regular_create_first">
				<!--비회원만 보이게-->
				<div>
					<input type="radio" id="irregularRadio" name="sort" disabled>
					<label for="irregularRadio">일시적</label> <input type="radio"
						id="regularRadio" name="sort" checked> <label
						for="regularRadio">정기적</label>
				</div>

				<div class="creator">
					<h3>모임장</h3>
					<div class="creator_info">컴퓨터학과 / 20191003</div>
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="regular_title"
						size="120" required></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="regular_name" size="70">
					</td>
					<td style="text-align: right;"><strong>모집 인원</strong></td>
					<td><input type="text" name="regular_num" size="10" max="10"
						required> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" name="regular_place"
						size="70" required></td>
				</tr>

				<tr>
					<th>모임날짜</th>
					<td colspan="3">
						<div class="regular_dayTime">
							<div>
								<h4>- 매주</h4>
							</div>

							<div>
								<input type="checkbox" id="regularDay" value="mon">월&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="tue">화&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="wed">수&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="thu">목&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="fri">금&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="sat">토&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="sun">일&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시간대</h4>
							</div>

							<div>
								<input id="regularTime" type="checkbox" value="morning">06-12&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="afternoon">12-18&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="evening">18-24&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="night">00-06&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시작 날짜</h4>
							</div>

							<div class="start_day">
								<input type="date">
							</div>

							<br>
						</div>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>
					<td>
						<div>
							<input type="radio" id="meal" name="meeting_info"> <label
								for="meal">식사</label> <input type="radio" id="study"
								name="meeting_info"> <label for="study">스터디</label> <input
								type="radio" id="hobby" name="meeting_info"> <label
								for="hobby">취미</label>
						</div>
					</td>
					<td><strong>모임 메모</strong></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td>
						<div class="meeting_info_detail_td">
							<div>
								<input type="checkbox" id="sports"> <label for="sports">스포츠</label>
							</div>
							<div>
								<input type="checkbox" id="art"> <label for="art">예술</label>
							</div>
							<div>
								<input type="checkbox" id="it"> <label for="it">IT</label>
							</div>
							<div>
								<input type="checkbox" id="etc"> <label for="etc"><input
									type="text" id="etc" placeholder="기타항목을 입력하세요."></label>
							</div>
						</div>
					</td>

					<td colspan="2"><textarea class="regular_memo"
							placeholder="모임 상세 정보 등을 자유롭게 작성해주세요."></textarea></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td>
						<div class="regular_create_btn">생성하기</div>
					</td>
					<td>
						<div class="regular_back_btn">취소하기</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>