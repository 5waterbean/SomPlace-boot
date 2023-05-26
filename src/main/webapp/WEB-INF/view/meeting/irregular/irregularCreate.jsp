<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>irregularCreate</title>
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
	width: 20%;
}

.container form td {
	padding: 10px;
}

.container form input[type="text"] {
	border-radius: 20px;
	padding: 7px;
	border: 1px solid black;
}

.container form input[type="date"], .container form input[type="time"] {
	width: 30%;
	border-radius: 20px;
	padding: 7px;
	border: 1px solid black;
}

.container form textarea {
	border: 1px solid black;
	border-radius: 20px;
	width: 100%;
	height: 175px;
	padding: 15px;
	resize: none;
}

.container form>div:nth-child(1) {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.irregular_create_first {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.irregular_create_first>div:nth-child(2) {
	display: flex;
	align-items: center;
	justify-content: center;
}

#creatorId {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 5px;
	background-color: beige;
	font-size: medium;
}

#title, #meetingPlace, #memo {
	width: 100%;
}

#numOfPeople {
	width: 15%;
}

#meetingDateAndTime {
	width: 50%;
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

.container form table tr:nth-child(8)>td:nth-child(3), .container form table tr:nth-child(8)>td:nth-child(4)
	{
	width: 20%;
}

.irregular_create_btn, .irregular_back_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.irregular_create_btn:hover, .irregular_back_btn:hover {
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
				<h2>일시적 모임 만들기</h2>
			</div>

			<hr>

			<div class="irregular_create_first">
				<div>
					<input type="radio" id="irregularRadio" name="sort" checked>
					<label for="irregularRadio">일시적</label> <input type="radio"
						id="regularRadio" name="sort" disabled> <label
						for="regularRadio">정기적</label>
				</div>

				<div class="creator">
					<h3>모임장</h3>
					<input type="text" id="creatorId" name="creatorId"
						value="컴퓨터학과/20191011">
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title" name="title"
						size="90" required></td>
				</tr>

				<tr>
					<th>모집인원</th>
					<td colspan="3"><input type="text" id="numOfPeople"
						name="numOfPeople" size="3" required> <strong>명</strong></td>
				</tr>
				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" id="meetingPlace"
						name="meetingPlace" size="30" required></td>
				</tr>
				<tr>
					<th>모임 날짜/시간</th>
					<td colspan="3"><input type="date" id="meetingDate"
						name="meetingDate" required> <input type="time"
						id="meetingTime" name="meetingTime" required></td>
				</tr>
				<tr>
					<th>모임 메모</th>
					<td colspan="3"><textarea class="regular_memo"
							placeholder="모임 상세 정보 등을 자유롭게 작성해주세요."></textarea></td>
				</tr>
				<tr>
					<th>카테고리</th>

					<td><input type="radio" id="meal" name="meetingInfo">
						<label for="meal">식사</label> <input type="radio" id="study"
						name="meetingInfo"> <label for="study">스터디</label> <input
						type="radio" id="hobby" name="meetingInfo"> <label
						for="hobby">취미</label></td>
				</tr>

				<!-- 식사 선택시
                <tr>
                    <th></th>
                    <td colspan="3">
                        <div class="meeting_info_detail_td">
                            <div>
                                <input type="checkbox" id="western" name="meetingInfoDetail">
                                <label for="western">양식</label>
                            </div>
                            <div>
                                <input type="checkbox" id="japanese" name="meetingInfoDetail">
                                <label for="japanese">일식</label>
                            </div>
                            <div>
                                <input type="checkbox" id="chinese" name="meetingInfoDetail">
                                <label for="chinese">중식</label>
                            </div>
                            <div>
                                <input type="checkbox" id="korean" name="meetingInfoDetail">
                                <label for="korean">한식</label>
                            </div>
                            <div>
                                <input type="checkbox" id="flour_based" name="meetingInfoDetail">
                                <label for="flour_based">분식</label>
                            </div>
                            <div>
                                <input type="checkbox" id="alcohol" name="meetingInfoDetail">
                                <label for="alcohol">술</label>
                            </div>
                            <div>
                                <input type="checkbox" id="etc" name="meetingInfoDetail">
                                <label for="etc">
                                    <input type="text" id="etcText" name="etcText" size="15" placeholder="기타항목 입력">
                                </label>
                            </div>
                        </div>
                    </td>
                </tr> -->

				<!-- 스터디 선택시
                <tr>
                    <th></th>
                    <td colspan="3">
                        <div class="meeting_info_detail_td">
                            <div>
                                <input type="checkbox" id="task" name="meetingInfoDetail">
                                <label for="task">과제</label>
                            </div>
                            <div>
                                <input type="checkbox" id="exam" name="meetingInfoDetail">
                                <label for="exam">학교 시험</label>
                            </div>
                            <div>
                                <input type="checkbox" id="prepare_employment" name="meetingInfoDetail">
                                <label for="prepare_employment">취업준비</label>
                            </div>
                            <div>
                                <input type="checkbox" id="license" name="meetingInfoDetail">
                                <label for="license">자격증</label>
                            </div>
                            <div>
                                <input type="checkbox" id="etc" name="meetingInfoDetail">
                                <label for="etc">
                                    <input type="text" id="etcText" name="etcText" size="15" placeholder="기타항목 입력"
                                    >
                                </label>
                            </div>
                        </div>
                    </td>
                </tr> -->

				<!-- 취미선택시 -->
				<tr>
					<th></th>
					<td colspan="3">
						<div class="meeting_info_detail_td">
							<div>
								<input type="checkbox" id="sports" name="meetingInfoDetail">
								<label for="sports">스포츠</label>
							</div>
							<div>
								<input type="checkbox" id="art" name="meetingInfoDetail">
								<label for="art">예술</label>
							</div>
							<div>
								<input type="checkbox" id="it" name="meetingInfoDetail">
								<label for="it">IT</label>
							</div>
							<div>
								<input type="checkbox" id="etc" name="meetingInfoDetail">
								<label for="etc"> <input type="text" id="etcText"
									name="etcText" size="15" placeholder="기타항목 입력">
								</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>
						<div class="irregular_create_btn">생성하기</div>
					</td>
					<td>
						<div class="irregular_back_btn">취소하기</div>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script>
		document.querySelector('input[type="date"]').value = new Date()
				.toISOString().substring(0, 10);
		document.querySelector('input[type="date"]').min = new Date()
				.toISOString().substring(0, 10);
	</script>
</body>

</html>