<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<style>
.container {
	width: 50%;
	margin: 0 auto;
	border: 1px solid black;
	border-radius: 20px;
}

.containerTitle {
	background-color: rgb(254, 251, 191);
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
	padding: 10px;
	padding-left: 20px;
	font-weight: bold;
}

form {
	width: 100%;
	padding: 10px;
}

form table {
	width: 100%;
	border-collapse: collapse;
}

form th {
	text-align: right;
	width: 20%;
	padding: 10px;
}

form td {
	padding: 10px;
}

input {
	width: 100%;
	border-radius: 20px;
	padding: 5px;
	border: 2px solid black;
}

select {
	width: 100%;
	padding: 5px;
	border-radius: 20px;
	border: 2px solid black;
}

.phone td {
	font-size: x-large;
}

.noChange {
	background-color: lightgray;
}

.lastTd {
	width: 20%;
}

input[type="submit"] {
	width: 100%;
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
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/view/leftTopBar.jsp" />
	<jsp:include page="/WEB-INF/view/rightBar.jsp" />

	<div class="container">
		<div class="containerTitle">내정보</div>

		<form action="" method="post">
			<table>
				<tr>
					<th><label for="">아이디 💻</label></th>
					<td colspan="5"><input class="noChange" type="text"
						minlength="1" maxlength="20" value="somesome" disabled></td>
					<td rowspan="8"></td>
				</tr>

				<tr>
					<th><label for="">비밀번호 🔒</label></th>
					<td colspan="5"><input type="password" minlength="1"
						maxlength="20" placeholder="20자 이내로 입력해주세요"
						value="somesome20190998"></td>
				</tr>

				<tr>
					<th><label for="">비밀번호 확인🔒</label></th>
					<td colspan="5"><input type="password" minlength="1"
						maxlength="20" placeholder="20자 이내로 입력해주세요"
						value="somesome20190998"></td>
				</tr>

				<tr>
					<th><label for="">이름 📰</label></th>
					<td colspan="5"><input type="text" value="이지수"></td>
				</tr>

				<tr>
					<th><label for="">학번 🏫</label></th>
					<td colspan="5"><input class="noChange" type="text"
						minlength="8" maxlength="8" value="20190998" disabled></td>
				</tr>

				<tr>
					<th><label for="">학과 📒</label></th>
					<td colspan="5"><select>
							<option disabled>선택해주세요</option>
							<option value="국어국문학전공">국어국문학전공</option>
							<option value="국사학전공">국사학전공</option>
							<option value="문예창작전공">문예창작전공</option>
							<option value="영어전공">영어전공</option>
							<option value="일어일본학전공">일어일본학전공</option>
							<option value="중어중국학전공">중어중국학전공</option>
							<option value="유러피언스터디즈전공">유러피언스터디즈전공</option>
							<option value="경영학전공">경영학전공</option>
							<option value="국제경영학전공">국제경영학전공</option>
							<option value="문헌정보학전공">문헌정보학전공</option>
							<option value="식품영양학전공">식품영양학전공</option>
							<option value="보건관리학전공">보건관리학전공</option>
							<option value="응용화학전공">응용화학전공</option>
							<option value="화장품학전공">화장품학전공</option>
							<option value="컴퓨터학전공" selected>컴퓨터학전공</option>
							<option value="정보통계학전공">정보통계학전공</option>
							<option value="체육학전공">체육학전공</option>
							<option value="약학과">약학과</option>
							<option value="회화전공">회화전공</option>
							<option value="디지털공예전공">디지털공예전공</option>
							<option value="큐레이터학전공">큐레이터학전공</option>
							<option value="피아노전공">피아노전공</option>
							<option value="관현악전공">관현악전공</option>
							<option value="성악전공">성악전공</option>
							<option value="패션디자인전공">패션디자인전공</option>
							<option value="시각&실내디자인전공">시각&실내디자인전공</option>
							<option value="미디어디자인전공">미디어디자인전공</option>
							<option value="방송연예전공">방송연예전공</option>
							<option value="실용음악전공">실용음악전공</option>
							<option value="무용전공">무용전공</option>
							<option value="모델전공">모델전공</option>
							<option value="커뮤니케이션콘텐츠전공">커뮤니케이션콘텐츠전공</option>
							<option value="문화예술경영전공">문화예술경영전공</option>
							<option value="글로벌MICE전공">글로벌MICE전공</option>
							<option value="HCI사이언스전공">HCI사이언스전공</option>
							<option value="패션마케팅연계전공">패션마케팅연계전공</option>
							<option value="글로벌다문화학연계전공">글로벌다문화학연계전공</option>
							<option value="빅데이터연계전공">빅데이터연계전공</option>
							<option value="공공문화예술연계전공">공공문화예술연계전공</option>
							<option value="평생교육연계전공">평생교육연계전공</option>
							<option value="공공인재연계전공">공공인재연계전공</option>
					</select></td>
				</tr>

				<tr class="phone">
					<th>폰번호 📱</th>
					<td colspan="5"><input type="text"
						placeholder="-빼고 입력해주세요 예,01012345678"></td>
				</tr>

				<tr>
					<th><label for="">생년월일 🎂</label></th>
					<td colspan="5"><input class="noChange" type="date"
						value="2000-08-05" disabled></td>
				</tr>

				<tr>
					<td colspan="6"></td>
					<td class="lastTd"><input type="submit" value="수정하기📝"></td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>