<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LeftTopBar</title>
<style>
* {
	box-sizing: border-box;
}

html {
	height: 100%;
}

body {
	margin: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
}

.top {
	background-color: rgb(254, 251, 191);
	height: 50px;
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	font-weight: bold;
	z-index: 10;
}

.top>div:hover {
	color: gray;
	cursor: pointer;
}

.left {
	width: 15%;
	position: fixed;
	top: 50px;
	left: 0;
	padding: 10px;
}

.profile {
	width: 100%;
	margin: 10px;
	padding: 10px;
	border: 1px solid black;
	border-radius: 20px;
	text-align: center;
}

.profile .face {
	width: 80%;
	height: 150px;
}

.like {
	width: 100%;
	display: flex;
	justify-content: space-evenly;
}

.like img {
	height: 30px;
	width: 30px;
}

.like>div {
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-size: large;
}

.profile_btn {
	width: 100%;
	display: flex;
	justify-content: space-evenly;
}

.profile_btn>div {
	border: 1px solid black;
	border-radius: 20px;
	padding: 5px 15px;
	background-color: rgb(226, 240, 217);
}

.profile_btn>div:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.list {
	width: 100%;
	border-radius: 20px;
	margin: 10px;
}

.list>div:nth-child(1) {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

.list>div:nth-child(4) {
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}

.list>div {
	border: 1px solid black;
	text-align: center;
	background-color: rgb(226, 240, 217);
	padding: 7px;
}

.list>div:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="top">
		<div>식사</div>
		<div>스터디</div>
		<div>취미</div>
	</div>

	<div class="left">
		<div class="profile">
			<img src="./img/somsom.png" class="face"> <br>
			<div>이지수</div>
			<br>
			<div>20190998</div>
			<br>
			<div class="like">
				<div>
					<img src="./img/좋아요.png" class="estimate"> &nbsp;
					<div>4</div>
				</div>
				<div>
					<img src="./img/싫어요.png" class="estimate"> &nbsp;
					<div>1</div>
				</div>
			</div>
			<br>
			<div class="profile_btn">
				<div>내 정보</div>
				<div>로그아웃</div>
			</div>
		</div>

		<br>

		<div class="list">
			<div>내가 생성한 모임</div>
			<div>내가 속한 모임</div>
			<div>내가 찜한 모임</div>
			<div>내가 신청한 모임</div>
		</div>
	</div>
</body>

</html>