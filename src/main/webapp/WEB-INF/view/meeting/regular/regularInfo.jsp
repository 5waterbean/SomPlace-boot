<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regularInfo</title>
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
	padding: 5px;
	border: 2px solid black;
}

.container form textarea {
	border: 1px solid black;
}

.container form input:disabled {
	background-color: rgb(244, 243, 243);
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
}

.member_list_td {
	border: 1px solid gray;
	border-radius: 20px;
}

.member_list_td img {
	height: 30px;
	width: 30px;
}

.member_list_td>div {
	display: flex;
	align-items: center;
}

.member {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 10px;
	margin: 5px;
}

.member_good, .member_bad {
	border: 1px solid gray;
	border-radius: 20px;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 5px;
	padding: 5px 15px 5px 15px;
}

.member_good_btn, .member_bad_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	border-radius: 20px;
	padding: 5px 15px 5px 15px;
	margin: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.member_out_btn, .member_in_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 10px 15px 10px 15px;
	margin: 5px;
	border-radius: 20px;
	text-align: center;
}

.regular_update_btn, .regular_delete_btn, .regular_close_btn,
	.regular_apply_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.regular_update_btn:hover, .member_out_btn:hover, .member_in_btn:hover,
	.member_good_btn:hover, .member_bad_btn:hover, .regular_delete_btn:hover,
	.regular_close_btn:hover, .regular_apply_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}
</style>

</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />
	<jsp:include page="/WEB-INF/view/reviewList.jsp" />
	<div class="container">
		<form action="" method="post">
			<div>
				<h2>(모임 이름) 상세정보</h2>

				<div class="regular_update_btn">모임 수정하기</div>
			</div>

			<hr>

			<div class="regular_create_first">
				<!--비회원만 보이게-->
				<div>
					<input type="radio" id="irregularRadio" name="sort" disabled>
					<label for="irregularRadio">일시적</label> <input type="radio"
						id="regularRadio" name="sort" disabled checked> <label
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
						size="120" value="컴과솜 모여랏" disabled></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="regular_name" size="70"
						value="컴과솜솜" disabled></td>
					<td style="text-align: right;"><strong>현재 인원/모집 인원</strong></td>
					<td><input type="text" name="regular_num" size="10"
						value="2 / 8" disabled> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" name="regular_place"
						size="70" value="동덕여자대학교 인문관B303" disabled></td>
				</tr>

				<tr>
					<th>모임날짜</th>
					<td colspan="3">
						<div class="regular_dayTime">
							<div>
								<h4>- 매주</h4>
							</div>

							<div>
								<input type="checkbox" id="regularDay" value="mon" disabled
									checked>월&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="tue" disabled>화&nbsp;&nbsp; <input
									type="checkbox" id="regularDay" value="wed" disabled checked>수&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="thu" disabled>목&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="fri" disabled
									checked>금&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="sat" disabled>토&nbsp;&nbsp; <input
									type="checkbox" id="regularDay" value="sun" disabled>일&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시간대</h4>
							</div>

							<div>
								<input id="regularTime" type="checkbox" value="morning" disabled>06-12&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="afternoon"
									disabled checked>12-18&nbsp;&nbsp; <input
									id="regularTime" type="checkbox" value="evening" disabled
									checked>18-24&nbsp;&nbsp; <input id="regularTime"
									type="checkbox" value="night" disabled>00-06&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시작 날짜</h4>
							</div>

							<div class="start_day">&nbsp;2023년 6월 30일</div>

							<br>
						</div>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>
					<td>
						<div>
							<input type="radio" id="meal" name="meeting_info" disabled>
							<label for="meal">식사</label> <input type="radio" id="study"
								name="meeting_info" disabled> <label for="study">스터디</label>

							<input type="radio" id="hobby" name="meeting_info" disabled
								checked> <label for="hobby">취미</label>
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
								<input type="checkbox" id="meetingInfoDetail" disabled>
								스포츠
							</div>
							<div>
								<input type="checkbox" id="meetingInfoDetail" disabled>
								예술
							</div>
							<div>
								<input type="checkbox" id="meetingInfoDetail" disabled checked>
								IT
							</div>
							<div>
								<input type="checkbox" id="meetingInfoDetail" disabled>
								<label><input type="text" id="etc"
									placeholder="기타항목을 입력하세요." disabled></label>
							</div>
						</div>
					</td>

					<td colspan="2"><textarea class="regular_memo" disabled>같이 모여서 코딩해요! &#10;월,수,금 3시간씩 오후 1시에 모여요 &#10;늦으면 벌금 3천원!!!!!</textarea>
					</td>
				</tr>

				<!-- 회원들만
                <tr>
                    <th><h3>모임장 정보</h3></th>
                    <td class="member_list_td" colspan="6">
                        <div class="member_list">
                            <div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
                            <div class="member_good_btn"><img src="./img/좋아요.png" class="estimate"></div>
                            <div class="member_bad_btn"><img src="./img/싫어요.png" class="estimate"></div>
                        </div>
                    </td> 
                </tr>
                -->

				<tr>
					<!--생성자만-->
					<th>회원 목록</th>

					<td colspan="3">
						<div class="member_list_td">
							<div>
								<div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="./img/좋아요.png" class="estimate">
								</div>
								<div class="member_bad_btn">
									<img src="./img/싫어요.png" class="estimate">
								</div>
								<!--<div class="member_out_btn">내보내기</div>-->
							</div>
							<div>
								<div class="member">오수빈 / 20200985 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="./img/좋아요.png" class="estimate">
								</div>
								<div class="member_bad_btn">
									<img src="./img/싫어요.png" class="estimate">
								</div>
								<!--<div class="member_out_btn">내보내기</div>-->
							</div>
							<div>
								<div class="member">장현수 / 20191011 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="./img/좋아요.png" class="estimate">
								</div>
								<div class="member_bad_btn">
									<img src="./img/싫어요.png" class="estimate">
								</div>
								<!--<div class="member_out_btn">내보내기</div>-->
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th>신청 목록</th>
					<td colspan="6">
						<div class="member_list_td">
							<div>
								<div class="member">김동덕 / 20190000 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good">
									<img src="./img/좋아요.png" class="estimate">&nbsp;4
								</div>
								<div class="member_bad">
									<img src="./img/싫어요.png" class="estimate">&nbsp;1
								</div>
								<div class="member_in_btn">수락하기</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td>
						<div class="regular_delete_btn">모임 삭제하기</div> <!--생성자만-->
					</td>

					<td>
						<div class="regular_close_btn">모집 마감하기</div> <!--생성자만-->
					</td>
					<!--  <td>
                       비회원만 <div class="regular_apply_btn">모임 신청하기</div>
                    </td> -->
				</tr>
			</table>
		</form>
	</div>
</body>

</html>