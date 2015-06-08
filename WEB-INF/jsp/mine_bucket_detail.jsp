
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style type="text/css">
#contents {
	width: 100%;
	height: 100%;
	position: relative;
	left: 0px;
	top: 0px;
	background-color: #ffffff;
}

#info {
	width: 100%;
	height: 100%;
	position: relative;
	left: 0px;
	top: 0px;
	background-color: white;
}

#sidespace {
	width: 100%;
	height: 100%;
	position: relative;
	top: 0px;
	background-color: white;
}

#sidebar {
	width: 100%;
	height: 100%;
	position: relative;
	top: 0px;
	background-color: #eb5b5e;
}

b {
	font-family: 함초롬바탕, sans-serif;
}
</style>
<body>
	<c:url value="/updateBucketTeamDAO.do" var="targetUrl" />
	<div id="contents">
		<table border=0 width="100%">
			<tr>
				<td width="68%">
					<div id="info">
						<table border=0 width="100%" height="100%">
							<tr>
								<td width="40%" height="50"><font size=10 color="#eb5b5e"><b>
											<c:out value="${bucket.getBucketTitle()}" />
									</b></font></td>
								<td width="60%" align=right><font size=6 color="#76a4ad"><b>달성률</b></font></td>
							</tr>
							<tr>
								<td colspan=2 bgcolor="#ffadad" height="10"></td>
							</tr>
							<tr>
								<td colspan=2 align=right><font size=5 color="gray"><b>Category
											: <c:out value="${categoryName}" />
									</b></font></td>
							</tr>
							<tr>
								<td colspan=2 bgcolor="#ffffff" height="10"></td>
							</tr>
							<tr>
								<td colspan=2 bgcolor="#bababa" height="300"><c:out
										value="${bucket.getBucketDetail()}" /></td>
							</tr>
							<tr>
								<td colspan=2 bgcolor="#ffffff" height="10"></td>
							</tr>
							<tr>
								<td colspan=2 valign="middle"><font size=5 color="#eb5b5e"><b>Check
											List</b></font> &nbsp;&nbsp;&nbsp;<input type="button" value="Check" /></td>
							</tr>
							<tr>
								<td colspan=2>
									<c:forEach var="bucketItem"	items="${bucketItemList}">
											&nbsp;&nbsp;<c:out value="${bucketItem.getBucketItemNum() }" />.
											&nbsp;&nbsp;<c:out value="${bucketItem.getBucketItemTitle()}" />
										
										<br>
									</c:forEach>
								</td>
							</tr>

							<tr>
								<td colspan=2 bgcolor="#ffffff" height="10"></td>
							</tr>
							<tr>
								<c:url value="/commentInsert.do" var="commentInsertUrl">
									<c:param name="bucketNum" value="${bucket.getBucketNum()}" />
								</c:url>
								<form:form action="${commentInsertUrl}" method="post">
									<td colspan=2 align=center bgcolor="#ffadad"><font size=4
										color="gray"><b>Comment&nbsp;&nbsp;&nbsp;</b></font><input
										type="text" size=110 name="contents">&nbsp;&nbsp;&nbsp;<input
										type="submit" value="Submit" /></td>
								</form:form>
							</tr>
							<tr>
								<td colspan=2 bgcolor="#ffadad">
									<c:if test="${bucketCommentList != NULL}">
										<c:forEach var="comment" items="${bucketCommentList}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:out value="${comment.getBucketUserNickName()}" />
										: <c:out value="${comment.getBucketCommentContents()}" /><br>
										</c:forEach>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="2%" bgcolor="#ffffff"></td>
				<td width="25%">
					<div id="sidebar">
						<table border=0 height="100%">
							<tr align="center">
								<td height=100>즐겨찾기</td>
								<c:url value="/updateBucketPage.do" var="updateBucketPageUrl">
										<c:param name="bucketNum" value="${bucket.getBucketNum()}" />
								</c:url>
								<form:form action="${updateBucketPageUrl}" method="post">
								<td>
								<c:if test="${!isUser}" > <input type="submit" value="Modify" /></c:if>
								</td>
								<td><input type="button" value="Back" /></td>
								</form:form>
							</tr>
							<tr align="center">
								<td height=200 colspan=3 valign="top"><font size=5
									color="white"><b>시작일</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font
									size=4 color="white"><b><c:out
												value="${bucket.toString(bucket.getBucketRegisterDate())}" /></b></font> <br>
									<br> <font size=5 color="white"><b>종료일</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font size=4 color="white"><b><c:out
												value="${bucket.toString(bucket.getBucketExpireDate())}" /></b></font></td>
							<tr align="center">
								<td height=50 colspan=3></td>
							</tr>
							<tr align="center">
								<td colspan=3 height="120">
								<font size=5 color="white"><b>
								<c:if test="${bucket.getOriginUserNickName() != NULL}">
										원작자 : <c:out value="${bucket.getOriginUserNickName()}" />
								</c:if></b></font>
								</td>
							</tr>
							<tr align="center">								
								<td colspan=3 height="70">
									<font size=5 color="white"><b>
									조회수 : <c:out value="${bucket.getBucketClickCount()}" />
									</b></font>
								</td>
							</tr>
							<tr align="center">
								<td colspan=3 height="70">
										<font size=5 color="white"><b>
									응원수 : <c:out value="${supportCount}" />
									</b></font>
								</td>
							</tr>
							<tr align="center">
								<td height="100" colspan=3></td>
							</tr>
							<tr align="center">
								<td height=50 colspan=3>
								<c:if test="${isUser}" >
								<c:url value="/quoteBucket.do" var="quoteUrl">
										<c:param name="bucketNum" value="${bucket.getBucketNum()}" />
									</c:url>
									<form:form action="${quoteUrl}" method="post">
										<input type="submit" value="퍼오기" />
									</form:form>
									</c:if>
									</td>
							</tr>
							<tr align="center">
								<td height=50 colspan=3>
								<c:if test="${isUser}" >
								<c:url value="/createSupport.do" var="supportUrl">
										<c:param name="bucketNum" value="${bucket.getBucketNum()}" />
									</c:url>
									<form:form action="${supportUrl}" method="post">
										<input type="submit" value="응원하기" />
								</form:form>
								</c:if>
								</td>
							</tr>
						</table>
					</div>
				</td>
				<td width="5%" bgcolor="white"></td>
			</tr>
		</table>
	</div>
</body>
</html>