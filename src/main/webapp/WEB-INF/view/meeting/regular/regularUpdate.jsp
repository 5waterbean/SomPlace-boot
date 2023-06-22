<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>regular update</title>
<style>
.container {
	width: 65%;
	border-radius: 20px;
	position: absolute;
	top: 80px;
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

.meeting_info_detail_td, button {
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

button, .regular_back_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
	font-size: 16px;
	height: 33px;
}

button:hover, .regular_back_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

button {
	font-size: 16px;
	height: 33px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<form:form action="/meeting/regular/update" method="POST"
			onSubmit="return update(this)">
			<div>
				<h2>${regular.meetingTitle}수정하기</h2>
				<input type="hidden" name="checkedById" value="${regular.meetingId}">
			</div>

			<hr>

			<div class="regular_create_first">
				<!--비회원만 보이게-->
				<div>
					<input type="radio" id="irregularRadio" name="sort" disabled>
					<label for="irregularRadio">일시적</label> <input type="radio"
						id="regularRadio" name="sort" checked disabled> <label
						for="regularRadio">정기적</label>
				</div>

				<div class="creator">
					<h3>모임장</h3>
					<div class="creator_info">&nbsp; ${memberSession.major} /
						${memberSession.studentNumber} &nbsp;</div>
					<input type="hidden" name="creatorId"
						value="${memberSession.memberId}">
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title"
						name="meetingTitle" title="15자 이내로 입력해주세요" pattern=".{1,15}"
						size="120" value="${regular.meetingTitle}" required></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="meetingName"
						placeholder="15자 이내로 입력해주세요" pattern=".{1,15}"
						value="${regular.meetingName}" required>
					<td style="text-align: right;"><strong>모집 인원</strong></td>
					<td><input type="text" name="maxPeople" size="10" max="10"
						required value="${regular.maxPeople}"> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" name="meetingPlace"
						placeholder="15자 이내로 입력해주세요" pattern=".{1,15}" size="70" required
						value="${regular.meetingPlace}"></td>
				</tr>

				<tr>
					<th>모임날짜</th>
					<td colspan="3">
						<div class="regular_dayTime">
							<div>
								<h4>- 매주</h4>
								<font><form:errors path="regularMeetingDay" /></font>
							</div>

							<div>
								<c:set var="meetingdayList" value="${meetingdayList}" />
								<input type="checkbox" id="regularDay" value="월"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '월')}" > checked</c:if>>월&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="화"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '화')}" > checked</c:if>>화&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="수"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '수')}" > checked</c:if>>수&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="목"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '목')}" > checked</c:if>>목&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="금"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '금')}" > checked</c:if>>금&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="토"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '토')}" > checked</c:if>>토&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" value="일"
									name="regularMeetingDay"
									<c:if test="${fn:contains(meetingdayList, '일')}" > checked</c:if>>일&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시간대</h4>
								<font color="red" size="2"><form:errors
										path="meetingTime" /></font>
							</div>

							<div>
								<c:set var="meetingTimeList" value="${meetingTimeList}" />
								<input id="regularTime" type="checkbox" value="06-12"
									name="meetingTime"
									<c:if test="${fn:contains(meetingTimeList, '06-12')}" > checked</c:if>>06-12&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="12-18"
									name="meetingTime"
									<c:if test="${fn:contains(meetingTimeList, '12-18')}" > checked</c:if>>12-18&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="18-24"
									name="meetingTime"
									<c:if test="${fn:contains(meetingTimeList, '18-24')}" > checked</c:if>>18-24&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" value="00-06"
									name="meetingTime"
									<c:if test="${fn:contains(meetingTimeList, '00-06')}" > checked</c:if>>00-06&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시작 날짜</h4>
							</div>

							<div class="start_day">
								<input name="startDay" type="date"
									value="<fmt:formatDate value='${regular.startDay}' pattern='yyyy-MM-dd'/>">
							</div>

							<br>
						</div>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>
					<td>
						<div>
							<input type="radio" id="meal" name="meetingInfo" value="식사"
								<c:if test="${regular.meetingInfo eq '식사'}" > checked</c:if>
								disabled> <label for="meal">식사</label> <input
								type="radio" id="study" name="meetingInfo" value="스터디"
								<c:if test="${regular.meetingInfo eq '스터디'}" > checked</c:if>
								disabled> <label for="study">스터디</label> <input
								type="radio" id="hobby" name="meetingInfo" value="취미"
								<c:if test="${regular.meetingInfo eq '취미'}" > checked</c:if>
								disabled> <label for="hobby">취미</label>
						</div>
					</td>
					<td><strong>모임 메모</strong></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td><font color="red" size="2"><form:errors
								path="meetingInfoDetail" /></font> <c:set var="detailList"
							value="${detailList}" /> <c:choose>

							<c:when test="${regular.meetingInfo eq '식사'}">
								<div class="meeting_info_detail_td" id="mealDetail">
									<div>
										<input type="checkbox" id="western" name="meetingInfoDetail"
											value="양식" disabled
											<c:if test="${fn:contains(detailList, '양식')}">checked</c:if>>
										<label for="western">양식</label>
									</div>
									<div>
										<input type="checkbox" id="japanese" name="meetingInfoDetail"
											value="일식" disabled
											<c:if test="${fn:contains(detailList, '일식')}">checked</c:if>>
										<label for="japanese">일식</label>
									</div>
									<div>
										<input type="checkbox" id="chinese" name="meetingInfoDetail"
											value="중식" disabled
											<c:if test="${fn:contains(detailList, '중식')}">checked</c:if>>
										<label for="chinese">중식</label>
									</div>
									<div>
										<input type="checkbox" id="korean" name="meetingInfoDetail"
											value="한식" disabled
											<c:if test="${fn:contains(detailList, '한식')}">checked</c:if>>
										<label for="korean">한식</label>
									</div>
									<div>
										<input type="checkbox" id="flour_based"
											name="meetingInfoDetail" value="분식" disabled
											<c:if test="${fn:contains(detailList, '분식')}">checked</c:if>>
										<label for="flour_based">분식</label>
									</div>
									<div>
										<input type="checkbox" id="alcohol" name="meetingInfoDetail"
											value="술" disabled
											<c:if test="${fn:contains(detailList, '술')}">checked</c:if>>
										<label for="alcohol">술</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											onclick="etcVal(this.id)" disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>
										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcText" size="15"
											placeholder="기타항목 입력" disabled value="${detailValue}">
										</label>
									</div>
								</div>
							</c:when>

							<c:when test="${regular.meetingInfo eq '스터디'}">

								<div class="meeting_info_detail_td" id="studyDetail">
									<div>
										<input type="checkbox" id="task" name="meetingInfoDetail"
											value="과제" disabled
											<c:if test="${fn:contains(detailList, '과제')}">checked</c:if>>
										<label for="task">과제</label>
									</div>
									<div>
										<input type="checkbox" id="exam" name="meetingInfoDetail"
											value="학교 시험" disabled
											<c:if test="${fn:contains(detailList, '학교 시험')}">checked</c:if>>
										<label for="exam">학교 시험</label>
									</div>
									<div>
										<input type="checkbox" id="prepare_employment"
											name="meetingInfoDetail" value="취업준비" disabled
											<c:if test="${fn:contains(detailList, '취업준비')}">checked</c:if>>
										<label for="prepare_employment">취업준비</label>
									</div>
									<div>
										<input type="checkbox" id="license" name="meetingInfoDetail"
											value="자격증" disabled
											<c:if test="${fn:contains(detailList, '자격증')}">checked</c:if>>
										<label for="license">자격증</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											onclick="etcVal(this.id)" disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>
										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcText" size="15"
											placeholder="기타항목 입력" disabled value="${detailValue}">
										</label>
									</div>
								</div>
							</c:when>

							<c:when test="${regular.meetingInfo eq '취미'}">
								<div class="meeting_info_detail_td" id="hobbyDetail">
									<div>
										<input type="checkbox" id="sports" name="meetingInfoDetail"
											value="스포츠" disabled
											<c:if test="${fn:contains(detailList, '스포츠')}">checked</c:if>>
										<label for="sports">스포츠</label>
									</div>
									<div>
										<input type="checkbox" id="art" name="meetingInfoDetail"
											value="예술" disabled
											<c:if test="${fn:contains(detailList, '예술')}">checked</c:if>>
										<label for="art">예술</label>
									</div>
									<div>
										<input type="checkbox" id="it" name="meetingInfoDetail"
											value="IT" disabled
											<c:if test="${fn:contains(detailList, 'IT')}">checked</c:if>>
										<label for="it">IT</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											onclick="etcVal(this.id)" disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>
										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcTextDetail"
											placeholder="기타항목을 입력하세요." disabled value="${detailValue}">
										</label>
									</div>
								</div>
							</c:when>
						</c:choose></td>

					<td colspan="2"><textarea class="regular_memo" name="memo"
							id="memo">${regular.memo}</textarea></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td>
						<button type="submit">수정하기</button>
					</td>
					<td>
						<div class="regular_back_btn" onclick="history.back();">취소하기</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	<script>		
		
		function update() {			        
	        var text_len = document.getElementById("memo").value.length; //입력한 문자수
            if (text_len >= 60) {
            	alert("메모를 60자 이내로 입력해주세요");
            	return false;
            }
	        
            var retVal = confirm("수정하시겠습니까?");
            if (retVal == false) {
            	alert("수정취소되었습니다.");
            }
            return retVal;
	    }
	</script>
</body>

</html>