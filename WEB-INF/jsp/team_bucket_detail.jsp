<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<c:url value="/registerTeamMember.do" var="registerMemberUrl">
	<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
</c:url>

s
<script type="text/javascript">
	function isCheckedSel() {
		var num = document.tempForm.check.length;
		if (num > 0) {
			var selectedIndex = new Array();
			for (var i = 0; i < num; i++) {
				if (document.tempForm.check[i].checked) {
					selectedIndex.push(i);
				}
			}
			document.tempForm.selectedIndex.value = selectedIndex;
		} else
			document.tempForm.selectedIndex.value = 0;
	}

	function teamMatchOk() {
		alert(document.teamMatchForm.teamMatchFlag.value);
		document.teamMatchForm.teamMatchFlag.value = 1;
		document.teamMatchForm.submit();

	}

	function updateSuccessFlag() {
		var num = document.successCheckForm.successCheck.length;
		var checkedItemNum = new Array();

		if (num > 0) {
			for (var i = 0; i < num; i++) {
				if (!document.successCheckForm.successCheck[i].checked) {
					checkedItemNum
							.push(document.successCheckForm.successCheck[i].value);
				}
			}
			document.successCheckForm.resetSuccessFlagItemNum.value = checkedItemNum;
		} else {
			if (!document.successCheckForm.successCheck.checked) {
				checkedItemNum
						.push(document.successCheckForm.successCheck.value);
			}
			document.successCheckForm.resetSuccessFlagItemNum.value = checkedItemNum;
		}

		document.successCheckForm.submit();
	}
</script>

</head>
<body>
	<c:set var="userNum" value="${userNum}" />
	<c:url value="/updateBucketDAO.do" var="targetUrl" />
	<c:url value="/registerTeamMember.do" var="registerMemberUrl">
		<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
	</c:url>
	<c:url value="/teamMatchOk.do" var="teamMatchOkUrl">
		<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
	</c:url>
	<c:url value="/updateSuccessFlag.do" var="updateSuccessFlagUrl">
		<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
	</c:url>
	<form:form action="${targetUrl}" method="post" name="form">
		<input type="hidden" name="bucketNum"
			value="${bucketTeam.getBucketNum() }" />
		<c:out value="${bucketTeam.getBucketTeamUserCount()}" />
		<Br>
		<c:out value="${bucketTeam.getBucketNum() }" />
		<br>
		<c:out value="${bucketTeam.getBucketTitle()}" />
		<Br>
		<c:out value="${bucketTeam.getBucketDetail()}" />
		<Br>
		<c:out value="${bucketTeam.getBucketCategoryNum()}" />
		<Br>
		<c:out value="${bucketTeam.getBucketExpireDate().toString()}" />
		<Br>
		<c:out value="${bucketTeam.getBucketRegisterDate().toString()}" />
		<Br>
		<c:set var="changedRoleNum" value="-1" />
		<c:if test="${bucketTeam.getBucketTeamMatchOk() == 0}">
			<c:forEach var="bucketTeamItem" items="${bucketTeamItemList}">
				<c:if
					test="${changedRoleNum != bucketTeamItem.getBucketTeamItemRoleNum()}">
					<c:set var="changedRoleNum"
						value="${bucketTeamItem.getBucketTeamItemRoleNum() }" />
					<c:out value="${bucketTeamItem.getBucketTeamItemRoleNum()}" />
					<br>
				</c:if>
				<%-- <c:out value="번호  ${bucketTeamItem.getBucketTeamItemNum() } " /> --%>
				<c:out value="${bucketTeamItem.getBucketTeamItemTitle()} " />
				<input type="checkbox" disabled="disabled">
				<br>
				<br>
			</c:forEach>
		</c:if>
	</form:form>

	<form:form action="${updateSuccessFlagUrl}" method="post"
		name="successCheckForm">
		<input type="hidden" id="resetSuccessFlagItemNum"
			name="resetSuccessFlagItemNum" />
		<c:if test="${bucketTeam.getBucketTeamMatchOk() == 1}">
			<c:set var="changedNickname" value="" />
			<c:forEach var="bucketTeamItem" items="${bucketTeamItemList}">
				<c:if
					test="${bucketTeamItem.getBucketTeamItemTargetUserNick() != changedNickname}">
					<c:set var="changedNickname"
						value="${bucketTeamItem.getBucketTeamItemTargetUserNick()}" />
					<c:if test="${changedNickname == '-1'}">
						<br>
						<c:out value="공통" />
						<br>
					</c:if>
					<c:if test="${changedNickname != '-1'}">
						<br>
						<c:out value="${changedNickname}" />
						<br>
					</c:if>
				</c:if>

				<c:out value="${bucketTeamItem.getBucketTeamItemTitle()} " />

				<c:if
					test="${bucketTeamItem.getBucketTeamItemTargetUserNick() != userNickname && bucketTeamItem.getBucketTeamItemTargetUserNick() != '-1'}">
					<c:if
						test="${bucketTeamItem.getBucketTeamItemSuccessFlag() == '1'}">
						<input type="checkbox" disabled="disabled" checked="checked">
						<br>
					</c:if>
					<c:if
						test="${bucketTeamItem.getBucketTeamItemSuccessFlag() == '0'}">
						<input type="checkbox" disabled="disabled">
						<br>
					</c:if>


				</c:if>

				<c:if
					test="${bucketTeamItem.getBucketTeamItemTargetUserNick() == userNickname || bucketTeamItem.getBucketTeamItemTargetUserNick() == '-1'}">
					<c:if
						test="${bucketTeamItem.getBucketTeamItemSuccessFlag() == '1'}">
						<input type="checkbox" name="successCheck"
							value="${bucketTeamItem.getBucketTeamItemNum()}"
							checked="checked">

						<%-- 
							<input type="checkbox" name="successCheck"
							id="${bucketTeamItem.getBucketTeamItemNum()}" checked="checked"> --%>
						<br>
					</c:if>
					<c:if
						test="${bucketTeamItem.getBucketTeamItemSuccessFlag() == '0'}">

						<input type="checkbox"
							value="${bucketTeamItem.getBucketTeamItemNum()}"
							name="successCheck" id="successCheck">
						<br>
					</c:if>

				</c:if>

			</c:forEach>
			<input type="button" onclick="updateSuccessFlag(this)" />
		</c:if>
	</form:form>
	<!-- 마스터일 때 temp 보여주기-->

	<c:if test="${bucketTeam.getUserNum() == userNum}">
		<%-- 	<c:url value="/registerTeamMember.do" var="registerMemberUrl" >	
		<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" /> 
		<c:param name="userNum" value="${bucketTeam.getTempMemberNum()}" />
 	</c:url> 
 	 --%>

		<c:url value="/registerTeamMember.do" var="registerMemberUrl">
			<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
			<c:param name="teamMatchFlag"
				value="${bucketTeam.getBucketTeamMatchOk()}" />
		</c:url>

		<br>
		<form:form action="${teamMatchOkUrl}" name="teamMatchForm"
			id="teamMatchForm" method="post">
			<c:out value="${bucketTeam.getBucketTeamMatchOk() }" />
			<c:if test="${bucketTeam.getBucketTeamMatchOk() != 1}">
				<input type="hidden" value="0" id="teamMatchFlag"
					name="teamMatchFlag" />
				<input type="button" value="팀결성" onclick="teamMatchOk(this)" />
				<br>
			</c:if>

		</form:form>

		<form:form action="${registerMemberUrl}" name="tempForm" id="tempForm">
			<c:if test="${bucketTeam.getBucketTeamMatchOk() != 1}">
				<c:out value="Temp 인원수" />
				<c:out value="${bucketTeam.getTempMemberNum()}" />

				<br>

				<c:forEach var="tempMemberNum"
					items="${bucketTeam.getTempMemberNum()}">
					<input type="checkbox" value="${tempMemberNum}" name="check"
						id="check">
					<c:out value="${tempUserNickListMap.get(tempMemberNum)}" />
					<select name="selectRoleNum" id="selectRoleNum"><c:forEach
							var="i" begin="1"
							end="${bucketTeam.getBucketTeamUserCount() - 1}">
							<option value="${i}">${i}</option>
						</c:forEach></select>
				</c:forEach>








				<input type="hidden" id="selectedIndex" name="selectedIndex" />
				<input type="submit" value="허락하기" onclick="isCheckedSel(this)" />
				<br>
			</c:if>
		</form:form>
	</c:if>
	<br>
	<c:if test="${bucketTeam.getBucketTeamMatchOk() != 1}">
		<c:out value="사용 중 인 RoleNum" />
		<br>
		<c:forEach var="usedRoleNum" items="${usedRoleNum}">
			<c:out value="${usedRoleNum}" />
			<br>
		</c:forEach>
		<br>
		<br>
		<br>
	</c:if>
	<c:out value="member 명단" />
	<c:out value="${bucketTeam.getBucketTeamUserCount()}" />
	<c:forEach var="memberNickname"
		items="${bucketTeam.getMemberNickname()}">
		<c:out value="${memberNickname}" />
	</c:forEach>

	<c:url value="/registerTeamTempMember.do" var="registerUrl">
		<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
"
	</c:url>
	<c:if
		test="${bucketTeam.getUserNum() != userNum && !tempUserList.contains(userNum)}">
		<form:form action="${registerUrl}" method="post">
			<input type="submit" value="신청하기" />
		</form:form>
	</c:if>
</body>
</html>