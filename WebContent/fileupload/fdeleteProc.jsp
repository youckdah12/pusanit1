<!-- fdeleteProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="fileupload.FileuploadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
       //üũ�� fch���� �迭�� ����
		String snum[]=request.getParameterValues("fch");
       //���ڿ� snum���� ���� num������ ��ȯ�ϱ� ���� int �迭�� ����.
       //num�� ũ��� snum�̶� ����.
		int num[]=new int[snum.length];
       //���ڿ� �迭�� ����Ÿ�� �迭�� ��ȯ
		for(int i=0;i<snum.length;i++){
			num[i]=Integer.parseInt(snum[i]);
		}
       mgr.deleteFile(num);
       response.sendRedirect("flist.jsp");
%>