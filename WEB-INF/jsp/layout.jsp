<%@ page contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("euc-kr"); %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
    <style>
    	html, body {
			height: 100%;
			padding: 0px;
			margin: 0px;
		}
		table {
        	width: 100%;
        	height: 100%;
     	}
    </style>
</head>
<body>
	<table bordercolor="#bababa" border="0" align="center">
		<tr>
			<td colspan="2" height="120" bgcolor="#6fb33e">
				<tiles:insertAttribute name="header" />
			</td>
		</tr>
		<tr>
			<td width="20%" height="200"><tiles:insertAttribute name="menu" /></td>
			<td width="80%" rowspan="2"><tiles:insertAttribute name="main" /></td>
		</tr>
		<tr>
			<td height="200"><tiles:insertAttribute name="rank" /></td>
		</tr>
	</table>
</body>
</html>
