package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ProductMgr {
		
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/myapp/WebContent/shop/data/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	public ProductMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<ProductBean> getProductList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist =new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select no, name, price, date, stock from tblProduct order by no desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ProductBean bean =new ProductBean();
				bean.setNo(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getString(3));
				bean.setDate(rs.getString(4));
				bean.setStock(rs.getString(5));
				vlist.addElement(bean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;

	}
	
	//Product Detail
	public ProductBean getProduct(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductBean bean =new ProductBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblProduct where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNo(rs.getString("no"));//��ǰ��ȣ
				bean.setName(rs.getString("name"));//��ǰ�̸�
				bean.setPrice(rs.getString("price"));//��ǰ����
				bean.setDetail(rs.getString("detail"));//��ǰ�󼼼���
				bean.setDate(rs.getString("date"));
				bean.setStock(rs.getString("stock"));//��ǰ����
				bean.setImage(rs.getString("image"));//��ǰ�̹���
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	//Product Stock Reduce(��� ����)
	
	/////admin mode//////////
	
	//Product Insert
	
	//Product Update
	
	//Product Delete
	
	
}
