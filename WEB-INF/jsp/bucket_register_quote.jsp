<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	
	function addBucketItem() {
		++bucketItemCnt;
		var msg = "";
		msg += "<table id='bucketTitleForm" + bucketItemCnt + "' border='1'>"
				+ "<tr><td>"+ bucketItemCnt + "</td><td><input type='text' name='bucketItemTitle' size='20'>"
				+ "<input type='hidden' name='bucketItemNum' value='" + bucketItemCnt + "'></td></tr></table>";

		bucketItemForm.innerHTML += msg;

	}
</script>


</head>
<body>
<c:url value="/insertQuoteBucketDAO.do" var="targetUrl" />
	<form:form action="${targetUrl}" commandName="bucket" method="POST" name="form">
	<form:hidden path="bucketTeamFlag"/>
	<form:hidden path="userNickName"/>
	
	<table border="1">
			<tr>
				<td>제목</td>
				<td><form:input path="bucketTitle" size="30" /></td>
			</tr>

			<tr>
				<td>설명</td>
				<td><form:textarea path="bucketDetail" /></td>
			</tr>

			<tr>
				<td>Content</td>
				<td><form:select path="bucketCategoryNum">
						<form:option value="1">여행</form:option>
						<form:option value="2">취업</form:option>
						<form:option value="3">자격증</form:option>
						<form:option value="4">요리</form:option>
						<form:option value="5">운동</form:option>
						<form:option value="6">독서</form:option>
						<form:option value="7">프로젝트</form:option>
						<form:option value="8">공부</form:option>
				</form:select></td>
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
				<td>공개여부</td>
				<td>
					<form:radiobutton path="bucketPublicFlag" value="0" /><b>예</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<form:radiobutton path="bucketPublicFlag" value="1" /><b>아니요</b>
				</td>
			</tr>
			
			<tr>
				<td>체크리스트</td>
				<td><input type="button" value="+" onClick="addBucketItem()"></td>
			</tr>
			
			
		</table>
		<input type="hidden" name="count" value="${bucketItemList.size()}">
		
		<c:forEach var="bucketItem" items="${bucketItemList}">
		<table id="bucketTitleForm1" border="1">
			<tr>
				<td><c:out value="${bucketItem.getBucketItemNum()}" /></td>
				<td><input type="text" name="bucketItemTitle" value="${bucketItem.getBucketItemTitle()}" size="20">
					<input type=button value='-' onClick="delBucketItem('bucketTitleForm1')">
					<input type="hidden" name="bucketItemNum" value="${bucketItem.getBucketItemNum()}"></td>
			</tr>
		</table>
		</c:forEach>
		
		<script type="text/javascript">
			var bucketItemCnt = form.count.value;
		</script>
		
		<div id="bucketItemForm"></div> 
		<input type="submit" value="버킷만들기" />
	</form:form>
</body>
</html>