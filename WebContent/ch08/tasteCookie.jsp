<!-- tasteCookie.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		Cookie[] cookies= request.getCookies();
		if(cookies!=null){
			for(int i=0; i<cookies.length; i++){
%>
				Cookie Name:<%=cookies[i].getName()%><br/>
				Cookie Value:<%=cookies[i].getValue()%><p/>
<%				
			}
		}
%>
