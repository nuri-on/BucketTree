<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
	function urlload(){
		if (form.userNum.value != 0)
			form.submit();
	}
	
</script>

</head>
<body>
	<p>개인정보 입력</p>
	<c:url var="targetUserUrl" value="/visitBucketPage.do" />
	
	<form name="form" action="${targetUserUrl}" method="post" >
	
	<select name="userNum" onChange="urlload()">
	<option value="0">FOLLOW목록</option>
	<c:if test="${followList != null}" >
	<c:forEach var="follow" items="${followList}">
		<option value="${follow.getTargetUserNum()}">
		<c:out value="${follow.getTargetNickName()}" />
		</option>
	</c:forEach>
	</c:if>
	</select>
	
	</form>
</body>
</html>