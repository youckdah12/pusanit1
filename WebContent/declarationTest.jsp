<!-- declaration Test.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<h1><%=getStr()%></h1>
<%!

		public String getStr(){
			str+="테스트입니다.";
			return str;
		}
		private String str="선언문";
%>
