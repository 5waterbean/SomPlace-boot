<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="right_review_first">
			<div>
				<div>후기들</div>
				<div>
					(평점 <span class="score">4.5</span>)
				</div>
			</div>

			<div class="right_review_btn">후기 작성하기</div>
		</div>

		<br>

		<div class="right_review_second">
			<div class="review_item">
				<div class="star">★★★★☆</div>
				<div>러닝하니까 건강해지는 느낌!</div>
			</div>

			<br>

			<div class="review_item">
				<div class="star">★★★★★</div>
				<div>솜솜들이 다 너무 착하셔서 만족하면서 운동하고 있어요ㅠ</div>
			</div>

			<br>

			<div class="review_item">
				<div class="star">★★★☆☆</div>
				<div>운동도 하고 친구도 생겼어요!</div>
			</div>
		</div>
	</div>
</body>

</html>