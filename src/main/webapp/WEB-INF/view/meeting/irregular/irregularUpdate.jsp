<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>irregularUpdate</title>
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

#maxPeople {
	width: 15%;
}

#meetingDateAndTime {
	width: 50%;
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

.container form table tr:nth-child(8)>td:nth-child(3), .container form table tr:nth-child(8)>td:nth-child(4)
	{
	width: 20%;
}

button, .irregular_back_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
	font-size: 16px;
	height: 33px;
}

button:hover, .irregular_back_btn:hover {
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
		<form:form action="/meeting/irregular/update" method="post"
			onsubmit="return update(this)">
			<div>
				<h2>일시적모임 수정하기</h2>
			</div>

			<hr>
			<div class="irregular_create_first">
				<div>
					<input type="radio" id="irregularRadio" name="sort" checked
						disabled> <label for="irregularRadio">일시적</label> <input
						type="radio" id="regularRadio" name="sort" disabled> <label
						for="regularRadio">정기적</label>
				</div>

				<div class="creator">
					<h3>모임장</h3>
					<input type="text" id="creatorId"
						value=" ${memberSession.major} / ${memberSession.studentNumber} "
						readonly>
				</div>
			</div>

			<br>
			<input type="hidden" id="checkedById" name="checkedById"
				value="${irregular.meetingId}"></input>
			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title"
						name="meetingTitle" size="90" value="${irregular.meetingTitle}"
						pattern=".{1,15}" required title="15자 이내로 작성해주세요."></td>
				</tr>

				<tr>
					<th>모집인원</th>
					<td colspan="3"><input type="text" id="maxPeople"
						name="maxPeople" size="3" required value="${irregular.maxPeople}">
						<strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" id="meetingPlace"
						name="meetingPlace" size="30" value="${irregular.meetingPlace}"
						pattern=".{1,15}" required title="15자 이내로 작성해주세요."></td>
				</tr>

				<tr>
					<th>모임 날짜/시간</th>
					<td colspan="3"><input type="date" id="meetingDate"
						name="irregularMeetingDate" value="${meetingDay}" required>
						<input type="time" id="meetingTime" name="irregularMeetingTime"
						value="${meetingTime}" required></td>
				</tr>

				<tr>
					<th>모임 메모</th>
					<td colspan="3"><textarea class="irregular_memo" name="memo"
							id="memo" placeholder="모임 상세 정보 등을 자유롭게 작성해주세요.">${irregular.memo}</textarea>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>

					<td><input type="radio" id="meal" name="meetingInfo" disabled
						<c:if test="${irregular.meetingInfo eq '식사'}">checked</c:if>>
						<label for="meal">식사</label> <input type="radio" id="study"
						name="meetingInfo" disabled
						<c:if test="${irregular.meetingInfo eq '스터디'}">checked</c:if>>
						<label for="study">스터디</label> <input type="radio" id="hobby"
						name="meetingInfo" disabled
						<c:if test="${irregular.meetingInfo eq '취미'}">checked</c:if>>
						<label for="hobby">취미</label></td>
				</tr>

				<tr>
					<th></th>
					<td colspan="3"><c:set var="detailList" value="${detailList}" />
						<c:choose>

							<c:when test="${irregular.meetingInfo eq '식사'}">
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

							<c:when test="${irregular.meetingInfo eq '스터디'}">

								<div class="meeting_info_detail_td" id="studyDetail">
									<div>
										<input type="checkbox" id="task" name="meetingInfoDetail"
											value="과제" disabled
											<c:if test="${fn:contains(detailList, '과제')}">checked</c:if>>
										<label for="task">과제</label>
									</div>
									<div>
										<input type="checkbox" id="exam" name="meetingInfoDetail"
											value="학교시험" disabled
											<c:if test="${fn:contains(detailList, '학교시험')}">checked</c:if>>
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

							<c:when test="${irregular.meetingInfo eq '취미'}">
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
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>
						<button type="submit">수정하기</button>
					</td>
					<td>
						<div class="irregular_back_btn" onclick="history.back();">취소하기</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>

	<script>
		document.querySelector('input[type="date"]').min = new Date()
				.toISOString().substring(0, 10);

 		var etc = document.querySelector("#etc");
    	var etcTextDetail = document.querySelector('#etcTextDetail');
    	
    	var category = document.querySelector("#category");

		function update() {
    		if (etc.checked) {
        		if (etc.value != "") {
            		etc.value = etcTextDetail.value;
        		}
    		}
    		
    		var obj = document.getElementById("memo").value;
            var text_len = obj.length;
            if(text_len >= 60) {
            	alert("60자 이내로 작성해주세요.");
            	document.getElementById("memo").focus();
            	return false;
            }
            
            var r = confirm("수정하시겠습니까?");
            if (r == true) {
                alert("수정되었습니다.")
            } 
            return r;
		}
	</script>
</body>

</html>