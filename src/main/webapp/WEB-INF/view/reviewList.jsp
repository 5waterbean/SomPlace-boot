<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<title>reviewList</title>
<style>
.right_review {
	width: 15%;
	position: fixed;
	top: 400px;
	right: 0;
	padding: 10px;
	margin: 10px;
}

.right_review_first {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
}

.right_review_first .score {
	font-weight: bold;
	color: red;
}

.right_review_first .right_review_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px;
	border-radius: 20px;
}

.right_review_first .right_review_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.right_review_second {
	border: 1px solid black;
	border-radius: 20px;
	padding: 10px;
	overflow-y: scroll;
	height: 200px;
}

.right_review .review_item {
	border: 1px solid black;
	border-radius: 20px;
	padding: 5px;
	font-size: small;
}

.right_review .review_item .star {
	color: blue;
	font-size: large;
}
</style>
</head>

<body>
	<div class="right_review">

		<c:set var="currentMemberId" value="${memberSession.memberId}" />

		<div class="right_review_first">
			<div>
				<div>후기들</div>
				<div>
					(평점 <span class="score">4.5</span>)
				</div>
			</div>

			<c:if test="${fn:contains(joinMemberIdList, currentMemberId)}">
				<c:choose>
					<c:when test="${fn:contains(reviewMemberIdList, currentMemberId)}">
						<div class="right_review_btn" onClick="updateForm.submit()">후기
							수정하기</div>
					</c:when>

					<c:otherwise>
						<div class="right_review_btn"
							onClick="location.href='/review/write/form?meetingId=' + ${regular.meetingId}">후기
							작성하기</div>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>

		<br>

		<div class="right_review_second">
			<c:forEach var="review" items="${reviewList}">
				<div class="review_item">
					<div class="star">
						<c:forEach begin="1" end="${review.star}">
							★	
						</c:forEach>
						<c:forEach begin="${review.star + 1}" end="5">
							☆
						</c:forEach>
					</div>
					<div>${review.reviewMemo}</div>
				</div>

				<br>
			</c:forEach>

		</div>
	</div>
</body>

</html>