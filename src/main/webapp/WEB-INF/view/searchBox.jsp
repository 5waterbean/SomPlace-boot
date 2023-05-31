<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchBox</title>
    <style>
         .middle {
            width: 67%;
            margin: 0 auto;
            padding: 10px;
            position: absolute;
            top: 70px;
            left: 0;
            right: 0;
        }

        form {
            display: flex;
            justify-content: center;
            height: 40px;
        }

        form>input {
            flex-grow: 1;
            padding: 5px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }

        .middle_first>form>div {
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

        .middle_second>form {
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
        	<form name="searchForm" action="/meeting/search">
        		<input type="hidden" name="category" value="${checkedCategory}"></input>
        		<input type="hidden" id="meetingType" name="meetingType" value="${meetingType}"></input>
            	<input type="text" id="key" name="key" placeholder=" 검색하고 싶은 키워드를 입력해주세요" value="${checkedKey}">
            	<div>
                	<img src="../../../img/search.png" onclick="searchForm.submit()">
            	</div>
            </form>
        </div>

        <div class="middle_second">
        	<form:form name="selectForm" action="/meeting/sort/all">
            <div>
                <input type="radio" name="meetingType" value="irregular" 
                	<c:if test="${checkedIrregular}">checked</c:if> onchange="this.form.submit()">
                <label for="">일시적</label>
                <input type="radio" name="meetingType" value="regular" 
                	<c:if test="${checkedRegular}">checked</c:if> onchange="this.form.submit()">
                <label for="">정기적</label>
                <input type="radio" name="meetingType" value="all" 
                	<c:if test="${checkedAll}">checked</c:if> onchange="this.form.submit()">
                <label for="">전체</label>
            </div>
				<input type="hidden" name="category" value="${checkedCategory}"></input>
				<input type="hidden" name="key" value="${checkedKey}"></input>
            	<select name="sortWith" style="width: 80px; height: 37px;" onchange="this.form.submit()">
                	<option value="order" 
                		<c:if test="${checkedOrder}">selected</c:if>>최신순</option>
                	<option value="heart"
                		<c:if test="${checkedHeart}">selected</c:if>>인기순</option>
            	</select>
            </form:form>
        </div>
    </div>
</body>

</html>