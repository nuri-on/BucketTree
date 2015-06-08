<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
div {
	position: relative;
	background-color: #6fb33e;
	height: 100px;
}

#status {
	margin: 2px;
	height: 45px;
	width: 15%;
	background-color: #6fb33e;
	position: absolute;
	right: 0px;
	top: 0px;
	float: right;
	top: 0px
}

#choice {
	background-color: #6fb33e;
	position: relative;
	width: 30%;
	height: 70px;
	left: 830px;
	top: -70px;
}

#logoBox {
	background-color: #6fb33e;
	width: 550px;
	height: 100px;
	position: relative;
	margin-bottom: 3px;
}

a:link {
	text-decoration: none;
	color: #ffffff;
}

a:visited {
	text-decoration: none;
	color: #ffffff;
	border: none;
}

a:active {
	text-decoration: none;
	color: #ffffff;
}

a:hover {
	text-decoration: none;
	color: #ff0000;
}
</style>
</head>
<body>
	<div style="background-color: #6fb33e;">
		<div id="logoBox">
			&nbsp;&nbsp;&nbsp;
			<c:url value="/main.do" var="targetUrl" /><a href="${targetUrl}">
			<img src="images/tree.png" height="100px"></a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:url value="/main.do" var="targetUrl" /><a href="${targetUrl}">
			<img src="images/logo.png" height="50px"></a>
		</div>

		<div id="choice">
			<table border=0 height="35">
				<tr height="35">
					<td style="padding-right: 45px;"><h1>Mine</h1></td>
					<td style="padding-right: 45px;"><c:url value="/sharedBucket.do"
							var="sharedBucketUrl" /><a href="${sharedBucketUrl}"><h1>Shared</h1></a></td>
					<td style="padding-right: 5px;"><c:url value="/teamBucket.do"
							var="teamBucketUrl" /><a href="${teamBucketUrl}"><h1>Team</h1></a>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<div id="status">
		<table border=0 height="25">
			<tr height="25">
				<td style="padding-right: 15px;">
					<c:url value="/main.do" var="targetUrl" />
					<a href="${targetUrl}"><h3>Home</h3></a>
				</td>
				<c:url value="/mypage.do" var="mypageUrl"/>
				<td style="padding-right: 15px;"><a href="${mypageUrl}" ><h3>My Page</h3></a></td>
				<c:url value="/loginout.do" var="loginoutUrl"/>
				<td style="padding-right: 10px;"><a href="${loginoutUrl}" ><h3>Log Out</h3></a></td>
			</tr>
		</table>
	</div>
</body>
</html>