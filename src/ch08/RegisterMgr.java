package ch08;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ch07.TeamBean;

public class RegisterMgr {

	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	public boolean loginRegister1(String id,String pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;//이거빠져먹음
		String sql=null;
		boolean flag = false;
		try {
			con=pool.getConnection();
			sql=" select count(*) from tblRegister" + 
					"  where id=? and pwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			if(rs.next()&&rs.getInt(1)==1) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		
	return flag;
 }


public boolean loginRegister2(String id,String pwd) {
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;//이거빠져먹음
	String sql=null;
	boolean flag = false;
	try {
		con=pool.getConnection();
		sql=" select id from rblRegister" + 
				"  where id=? and pwd=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rs=pstmt.executeQuery();
		flag=rs.next();
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		pool.freeConnection(con,pstmt,rs);
	}
	
return flag;
}
}
	
