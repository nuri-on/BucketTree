
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	var bucketTeamItemCnt = 1;
	function addBucketTeamItem() {
		var userCount = document.insertForm.bucketTeamUserCount.value;
		++bucketTeamItemCnt;
		var msg = "";
		msg += "<table id='bucketTeamTitleForm" + bucketTeamItemCnt + "' border='1'>"
				+ "<tr><td>"
				+ bucketTeamItemCnt
				+ "</td><td><select name='bucketTeamItemRoleNum' id='bucketTeamItemRoleNum'><option value='-1'>공통</option><option value='0'>나</option>";
		for (var i = 1; i < userCount; i++) {
			msg += "<option value='" + i + "'>" + i + "</option>";
		}

		msg += "</select><input type='text' name='bucketTeamItemTitle' size='20'>"
				+ "<input type='hidden' name='bucketTeamItemNum' value='" + bucketTeamItemCnt + "'></td></tr></table>";

		bucketTeamItemForm.innerHTML += msg;
	}

	function changeTeamUserCount(form) {
		var roleNumCount = 0;
		for (var i = 0; document.insertForm.bucketTeamItemRoleNum[i] != null; i++)
			roleNumCount++;
		alert(roleNumCount);
		var userCount = document.insertForm.bucketTeamUserCount.value;

		if (roleNumCount == 1) {
			document.insertForm.bucketTeamItemRoleNum.length = 1;
			for (var j = userCount - 1; j > 0; j--) {
				document.insertForm.bucketTeamItemRoleNum.options.add(
						new Option(j, j), 1);
			}
			document.insertForm.bucketTeamItemRoleNum.options.add(
					new Option("나", 0), 1);
		} else {
			for (var i = 0; document.insertForm.bucketTeamItemRoleNum[i] != null; i++) {
				document.insertForm.bucketTeamItemRoleNum[i].length = 1;

				for (var j = userCount - 1; j > 0; j--) {
					document.insertForm.bucketTeamItemRoleNum[i].options.add(
							new Option(j, j), 1);
				}
				document.insertForm.bucketTeamItemRoleNum[i].options.add(
						new Option("나", 0), 1);

			}
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<c:url value="/insertBucketTeamDAO.do" var="targetUrl" />
	<form:form action="${targetUrl}" method="POST" id="insertForm"
		name="insertForm">

		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bucketTitle" size="30" /></td>
			</tr>

			<tr>
				<td>설명</td>
				<td><textarea name="bucketDetail"></textarea></td>
			</tr>

			<tr>
				<td>인원</td>
				<td><input type="text" onchange="changeTeamUserCount(this)"
					name="bucketTeamUserCount" id="bucketTeamUserCount"></td>
			</tr>

			<tr>
				<td>Content</td>
				<td><select onc name="bucketCategoryNum">
						<option value="1">여행</option>
						<option value="2">취업</option>
						<option value="3">자격증</option>
						<option value="4">요리</option>
						<option value="5">운동</option>
						<option value="6">독서</option>
						<option value="7">프로젝트</option>
						<option value="8">공부</option>
				</select></td>
			</tr>

			<tr>
				<td>시작 날짜</td>
				<td><input type="date" name="bucketRegisterDate" size="30" /></td>
			</tr>
			<tr>
				<td>완성 날짜</td>
				<td><input type="date" name="bucketExpireDate" size="30" /></td>
			</tr>
			<tr>
				<td>체크리스트</td>
				<td><input type="button" value="+"
					onClick="addBucketTeamItem()"></td>
			</tr>
		</table>
		<table id="bucketTeamTitleForm1" border="1">
			<tr>
				<td>1</td>
				<td><select name="bucketTeamItemRoleNum"
					id="bucketTeamItemRoleNum">
						<option value='-1'>공통</option>

				</select> <input type="text" name="bucketTeamItemTitle" size="20"> <!-- <input
					type=button value='-' onClick="delBucketItem('bucketTitleForm1')"> -->
					<input type="hidden" name="bucketTeamItemNum" value="1"></td>
			</tr>
		</table>
		<div id="bucketTeamItemForm"></div>


		<input type="submit" value="팀버킷만들기" />

	</form:form>

</body>
</html>