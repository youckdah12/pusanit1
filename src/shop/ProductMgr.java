package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
		
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/eclipse-workspace/myapp/WebContent/shop/data/";
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
				bean.setPrice(rs.getInt(3));
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
				bean.setNo(rs.getString("no"));//상품번호
				bean.setName(rs.getString("name"));//상품이름
				bean.setPrice(rs.getInt("price"));//상품가격
				bean.setDetail(rs.getString("detail"));//상품상세설명
				bean.setDate(rs.getString("date"));
				bean.setStock(rs.getString("stock"));//상품제고
				bean.setImage(rs.getString("image"));//상품이미지
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	//Product Stock Reduce(재고 수정)
	public void reduceProduct(OrderBean order){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock=stock-? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, order.getQuantity());
			pstmt.setInt(2, order.getProductNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	/////admin mode//////////
	
	//Product Insert
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag =false;
		try {
			MultipartRequest multi=new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert tblProduct(name,price,detail,date,stock,image)"
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
			pstmt.setString(3, multi.getParameter("detail"));
			pstmt.setString(4, UtilMgr.getDay());
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("stock")));
			
			if(multi.getFilesystemName("image")==null)
					pstmt.setString(6, "ready.jsp");
			else
					pstmt.setNString(6, multi.getFilesystemName("image"));
			if(pstmt.executeUpdate()==1)
				flag =true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//Product Update
		public boolean updateProduct(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag =false;
			try {
				MultipartRequest multi=new MultipartRequest(req, UPLOAD, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
				con = pool.getConnection();
				if(multi.getFilesystemName("image")==null) {
						//파일은 선택을 안 함.
					sql="update tblProduct set name=?, price=?, detail=?, stock=? where no = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, multi.getParameter("name"));
					pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
					pstmt.setString(3, multi.getParameter("detail"));
					pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
					pstmt.setInt(5, Integer.parseInt(multi.getParameter("no")));
				}else {
						//파일까지 수정함.
				sql="update tblProduct set name=?, price=?, detail=?, stock=?, image=? where no = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));
				pstmt.setNString(5, multi.getFilesystemName("image"));
				pstmt.setInt(6, Integer.parseInt(multi.getParameter("no")));
				}
				if(pstmt.executeUpdate()==1) flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;

		}
	
	//Product Delete
		public boolean deleteProduct(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			boolean flag =false;
			try {
				con = pool.getConnection();
				sql = "delete from tblProduct where no = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				if(pstmt.executeUpdate()==1)
					flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;

		}
	
}
