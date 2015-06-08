<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
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

#bucketItemForm {
	background-color: #ededed;
	height: 37px;
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
	var bucketItemCnt = 1;
	function addBucketItem() {
		++bucketItemCnt;
		var msg = "";
		msg += "<table id='bucketTitleForm" + bucketItemCnt + "' border='0'>"
				+ "<tr height=50><td width='230' align='right'><font size=5 color='#76a4ad'><b>"+ bucketItemCnt +
				".</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input type='text' name='bucketItemTitle' size='100'>"
				+ "<input type='hidden' name='bucketItemNum' value='" + bucketItemCnt + "'></td></tr></table>";

		bucketItemForm.innerHTML += msg;

	}
</script>

</head>
<body bgcolor="#ededed">
<div id="contents">
	<c:url value="/insertBucketDAO.do" var="targetUrl" />
	<form:form action="${targetUrl}" method="POST">
		<table border=0 width="100%" height="100%">
			<tr align="right" height=45>
				<td colspan=2><input type="submit" value="����ϱ�" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			
			<tr height=60>
				<td width="230" align="center"><font size=6 color="#eb5b5e"><b>����</b></font></td>
				<td><input type="text" name="bucketTitle" size="100" /></td>
			</tr>
			
			<tr>
				<td colspan=2 bgcolor="#ffadad" height="10"></td>
			</tr>

			<tr>
				<td align="center"><font size=6 color="#eb5b5e"><b>����</b></font></td>
				<td><textarea name="bucketDetail" style="width:90%;height:200px;">��Ŷ�� ���õ� ������ �Է��ϼ���.</textarea></td>
			</tr>
			
			<tr>
				<td colspan=2 bgcolor="#ffadad" height="10"></td>
			</tr>

			<tr height=60>
				<td align="center"><font size=6 color="#eb5b5e"><b>Category</b></font></td>
				<td><select name="bucketCategoryNum">
						<option value="1">����</option>
						<option value="2">���</option>
						<option value="3">�ڰ���</option>
						<option value="4">�丮</option>
						<option value="5">�</option>
						<option value="6">����</option>
						<option value="7">������Ʈ</option>
						<option value="8">����</option>
				</select></td>
			</tr>

			<tr>
				<td colspan=2 bgcolor="#ffadad" height="10"></td>
			</tr>

			<tr height=60>
				<td align="center"><font size=6 color="#eb5b5e"><b>������</b></font></td>
				<td><input type="date" name="bucketRegisterDate" size="30" /></td>
			</tr>
			
			<tr height=60>
				<td align="center"><font size=6 color="#eb5b5e"><b>������</b></font></td>
				<td><input type="date" name="bucketExpireDate" size="30" /></td>
			</tr>

			<tr>
				<td colspan=2 bgcolor="#ffadad" height="10"></td>
			</tr>
									
			<tr height=60>
				<td align="center"><font size=6 color="#eb5b5e"><b>��������</b></font></td>
				<td><input type="radio" name="publicTag" value="0" checked /><b>��</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="publicTag" value="1" /><b>�ƴϿ�</b>
				</td>
			</tr>

			<tr>
				<td colspan=2 bgcolor="#ffadad" height="10"></td>
			</tr>
		
			<tr height=60>
				<td align="center"><font size=6 color="#eb5b5e"><b>üũ����Ʈ</b></font></td>
				<td valign="middle"><font size=5 color="#76a4ad"><b>�׸� ���ϱ�</b></font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="+" onClick="addBucketItem()"></td>
			</tr>
		</table>
		<table id="bucketTitleForm1" border="0">
			<tr height=50>
				<td width="230" align="right"><font size=5 color="#76a4ad"><b>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
				<td><input type="text" name="bucketItemTitle" size="100">
					<input type="hidden" name="bucketItemNum" value="1"></td>
			</tr>			
		</table>	
		<div id="bucketItemForm"></div>		
	</form:form>
</div>
</body>
</html>