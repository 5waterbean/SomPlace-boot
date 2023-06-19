<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>regularInfo</title>
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

.member_list_td {
	border: 1px solid gray;
	border-radius: 20px;
	height: 250px;
	overflow-y: scroll;
	resize: none;
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
	border: 1px solid black;
	background-color: white;
	border-radius: 20px;
	padding: 5px 15px 5px 15px;
	margin: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
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

.container form table tr:nth-child(9)>td:nth-child(3), .container form table tr:nth-child(9)>td:nth-child(4)
	{
	width: 20%;
}

.regular_update_btn, .regular_delete_btn, .regular_close_btn,
	.regular_apply_btn, .regular_applyCancel_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.regular_update_btn:hover, .member_out_btn:hover, .member_in_btn:hover,
	.member_good_btn:hover, .member_bad_btn:hover, .regular_delete_btn:hover,
	.regular_close_btn:hover, .regular_apply_btn:hover,
	.regular_applyCancel_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.start_day {
	border: 1px solid gray;
	border-radius: 5px;
	width: fit-content;
	padding: 4px;
	background-color: rgb(244, 243, 243);
	font-size: 14px;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />
	<jsp:include page="/WEB-INF/view/reviewList.jsp" />

	<div class="container" id="container">
		<form name="updateForm" action="/meeting/regular/update/form">
			<div>
				<h2>&lt;${regular.meetingTitle}&gt; 상세정보</h2>

				<c:if test="${regular.cancel eq 1}">
					<font color="red" size="4">삭제된 모임입니다.</font>
				</c:if>
				<c:if test="${regular.close eq 1 && regular.cancel eq 0}">
					<font color="red" size="4">모집 마감된 모임입니다.</font>
				</c:if>
				<c:if test="${regular.creatorId eq memberSession.memberId}">
					<c:if test="${regular.cancel eq 0}">
						<div class="regular_update_btn" onClick="updateForm.submit()">모임
							수정하기</div>
					</c:if>
				</c:if>

				<input type="hidden" name="checkedById" value="${regular.meetingId}">
				<input type="hidden" name="detailValue" value="${detailValue}">
				<input type="hidden" name="close" id="close"
					value="${regular.close}"> <input type="hidden"
					name="cancel" id="cancel" value="${regular.cancel}">
			</div>

			<hr>

			<div class="regular_create_first">
				<!--비회원만 보이게-->
				<div>
					<input type="radio" id="regularRadio" name="sort" disabled>
					<label for="regularRadio">일시적</label> <input type="radio"
						id="regularRadio" name="sort" disabled checked> <label
						for="regularRadio">정기적</label>
				</div>

				<div class="creator">
					<h3>모임장</h3>
					<div class="creator_info">&nbsp; ${creatorMember.major} /
						${creatorMember.studentNumber} &nbsp;</div>
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="4"><input type="text" name="meetingTitle"
						size="120" value="${regular.meetingTitle}" disabled required></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="meetingName" size="70"
						maxlength="40" value="${regular.meetingName}" disabled required></td>
					<td></td>
					<td style="text-align: right;"><strong>현재 인원/모집 인원</strong></td>
					<td><input type="text" name="numOfPeople" size="10"
						value="${regular.numOfPeople} / ${regular.maxPeople}" disabled
						required> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="4"><input type="text" name="regularMeetingDay"
						size="70" value="${regular.meetingPlace}" disabled required></td>
				</tr>

				<tr>
					<th>모임날짜</th>
					<td colspan="4">
						<div class="regular_dayTime">
							<div>
								<h4>- 매주</h4>
							</div>

							<div>
								<c:set var="meetingdayList" value="${meetingdayList}" />
								<input type="checkbox" id="regularDay" value="월"
									<c:if test="${fn:contains(meetingdayList, '월')}" > checked</c:if>
									disabled>월&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="화"
									<c:if test="${fn:contains(meetingdayList, '화')}" > checked</c:if>
									disabled>화&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="수"
									<c:if test="${fn:contains(meetingdayList, '수')}" > checked</c:if>
									disabled>수&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="목"
									<c:if test="${fn:contains(meetingdayList, '목')}" > checked</c:if>
									disabled>목&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="금"
									<c:if test="${fn:contains(meetingdayList, '금')}" > checked</c:if>
									disabled>금&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="토"
									<c:if test="${fn:contains(meetingdayList, '토')}" > checked</c:if>
									disabled>토&nbsp;&nbsp; <input type="checkbox"
									id="regularDay" value="일"
									<c:if test="${fn:contains(meetingdayList, '일')}" > checked</c:if>
									disabled>일&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시간대</h4>
							</div>

							<div>
								<c:set var="meetingTimeList" value="${meetingTimeList}" />
								<input id="regularTime" type="checkbox" value="06-12"
									<c:if test="${fn:contains(meetingTimeList, '06-12')}" > checked</c:if>
									disabled>06-12&nbsp;&nbsp; <input id="regularTime"
									type="checkbox" value="12-18"
									<c:if test="${fn:contains(meetingTimeList, '12-18')}" > checked</c:if>
									disabled>12-18&nbsp;&nbsp; <input id="regularTime"
									type="checkbox" value="18-24"
									<c:if test="${fn:contains(meetingTimeList, '18-24')}" > checked</c:if>
									disabled>18-24&nbsp;&nbsp; <input id="regularTime"
									type="checkbox" value="00-06"
									<c:if test="${fn:contains(meetingTimeList, '00-06')}" > checked</c:if>
									disabled>00-06&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시작 날짜</h4>
							</div>

							<div class="start_day">
								<fmt:formatDate value="${regular.startDay}"
									pattern="yyyy년 MM월 dd일" />
								<input type="hidden" name="startDay" value="${regular.startDay}">
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
					<td></td>
					<td><strong>모임 메모</strong></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td><c:set var="detailList" value="${detailList}" /> <c:choose>
							<c:when test="${regular.meetingInfo eq '식사'}">
								<div class="meeting_info_detail_td" id="mealDetail">
									<div>
										<input type="checkbox" id="western" name="meetingInfoDetail"
											value="양식"
											<c:if test="${fn:contains(detailList, '양식')}" > checked</c:if>
											disabled> <label for="western">양식</label>
									</div>
									<div>
										<input type="checkbox" id="japanese" name="meetingInfoDetail"
											value="일식"
											<c:if test="${fn:contains(detailList, '일식')}" > checked</c:if>
											disabled> <label for="japanese">일식</label>
									</div>
									<div>
										<input type="checkbox" id="chinese" name="meetingInfoDetail"
											value="중식"
											<c:if test="${fn:contains(detailList, '중식')}" > checked</c:if>
											disabled> <label for="chinese">중식</label>
									</div>
									<div>
										<input type="checkbox" id="korean" name="meetingInfoDetail"
											value="한식"
											<c:if test="${fn:contains(detailList, '한식')}" > checked</c:if>
											disabled> <label for="korean">한식</label>
									</div>
									<div>
										<input type="checkbox" id="flour_based"
											name="meetingInfoDetail" value="분식"
											<c:if test="${fn:contains(detailList, '분식')}" > checked</c:if>
											disabled> <label for="flour_based">분식</label>
									</div>
									<div>
										<input type="checkbox" id="alcohol" name="meetingInfoDetail"
											value="술"
											<c:if test="${fn:contains(detailList, '술')}" > checked</c:if>
											disabled> <label for="alcohol">술</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>
										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcText" size="15"
											value="${detailValue}" disabled>
										</label>
									</div>
								</div>
							</c:when>

							<c:when test="${regular.meetingInfo eq '스터디'}">

								<div class="meeting_info_detail_td" id="studyDetail">
									<div>
										<input type="checkbox" id="task" name="meetingInfoDetail"
											value="과제"
											<c:if test="${fn:contains(detailList, '과제')}" > checked</c:if>
											disabled> <label for="task">과제</label>
									</div>
									<div>
										<input type="checkbox" id="exam" name="meetingInfoDetail"
											value="학교시험"
											<c:if test="${fn:contains(detailList, '학교시험')}" > checked</c:if>
											disabled> <label for="exam">학교시험</label>
									</div>
									<div>
										<input type="checkbox" id="prepare_employment"
											name="meetingInfoDetail" value="취업준비"
											<c:if test="${fn:contains(detailList, '취업준비')}" > checked</c:if>
											disabled> <label for="prepare_employment">취업준비</label>
									</div>
									<div>
										<input type="checkbox" id="license" name="meetingInfoDetail"
											value="자격증"
											<c:if test="${fn:contains(detailList, '자격증')}" > checked</c:if>
											disabled> <label for="license">자격증</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>

										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcText" size="15"
											value="${detailValue}" disabled>
										</label>
									</div>
								</div>
							</c:when>

							<c:otherwise>

								<div class="meeting_info_detail_td" id="hobbyDetail">
									<div>
										<input type="checkbox" id="sports" name="meetingInfoDetail"
											value="스포츠"
											<c:if test="${fn:contains(detailList, '스포츠')}" > checked</c:if>
											disabled> <label for="sports">스포츠</label>
									</div>
									<div>
										<input type="checkbox" id="art" name="meetingInfoDetail"
											value="예술"
											<c:if test="${fn:contains(detailList, '예술')}" > checked</c:if>
											disabled> <label for="art">예술</label>
									</div>
									<div>
										<input type="checkbox" id="it" name="meetingInfoDetail"
											value="IT"
											<c:if test="${fn:contains(detailList, 'IT')}" > checked</c:if>
											disabled> <label for="it">IT</label>
									</div>
									<div>
										<input type="checkbox" id="etc" name="meetingInfoDetail"
											disabled
											<c:if test="${!empty detailValue && fn:contains(detailList, detailValue)}">checked</c:if>>

										<label for="etc"> <input type="text"
											id="etcTextDetail" name="etcText" size="15"
											value="${detailValue}" disabled>
										</label>
									</div>
								</div>
							</c:otherwise>
						</c:choose></td>
						<td></td>
					<td colspan="2"><textarea class="regular_memo" name="memo"
							disabled>${regular.memo}</textarea></td>
				</tr>

				<!-- 회원들만 모임장 정보 보이게 -->
				<c:if test="${regular.creatorId ne memberSession.memberId}">
					<c:if
						test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
						<tr>
							<th>모임장 정보</th>
							<td colspan="4">
								<div class="member_list_td">
									<div>
										<div class="member">${creatorMember.name}/
											${creatorMember.studentNumber} / ${creatorMember.major} /
											${creatorMember.phone}</div>
										<div class="member_good_btn"
											onClick="rateMember('${regular.creatorId}','like')">
											<img src="../../../img/좋아요.png">
										</div>
										<div class="member_bad_btn"
											onClick="rateMember('${regular.creatorId}','dislike')">
											<img src="../../../img/싫어요.png">
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:if>
				</c:if>

				<!-- 모임 생성자만 보이게 -->
				<c:if test="${regular.creatorId eq memberSession.memberId}">
					<tr>
						<th>회원 목록</th>
						<td colspan="4">
							<div class="member_list_td">
								<c:forEach var="joinMember" items="${joinMemberList}">
									<div>
										<div class="member">${joinMember.name}/
											${joinMember.studentNumber} / ${joinMember.major} /
											${joinMember.phone}</div>
										<div class="member_good_btn"
											onClick="rateMember('${joinMember.memberId}','like')">
											<img src="../../img/좋아요.png">
										</div>
										<div class="member_bad_btn"
											onClick="rateMember('${joinMember.memberId}','dislike')">
											<img src="../../img/싫어요.png">
										</div>
										<c:if test="${regular.close eq 0 || regular.cancel eq 0}">
											<div class="member_out_btn" id="${joinMember.memberId}"
												onclick="memberOut(this.id)">내보내기</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>

					<tr>
						<th>신청 목록</th>
						<td colspan="4">
							<div class="member_list_td">
								<c:forEach var="applyMember" items="${applyMemberList}">
									<div>
										<div class="member">${applyMember.name}/
											${applyMember.studentNumber} / ${applyMember.major} /
											${applyMember.phone}</div>
										<div class="member_good">
											<img src="../../img/좋아요.png">&nbsp;${applyMember.good}
										</div>
										<div class="member_bad">
											<img src="../../img/싫어요.png">&nbsp;${applyMember.bad}
										</div>
										<c:if test="${regular.close eq 0 && regular.cancel eq 0}">
											<div class="member_in_btn" id="${applyMember.memberId}"
												onclick="memberIn(this.id)">수락하기</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>
				</c:if>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td style="width: 20%">
					<c:if test="${regular.cancel eq 0 && regular.close eq 0}">
							<c:if test="${regular.creatorId eq memberSession.memberId}">
								<div class="regular_close_btn" onclick="closeForm.submit()">모집 마감하기</div>
								<!-- 모임 생성자만 보이게 -->
							</c:if>
							<!-- 비회원만 보이게(신청X) -->
							<c:if test="${regular.creatorId ne memberSession.memberId}">
								<c:if
									test="${fn:contains(joinMemberIdList, memberSession.memberId) eq false}">
									<c:if
										test="${fn:contains(applyMemberIdList, memberSession.memberId) eq false}">
										<div class="regular_apply_btn" onclick="applyForm.submit()">신청하기</div>
									</c:if>
								</c:if>
							</c:if>
							<!-- 신청한 사람들만 (수락X) 보이게 -->
							<c:if test="${regular.creatorId ne memberSession.memberId}">
								<c:if
									test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
									<div class="regular_apply_btn"
										onclick="applyCancelForm.submit()">신청 취소하기</div>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${regular.cancel eq 0 && regular.close eq 1}">
							<c:if test="${regular.creatorId eq memberSession.memberId}">
								<c:if test="${regular.numOfPeople lt regular.maxPeople}">
									<div class="regular_cancel_close_btn"
										onclick="closeCancelForm.submit()">다시 모집하기</div>
									<!-- 모임 생성자만 보이게 -->
								</c:if>
							</c:if>
						</c:if>
					</td>
					
					<!-- 모임 생성자만 보이게 -->
					<c:if test="${regular.creatorId eq memberSession.memberId}">
						<c:if test="${regular.cancel eq 0 }">
							<td style="width: 20%">
								<div class="regular_delete_btn" onClick="deleteMeeting()">모임
									삭제하기</div>
							</td>
						</c:if>
					</c:if>
				</tr>
			</table>
		</form>
		<!-- 멤버 내보내기 -->
		<form name="memberOutForm" id="memberOutForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="applyMemberId" id="memberOut"> <input
				type="hidden" name="inOrOut" value="0"> <input type="hidden"
				name="count" value="${regular.numOfPeople}">
		</form>
		<!-- 멤버 수락 -->
		<form name="memberInForm" id="memberInForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="applyMemberId" id="memberIn"> <input
				type="hidden" name="inOrOut" value="1"> <input type="hidden"
				name="count" value="${regular.numOfPeople}">
		</form>

		<form name="deleteForm" action="/meeting/delete" method="post">
			<input type="hidden" name="meetingId" value="${regular.meetingId}">
		</form>

		<form name="closeForm" action="/meeting/regular/info">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="close" value="1">
		</form>

		<form name="closeCancelForm" action="/meeting/regular/info">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="close" value="0">
		</form>

		<form name="applyForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="checkedApply" value="1">
			<c:choose>
				<c:when
					test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="1">
				</c:when>
				<c:when
					test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="0">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apply" value="-1">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="heart" value="${heart}">
		</form>

		<form name="applyCancelForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${regular.meetingId}">
			<input type="hidden" name="checkedApply" value="0">
			<c:choose>
				<c:when
					test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="1">
				</c:when>
				<c:when
					test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="0">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apply" value="-1">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="heart" value="${heart}">
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>			
		init();
		
		function init() {
			let cancel = document.getElementById("cancel").value;
			if (cancel == 1) {
				document.getElementById("container").style.backgroundColor = "rgb(244, 243, 243)";
			}
		}
		
		function memberIn(applyMemberId) {
			var retVal = confirm("이 회원을 수락하시겠습니까?");
            if (retVal == true) {
            	document.getElementById("memberIn").value = applyMemberId;
    			document.getElementById("memberInForm").submit();
            	alert("수락했습니다.");
            }
            return retVal;
		}
		
		function memberOut(applyMemberId) {
			var retVal = confirm("이 회원을 내보내시겠습니까?");
            if (retVal == true) {
            	document.getElementById("memberOut").value = applyMemberId;
    			document.getElementById("memberOutForm").submit();
            	alert("완료되었습니다.");
            }
            return retVal;
		}
		
		function deleteMeeting() {
			var retVal = confirm("삭제하시겠습니까?");
            if (retVal == true) {
            	alert("삭제되었습니다.");
            	deleteForm.submit();
            }
            return retVal;
		} 
		
		function rateMember(evaluatedMember, type) {
			var rater = '${memberSession.memberId}';
			var meetingId = ${regular.meetingId};
			
			$.ajax({
				url : "/member/rating",
				type : "post",
				data : {"rater" : rater,
						"evaluatedMember" : evaluatedMember,
						"meetingId" : meetingId,
						"type" : type }, 
				success : function(data){
					if(data == "rated") {
						alert("이미 평가를 완료한 회원입니다");
					} else if (data == "likeSuccess"){
						alert("좋아요 성공");
					} else {
						alert("싫어요 성공");
					}
				}
			})
		}
	</script>

</body>

</html>