<!-- if.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%//request:��û ���尴ü
		
		//��û�Ǵ� ���� ���� set�� �ѱ۷� ����
		request.setCharacterEncoding("EUC-KR");
	
		String name=request.getParameter("name");
		String color=request.getParameter("color");
		
		String str="";
		if(color.equals("blue")){
			str="�Ķ���";
		}else if(color.equals("red")){
			str="������";
		}else if(color.equals("orange")){
			str="��������";
		}else{
			color="white";
			str="��Ÿ��";
		
		}
%>
<body bgcolor="<%=color %>">
<h2><%=name%>���� �����ϴ� ������<%=str%>
�Դϴ�.</h2>
</body>

