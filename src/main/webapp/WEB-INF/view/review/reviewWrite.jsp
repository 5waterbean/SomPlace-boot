<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWrite</title>

<style>
.container {
	width: 65%;
	margin: 0 auto;
	margin-top: 10px;
	padding: 10px;
	position: absolute;
	top: 60px;
	left: 0;
	right: 0;
	border: 1px solid black;
	border-radius: 20px;
}

.container h2 {
	margin: 10px;
}

.container table {
	width: 100%;
}

.container table th {
	text-align: right;
	padding: 10px;
	width: 10%;
}

.container table td {
	padding: 10px;
}

.container table td textarea {
	width: 100%;
	border-radius: 10px;
	padding: 5px;
}

input[type="text"] {
	width: 50%;
	border-radius: 20px;
	padding: 5px;
	border: 2px solid black;
}

input[type="submit"] {
	width: 100%;
	padding: 5px;
	border-radius: 20px;
	border: none;
	border: 2px solid black;
	color: black;
	background-color: rgb(226, 240, 217);
}

input:hover {
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: rgb(174, 220, 175);
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~label {
	-webkit-text-fill-color: cornflowerblue;
}

.star-rating label:hover, .star-rating label:hover ~label {
	-webkit-text-fill-color: cornflowerblue;
}
</style>
</head>

<body>
	<div class="container">
		<h2>&lt;후기 작성하기&gt;</h2>
		<table>
			<tr>
				<th>모임이름</th>
				<td><input type="text" value="러닝해솜" disabled></td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5"
							v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4"
							v-model="ratings" /> <label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3"
							v-model="ratings" /> <label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2"
							v-model="ratings" /> <label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1"
							v-model="ratings" /> <label for="1-star" class="star">★</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>후기</th>
				<td><textarea name="" id="" rows="10">혼자하면 힘든데 다같이 하니까 덜 힘든 것 같아요.</textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2"></td>
				<td style="width: 20%;"><input type="submit" value="제출하기"></td>
			</tr>
		</table>
	</div>
</body>

</html>