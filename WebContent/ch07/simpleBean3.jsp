<!-- simpleBean3.jsp -->
<%@page import="ch07.SimpleBean2"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		SimpleBean2 bean=new SimpleBean2();
		//3���� ���� �޴´�.
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String city=request.getParameter("city");	
	
		//3���� ���� bean�� �����Ѵ�. 
		bean.setName(name);
		bean.setAge(age);
		bean.setCity(city);
		
%>
<!-- 3���� ���� ����Ѵ�. -->
name:<%=bean.getName()%><br/>
age:<%=bean.getAge()%><br/>
city:<%=bean.getCity()%>


