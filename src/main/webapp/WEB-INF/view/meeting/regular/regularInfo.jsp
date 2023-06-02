<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
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
	padding: 15px;
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

.container form table tr:nth-child(9)>td:nth-child(3), .container form table tr:nth-child(9)>td:nth-child(4)
	{
	width: 20%;
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
				<h2>${regular.meetingTitle} 상세정보</h2>

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
					<div class="creator_info">&nbsp; ${memberSession.major} / ${memberSession.studentNumber} &nbsp;</div>
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="meetingTitle"
						size="120" value="${regular.meetingTitle}" disabled required></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="meetingName" size="70"
						value="${regular.meetingName}" disabled required></td>
					<td style="text-align: right;"><strong>현재 인원/모집 인원</strong></td>
					<td><input type="text" name="numOfPeople" size="10"
						value="${regular.numOfPeople} / ${regular.maxPeople}" disabled required> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" name="regularMeetingDay"
						size="70" value="${regular.meetingPlace}" disabled required></td>
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

							<div class="start_day">&nbsp;${regular.startDay}</div>

							<br>
						</div>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>
					<td>
						<div>
							<input type="radio" id="meal" name="meetingInfo" value="식사" 
								<c:if test="${regular.meetingInfo eq '식사'}" > checked</c:if> disabled> 
							<label for="meal">식사</label> 
							<input type="radio" id="study" name="meetingInfo" value="스터디" 
								<c:if test="${regular.meetingInfo eq '스터디'}" > checked</c:if> disabled> 
							<label for="study">스터디</label> 
							<input type="radio" id="hobby" name="meetingInfo" value="취미" 
							 	<c:if test="${regular.meetingInfo eq '취미'}" > checked</c:if> disabled> 
							<label for="hobby">취미</label>
						</div>
					</td>
					<td><strong>모임 메모</strong></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td>
					<c:set var="detailList" value="${detailList}"/>
					<c:choose>
						
						<c:when test="${regular.meetingInfo eq '식사'}">
	                        <div class="meeting_info_detail_td" id="mealDetail">
	                           <div>
	                               <input type="checkbox" id="western" name="meetingInfoDetail" value="양식"
	                               	 <c:if test="${fn:contains(detailList, '식사')}" > checked</c:if> disabled>
	                               <label for="western">양식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="japanese" name="meetingInfoDetail" value="일식"
	                               	<c:if test="${fn:contains(detailList, '일식')}" > checked</c:if> disabled>
	                               <label for="japanese">일식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="chinese" name="meetingInfoDetail" value="중식"
	                               <c:if test="${fn:contains(detailList, '중식')}" > checked</c:if> disabled>
	                               <label for="chinese">중식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="korean" name="meetingInfoDetail" value="한식"
	                               <c:if test="${fn:contains(detailList, '한식')}" > checked</c:if> disabled>
	                               <label for="korean">한식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="flour_based" name="meetingInfoDetail" value="분식"
	                               <c:if test="${fn:contains(detailList, '분식')}" > checked</c:if> disabled>
	                               <label for="flour_based">분식</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="alcohol" name="meetingInfoDetail" value="술"
	                               <c:if test="${fn:contains(detailList, '술')}" > checked</c:if> disabled>
	                               <label for="alcohol">술</label>
	                           </div>
	                           <div>
	                               <input type="checkbox" id="etc" name="meetingInfoDetail" onclick="etcVal(this.id)">
	                                <label for="etc">
	                                   <input type="text" id="etcTextDetail" name="etcText" size="15" disabled>
	                               </label>
	                           </div>
	                        </div>
	                       </c:when>
	
							<c:when test="${regular.meetingInfo eq '스터디'}">
	                        
							<div class="meeting_info_detail_td" id="studyDetail">
	                            <div>
	                                <input type="checkbox" id="task" name="meetingInfoDetail" value="과제"
	                                	<c:if test="${fn:contains(detailList, '과제')}" > checked</c:if> disabled>
	                                <label for="task">과제</label>
	                            </div>
	                            <div>
	                                <input type="checkbox" id="exam" name="meetingInfoDetail" value="학교 시험"
	                                	<c:if test="${fn:contains(detailList, '학교 시험')}" > checked</c:if> disabled>
	                                <label for="exam">학교 시험</label>
	                            </div>
	                            <div>
	                                <input type="checkbox" id="prepare_employment" name="meetingInfoDetail" value="취업준비"
	                                	<c:if test="${fn:contains(detailList, '취업준비')}" > checked</c:if> disabled>
	                                <label for="prepare_employment">취업준비</label>
	                            </div>
	                            <div>
	                                <input type="checkbox" id="license" name="meetingInfoDetail" value="자격증"
	                                	<c:if test="${fn:contains(detailList, '자격증')}" > checked</c:if> disabled>
	                                <label for="license">자격증</label>
	                            </div>
	                            <div>
	                                <input type="checkbox" id="etc" name="meetingInfoDetail" disabled>
	                                <label for="etc">
	                                    <input type="text" id="etcTextDetail" name="etcText" size="15" placeholder="기타항목 입력"
	                                    >
	                                </label>
	                            </div>
	                        </div>
	                    </c:when>
	                    
	                    <c:otherwise>
							
							<div class="meeting_info_detail_td" id="hobbyDetail">
								<div>
									<input type="checkbox" id="sports" name="meetingInfoDetail" value="스포츠"
										<c:if test="${fn:contains(detailList, '스포츠')}" > checked</c:if> disabled> 
									<label for="sports">스포츠</label>
								</div>
								<div>
									<input type="checkbox" id="art" name="meetingInfoDetail" value="예술"
										<c:if test="${fn:contains(detailList, '예술')}" > checked</c:if> disabled> 
									<label for="art">예술</label>
								</div>
								<div>
									<input type="checkbox" id="it" name="meetingInfoDetail" value="IT"
										<c:if test="${fn:contains(detailList, 'IT')}" > checked</c:if> disabled> 
									<label for="it">IT</label>
								</div>
								<div>
									<input type="checkbox" id="etc" name="meetingInfoDetail" disabled> 
									<label for="etc">
										<input type="text" id="etcTextDetail" name="etcTextDetail" placeholder="기타항목을 입력하세요.">
									</label>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					</td>
					
				</tr>

				<!-- 회원들만
                <tr> 
                    <th>모임장 정보</th>
                    <td colspan="3">
                        <div class="member_list_td">
                            <div>
                                <div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
                                <div class="member_good_btn"><img src="../../img/좋아요.png"></div>
                                <div class="member_bad_btn"><img src="../../img/싫어요.png"></div>
                            </div>
                        </div>
                    </td> 
                </tr>  -->

				<tr>
					<!--생성자만-->
					<th>회원 목록</th>

					<td colspan="3">
						<div class="member_list_td">
							<div>
								<div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../img/싫어요.png">
								</div>
								<!--<div class="member_out_btn">내보내기</div>-->
							</div>
							<div>
								<div class="member">오수빈 / 20200985 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../img/싫어요.png">
								</div>
								<!--<div class="member_out_btn">내보내기</div>-->
							</div>
							<div>
								<div class="member">장현수 / 20191011 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../img/싫어요.png">
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
									<img src="../../img/좋아요.png">&nbsp;4
								</div>
								<div class="member_bad">
									<img src="../../img/싫어요.png">&nbsp;1
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
	<script>
		$(document).ready(function() {
			document.getElementById("studyDetail").style.display = "none";
			document.getElementById("hobbyDetail").style.display = "none";
		});
		
		function showDetail(infoId) {
			if (infoId == "meal") {
				document.getElementById("mealDetail").style.display = "";
				document.getElementById("studyDetail").style.display = "none";
				document.getElementById("hobbyDetail").style.display = "none";
			} else if (infoId == "study") {
				document.getElementById("mealDetail").style.display = "none";
				document.getElementById("studyDetail").style.display = "";
				document.getElementById("hobbyDetail").style.display = "none";
			} else {
				document.getElementById("mealDetail").style.display = "none";
				document.getElementById("studyDetail").style.display = "none";
				document.getElementById("hobbyDetail").style.display = "";
			}
		}
	</script>
	
</body>

</html>