<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
				
		<style type="text/css">
			body {
				background: url(images/background.png) no-repeat center center fixed;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				-o-background-size: cover;
				background-size: cover;
			}
			
			#logoBoxCenter {
				position: relative;
				margin-left: -475px;
				left: 50%;
				width: 950px;
				height: 400px;
				text-align: center;
				display: table-cell;
        		vertical-align: bottom;				
			}
			
			#loginBoxCenter {
				background: #000000;
				background: rgba(255, 255, 255, 0.4);
				position: relative;
				margin-left: -300px;
				left: 50%;
				width: 600px;
				height: 225px;
				text-align: center;
			}
			
			#joinBoxCenter {
				position: relative;
				margin-left: -50px;
				left: 50%;
				width: 100px;
				height: 30px;
				text-align: center;
			}
			
			.tdB {vertical-align:bottom}
			
			a:link { text-decoration:none; color:#ffffff; }
			a:visited { text-decoration:none; color:#ffffff; }
			a:active { text-decoration:none; color:#ffffff; }
			a:hover { text-decoration:none; color:#ff0000; }
		</style>
		
		<script type="text/javascript">
	
			function bucketLogin() {
				if (loginForm.userId.value == "") {
					alert("사용자 아이디를 입력하십시요.");
					login_form.email.focus();
					return false;
				}
				if (loginForm.userPassword.value == "") {
					alert("비밀번호를 입력하십시요.");
					login_form.password.focus();
					return false;
				}
		
				loginForm.submit();
			}
		</script>
	
	</head> 
	<body>
	
		<c:if test="${check}">
		<script language="javascript">
     		alert("아이디와 비밀번호를 확인해주세요");
   		</script>
   		</c:if>
   		
		<div id="logoBoxCenter">
			<table cellpadding="5" cellspacing="0" align="center" border="0" >		
				<tr>
					<td class="tdB"><img src="images/tree.png" height=150></td>
					<td class="tdB"><img src="images/logo.png" height=100></td>
				</tr>
			</table>
			<br><br>
		</div>
	
		<div id="loginBoxCenter">
			<c:url value="/main.do" var="targetUrl" />
			<form:form name="loginForm" action="${targetUrl}" method="POST">					
			<table cellpadding="5" cellspacing="0" align="center" border="0" >		
				<tr>
					<td><h2>E-MAIL</h2></td>
					<td><input type="text" name="userId" size="30" placeholder="아이디를 입력하세요"/></td>
				</tr>
		
				<tr>
					<td><h2>PASSWORD</h2></td>
					<td><input type="password" name="userPassword" size="31" placeholder="패스워드를 입력하세요"/></td>
				</tr>
								
				<tr>
					<td colspan="2" align="center">
					<c:url value="/main.do" var="messageUrl" />
					<a href="${messageUrl}">
					<br><input type="button" name="loginBtn" onClick="bucketLogin()" value="LOG-IN"></a>						
					</td>
				</tr>
					
			</table>
			</form:form>
		</div>	
		
		<div id="joinBoxCenter">
			<br><br>
			<c:url value="/join.do" var="joinUrl" />
			<a href="${joinUrl}"><h3>Let's JOIN</h3></a>
		</div>
	</body>
</html>
