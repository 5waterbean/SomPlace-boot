<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>rightBar</title>
<style>
.right {
	width: 15%;
	position: fixed;
	top: 60px;
	right: 0;
	text-align: center;
	padding: 10px;
	margin: 10px;
}

.right>.create_btn {
	border: 1px solid black;
	background-color: rgb(226, 240, 217);
	padding: 5px;
	border-radius: 20px;
}

.right>.create_btn:hover {
	background-color: rgb(174, 220, 175);
	cursor: pointer;
}

.right .divTable {
	border: 1px solid black;
	border-radius: 20px;
}

.right table {
	border-collapse: collapse;
	width: 100%;
	border-radius: 20px;
}

.right table tr {
	border-top: 1px solid black;
	vertical-align : top;
}

.right table td {
	height: 45px;
}

.right table th {
	font-size: large;
	background-color: rgb(254, 251, 191);
	border-top-right-radius: 20px;
	border-top-left-radius: 20px;
}

</style>
</head>

<body>
	<div class="right">
		<div class="create_btn" onClick="location.href='/meeting/irregular/create/form';">모임 만들기</div>

		<br>

		<div class="divTable">
			<table id="calendar">
				<tr style="border:0px;">
					<th colspan="7">${myCalendar.month}월 일정</th>
				</tr>

				<c:set var="num" value="1"/>
				<c:forEach begin="1" end="${myCalendar.firstDay}" varStatus="status">
					<c:if test="${num % 7 == 1}">
						<tr>
					</c:if>
					<td> </td>
					<c:set var="num" value="${num + 1}" />
				</c:forEach>
				
				<c:forEach begin="1" end="${myCalendar.lastDate}" varStatus="status">
					<c:if test="${num % 7 == 1}">
						<tr>
					</c:if>
					<td style='background-color:<c:if test="${myCalendar.today == status.index}">rgb(220, 220, 220)</c:if>'>
						<font class="${num % 7}" color='
							<c:choose>
								<c:when test="${num % 7 == 1}">red</c:when>
								<c:when test="${num % 7 == 0}">blue</c:when>
								<c:otherwise>black</c:otherwise>
							</c:choose>'>${status.index}</font>
						<br>
						<font size="1" id="${status.index}"></font>
					</td>
					<c:if test="${num % 7 == 0}">
						</tr>
					</c:if>
					<c:set var="num" value="${num + 1}" />
				</c:forEach>
			</table>
		</div>
		<script>
			<c:forEach var='regular' items='${myCalendar.myJoinRegularList}'>
				var day = "<c:out value='${regular.meetingDay}'/>";
				var startDate = "<fmt:formatDate pattern='yyyy/MM/dd' value='${regular.startDay}'/>";
				var startMonth = Number(startDate.slice(-5,-3));
				var startDay = Number(startDate.slice(-2));
				var dayStr = '';
				
				if(startMonth <= ${myCalendar.month}) {
					if(day.includes('월'))
						dayStr += '2';
					if(day.includes('화'))
						dayStr += '3';
					if(day.includes('수'))
						dayStr += '4';
					if(day.includes('목'))
						dayStr += '5';
					if(day.includes('금'))
						dayStr += '6';
					if(day.includes('토'))
						dayStr += '0';
					if(day.includes('일'))
						dayStr += '1';
					
					var dayArr = Array.from(dayStr);
					for(var i = 0; i < dayArr.length; i++){
						dayClass = document.getElementsByClassName(dayArr[i]);
						for(var j = 0; j < dayClass.length; j++){
							if(startMonth == ${myCalendar.month}){
								if(Number(dayClass[j].innerHTML) > startDay)
									dayClass[j].nextElementSibling.nextElementSibling.innerHTML = "📌";
							} else {
								dayClass[j].nextElementSibling.nextElementSibling.innerHTML = "📌";
							}
								
						}
					}
				}
			</c:forEach>
			
			<c:forEach var='irregular' items='${myCalendar.myJoinIrregularList}'>
				var date = "<fmt:formatDate pattern='yyyy/MM/dd' value='${irregular.meetingDate}'/>";
				var month = Number(date.slice(-5,-3));
				var day = Number(date.slice(-2));
				if(month == ${myCalendar.month}) {
					document.getElementById(String(day)).innerHTML = "📌";
				}
			</c:forEach>
		</script>
	</div>
</body>

</html>