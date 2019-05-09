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
<h2>투표 프로그램</h2>
<hr width="60%"/>
<b>설문폼</b>
<!-- include 액션태그 요청 정보가 같이 넘어간다. -->
<jsp:include page="pollForm.jsp"/>
<hr width="60%"/>
<b>설문리스트</b>
<table>
	<tr>
		<td>
		<table  border="1">
			<tr>
				<th width="50">번호</th>
				<th width="250">설문</th>
				<th width="200">시작일~종료일</th>
			</tr>
			<!-- 설문리스트 Start-->
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
			<!-- 설문리스트 End-->
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="pollInsert.jsp">설문작성하기</a>
		</td>
	</tr>
</table>
</div>
</body>
</html>




