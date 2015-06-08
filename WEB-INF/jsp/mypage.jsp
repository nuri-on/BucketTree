<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MYPAGE</title>

<style type="text/css">
#logoBoxCenter {
	position: relative;
	margin-left: -475px;
	left: 50%;
	width: 950px;
	height: 200px;
	text-align: center;
	display: table-cell;
	vertical-align: bottom;
}

.tdB {
	vertical-align: bottom
}

b, h3 {
	color: black;
	font-family: 함초롬바탕;
}

#contents {
	width: 100%;
	height: 100%;
	position: relative;
	left: 0px;
	top: 0px;
	background-color: #ededed;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: #ff0000;
}

#loginBoxCenter {
	background: #000000;
	background: rgba(235, 91, 94, 0.4);
	position: relative;
	margin-left: -300px;
	left: 10%;
	width: 600px;
	height: 100%;
	text-align: center;
}

</style>
</head>
<body>
	<div id="contents">
		<center>
			<div id="loginBoxCenter">
			<c:url value="/ModifyUser.do" var="targetUrl" />
			<form:form action="${targetUrl}" method="POST" commandName="user">
				<form:hidden path="userId" />
				<form:hidden path="userNum" />
				<table cellpadding="5" cellspacing="0" align="center" border="1">
					<tr bgcolor="#EB5B5E">
						<td colspan="2" align="center"><h1><font color="white">Modify Information</font></h1></td>
					</tr>
					
					<tr>
						<td width="300" align="right"><h3>이름</h3></td>
						<td width="300"><form:input path="userName" size="30" /></td>
					</tr>

					<tr>
						<td align="right"><h3>이메일</h3></td>
						<td><c:out value="${user.getUserId()}" /></td>
					</tr>

					<tr>
						<td align="right"><h3>패스워드</h3></td>
						<td><form:password path="userPassword" size="30"
								value="${user.getUserPassword()}" /></td>
					</tr>

					<tr>
						<td align="right"><h3>패스워드 확인</h3></td>
						<td><input type="password" name="userPassword2" size="30" /></td>
					</tr>

					<tr>
						<td align="right"><h3>생일</h3></td>
						<td><input type="text" name="userBirth" size="31"
							value="${user.toString(user.getUserBirth())}"></td>
					</tr>

					<tr>
						<td align="right"><h3>닉네임</h3></td>
						<td colspan="2"><c:out value="${user.getUserNickname()}" /></td>
					</tr>

					<tr>
						<td align="right"><h3>성별</h3></td>
						<td><form:radiobutton path="userSex" value="0" /><b>Male</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<form:radiobutton path="userSex" value="1" /><b>Female</b></td>
					</tr>

					<tr>
						<td align="right"><h3>직업</h3></td>
						<td>
							<form:select path="userJob">
							<form:option value='선택안함'>직업을 선택하세요.</form:option>
							<form:option value='학생'>학생</form:option>
							<form:option value='공무원'>공무원</form:option>
							<form:option value='직장인'>직장인</form:option>
							<form:option value='주부'>주부</form:option>
							<form:option value='무직'>무직</form:option>
							</form:select>
						</td>
					</tr>

					<tr>
						<td align="right"><h3>공개여부</h3></td>
						<td><form:radiobutton path="bucketFlag" value="0" /><b>Yes</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<form:radiobutton path="bucketFlag" value="1" /><b>No</b></td>
					</tr>

					<tr bgcolor="#EB5B5E">
						<td colspan="2" align="center"><br> <input type="button"
							name="backBtn" value="뒤로가기"> &nbsp;&nbsp;&nbsp; <input
							type="submit" name="submitBtn" value="수정하기">
						</td>
					</tr>
				</table>
			</form:form>
			</div>
		</center>
	</div>
</body>
</html>
