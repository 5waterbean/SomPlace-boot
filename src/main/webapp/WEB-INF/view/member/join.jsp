<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50px;
            font-weight: bold;
            text-align: center;
            background-color: rgb(254, 251, 191);
        }

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

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: right;
            width: 20%;
            padding: 10px;
        }

        td {
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

        input[type="submit"],
        input[type="button"] {
            border: none;
            border: 2px solid black;
            color: black;
            background-color: rgb(226, 240, 217);
        }

        input:hover {
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: rgb(174, 220, 175);
        }
    </style>
    
    <script>
		function checkId() {
			var memberId = document.querySelector('input[name="memberId"]').value;
			if(memberId.length == 0 || memberId == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}
			else if(memberId.length < 4 || memberId.length > 15) {
				alert("아이디를 다시 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "/member/join/idCheck",
				type : "post",
				data : {"memberId" : memberId},
				success : function(data){
					if(data == 0) {
						alert("사용가능한 아이디입니다.");
						$("input[name='idCheck']").attr("disabled", true);
						$("input[name='memberId']").attr("readonly", true);
					} else {
						alert("사용불가능한 아이디입니다.");
					}
				}
			})
		}
		
		function createMember(form) {
			var pw = document.querySelector('input[name="pw"]').value;
			var pwConfirm = document.querySelector('input[name="pwConfirm"]').value;
			
			if (form.idCheck.disabled == false) {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if (pw != pwConfirm) {
				alert("비밀번호를 다시 확인해주세요.");
				return false;
			}
			
			return true;
		}
	</script>
</head>

<body>

    <div class="top">솜솜이 놀이터 회원가입</div>

    <div class="container">
        <div class="containerTitle">회원가입</div>

        <form:form name="joinFrm" modelAttribute="memberCommand" action="/member/join" method="post" onsubmit="return createMember(this)">
            <table>
                <tr>
                    <th><label for="">아이디 💻</label></th>
                    <td colspan="5">
                    	<input type="text" name="memberId" value="${memberCommand.memberId}" placeholder="4자 이상 15자 이내로 입력해주세요" 
                    			pattern=".{4,15}" required title="4자 이상 15자 이내로 입력해주세요">
                    </td>
                    <td style="width: 25%;"><input type="button" id="idCheck" name="idCheck" value="중복확인" onClick="checkId()"></td>
                </tr>

                <tr>
                    <th><label for="">비밀번호 🔒</label></th>
                    <td colspan="5">
                    	<input type="password" name="pw" value="${memberCommand.pw}" placeholder="4자 이상 15자 이내로 입력해주세요" 
                    			pattern=".{4,15}" required title="4자 이상 15자 이내로 입력해주세요">
                    </td>
                    <td>
                    	<font color="red" size="2"><form:errors path="pw"/></font>
                    </td>
                </tr>

                <tr>
                    <th><label for="">비밀번호 확인🔒</label></th>
                    <td colspan="5"><input type="password" name="pwConfirm" value="${memberCommand.pwConfirm}" required></td>
                    <td>
                    	<font color="red" size="2"><form:errors path="pwConfirm"/></font>
                    </td>
                </tr>

                <tr>
                    <th><label for="">이름 📰</label></th>
                    <td colspan="5"><input type="text" name="name" value="${memberCommand.name}" required></td>
                    <td>
                    	<font color="red" size="2"><form:errors path="name"/></font>
                    </td>
                </tr>

                <tr>
                    <th><label for="">학번 🏫</label></th>
                    <td colspan="5">
                   		<input type="text" name="studentNumber" value="${memberCommand.studentNumber}" placeholder="8자리로 작성해주세요"
                   				pattern=".{8,8}" required title="8자리로 작성해주세요">
                    </td>
                    <td>
                    	<font color="red" size="2"><form:errors path="studentNumber"/></font>
                    </td>
                </tr>

                <tr>
                    <th><label for="">학과 📒</label></th>
                    <td colspan="5">
                        <select name="major">
                            <option selected disabled>선택해주세요</option>
                            <c:forEach var="major" items="${majorList}">
                            	<option value="${major}" <c:if test="${memberCommand.major == major}">selected</c:if>>${major}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                    	<font color="red" size="2"><form:errors path="major"/></font>
                    </td>
                </tr>

                <tr class="phone">
                    <th>폰번호 📱</th>
                    <td colspan="5">
                    	<input type="text" name="phone" value="${memberCommand.phone}" placeholder="- 빼고 숫자만 입력해주세요" required>
                    </td>
                    <td><font color="red" size="2"><form:errors path="phone"/></font></td>
                </tr>

                <tr>
                    <th><label for="">생년월일 🎂</label></th>
                    <td colspan="5"><input type="date" name="birth" value="${memberCommand.birth}" required></td>
                    <td>
                    	<font color="red" size="2"><form:errors path="birth"/></font>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="2"><input type="submit" value="회원가입"></td>
                    <td></td>
                    <td colspan="2"><input type="button" value="취소" onClick="location.href='/'"></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>