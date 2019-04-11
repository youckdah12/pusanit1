<!-- scope.jsp -->
<%@page import="ch07.ScopeBean"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="pBean" scope="page" class="ch07.ScopeBean"/>
<jsp:useBean id="sBean" scope="session" class="ch07.ScopeBean"/>
<% 
		ScopeBean sBean1=new ScopeBean();
		session.setAttribute("sBean1", sBean1);

%>


<jsp:setProperty property="num" name="pBean"
value="<%=pBean.getNum()+10 %>"/>
<jsp:setProperty property="num" name="sBean"
value="<%=sBean.getNum()+10 %>"/>

pBean:<%=pBean.getNum()%><br/>
sBean:<%=sBean.getNum()%><br/>