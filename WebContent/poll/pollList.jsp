<%@page import="poll.PollListBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>��ǥ ���α׷�</h2>
<hr width="60%"/>
<b>������</b>
<!-- include �׼��±� ��û ������ ���� �Ѿ��. -->
<jsp:include page="pollForm.jsp"/>
<hr width="60%"/>
<b>��������Ʈ</b>
<table>
	<tr>
		<td>
		<table  border="1">
			<tr>
				<th width="50">��ȣ</th>
				<th width="250">����</th>
				<th width="200">������~������</th>
			</tr>
			<!-- ��������Ʈ Start-->
					<%
							Vector<PollListBean> vlist =mgr.getAllList();
							for(int i=0;i<vlist.size();i++){
								PollListBean plBean =vlist.get(i);
								int num = plBean.getNum();
								String question =plBean.getQuestion();
								String sdate=plBean.getSdate();
								String edate=plBean.getEdate();
								%>
								<tr align="center">
								<td><%=vlist.size()-i %></td>
								<td align="left"><a href="pollList.jsp?num=<%=num%>"><%=question%></a></td>
								<td><%=sdate+"~"+edate%></td>								
								</tr>
								<%}//--for%>
			<!-- ��������Ʈ End-->
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="pollInsert.jsp">�����ۼ��ϱ�</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>




