<!-- cookieLoginOK.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String id="";//쿠키에저장된 id값을 가져온다.
		Cookie[] cookies=request.getCookies();
		for(int i=0; i<cookies.length;i++){
			if(cookies[i].getName().equals("idKey")){
				id=cookies[i].getValue();
			}
		}
		if(id.equals("")){
%>
		<script>
			alert("로그인 지되 않았습니다.");
			location.href="cookieLoginOK.jsp";
		</script>
<%}%>
<html>
<head>
<title>Cookie 로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h2 align="center">Cookie 로그인</h2>
	<table width="300" border="1" align="center" bgcolor="#FFFF99">
		<tr bordercolor="#FFFF66">
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b>님이 로그인 하셨습니다.</td>
			<td align="center"><a href="cookieLogout.jsp">로그아웃</a></td>
		</tr>
	</table>
</body>
</html>

