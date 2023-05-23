<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchBox</title>
<style>
.middle {
	width: 67%;
	margin: 0 auto;
	padding: 10px;
	position: absolute;
	top: 60px;
	left: 0;
	right: 0;
}

.middle_first {
	display: flex;
	justify-content: center;
	height: 40px;
}

.middle_first>input {
	flex-grow: 1;
	padding: 5px;
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
}

.middle_first>div {
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
	border: 1px solid black;
	background-color: lightgray;
	display: flex;
	align-items: center;
	justify-content: center;
}

.middle_first img {
	width: 50%;
}

.middle_first>div:hover {
	cursor: pointer;
	background-color: rgb(193, 193, 193);
}

.middle_second {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.middle_second select {
	padding: 5px;
	width: 15%;
	border-radius: 20px;
	font-size: medium;
}
</style>
</head>

<body>
	<div class="middle">
		<div class="middle_first">
			<input type="text" placeholder=" 검색하고 싶은 키워드를 입력해주세요">
			<div>
				<img src="./img/search.png" alt="" class="">
			</div>
		</div>

		<div class="middle_second">
			<div>
				<input type="radio" name="sort"> <label for="">일시적</label> <input
					type="radio" name="sort"> <label for="">정기적</label> <input
					type="radio" name="sort" checked> <label for="">전체</label>
			</div>

			<select>
				<option value="">최신순</option>
				<option value="">인기순</option>
			</select>
		</div>
	</div>
</body>

</html>