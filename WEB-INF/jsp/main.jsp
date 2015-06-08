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
<title>BUCKET TREE</title>
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
<script type="text/javascript">

	function changeRangement() {
		form1.submit();

	}
	
</script>
</head>
<body>
	
	<div id="contents">
		<c:url value="/main.do" var="mainUrl" />		
		<table border=0 width="100%" height=200>
			<tr>
				<td>
					<!-- 검색 및 정렬 테이블 시작 -->
					<table border=0 width="100%">
						<tr>
							<form:form name="form1" commandName="rangeForm" action="${mainUrl}" method="post" >	
							<td rowspan=2>	
								&nbsp;&nbsp;&nbsp;
								<form:select path="option1" onChange="changeRangement()">
									<form:option value="1">최신 등록순</form:option>
									<form:option value="2">마감 임박순</form:option>
									<form:option value="3">조회 많은순</form:option>
								</form:select>&nbsp;&nbsp;&nbsp;		
								
								<form:radiobutton path="option2" value="1" onclick="changeRangement()" />
								<font size=6><b>All</b></font>&nbsp;&nbsp;&nbsp;
								<form:radiobutton path="option2" value="2" onclick="changeRangement()" />
								<font size=6><b>Mine</b></font>&nbsp;&nbsp;&nbsp;
								<form:radiobutton path="option2" value="3" onclick="changeRangement()" />
								<font size=6><b>Team</b></font>
								
								
							</td>
							<td height=50 align="right">
									<form:select path="option3">
									<form:option value="0">카테고리</form:option>
									<form:option  value="1">여행</form:option>
									<form:option  value="2">취업</form:option>
									<form:option  value="3">자격증</form:option>
									<form:option  value="4">요리</form:option>
									<form:option  value="5">운동</form:option>
									<form:option  value="6">독서</form:option>
									<form:option  value="7">프로젝트</form:option>
									<form:option  value="8">공부</form:option>
									</form:select>&nbsp;&nbsp;
							<form:input path="contents" size="20" id="searchBucket"/>&nbsp;<input type="submit" value="Search" />
							</td>
							</form:form>
						</tr>
						<tr>
							<td height=50 align="right">
							<c:url value="/insertBucket.do" var="insertBucketUrl" />
							<a href="${insertBucketUrl}"><font size=4><b>Write</b></font></a>&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
					<!-- 검색 및 정렬 테이블 끝 -->
				</td>
			</tr>
			<tr>
				<td>
					<table border=0  cellspacing="10" width="100%">
						<c:forEach var="bucket" items="${bucketlist}" varStatus="status">
							<c:url var="targetUrl" value="/bucketItem.do">
								<c:param name="bucketNum" value="${bucket.getBucketNum()}" />
							</c:url>
							<c:url value="/favoriteControl.do" var="favoriteUrl" >
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
															</tr>
															<!-- 즐겨찾기 영역 끝 -->
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
															</tr>
														<!-- 즐겨찾기 영역 끝 -->
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
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
															<td align="right">
																<c:if test="${bucket.getFavoriteflag() == 1}">
																<a href="${favoriteUrl}">나는 즐겨찾기</a>
																</c:if>
																<c:if test="${bucket.getFavoriteflag() == 0}">
																<a href="${favoriteUrl}">나는 아니예요ㅠㅠ</a>
																</c:if>
															</td>
															</tr>
														<!-- 즐겨찾기 영역 끝 -->
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
