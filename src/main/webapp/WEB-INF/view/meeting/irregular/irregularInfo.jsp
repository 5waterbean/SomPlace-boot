<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>irregularInfo</title>
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

.container form textarea {
	border: 1px solid black;
	border-radius: 20px;
	width: 100%;
	height: 175px;
	padding: 15px;
	resize: none;
}

.container form input:disabled, textarea:disabled {
	background-color: rgb(244, 243, 243);
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

#meetingDate {
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

.member_list_td {
	border: 1px solid gray;
	border-radius: 20px;
	height: 150px;
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

.container form table tr:nth-child(10)>td:nth-child(3), 
.container form table tr:nth-child(10)>td:nth-child(4)
	{
	width: 20%;
}

.irregular_delete_btn, .irregular_close_btn, .irregular_cancel_close_btn,
.irregular_apply_btn, .irregular_cancel_apply_btn, #irregular_update_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.member_out_btn:hover, .member_in_btn:hover, .member_good_btn:hover,
	.member_bad_btn:hover, .irregular_delete_btn:hover,
	.irregular_close_btn:hover, .irregular_cancel_close_btn:hover, 
	.irregular_apply_btn:hover, .irregular_cancel_apply_btn:hover,
	#irregular_update_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container" id="container">
		<form action="/meeting/irregular/update/form">
			<div>
				<h2>일시적모임 상세정보</h2>
				<input type="hidden" name="checkedById" value="${irregular.meetingId}">
				<input type="hidden" id="close" name="close" value="${irregular.close}"><!-- 모집 마감 -->
				<input type="hidden" id="cancel" name="cancel" value="${irregular.cancel}"><!-- 모임 삭제 -->
				
				<c:if test="${irregular.cancel eq 1}">
					<font color="red" size="4">삭제된 모임입니다.</font>
				</c:if>
				<c:if test="${irregular.close eq 1 && irregular.cancel eq 0}">
					<font color="red" size="4">모집 마감된 모임입니다.</font>
				</c:if>
				<c:if test="${irregular.creatorId eq memberSession.memberId}">
					<c:if test="${irregular.cancel eq 0}">
						<button id="irregular_update_btn" type="submit">모임 수정하기</button>
					</c:if>
				</c:if>
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
						value=" ${creatorMember.major} / ${creatorMember.studentNumber} " disabled>
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title" name="meetingTitle"
						size="90" value="${irregular.meetingTitle}" required disabled>
					</td>
				</tr>

				<tr>
					<th>현재인원 / 모집인원</th>
					<td colspan="3"><input type="text" id="maxPeople"
						name="maxPeople" required size="3" value="${irregular.numOfPeople} / ${irregular.maxPeople}" disabled>
						<strong>명</strong></td>
				</tr>
				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" id="meetingPlace"
						name="meetingPlace" required size="30" value="${irregular.meetingPlace}" disabled>
					</td>
				</tr>
				<tr>
					<th>모임 날짜/시간</th>
					<td colspan="3"><input type="text" id="meetingDate"
						name="meetingDate" required value="${meetingDay}  ${meetingTime}"
						disabled></td>
				</tr>
				<tr>
					<th>모임 메모</th>
					<td colspan="3"><textarea class="regular_memo" disabled>${irregular.memo}</textarea>
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<input type="radio" id="meal" name="meetingInfo" disabled
							<c:if test="${irregular.meetingInfo eq '식사'}">checked</c:if>>
							<label for="meal">식사</label> 
						<input type="radio" id="study" name="meetingInfo" disabled
							<c:if test="${irregular.meetingInfo eq '스터디'}">checked</c:if>> 
							<label for="study">스터디</label>
						<input type="radio" id="hobby" name="meetingInfo" disabled
							<c:if test="${irregular.meetingInfo eq '취미'}">checked</c:if>>
							<label for="hobby">취미</label>
					</td>
				</tr>
				<tr>
                    <th></th>
                    <td colspan="3">
                    	<input type="hidden" name="detailValue" value="${detailValue}">
                        <c:set var="detailList" value="${detailList}"/>
                        <c:choose>
                        
                        <c:when test="${irregular.meetingInfo eq '식사'}">
	                        <div class="meeting_info_detail_td" id="mealDetail">
	                           <div>
	                               <input type="checkbox" id="western" name="meetingInfoDetail" value="양식" disabled
	                               	<c:if test="${fn:contains(detailList, '양식')}">checked</c:if>>
	                               <label for="western">양식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="japanese" name="meetingInfoDetail" value="일식" disabled
	                               	<c:if test="${fn:contains(detailList, '일식')}">checked</c:if>>
	                               <label for="japanese">일식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="chinese" name="meetingInfoDetail" value="중식" disabled
	                               	<c:if test="${fn:contains(detailList, '중식')}">checked</c:if>>
	                               <label for="chinese">중식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="korean" name="meetingInfoDetail" value="한식" disabled
	                               	<c:if test="${fn:contains(detailList, '한식')}">checked</c:if>>
	                               <label for="korean">한식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="flour_based" name="meetingInfoDetail" value="분식" disabled
	                               	<c:if test="${fn:contains(detailList, '분식')}">checked</c:if>>
	                               <label for="flour_based">분식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="alcohol" name="meetingInfoDetail" value="술" disabled
	                               	<c:if test="${fn:contains(detailList, '술')}">checked</c:if>>
	                               <label for="alcohol">술</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="etc" name="meetingInfoDetail" disabled 
	                               		<c:if test="${fn:contains(detailList, detailValue)}">checked</c:if>>
	                                <label for="etc">
	                                   <input type="text" id="etcTextDetail" name="etcText" size="15" placeholder="기타항목 입력"
	                                   	 disabled value="${detailValue}">
	                               </label>
	                           </div>
	                        </div>
                        </c:when>

						<c:when test="${irregular.meetingInfo eq '스터디'}">
                        
						<div class="meeting_info_detail_td" id="studyDetail">
                            <div>
                                <input type="checkbox" id="task" name="meetingInfoDetail" value="과제" disabled
                                	<c:if test="${fn:contains(detailList, '과제')}">checked</c:if>>
                                <label for="task">과제</label>
                            </div>
                            <div>
                                <input type="checkbox" id="exam" name="meetingInfoDetail" value="학교시험" disabled
                                	<c:if test="${fn:contains(detailList, '학교시험')}">checked</c:if>>
                                <label for="exam">학교시험</label>
                            </div>
                            <div>
                                <input type="checkbox" id="prepare_employment" name="meetingInfoDetail" value="취업준비" disabled
                                	<c:if test="${fn:contains(detailList, '취업준비')}">checked</c:if>>
                                <label for="prepare_employment">취업준비</label>
                            </div>
                            <div>
                                <input type="checkbox" id="license" name="meetingInfoDetail" value="자격증" disabled
                                	<c:if test="${fn:contains(detailList, '자격증')}">checked</c:if>>
                                <label for="license">자격증</label>
                            </div>
                            <div>
                                <input type="checkbox" id="etc" name="meetingInfoDetail" disabled <c:if test="${fn:contains(detailList, detailValue)}">checked</c:if>>
                                <label for="etc">
                                    <input type="text" id="etcTextDetail" name="etcText" size="15" placeholder="기타항목 입력"
                                     disabled value="${detailValue}">
                                </label>
                            </div>
                        </div>
                        </c:when>
                    
                    	<c:when test="${irregular.meetingInfo eq '취미'}">
						<div class="meeting_info_detail_td" id="hobbyDetail">
							<div>
								<input type="checkbox" id="sports" name="meetingInfoDetail" value="스포츠" disabled
									<c:if test="${fn:contains(detailList, '스포츠')}">checked</c:if>> 
								<label for="sports">스포츠</label>
							</div>
							<div>
								<input type="checkbox" id="art" name="meetingInfoDetail" value="예술" disabled
									<c:if test="${fn:contains(detailList, '예술')}">checked</c:if>> 
								<label for="art">예술</label>
							</div>
							<div>
								<input type="checkbox" id="it" name="meetingInfoDetail" value="IT" disabled
									<c:if test="${fn:contains(detailList, 'IT')}">checked</c:if>> 
								<label for="it">IT</label>
							</div>
							<div>
								<input type="checkbox" id="etc" name="meetingInfoDetail" disabled <c:if test="${fn:contains(detailList, detailValue)}">checked</c:if>> 
								<label for="etc">
									<input type="text" id="etcTextDetail" name="etcTextDetail" placeholder="기타항목을 입력하세요." disabled value="${detailValue}">
								</label>
							</div>
						</div>
						</c:when>
						</c:choose>
					</td>
				</tr>

				<!-- 회원들만 모임장 정보 보이게 -->
				<c:if test="${irregular.creatorId ne memberSession.memberId}">
					<c:if test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
		                <tr> 
		                    <th>모임장 정보</th>
		                    <td colspan="3">
		                        <div class="member_list_td">
		                            <div>
		                                <div class="member">${creatorMember.name} / ${creatorMember.studentNumber} / ${creatorMember.major} / ${creatorMember.phone}</div>
		                                <div class="member_good_btn">
		                                	<img src="../../../img/좋아요.png">
		                                </div>
		                                <div class="member_bad_btn">
		                                	<img src="../../../img/싫어요.png">
		                                </div>
		                            </div>
		                        </div>
		                    </td> 
		                </tr>
		             </c:if>
		         </c:if>

				<c:if test="${irregular.creatorId eq memberSession.memberId}"> <!--생성자만-->
					<tr>
						<th>회원 목록</th>
						<td colspan="6">
							<div class="member_list_td">
								<c:forEach var="joinMember" items="${joinMemberList}">
									<div>
										<div class="member">${joinMember.name} / ${joinMember.studentNumber} / ${joinMember.major} / ${joinMember.phone}</div>
										<div class="member_good_btn">
											<img src="../../../img/좋아요.png">
										</div>
										<div class="member_bad_btn">
											<img src="../../../img/싫어요.png">
										</div>
										<c:if test="${irregular.close eq 0 || irregular.cancel eq 0}">
											<div class="member_out_btn" id="${joinMember.memberId}" onclick="memberOut(this.id)">내보내기</div>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>

					<tr>
						<!--생성자만-->
						<th>신청 목록</th>
						<td colspan="6">
							<div class="member_list_td">
								<c:forEach var="applyMember" items="${applyMemberList}">
									<div>
										<div class="member">${applyMember.name} / ${applyMember.studentNumber} / ${applyMember.major} / ${applyMember.phone}</div>
										<div class="member_good">
											<img src="../../../img/좋아요.png">&nbsp;${applyMember.good}
										</div>
										<div class="member_bad">
											<img src="../../../img/싫어요.png">&nbsp;${applyMember.bad}
										</div>
										<c:if test="${irregular.close eq 0 && irregular.cancel eq 0}">
											<div class="member_in_btn" id="${applyMember.memberId}" onclick="memberIn(this.id)">수락하기</div>
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
					<td>
						<c:if test="${irregular.cancel eq 0 && irregular.close eq 0}">
							<c:if test="${irregular.creatorId eq memberSession.memberId}">
								<div class="irregular_close_btn" onclick="closeForm.submit()">모집 마감하기</div> <!-- 모임 생성자만 보이게 -->
							</c:if>
							<!-- 비회원만 보이게(신청X) -->
							<c:if test="${irregular.creatorId ne memberSession.memberId}">
								<c:if test="${fn:contains(joinMemberIdList, memberSession.memberId) eq false}">
									<c:if test="${fn:contains(applyMemberIdList, memberSession.memberId) eq false}">
										<div class="irregular_apply_btn" onclick="applyForm.submit()">신청하기</div>
									</c:if>
								</c:if>
							</c:if>
							<!-- 신청한 사람들만 (수락X) 보이게 -->
							<c:if test="${irregular.creatorId ne memberSession.memberId}">
								<c:if test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
									<div class="irregular_cancel_apply_btn" onclick="applyCancelForm.submit()">신청 취소하기</div>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${irregular.cancel eq 0 && irregular.close eq 1}">
							<c:if test="${irregular.creatorId eq memberSession.memberId}">
								<c:if test="${irregular.numOfPeople lt irregular.maxPeople}">
									<div class="irregular_cancel_close_btn" onclick="closeCancelForm.submit()">다시 모집하기</div> <!-- 모임 생성자만 보이게 -->
								</c:if>
							</c:if>
						</c:if>
					</td>
					<td>
						<!-- 모임 생성자만 보이게 -->
						<c:if test="${irregular.creatorId eq memberSession.memberId}">
							<c:if test="${irregular.cancel eq 0}">
								<div class="irregular_delete_btn" onclick="deleteForm.submit()">모임 삭제하기</div> <!--생성자만-->
							</c:if>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
		<form name="memberOutForm" id="memberOutForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="applyMemberId" id="memberOut">
			<input type="hidden" name="inOrOut" value="0">
			<input type="hidden" name="count" value="${irregular.numOfPeople}">
		</form>
		<form name="memberInForm" id="memberInForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="applyMemberId" id="memberIn">
			<input type="hidden" name="inOrOut" value="1">
			<input type="hidden" name="count" value="${irregular.numOfPeople}">
		</form>
		<form name="deleteForm" action="/meeting/delete" method="post">
			<input type="hidden" name="meetingId" value="${irregular.meetingId}">
		</form>
		<form name="closeForm" action="/meeting/irregular/info">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="close" value="1">
		</form>
		<form name="closeCancelForm" action="/meeting/irregular/info">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="close" value="0">
		</form>
		<form name="applyForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="checkedApply" value="1">
			<c:choose>
				<c:when test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="1">
				</c:when>
				<c:when test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="0">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apply" value="-1">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="heart" value="${heart}">
		</form>
		<form name="applyCancelForm" action="/meeting/join">
			<input type="hidden" name="checkedById" value="${irregular.meetingId}">
			<input type="hidden" name="checkedApply" value="0">
			<c:choose>
				<c:when test="${fn:contains(applyMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="1">
				</c:when>
				<c:when test="${fn:contains(joinMemberIdList, memberSession.memberId)}">
					<input type="hidden" name="apply" value="0">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="apply" value="-1">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="heart" value="${heart}">
		</form>
	</div>

	<script>
			init();
	
			function init() {
	    		let cancel = document.getElementById("cancel").value;
	    		if (cancel == 1) {
	    			document.getElementById("container").style.backgroundColor = "rgb(244, 243, 243)";
	    		}
	        }
			
			function memberIn(applyMemberId) {
				document.getElementById("memberIn").value = applyMemberId;
				document.getElementById("memberInForm").submit();
			}
			
			function memberOut(applyMemberId) {
				document.getElementById("memberOut").value = applyMemberId;
				document.getElementById("memberOutForm").submit();
			}
	</script>
</body>

</html>