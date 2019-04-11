<!-- teamSelect.jsp -->
<%@page import="ch07.TeamBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")==null){
			response.sendRedirect("teamList.jsp");	
		}else{
			num=Integer.parseInt(request.getParameter("num"));
		}
		TeamBean bean=mgr.getTeam(num);
		//네션에 bean 키값으로 저장, scope="session"같은기능 
		session.setAttribute("bean", bean);
%>
<link href="style.css" rel="stylesheet" type="text/css">
<body>
<div align="center">
<h1>Team Select</h1>
<table border="1">
	<tr>
		<td width="50">번호</td>
		<td width="100"><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>사는곳</td>
		<td><%=bean.getCity()%></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=bean.getAge()%></td>
	</tr>
	<tr>
		<td>팀명</td>
		<td><%=bean.getTeam()%></td>
	</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>&nbsp;&nbsp;
<a href="teamInsert.html">INSERT</a>&nbsp;&nbsp;
<a href="teamDelete.jsp?num=<%=num%>">DELETE</a>&nbsp;&nbsp;
<a href="teamUpdate.jsp?num=<%=num%>">UPDATE</a>&nbsp;&nbsp;
<a href="teamUpdate2.jsp">UPDATE2</a>&nbsp;&nbsp;
</div>
</body>
