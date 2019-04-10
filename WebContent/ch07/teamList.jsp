<%@page import="ch07.TeamBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<TeamBean> vlist=mgr.listTeam();
%>
<link href="style.css" rel="stylesheet" type="text/css">
<div align="center"><p/>
<h1>Team List</h1>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>사는곳</th>
		<th>나이</th>
		<th>팀명</th>
	</tr>
	<%
			for(int i=0;i<vlist.size();i++){
				//--vlist.elementAt(i);
			TeamBean bean=vlist.get(i);	
			int num=bean.getNum();
			
			%>
			<tr align="center">
			<td><a href="teamSelect.jsp?num=<%=num%>"><%=i+1%></a></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getCity()%></td>
			<td><%=bean.getAge() %></td>
			<td><%=bean.getTeam() %></td>
			</tr>
			<%}//--for %>
	
	</table><p/>
	<a href="teamInsert.html">INSERT</a>
	</div>
	</body>