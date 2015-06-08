<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
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
</style>
</head>
<body>
	<div id="contents">	
		<table border=0 width="100%" height="100%">
			<tr>
				<td align="right" height="50" valign="bottom">
					<c:url var="followUrl" value="/follow.do" >
						<c:param name="userNum" value="${targetUserNum}" />
					</c:url>
					
					<c:if test="${exist}">
					<form action="${followUrl}" method="post">
					<input type="submit" value="Follow">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</form>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					<table border=0  cellspacing="10" width="100%">
						<c:forEach var="bucket" items="${bucketlist}" varStatus="status">
							<c:url var="targetUrl" value="/bucketItem.do">
								<c:param name="bucketNum" value="${bucket.getBucketNum()}" /> 
							</c:url>
							
							<c:choose>
								<c:when test="${(status.index % 4) == 0}">
									<tr align="center" height="280">
										<td width="25%">
											<table border=0>
												<c:choose>
													<c:when test="${bucket.getBucketTeamFlag().toString() == '0'}">
														<tr height=100>
															<td bgcolor="#f7d672">
															<table border=0><tr align="center"><td height=80>
															<a href="${targetUrl}">
															<font size=6 color="#fc7d28"><b>
															<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a>
															</td></tr>
															<!-- 즐겨찾기 영역 시작-->
															<tr>
															<td align="right">개인 즐겨찾기</td>
															</tr>
															<!-- 즐겨찾기 영역 끝 -->
															</table>
															</td>
														</tr>
														<tr>
															<td bgcolor="#f7f2ba">
															<c:forEach var="bucketItem" items="${bucket.getBucketItemList()}" varStatus="status1">
																<c:choose>
																	<c:when test="${status1.index < 4}">
																		<p>
																		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		<font size=4><c:out value="${bucketItem.getBucketItemNum() }" /> :
																		&nbsp;&nbsp;&nbsp; <c:out value="${bucketItem.getBucketItemTitle()}" /></font><br>
																		</b>
																		</p>
																	</c:when>
																</c:choose>
															</c:forEach></td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr height=100 align="center">
															<td bgcolor="#ffadad">
															<table border=0><tr align="center"><td height=80>
															<a href="${targetUrl}">
															<font size=6 color="#eb5b5e"><b>
															<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a></td></tr>
															<!-- 즐겨찾기 영역 시작 -->
															<tr>
															<td align="right">팀 즐겨찾기</td>
															</tr>
															<!-- 즐겨찾기 영역 시작 -->
															</table>
															</td>
														</tr>
														<tr>
															<td bgcolor="#ffdbdb"><c:forEach var="bucketItem"
																	items="${bucket.getBucketItemList()}"
																	varStatus="status1">
																	<c:choose>
																		<c:when test="${status1.index < 4}">
																			<p>
																				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=4><c:out
																							value="${bucketItem.getBucketItemNum() }" /> :
																						&nbsp;&nbsp;&nbsp; <c:out
																							value="${bucketItem.getBucketItemTitle()}" /></font><br>
																				</b>
																			</p>
																		</c:when>
																	</c:choose>
																</c:forEach></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</td>
								</c:when>
								<c:when test="${(status.index % 4) == 3}">
									<td width="25%">
										<table border=0>
											<c:choose>
												<c:when test="${bucket.getBucketTeamFlag().toString() == '0'}">
														<tr height=100>
															<td bgcolor="#f7d672">
															<table border=0><tr align="center"><td height=80>
															<a href="${targetUrl}">
															<font size=6 color="#fc7d28"><b>
															<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a>
															</td></tr>
															<!-- 즐겨찾기 영역 시작-->
															<tr>
															<td align="right">개인 즐겨찾기</td>
															</tr>
															<!-- 즐겨찾기 영역 끝 -->
															</table>
															</td>
														</tr>
														<tr>
														<td bgcolor="#f7f2ba"><c:forEach var="bucketItem" items="${bucket.getBucketItemList()}" varStatus="status1">
																<c:choose>
																	<c:when test="${status1.index < 4}">
																		<p>
																		<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=4>
																		<c:out value="${bucketItem.getBucketItemNum() }" /> :
																		&nbsp;&nbsp;&nbsp; <c:out value="${bucketItem.getBucketItemTitle()}" /></font><br>
																		</b>
																		</p>
																	</c:when>
																</c:choose>
														</c:forEach></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr height=100 align="center">
														<td bgcolor="#ffadad">
														<table border=0><tr align="center"><td height=80>
														<a href="${targetUrl}">
														<font size=6 color="#eb5b5e"><b>
														<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a></td></tr>
														<!-- 즐겨찾기 영역 시작 -->
														<tr>
														<td align="right">팀 즐겨찾기</td>
														</tr>
														<!-- 즐겨찾기 영역 시작 -->
														</table>
														</td>
													</tr>
													<tr>
														<td bgcolor="#ffdbdb"><c:forEach var="bucketItem"
																items="${bucket.getBucketItemList()}"
																varStatus="status1">
																<c:choose>
																	<c:when test="${status1.index < 4}">
																		<p>
																			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=4><c:out
																						value="${bucketItem.getBucketItemNum() }" /> :
																					&nbsp;&nbsp;&nbsp; <c:out
																						value="${bucketItem.getBucketItemTitle()}" /></font><br>
																			</b>
																		</p>
																	</c:when>
																</c:choose>
															</c:forEach></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</table>
									</td>
									</tr>
								</c:when>
								<c:otherwise>
									<td width="25%">
										<table border=0>
											<c:choose>
												<c:when test="${bucket.getBucketTeamFlag().toString() == '0'}">
													<tr height=100>
														<td bgcolor="#f7d672">
														<table border=0><tr align="center"><td height=80>
														<a href="${targetUrl}">
														<font size=6 color="#fc7d28"><b>
														<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a>
														</td></tr>
														<!-- 즐겨찾기 영역 시작-->
														<tr>
														<td align="right">개인 즐겨찾기</td>
														</tr>
														<!-- 즐겨찾기 영역 끝 -->
														</table>
														</td>
														</tr>
													<tr>
														<td bgcolor="#f7f2ba"><c:forEach var="bucketItem"
																items="${bucket.getBucketItemList()}"
																varStatus="status1">
																<c:choose>
																	<c:when test="${status1.index < 4}">
																		<p>
																			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=4><c:out
																						value="${bucketItem.getBucketItemNum() }" /> :
																					&nbsp;&nbsp;&nbsp; <c:out
																						value="${bucketItem.getBucketItemTitle()}" /></font><br>
																			</b>
																		</p>
																	</c:when>
																</c:choose>
															</c:forEach></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr height=100 align="center">
														<td bgcolor="#ffadad">
														<table border=0><tr align="center"><td height=80>
														<a href="${targetUrl}">
														<font size=6 color="#eb5b5e"><b>
														<c:out value="${bucket.getBucketTitle().toString()}" /></b></font></a></td></tr>
														<!-- 즐겨찾기 영역 시작 -->
														<tr>
														<td align="right">팀 즐겨찾기</td>
														</tr>
														<!-- 즐겨찾기 영역 시작 -->
														</table>
														</td>
													</tr>
													<tr>
														<td bgcolor="#ffdbdb"><c:forEach var="bucketItem"
																items="${bucket.getBucketItemList()}"
																varStatus="status1">
																<c:choose>
																	<c:when test="${status1.index < 4}">
																		<p>
																			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size=4><c:out
																						value="${bucketItem.getBucketItemNum() }" /> :
																					&nbsp;&nbsp;&nbsp; <c:out
																						value="${bucketItem.getBucketItemTitle()}" /></font><br>
																			</b>
																		</p>
																	</c:when>
																</c:choose>
															</c:forEach></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</table>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>