<!-- declaration Test.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<h1><%=getStr()%></h1>
<%!

		public String getStr(){
			str+="�׽�Ʈ�Դϴ�.";
			return str;
		}
		private String str="����";
%>
