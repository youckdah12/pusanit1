package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class GuestBookMgr {
	
	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	public GuestBookMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//Join Login
	public boolean loginJoin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from tblJoin where id=? and pwd =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			if(pstmt.executeQuery().next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//Join Information
	public JoinBean getJoin(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JoinBean bean = new JoinBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblJoin where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setHp(rs.getString(5));
				bean.setGrade(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	 //GuestBook Insert
	public void insertGuestBook(GuestBookBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblGuestBook(id,contents,ip,regdate,regtime,secret) values(?,?,?,now(),now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2,bean.getContents());
			pstmt.setString(3,bean.getIp());
			pstmt.setString(4,bean.getSecret());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}	
	
	//GuestBook List : 비밀글은 본인및 관리자만 볼 수 있다.
		public Vector<GuestBookBean> listGuestBook(String id,String grade){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<GuestBookBean> vlist=new Vector<GuestBookBean>();
			try {
				con = pool.getConnection();
				if(grade.equals("1"/*admin로그인 관리자*/)) {
					sql = "select * from tblGuestBook order by num desc";
					pstmt = con.prepareStatement(sql);
				}else {//aaa 로그인 
					sql = "select * from tblGuestBook where id=? or secret=? order by num desc";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, "0");
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					GuestBookBean bean=new GuestBookBean();
					//모든 타입의 값은 getString가능 심지어 int형도 가능
					bean.setNum(rs.getInt(1));//num
					bean.setId(rs.getString(2));//id
					bean.setContents(rs.getString(3));
					bean.setIp(rs.getString(4));
					
					String tempDate=SDF_DATE.format(rs.getDate(5));
					bean.setRegdate(tempDate);
					
					String tempTime=SDF_TIME.format(rs.getDate(6));
					bean.setRegtime(tempTime);
					
					bean.setSecret(rs.getString(7));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//GuestBook Delete
		public void deleteGuestBook(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from tblGuestBook where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;

		}
		//GuestBook Get
		public GuestBookBean getGuestBook(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			GuestBookBean bean=new GuestBookBean();
			try {
				con = pool.getConnection();
				sql = "select * from tblGuestBook where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setNum(rs.getInt(1));//num
					bean.setId(rs.getString(2));//id
					bean.setContents(rs.getString(3));
					bean.setIp(rs.getString(4));
					String tempDate=SDF_DATE.format(rs.getDate(5));
					bean.setRegdate(tempDate);
					String tempTime=SDF_TIME.format(rs.getTime(6));
					bean.setRegtime(tempTime);
					bean.setSecret(rs.getString(7));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;

		}
		//GuestBook Update:contents,ip,secret 3개 수정
		public void updateGuestBook(GuestBookBean bean){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update tblGuestBook set contents=?,ip=?,secret=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getContents());
				pstmt.setString(2, bean.getIp());
				pstmt.setString(3, bean.getSecret());
				pstmt.setInt(4,bean.getNum());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
		}

}
