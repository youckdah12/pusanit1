<!-- directive4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page trimDirectiveWhitespaces="false" %>
<%@ page session="true" %>
<%@page buffer="8kb" %>
<%@ page autoFlush="true" %>
<%@ page isThreadSafe="true" %>
<%@page import="java.util.*" %>
<%
		Date d=new Date();
%>
<%=d.toLocaleString() %>	