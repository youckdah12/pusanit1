<%@ page contentType="text/html;charset=EUC-KR" %>
<html>
<head>
<title>Simple Shopping Mall Admin</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<form method="post" action="productProc.jsp?flag=insert" enctype="multipart/form-data">
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#996600"> 
		<td colspan="2" align="center">
			<font color="#FFFFFF">��ǰ ���</font>
		</td>
		</tr>
		<tr> 
			<td align="center">��ǰ�̸�</td>
			<td align="left"><input name="name" size="20"></td>
		</tr>
		<tr> 
			<td align="center">��ǰ����</td>
			<td align="left"><input name="price" size="20">��</td>
		</tr>
		<tr> 
			<td align="center">��ǰ����</td>
			<td><textarea rows="10" cols="45" name="detail"></textarea></td>
		</tr>
		<tr> 
			<td align="center">��ǰ����</td>
			<td><input name="stock" size="10">��</td>
		</tr>
		<tr> 
			<td align="center">��ǰ�̹���</td>
			<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
			<input type="submit" value="��ǰ���">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="�ٽþ���">
		</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>

