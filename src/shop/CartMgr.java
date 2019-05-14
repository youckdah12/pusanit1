package shop;

import java.util.Hashtable;

public class CartMgr {
	//Integer=��ǰ��ȣ(ProductNo)
			private Hashtable<Integer, OrderBean> hCart = new Hashtable<>();
			
			
			//Cart Insert
			public void addCart(OrderBean order/*���ο� ��ٱ���*/) {
					int productNo =order.getProductNo();
					int quantity/*�ֹ�����*/ = order.getQuantity();
					if(quantity>0) {
						//cart�� ������ ����� ���� �ִٸ�
						if(hCart.containsKey(productNo)) {
							//������ ����� �ֹ���ü
							OrderBean temp = hCart.get(productNo);
							//���ο� �ֹ� ����+ ������ �ֹ�����
							quantity+=temp.getQuantity();
							//order ��ü�� ������ �ֹ�����setter
							order.setQuantity(quantity);
							//īƮ�� �ٽ� �����ϸ� ������ �ֹ���ü�� �����ȴ�.
							hCart.put(productNo, order);
						}else {
							//������ ������ ���ٸ�
							hCart.put(productNo, order);
						}
						
					}
			}
			
			//Cart Update
			public void updateCart(OrderBean order) {
				int productNo =order.getProductNo();
				//������ key���� ��������
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
