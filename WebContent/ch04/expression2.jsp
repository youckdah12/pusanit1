<!-- expression2.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%!
		//int a= Math.max(a,b);
	public int max1(int a,int b){
		   return (a >= b) ? a : b;
	}
%>
<%
		java.util.Date d=new java.util.Date();
		int hour = d.getHours();
		int one=10;
		int two=12;
%>
지금은 오전일까요 오후일까요?<%=(hour<12)?"오전":"오후" %>
<br/>
one과two둘 중에 큰숫자는?<%=max1(one,two) %>
