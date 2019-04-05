<!-- scriptAction.jsp -->
<!-- SUN의 정책이 JSP코드에 java 코드를 0%로 만드는것 -->
<jsp:directive.page contentType="text/html; charset=EUC-KR"/>
<jsp:declaration>
		public int max(int a,int b){
			return a>b?a:b;
		}
</jsp:declaration>
<jsp:scriptlet>
		int i=22;
		int j=23;
</jsp:scriptlet>
<h3><jsp:expression>max(i,j)</jsp:expression></h3>
