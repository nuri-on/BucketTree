<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<% 	request.setCharacterEncoding("euc-kr");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Team Bucket</title>
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
		<c:url value="/temp.do" var="targetUrl" />
		<table border=0 width="100%" height=200>
			<tr>
				<td>
					<!-- �˻� �� ���� ���̺� ���� -->
					<table border=0 width="100%">
						<tr>
							<td rowspan=2>	
								&nbsp;&nbsp;&nbsp;	
								<select name="search">
									<option value='�ֽ� ��ϼ�' selected>�ֽ� ��ϼ�</option>
									<option value='���� �ӹڼ�'>���� �ӹڼ�</option>
									<option value='��ȸ ������'>��ȸ ������</option>
								</select>&nbsp;&nbsp;&nbsp;					
							</td>
							<td height=50 align="right"><select name="search">
									<option value='���þ���' selected>�˻�����</option>
									<option value='ī�װ�'>ī�װ�</option>
									<option value='����'>����</option>
									<option value='�۾���'>�۾���</option>
							</select>&nbsp;&nbsp;&nbsp;
							<input type="text" name="searchBucket" id="searchBucket" size=20 />
							&nbsp;&nbsp;&nbsp;<font size=5><b>Search</b>&nbsp;&nbsp;&nbsp;</font>
							</td>
						</tr>
						<tr>
							<td height=50 align="right">
							<c:url value="/insertBucketTeam.do" var="insertBucketTeamUrl" />
							<a href="${insertBucketTeamUrl}"><font size=4><b>Write</b></font></a>&nbsp;&nbsp;&nbsp;</td>
						</tr>
					</table>
					<!-- �˻� �� ���� ���̺� �� -->
				</td>
			</tr>
			<tr>
				<td>
					<table border=0  cellspacing="10" width="100%">
						<c:forEach var="bucketTeam" items="${bucketTeamlist}" varStatus="status">
							<c:url var="targetUrl" value="/bucketTeamItem.do">
								<c:param name="bucketNum" value="${bucketTeam.getBucketNum()}" />
							</c:url>

							<c:choose>
								<c:when test="${(status.index % 2) == 0}">
									<tr align="center" height="350">
										<td width="50%">
											<table border=0>											
												<tr height=140>
													<td bgcolor="#ffadad">
													<table border=0 width="100%">
														<tr>
															<td rowspan=2 width="20%" align="center">
																���࿩��
															</td>
															<td align="left">
																&nbsp;&nbsp;&nbsp;
																<font size=4 color="#ffffff"><b>
																ī�װ�</b></font>
															</td>
														</tr>
														<tr>
															<td align="left">
																&nbsp;&nbsp;&nbsp;
																<a href="${targetUrl}" ><font size=6 color="#eb5b5e"><b>
																<c:out value="${bucketTeam.getBucketTitle()}" /></b></font></a>																
															</td>
														</tr>
														<tr>
															<td colspan=2 align="right">
															����� ����� 															
															<font size=4 color="#ffffff"><b> / <c:out value="${bucketTeam.getBucketTeamUserCount()}" /></b></font>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</td>
														</tr>
													</table>
												</td>
												</tr>
												<tr>
													<td bgcolor="#ffdbdb">
														<table border=0 width="100%" height="100%">
															<tr>
																<td colspan=2>
																	��Ŷ ���� �ҷ�����
																</td>
															</tr>
															<tr height=50>
																<td width="13%" align="left">
																	�����ͺ��� �ҷ�����
																</td>
																<td align="right">
																	������~������ �ҷ�����
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
								</c:when>
								<c:otherwise>
									<td width="50%">
											<table border=0>											
												<tr height=140>
													<td bgcolor="#ffadad">
													<table border=0 width="100%">
														<tr>
															<td rowspan=2 width="20%" align="center">
																���࿩��
															</td>
															<td align="left">
																&nbsp;&nbsp;&nbsp;
																<font size=4 color="#ffffff"><b>
																ī�װ�</b></font>
															</td>
														</tr>
														<tr>
															<td align="left">
																&nbsp;&nbsp;&nbsp;
																<a href="${targetUrl}" ><font size=6 color="#eb5b5e"><b>
																<c:out value="${bucketTeam.getBucketTitle()}" /></b></font></a>																
															</td>
														</tr>
														<tr>
															<td colspan=2 align="right">
															����� ����� 															
															<font size=4 color="#ffffff"><b> / <c:out value="${bucketTeam.getBucketTeamUserCount()}" /></b></font>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</td>
														</tr>
													</table>
												</td>
												</tr>
												<tr>
													<td bgcolor="#ffdbdb">
														<table border=0 width="100%">
															<tr>
																<td colspan=2>
																	��Ŷ ���� �ҷ�����
																</td>
															</tr>
															<tr height=50>
																<td width="13%" align="left">
																	�����ͺ��� �ҷ�����
																</td>
																<td align="right">
																	������~������ �ҷ�����
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										</tr>
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