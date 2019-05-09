<%@page import="poll.PollListBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="poll.PollItemBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num =0;
		if(request.getParameter("num")!=null){
			num = 
			Integer.parseInt(request.getParameter("num"));
		}
		PollListBean plBean =mgr.getPollRead(num);
		Vector<PollItemBean> vlist =mgr.getView(num);
		int sumCount =mgr.sumCount(num);
		String question =plBean.getQuestion();
		Random r=new Random();
		///////////////////////////////////////
		//int cnt[] = new int[vlist.size()];
	//	for(int i=0;i<vlist.size();i++){
		//	cnt[i] = vlist.get(i).getCount();
	//	}
	//	Arrays.sort(cnt);
	//	int maxCnt = cnt[vlist.size()-1];
		int maxCnt =mgr.getMaxCount(num);
%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>투표 결과</h2>
<table border="1" width="400">
	<tr>
		<td colspan="4">
		<b>Q : <%=question%></b>	
		</td>
	</tr>
	<tr>
		<td colspan="3">
		<b>총 투표자 : <%=sumCount%>명</b>	
		</td>
		<td width="40"><b>count(%)</b></td>
	</tr>
		<%
				for(int i=0;i<vlist.size();i++){
					PollItemBean piBean =vlist.get(i);
					String item[] =piBean.getItem();
					int count = piBean.getCount();
					int ratio = new Double(Math.round((double)count/sumCount*100)).intValue();
					String rgb ="#"+Integer.toHexString(r.nextInt(255*255*255));
		%>
			<tr>
			<td width="20" align="center"><%=i+1%></td>
			<td width="120">
			<%if(maxCnt==count){%><b><font color="red"><%}%>
			<%=item[0] %>
			<%if(maxCnt==count){%></font></b><%}%>
	
			</td>
			<td>	
					<table width="<%=ratio%>">
					<tr>
						<td bgcolor="<%=rgb%>" height="15"></td>
					</tr>
					</table>
			</td>
			<td align="center" width="40"><%=count%>(<%=ratio %>)</td>
			</tr>								
		<% }//---for%>	
</table><br/>
<a href="javascript:window.close()">닫기</a>
</div>
</body>
</html>


















