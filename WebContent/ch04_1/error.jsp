<!-- error.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page isErrorPage="true"%>
다음과 같은 예외가 발생 하였습니다.<p/>
<%=exception.getMessage()%>
