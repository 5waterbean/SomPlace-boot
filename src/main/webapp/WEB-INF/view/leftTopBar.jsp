<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	height: 60px;
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	display: flex;
	align-items: center;
	font-weight: bold;
	z-index: 10;
}

.top>img {
	width: 15%;
	height: 90px;
}

.top>div {
	border: 1px solid blu;
	width: 70%;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	font-size: large;
            font-weight: bolder;
}

div.active {
	color: rgb(122, 205, 103);
	font-size: x-large;
}

.top>div>div:hover {
	cursor: pointer;
}

.left {
	width: 15%;
	position: fixed;
	top: 60px;
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

.list>div:nth-child(5) {
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
		<img src="../../../img/logo.png" onclick="location.href='/meeting/sort/all'">

		<div>
			<div id="meal" onclick="setCategory(this.id)">식사</div>
			<div id="study" onclick="setCategory(this.id)">스터디</div>
			<div id="hobby" onclick="setCategory(this.id)">취미</div>
		</div>
	</div>

	<form:form name="categoryForm" action="/meeting/sort/all">
		<input type="hidden" id="hiddenId" name="category"></input>
		<input type="hidden" id="meetingType" name="meetingType" value="${meetingType}"></input>
		<input type="hidden" id="key" name="key" value="${checkedKey}"></input>
	</form:form>

	<div class="left">
		<div class="profile">
			<img src="../../../img/somsom.png" class="face"> <br>
			<div>${memberSession.name}</div>
			<br>
			<div>${memberSession.studentNumber}</div>
			<br>
			<div class="like">
				<div>
					<img src="../../../img/좋아요.png" class="estimate"> &nbsp;
					<div>${memberSession.good}</div>
				</div>
				<div>
					<img src="../../../img/싫어요.png" class="estimate"> &nbsp;
					<div>${memberSession.bad}</div>
				</div>
			</div>
			<br>
			<div class="profile_btn">
				<div onClick="location.href='/member/myInfo'">내 정보</div>
				<div onClick="location.href='/member/logout'">로그아웃</div>
			</div>
		</div>

		<br>

		<div class="list">
			<div onClick="location.href='/member/myMeeting/made'">내가 생성한 모임</div>
			<div onClick="location.href='/member/myMeeting/join/irregular'">내가 속한 일시적 모임</div>
			<div onClick="location.href='/member/myMeeting/join/regular'">내가 속한 정기적 모임</div>
			<div onClick="location.href='/member/myMeeting/like'">내가 찜한 모임</div>
			<div onClick="location.href='/member/myMeeting/apply'">내가 신청한 모임</div>
		</div>
	</div>
	<script>
		let hidden = document.querySelector('input[type="hidden"]');
		let mealDiv = document.querySelector('div#meal');
		let studyDiv = document.querySelector('div#study');
		let hobbyDiv = document.querySelector('div#hobby');
	
		init();
	
		function init() {
			if (hidden.value != "") {
				mealDiv.classList.value = '';
				studyDiv.classList.value = '';
				hobbyDiv.classList.value = '';
	
				if (hidden.value == '식사') {
					mealDiv.classList.value = 'active';
				} else if (hidden.value == '스터디') {
					studyDiv.classList.value = 'active';
				} else if (hidden.value == '취미') {
					hobbyDiv.classList.value = 'active';
				}
			}
		}
	
		function setCategory(categoryId) {
			if (categoryId == 'meal') {
				hidden.value = "식사";
			} else if (categoryId == 'study') {
				hidden.value = "스터디";
			} else {
				hidden.value = "취미";
			}
	
			init();
	
			categoryForm.submit();
		}
		
</script>
</body>

</html>