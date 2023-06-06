<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>regular create</title>
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

.container form input[type="number"] {
	width: 40%;
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
	font-size:16px;
	height:33px;
}

button:hover, .regular_back_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

button {
	font-size:16px;
	height:33px;
}

</style>

</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<form:form action="/meeting/regular/create" method="post" modelAttribute="meetingCommand" >
			<div>
				<h2>정기적 모임 만들기</h2>
			</div>

			<hr>

			<div class="regular_create_first">
				<div>
					<input type="radio" id="irregularRadio" name="sort" 
						onclick="location.href='/meeting/irregular/create/form';">
					<label for="irregularRadio">일시적</label> 
					<input type="radio" id="regularRadio" name="sort" checked> 
					<label for="regularRadio">정기적</label>
				</div>

				<!--비회원만 보이게-->
				<div class="creator">
					<h3>모임장</h3>
					<div class="creator_info">&nbsp; ${memberSession.major} / ${memberSession.studentNumber} &nbsp;</div>
					<input type="hidden" name="creatorId" value="${memberSession.memberId}">
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title" name="meetingTitle" value=""
						size="120" required></td>
				</tr>

				<tr>
					<th>모임 이름</th>
					<td><input type="text" name="meetingName" value="" required>
					<font color="red" size="2"><form:errors path="meetingName" /></font>
					</td>
					<td style="text-align: right;"><strong>모집 인원</strong></td>
					<td><input type="number" name="maxPeople" min="2" max="10" value=""
						required> <strong>명</strong></td>
				</tr>

				<tr>
					<th>모임 장소</th>
					<td colspan="3"><input type="text" id="meetingPlace" name="meetingPlace" value=""
						size="70" required></td>
				</tr>

				<tr>
					<th>모임날짜</th>
					<td colspan="3">
						<div class="regular_dayTime">
							<div>
								<h4>- 매주</h4>
								<font color="red" size="2"><form:errors path="regularMeetingDay" /></font>
							</div>

							<div>
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="월">월&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="화">화&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="수">수&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="목">목&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="금">금&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="토">토&nbsp;&nbsp;
								<input type="checkbox" id="regularDay" name="regularMeetingDay" value="일">일&nbsp;&nbsp;
							</div>

							<br>

							<div>
								<h4>- 시간대</h4>
								<font color="red" size="2"><form:errors path="meetingTime" /></font>
							</div>

							<div>
								<input id="regularTime" type="checkbox" name="meetingTime" value="06-12">06-12&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" name="meetingTime" value="12-18">12-18&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" name="meetingTime" value="18-24">18-24&nbsp;&nbsp;
								<input id="regularTime" type="checkbox" name="meetingTime" value="00-06">00-06&nbsp;&nbsp;
								
							</div>

							<br>

							<div>
								<h4>- 시작 날짜</h4>
							</div>

							<div class="start_day">
								<input type="date" name="startDay" value="">
							</div>

							<br>
						</div>
					</td>
				</tr>

				<tr>
					<th>카테고리</th>
					<td>
						<div>
							<input type="radio" id="meal" name="meetingInfo" value="식사" onclick="showDetail(this.id)" checked> 
							<label for="meal">식사</label> 
							<input type="radio" id="study" name="meetingInfo" value="스터디" onclick="showDetail(this.id)"> 
							<label for="study">스터디</label> 
							<input type="radio" id="hobby" name="meetingInfo" value="취미" onclick="showDetail(this.id)"> 
							<label for="hobby">취미</label>
						</div>
					</td>
					<td><strong>모임 메모</strong></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td>
					<font color="red" size="2"><form:errors path="meetingInfoDetail" /></font>
						<!-- 식사선택시 -->
                        <div class="meeting_info_detail_td" id="mealDetail">
                           <div>
                               <input type="checkbox" id="western" name="meetingInfoDetail" value="양식">
                               <label for="western">양식</label>
                           </div>
                           <div>
                               <input type="checkbox" id="japanese" name="meetingInfoDetail" value="일식">
                               <label for="japanese">일식</label>
                           </div>
                           <div>
                               <input type="checkbox" id="chinese" name="meetingInfoDetail" value="중식">
                               <label for="chinese">중식</label>
                           </div>
                           <div>
                               <input type="checkbox" id="korean" name="meetingInfoDetail" value="한식">
                               <label for="korean">한식</label>
                           </div>
                           <div>
                               <input type="checkbox" id="flour_based" name="meetingInfoDetail" value="분식">
                               <label for="flour_based">분식</label>
                           </div>
                           <div>
                               <input type="checkbox" id="alcohol" name="meetingInfoDetail" value="술">
                               <label for="alcohol">술</label>
                           </div>
                           <div>
                               <input type="checkbox" id="mealEtc" name="meetingInfoDetail">
                                <label for="mealEtc">
                                   <input type="text" id="mealEtcTextDetail" name="mealEtcText" size="15" placeholder="기타항목 입력">
                               </label>
                           </div>
                        </div>

                        <!-- 스터디선택시 -->
						<div class="meeting_info_detail_td" id="studyDetail">
                            <div>
                                <input type="checkbox" id="task" name="meetingInfoDetail" value="과제">
                                <label for="task">과제</label>
                            </div>
                            <div>
                                <input type="checkbox" id="exam" name="meetingInfoDetail" value="학교시험">
                                <label for="exam">학교시험</label>
                            </div>
                            <div>
                                <input type="checkbox" id="prepare_employment" name="meetingInfoDetail" value="취업준비">
                                <label for="prepare_employment">취업준비</label>
                            </div>
                            <div>
                                <input type="checkbox" id="license" name="meetingInfoDetail" value="자격증">
                                <label for="license">자격증</label>
                            </div>
                            <div>
                                <input type="checkbox" id="StudyEtc" name="meetingInfoDetail">
                                <label for="StudyEtc">
                                    <input type="text" id="StudyEtcTextDetail" name="StudyEtcText" size="15" placeholder="기타항목 입력"
                                    >
                                </label>
                            </div>
                        </div>
                    
						<!-- 취미선택시 -->
						<div class="meeting_info_detail_td" id="hobbyDetail">
							<div>
								<input type="checkbox" id="sports" name="meetingInfoDetail" value="스포츠"> 
								<label for="sports">스포츠</label>
							</div>
							<div>
								<input type="checkbox" id="art" name="meetingInfoDetail" value="예술"> 
								<label for="art">예술</label>
							</div>
							<div>
								<input type="checkbox" id="it" name="meetingInfoDetail" value="IT"> 
								<label for="it">IT</label>
							</div>
							<div>
								<input type="checkbox" id="hobbyEtc" name="meetingInfoDetail"> 
								<label for="hobbyEtc">
									<input type="text" id="hobbyEtcTextDetail" name="hobbyEtcText" placeholder="기타항목을 입력하세요.">
								</label>
							</div>
						</div>
					</td>
					<td colspan="2"><textarea class="regular_memo" name="memo"
							placeholder="모임 상세 정보 등을 자유롭게 작성해주세요."></textarea></td>
				
				</tr>
				
				<tr>
					<td></td>
					<td></td>
					<td>
						<button type="submit" onclick="create()">생성하기</button>
					</td>
					<td>
						<div class="regular_back_btn" onclick="location.href='/meeting/sort/all'">취소하기</div>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		document.querySelector('input[type="date"]').value = new Date()
			.toISOString().substring(0, 10);
		document.querySelector('input[type="date"]').min = new Date()
			.toISOString().substring(0, 10);
	
		let mealEtc = document.querySelector("#mealEtc");
		let mealEtcTextDetail = document.querySelector('#mealEtcTextDetail');
		let StudyEtc = document.querySelector("#StudyEtc");
		let StudyEtcTextDetail = document.querySelector('#StudyEtcTextDetail');
		let hobbyEtc = document.querySelector("#hobbyEtc");
		let hobbyEtcTextDetail = document.querySelector('#hobbyEtcTextDetail');
		
	    function create() {
            if (mealEtc.checked) {
            	mealEtcTextDetail.required = true;
            	if (mealEtc.value != "") {
            		mealEtc.value = mealEtcTextDetail.value;
            		detailValue.value = mealEtcTextDetail.value;
            	}
            }
            if (StudyEtc.checked) {
            	StudyEtcTextDetail.required = true;
            	if (StudyEtc.value != "") {
            		StudyEtc.value = StudyEtcTextDetail.value;
            		detailValue.value = StudyEtcTextDetail.value;
            	}
            }
            if (hobbyEtc.checked) {
            	hobbyEtcTextDetail.required = true;
            	if (hobbyEtc.value != "") {
            		hobbyEtc.value = hobbyEtcTextDetail.value;
            		detailValue.value = hobbyEtcTextDetail.value;
            	}
            }
        }
	
	    $(document).ready(function() {
    		document.getElementById("studyDetail").style.display = "none";
    		document.getElementById("hobbyDetail").style.display = "none";
    	});
    	
    	let allMeal = document.querySelectorAll('#mealDetail > div > input[type="checkbox"]');
        let allStudy = document.querySelectorAll('#studyDetail > div > input[type="checkbox"]');
        let allHobby = document.querySelectorAll('#hobbyDetail > div > input[type="checkbox"]');
        
    	function showDetail(infoId) {
    		if (infoId == "meal") {
    			document.getElementById("mealDetail").style.display = "";
    			document.getElementById("studyDetail").style.display = "none";
    			document.getElementById("hobbyDetail").style.display = "none";
    			
    	        for (let i = 0; i < allStudy.length; i++) {
    	            allStudy[i].checked = false;
    	        }
    	        
    	        for (let i = 0; i < allHobby.length; i++) {
    	            allHobby[i].checked = false;
    	        }
    	        
    		} else if (infoId == "study") {
    			document.getElementById("mealDetail").style.display = "none";
    			document.getElementById("studyDetail").style.display = "";
    			document.getElementById("hobbyDetail").style.display = "none";
    			
    	        for (let i = 0; i < allMeal.length; i++) {
    	            allMeal[i].checked = false;
    	        }
    	        
    	        for (let i = 0; i < allHobby.length; i++) {
    	            allHobby[i].checked = false;
    	        }
    		} else {
    			document.getElementById("mealDetail").style.display = "none";
    			document.getElementById("studyDetail").style.display = "none";
    			document.getElementById("hobbyDetail").style.display = "";
    			
    	        for (let i = 0; i < allMeal.length; i++) {
    	            allMeal[i].checked = false;
    	        }
    	        
    	        for (let i = 0; i < allStudy.length; i++) {
    	            allStudy[i].checked = false;
    	        }
    		}
    	}
	</script>
</body>

</html>