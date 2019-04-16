<!-- login.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String id = (String) session.getAttribute("idKey");
	String msg = (String) session.getAttribute("msg");
%>
<html>
<body>
	<h1>Servlet ¼¼¼Ç</h1>

	<%if (id != null) {%>
	<%=id%>´Ô ¹Ý°©½À´Ï´Ù.
	<p />
	<a href="logout.jsp">·Î±×¾Æ¿ô</a>
	<%} else {%>
	<%if(msg!=null){%><font color="red"><%=msg%></font><%}%>
	<form method="post" action="loginServlet">
		id : <input name="id"><br />
	   pwd : <input type="password" name="pwd"><br /> <input type="submit" value="·Î±×ÀÎ">
	</form>
	<%}%>
</body>
</html>