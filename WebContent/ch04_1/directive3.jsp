<!-- directive3.jsp-->
<%@ page contentType="text/html; charset=EUC-KR" 
				   pageEncoding="EUC-KR"
%>
<%@page errorPage="error.jsp" %>
<%
	int one=1;
	int zero=0;
	%>
	<h1>Diretive Example3</h1>
	one��zero�� ��Ģ����<p/>
	one+zero=<%=one+zero%><p/>
	one-zero=<%=one-zero%><p/>
	one*zero=<%=one*zero%><p/>
	one/zero=<%=one/zero%><p/>