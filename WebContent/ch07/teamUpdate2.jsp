<!-- teamUpdate2.jsp -->

<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<jsp:useBean id="bean" scope="session" class="ch07.TeamBean"/>
<link href="style.css" rel="stylesheet" type="text/css">
<body>
	<div align="center">
		<h1>Team Update2</h1>
		<form method="post" action="teamUpdateProc.jsp">
			<table border="1">
				<tr>
					<td width="50" align="center">번호</td>
					<td width="150"><input name="num" readonly value="<%=bean.getNum()%>"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input name="name" value="<%=bean.getName()%>"></td>
				</tr>
				<tr>
					<td align="center">사는곳</td>
					<td><input name="city" value="<%=bean.getCity()%>"></td>
				</tr>
				<tr>
					<td align="center">나이</td>
					<td><input name="age" value="<%=bean.getAge()%>"></td>
				</tr>
				<tr>
					<td align="center">팀명</td>
					<td><input name="team" value="<%=bean.getTeam()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="UPDATE"></td>
				</tr>
			</table>
			<p />
		</form>
		<a href="teamSelect.jsp?num=<%=bean.getNum()%>">SELECT</a>
	</div>
</body>
