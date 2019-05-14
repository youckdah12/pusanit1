<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<% 
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
		}
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
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600">
				<td><font color="#FFFFFF">제품</font></td>
				<td><font color="#FFFFFF">수량</font></td>
				<td><font color="#FFFFFF">가격</font></td>
				<td><font color="#FFFFFF">수정/삭제</font></td>
				<td><font color="#FFFFFF">조회</font></td>
			</tr>
			<%
					int totalprice =0;
					Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
					if(hCart.isEmpty()){
			%>
			<tr>
				<td colspan="5" align="center">
					장바구니 비어 있습니다.
					</td>
			</tr>
			<%
					}else{
						//줄줄이사탕 객체
						Enumeration<Integer> hCartKey =hCart.keys();
						//hasMoreElements:요소값이 더이상 있을때 까지
						while(hCartKey.hasMoreElements()){
							//hCart에 저장된 주문객체를 리턴
							OrderBean order = hCart.get(hCartKey.nextElement());
							//상품객체(삼품가격,상품이름)
							int productNo=order.getProductNo();
							ProductBean pbean=pMgr.getProduct(order.getProductNo());
							int price =pbean.getPrice();//상품가격
							int quantity =order.getQuantity();//주문수량
							int subTotal =price*quantity;
							totalprice+=subTotal;//주문전체총액
							String pName=pbean.getName();
							%>
							<tr align="center">
								<form	method="post" action="cartProc.jsp">
										<input type="hidden" name="productNo" value="<%=productNo%>">
										<input type="hidden" name="flag">
									<td><%=pName%></td>
									<td>
										<input name="quantity" value="<%=quantity%>" size="5">개
									</td>
									<td><%=UtilMgr.monFormat(subTotal)%>원</td>
									<td>
										<input type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)"> 
										<input type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
										</td>
									<td>
										<a href="productDeatail('<%=productNo %>')">상세보기</a>
										</td>
								</form>
							</tr>
							<% }//=while%>
				
			<tr>
					<td colspan="4" align="right">
						총 주문 금액:<%=UtilMgr.monFormat(totalprice) %>원
					</td>
					<td align="center">
						<a href="orderProc.jsp">주문하기</a>
						</td>
			</tr>
		<%}//--if-else %>
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>	
</body>
</html>