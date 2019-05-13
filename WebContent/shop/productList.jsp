<!-- ProductList.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		Vector<ProductBean> pvlist = pMgr.getProductList();
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600"> 
				<td><font color="#FFFFFF">�̸�</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">��¥</font></td>
				<td><font color="#FFFFFF">���</font></td>
				<td><font color="#FFFFFF">�󼼺���</font></td>
			</tr>
		<% 
				for(int i=0;i<pvlist.size();i++){
					ProductBean pbean =pvlist.get(i);
			
		%>
			<tr align="center"> 
				<td><%=pbean.getName()%></td>
				<!-- õ���� �޸� :UtilMgr�� �޼ҵ� ��� -->
				<td><%=UtilMgr.monFormat(pbean.getPrice())%></td>
				<td><%=pbean.getDate()%></td>
					<!-- õ���� �޸� :UtilMgr�� �޼ҵ� ��� -->
				<td><%=UtilMgr.monFormat(pbean.getStock())%></td>
				<td>
				<input type="button" value="�󼼺���" 
			onclick="productDetail('<%=pbean.getNo()%>')" >
			</td>
		</tr>
		<%}//--for %>
		</table>
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>