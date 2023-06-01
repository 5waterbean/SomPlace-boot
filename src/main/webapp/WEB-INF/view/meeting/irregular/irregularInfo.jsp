<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.container form table tr:nth-child(10)>td:nth-child(3), .container form table tr:nth-child(10)>td:nth-child(4)
	{
	width: 20%;
}

.irregular_delete_btn, .irregular_close_btn, .irregular_apply_btn,
	.irregular_update_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	text-align: center;
}

.member_out_btn:hover, .member_in_btn:hover, .member_good_btn:hover,
	.member_bad_btn:hover, .irregular_delete_btn:hover,
	.irregular_close_btn:hover, .irregular_apply_btn:hover,
	.irregular_update_btn:hover {
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
				<div class="irregular_update_btn"  onClick="location.href='/meeting/irregular/update/form';">모임 수정하기</div>
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
						value=" ${memberSession.major} / ${memberSession.studentNumber} " disabled>
				</div>
			</div>

			<br>

			<table>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" id="title" name="title"
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
						name="meetingDate" required value="${irregular.meetingDate}"
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
						<input type="radio" id="meal" name="meetingInfo" disabled>
							<label for="meal">식사</label> 
						<input type="radio" id="study" name="meetingInfo" disabled> 
							<label for="study">스터디</label>
						<input type="radio" id="hobby" name="meetingInfo" disabled>
							<label for="hobby">취미</label>
					</td>
				</tr>
				<tr>
                    <th></th>
                    <td colspan="3">
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
                               <input type="checkbox" id="etc" name="meetingInfoDetail" onclick="etcVal(this.id)">
                                <label for="etc">
                                   <input type="text" id="etcTextDetail" name="etcText" size="15" placeholder="기타항목 입력">
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
                                <input type="checkbox" id="exam" name="meetingInfoDetail" value="학교 시험">
                                <label for="exam">학교 시험</label>
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
                                <input type="checkbox" id="etc" name="meetingInfoDetail" onclick="etcVal(this.id)">
                                <label for="etc">
                                    <input type="text" id="etcTextDetail" name="etcText" size="15" placeholder="기타항목 입력"
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
								<input type="checkbox" id="etc" name="meetingInfoDetail" onclick="etcVal(this.id)"> 
								<label for="etc">
									<input type="text" id="etcTextDetail" name="etcTextDetail" placeholder="기타항목을 입력하세요.">
								</label>
							</div>
						</div>
					</td>
				</tr>

				<!-- 회원들만
                <tr> 
                    <th>모임장 정보</th>
                    <td colspan="3">
                        <div class="member_list_td">
                            <div>
                                <div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
                                <div class="member_good_btn"><img src="../../../img/좋아요.png"></div>
                                <div class="member_bad_btn"><img src="../../../img/싫어요.png"></div>
                            </div>
                        </div>
                    </td> 
                </tr>  -->

				<tr>
					<!--생성자만-->
					<th>회원 목록</th>
					<td colspan="6">
						<div class="member_list_td">
							<div>
								<div class="member">이현아 / 20191003 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../../img/싫어요.png">
								</div>
								<div class="member_out_btn">내보내기</div>
							</div>
							<div>
								<div class="member">오수빈 / 20200985 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../../img/싫어요.png">
								</div>
								<div class="member_out_btn">내보내기</div>
							</div>
							<div>
								<div class="member">장현수 / 20191011 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good_btn">
									<img src="../../../img/좋아요.png">
								</div>
								<div class="member_bad_btn">
									<img src="../../../img/싫어요.png">
								</div>
								<div class="member_out_btn">내보내기</div>
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<!--생성자만-->
					<th>신청 목록</th>
					<td colspan="6">
						<div class="member_list_td">
							<div>
								<div class="member">김동덕 / 20190000 / 컴퓨터학과 / 010-7***-9***</div>
								<div class="member_good">
									<img src="../../../img/좋아요.png">&nbsp;4
								</div>
								<div class="member_bad">
									<img src="../../../img/싫어요.png">&nbsp;1
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
						<div class="irregular_delete_btn">모임 삭제하기</div> <!--생성자만-->
					</td>
					<td>
						<div class="irregular_close_btn">모집 마감하기</div> <!--생성자만-->
					</td>
					<!-- <td> 
                        비회원만 <div class="irregular_apply_btn">모임 신청하기</div>
                    </td> -->
				</tr>
			</table>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		document.querySelector('input[type="date"]').value = new Date()
				.toISOString().substring(0, 10);
		document.querySelector('input[type="date"]').min = new Date()
				.toISOString().substring(0, 10);
		
		 let etc = document.querySelector("#etc");
	        let etcTextDetail = document.querySelector('#etcTextDetail');

	        function create() {
	            if (etc.checked) {
	                if (etc.value != "") {
	                    etc.value = etcTextDetail.value;
	                }
	            }
	        }

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
	    	
	    	function etcVal(etc) {
	    		var etcText = regularCreateForm.etcTextDetail.value;
	    		alert(etcText);
	    		if (etc.checked) {
	    			$('#etc').attr('value', etcText);
	    		}
	    	}
	</script>
</body>

</html>