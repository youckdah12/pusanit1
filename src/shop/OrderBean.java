package shop;

public class OrderBean {
		private int no;
		private int productNo;
		public int getNo() {
			return no;
		}
		public void setNo(int no) {
			this.no = no;
		}
		public int getProductNo() {
			return productNo;
		}
		public void setProductNo(int productNo) {
			this.productNo = productNo;
		}
		private int quantity;
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		private String date;
		private String state;
		private String id;
		
		
	
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
}
