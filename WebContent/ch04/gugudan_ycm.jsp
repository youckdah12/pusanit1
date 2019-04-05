<!-- gugudan_ycm.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<div align="center">
	<h1>구구단을 만들어 봅시다</h1>
	
	<table border="2" cellpadding="4" style="border-style:groove" >
<% 
	for(int i=0; i<10; i++){
		out.println("<tr>");
	
	for(int j=2; j<10; j++){
		if(i==0){
			out.println("<th>"+j+"단</th>");
		}else{
			
%>
		<td bgcolor="#f7f5c2">
		<%=j%>X<%=i %>=
		<font color=#0000FF><%=i*j %></font>
		</td>
<%
		}
	}
	out.println("</tr>");
	}
%>
</table>