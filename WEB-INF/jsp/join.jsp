<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>JOIN</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#emailCheckBtn")
								.click(
										function() {
											var id = $("#userId").val();
											var divEle = document
													.getElementById("idcheck");
											if (id != "") {
												$
														.ajax({
															url : "confirmId.do",
															data : {
																"id" : $(
																		"#userId")
																		.val()
															},
															type : "post",
															dataType : "json",
															success : function(
																	data) {
																$("#ajax")
																		.remove();
																var result = data.result;

																if (result == 'true') {
																	divEle.innerHTML = "<B><font color=red>�̹� ��� ���� �̸����Դϴ�</font></B>";
																	$("#userId")
																			.val(
																					"");
																} else if (result == 'false') {
																	divEle.innerHTML = "<B><font color=skyblue>��� ������ �̸����Դϴ�</font></B>";
																}
															}
														});
											} else {
												divEle.innerHTML = "";
												alert("����Ͻ� �̸����� �Է����ּ���");
											}
										});

						$("#nicknameCheckBtn")
								.click(
										function() {
											var nickname = $("#userNickname")
													.val();
											var divEleNickname = document
													.getElementById("nicknamecheck");
											if (nickname != "") {
												$
														.ajax({
															url : "confirmNickname.do",
															data : {
																"nickname" : $(
																		"#userNickname")
																		.val()
															},
															type : "post",
															dataType : "json",
															success : function(
																	data) {
																$("#ajax")
																		.remove();
																var result = data.result;
																if (result == 'true') {
																	divEleNickname.innerHTML = "<B><font color=red>�̹� ��� ���� �г����Դϴ�</font></B>";
																	$("#userId")
																			.val(
																					"");
																} else if (result == 'false') {
																	divEleNickname.innerHTML = "<B><font color=skyblue>��� ������ �г����Դϴ�</font></B>";
																}
															}
														});
											} else {
												divEleNickname.innerHTML = "";
												alert("����Ͻ� �г����� �Է����ּ���");
											}
										});
					});
</script>

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
	height: 200px;
	text-align: center;
	display: table-cell;
	vertical-align: bottom;
}

.tdB {
	vertical-align: bottom
}

b, h3 {
	color: #ffffff;
	font-family: ���ʷҹ���;
}
</style>
</head>
<body>
	<div id="logoBoxCenter">
		<table cellpadding="4" cellspacing="0" align="center" border="0">
			<tr>
				<td class="tdB"><img src="images/tree.png" height=150></td>
				<td class="tdB"><img src="images/logo.png" height=100></td>
			</tr>
		</table>
		<br> <br>
	</div>

	<center>
		<c:url value="/insertUser.do" var="targetUrl" />
		<form:form action="${targetUrl}" method="POST">
			<table cellpadding="10" cellspacing="0" align="center" border="0" style="margin-left: 300px;">
				<tr>
					<td><h3>�̸�</h3></td>
					<td width=550><input type="text" name="userName" size="30" /></td>
				</tr>

				<tr>
					<td><h3>�̸���</h3></td>
					<td><input type="text" name="userId" id="userId" size="30" />
						<input type="button" name="emailCheckBtn" id="emailCheckBtn"
						value="�ߺ��˻�"> <span id="idcheck"></span></td>
				</tr>

				<tr>
					<td><h3>�н�����</h3></td>
					<td><input type="password" name="userPassword" size="30" /></td>
				</tr>

				<tr>
					<td><h3>�н����� Ȯ��</h3></td>
					<td><input type="password" name="userPassword2" size="30" /></td>
				</tr>

				<tr>
					<td><h3>����</h3></td>
					<td><input type="date" name="userBirth" size="31" /></td>
				</tr>

				<tr>
					<td><h3>�г���</h3></td>
					<td><input type="text" name="userNickname" id="userNickname"
						size="30" /> <input type="button" name="nicknameCheckBtn"
						id="nicknameCheckBtn" value="�ߺ��˻�"> <span
						id="nicknamecheck"></span></td>
				</tr>

				<tr>
					<td><h3>����</h3></td>
					<td><input type="radio" name="userSex" value="Male" checked /><b>Male</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="userSex" value="Female" /><b>Female</b>
					</td>
				</tr>

				<tr>
					<td><h3>����</h3></td>
					<td><select name="userJob">
							<option value='���þ���' selected>������ �����ϼ���.</option>
							<option value='�л�'>�л�</option>
							<option value='������'>������</option>
							<option value='������'>������</option>
							<option value='�ֺ�'>�ֺ�</option>
							<option value='����'>����</option>
					</select></td>
				</tr>

				<tr>
					<td><h3>��������</h3></td>
					<td><input type="radio" name="userBucketFlag" value="yes"
						checked /><b>Yes</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" name="userBucketFlag" value="no" /><b>No</b></td>
				</tr>

				<tr>

					<td>
					<td colspan="2"><br> <a
						href="javascript:history.back(-1)"><input type="button"
							name="backBtn" value="�ڷΰ���"></a> <input type="submit"
						name="submitBtn" value="�����ϱ�"></td>
				</tr>
			</table>
		</form:form>
	</center>

</body>
</html>
