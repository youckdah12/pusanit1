<!-- expression.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%!//무조건 법칙:배열 밑에는 항상 for문이 항상 존재함!
		String study[]={"Java","JSP","Servlet","Android"};
%>
<table border="1" width="200">
	<tr>
		<th>번호</th>
	    <th>과목</th>		
	</tr>
		<%for(int i=0;i<study.length;i++){%>
		 		<tr>
		 			<td><%=i+1%></td>
		 			<td><%=study[i]%></td>
		 		</tr>
		<%}%>
</table>

<hr>
<table border="1" width="200">
	<tr>
		<th>번호</th>
	    <th>과목</th>		
	</tr>
	<%for(int i=0;i<study.length;i++){
			out.println("<tr>");
			out.println("<td>"+(i+1)+"</td>");
			out.println("<td>"+study[i]+"</td>");
			out.println("</tr>");
		}//--for %>
</table>

