package shop;

import java.util.Hashtable;

public class CartMgr {
	//Integer=상품번호(ProductNo)
			private Hashtable<Integer, OrderBean> hCart = new Hashtable<>();
			
			
			//Cart Insert
			public void addCart(OrderBean order/*새로운 장바구니*/) {
					int productNo =order.getProductNo();
					int quantity/*주문수량*/ = order.getQuantity();
					if(quantity>0) {
						//cart에 기존에 저장된 것이 있다면
						if(hCart.containsKey(productNo)) {
							//기존에 저장된 주문객체
							OrderBean temp = hCart.get(productNo);
							//새로운 주문 수량+ 기존의 주문수량
							quantity+=temp.getQuantity();
							//order 객체에 합쳐진 주문수량setter
							order.setQuantity(quantity);
							//카트에 다시 저장하면 기존에 주문객체는 덮어쓰기된다.
							hCart.put(productNo, order);
						}else {
							//기존에 저장이 없다면
							hCart.put(productNo, order);
						}
						
					}
			}
			
			//Cart Update
			public void updateCart(OrderBean order) {
				int productNo =order.getProductNo();
				//동일한 key값을 덮여쓰기
				hCart.put(productNo, order);
			}
			
		
			//Cart Delete
			public void deleteCart(OrderBean order) {
				int productNo = order.getProductNo();
				hCart.remove(productNo);
			}
			
			//Cart List
			public Hashtable<Integer, OrderBean> getCartList(){
				return hCart;
			}
}
