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
<title>myMeetingList</title>
<style>
.title {
	text-align: left;
	width: 65%;
	margin: 5px auto;
	position: absolute;
	top: 60px;
}

.title h2 {
	border: 1px solid black;
	border-radius: 20px;
	display: inline-block;
	padding: 10px 30px 10px 30px;
	background-color: beige;
}

.container {
	width: 65%;
	border: 1px solid black;
	border-radius: 20px;
	position: absolute;
	top: 170px;
	overflow-y: scroll;
	overflow-x: hidden;
	height: 500px;
}

.container table {
    width: 100%;
}

.container tr {
    display: flex;
    flex-wrap: wrap;
}

.container td {
    text-align: center;
    width: 20%;
}

.container td>div {
	width: 90%;
	margin: 10px auto;
	border: 1px solid black;
	border-radius: 20px;
	transition: 0.7s ease all;
}

.container td>div:hover {
	transform: scale(1.1);
	cursor: pointer;
}

.container td div>div:nth-child(1) {
	text-align: right;
	color: gray;
	padding: 10px;
}

.container td div>div:nth-child(3) {
	font-weight: bold;
	font-size: small;
}

.container td div>div:nth-child(4) {
	font-weight: bold;
	font-size: x-small;
}

.container td div>div:nth-child(5) {
	font-size: x-small;
}

.container td div>div:nth-child(6) {
	text-align: right;
	padding: 10px;
	font-size: x-large;
}

.container td img {
	width: 40%;
}

.container td input {
	display: none;
}

.container td label:hover {
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	function addLike(like) {
		let heartLabel = like.nextElementSibling;
		let checkedById = like.id.slice(1);
		
		if (like.checked) {
			$.ajax({
				url : "/meeting/like",
				type : "post",
				data : {"checkedById" : checkedById}, 
				success : function(data){
					if(data == 1) {
						alert("모임 찜하기 성공!");
						heartLabel.innerHTML = "❤️";
					} 
				}
			})
		} else {
			$.ajax({
				url : "/meeting/like",
				type : "post",
				data : {"checkedById" : checkedById}, 
				success : function(data){
					if(data == -1) {
						alert("모임 찜하기 취소!");
						heartLabel.innerHTML = "🤍";
					} 
				}
			})
		}
		location.reload();
	}
</script>
</head>

<body>    
    <jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="title">
		<h2>
		<c:choose>
			<c:when test="${meetingListType eq 'made'}">
				내가 생성한 모임
			</c:when>
			<c:when test="${meetingListType eq 'joinIrregular'}">
				내가 속한 일시적 모임
			</c:when>
			<c:when test="${meetingListType eq 'joinRegular'}">
				내가 속한 정기적 모임
			</c:when>
			<c:when test="${meetingListType eq 'like'}">
				내가 찜한 모임
			</c:when>
			<c:otherwise>
				내가 신청한 모임
			</c:otherwise>
		</c:choose>
		</h2>
	</div>
	
	<div class="container">
		<table>
			<tr>
				<c:set var="study" value="../../img/read.png" />
				<c:set var="meal" value="../../img/english-breakfast.png" />
				<c:set var="hobby" value="../../img/lifestyle.png" />
				<c:forEach var="meeting" items="${myMeetingList}">
					<td>
						<form id="${meeting.meetingId}" action="/meeting/info"
							method="POST">
							<input type="hidden" name="checkedById"
								value="${meeting.meetingId}">
								<!-- 신청o, 찜하기o -->
								<c:if test="${fn:contains(memberSession.likeMeetingIdList, meeting.meetingId)
													&& fn:contains(memberSession.applyMeetingIdList, meeting.meetingId)}">
									<input type="hidden" name="heart" value="1">
									<input type="hidden" name="apply" value="1">
								</c:if>
								<!-- 신청o, 찜하기x -->
								<c:if test="${fn:contains(memberSession.likeMeetingIdList, meeting.meetingId) eq false
													&& fn:contains(memberSession.applyMeetingIdList, meeting.meetingId)}">
									<input type="hidden" name="heart" value="0">	
									<input type="hidden" name="apply" value="1">							
								</c:if>
								<!-- 신청x, 찜하기o -->
								<c:if test="${fn:contains(memberSession.likeMeetingIdList, meeting.meetingId)
													&& fn:contains(memberSession.applyMeetingIdList, meeting.meetingId) eq false}">
									<input type="hidden" name="heart" value="1">	
									<input type="hidden" name="apply" value="-1">							
								</c:if>
								<!-- 신청x, 찜하기x는 default -1 값으로 -->
						</form> <!-- this.previousElementSibling.submit(); findInfo(${meeting.meetingId}) -->
						<div onclick="this.previousElementSibling.submit();">
							<div>${meeting.numOfPeople}<font>/</font>${meeting.maxPeople}</div>
							<c:choose>
								<c:when test="${meeting.meetingInfo eq '식사'}">
									<img src='<c:out value="${meal}"/>' alt="">
								</c:when>
								<c:when test="${meeting.meetingInfo eq '스터디'}">
									<img src='<c:out value="${study}"/>' alt="">
								</c:when>
								<c:otherwise>
									<img src='<c:out value="${hobby}"/>' alt="">
								</c:otherwise>
							</c:choose>
							<div>${meeting.meetingTitle}</div>
							<div>${meeting.meetingInfo}</div>
							<div>${meeting.meetingInfoDetail}</div>

							<div style="height:50px;">
							<c:choose>
								<c:when test="${meeting.cancel eq 1}">
									<font color="gray" size="2">삭제된 모임입니다</font>
								</c:when>
								<c:otherwise>
									<c:if test="${memberSession.memberId ne meeting.creatorId}">
										<input type="checkbox" id="h${meeting.meetingId}" onclick="event.stopPropagation();" 
											<c:if test="${fn:contains(memberSession.likeMeetingIdList, meeting.meetingId)}">checked</c:if> oninput="addLike(this)">
										<label for="h${meeting.meetingId}"
											onclick="event.stopPropagation();">🤍</label>
										<script>
											var id = "h" + "<c:out value='${meeting.meetingId}'/>";
											if(document.getElementById(id).checked == true){
												document.getElementById(id).nextElementSibling.innerHTML = "❤️";
											}
										</script>
									</c:if>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</td>
				</c:forEach>
		    </tr>
		</table>
	</div>
</body>

</html>