<!-- teamDelete.jsp:ȭ�鿡 �������� �������� �ƴϰ� ó���� -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
			request.setCharacterEncoding("EUC-KR");
			int num =0;
			//���������� num���� ��û ������ if�� ����
			if(request.getParameter("num")!=null){
				num=Integer.parseInt(request.getParameter("num"));
					mgr.deleteTeam(num);
			}
			//num���� ��û�ϵ� ���ϵ� teamList.jsp�� ������ ����
				response.sendRedirect("teamList.jsp");	
%>