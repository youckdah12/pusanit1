<!-- cookieLoginOK.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String id="";//��Ű������� id���� �����´�.
		Cookie[] cookies=request.getCookies();
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("idKey")){
				id=cookies[i].getValue();
			}
		}
		if(id.equals("")){
%>
		<script>
			alert("�α��� ���� �ʾҽ��ϴ�.");
			location.href="cookieLoginOK.jsp";
		</script>
<%}%>
<html>
<head>
<title>Cookie �α���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2 align="center">Cookie �α���</h2>
	<table width="300" border="1" align="center" bgcolor="#FFFF99">
		<tr bordercolor="#FFFF66">
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b>���� �α��� �ϼ̽��ϴ�.</td>
			<td align="center"><a href="cookieLogout.jsp">�α׾ƿ�</a></td>
		</tr>
	</table>
</body>
</html>

