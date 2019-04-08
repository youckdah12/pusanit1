package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection2 {
	private DBConnectionMgr pool;

	public MySQLConnection2() {
		//½Ì±ÛÅæ ÆÐÅÏ->°´Ã¼¸¦ only ÇÑ°³¸¸ »ý¼º
		pool=DBConnectionMgr.getInstance();

	}

	public void selectTeam() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		String sql=null;

		try {
			//pool¿¡¼­ ºô·Á¿È.
			con=pool.getConnection();
			sql="select*from tblTeam";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			System.out.println("¹øÈ£\t¼º ¸í\t»ç´Â°÷\t³ªÀÌ\tÆÀ ¸í");
			while(rs.next()) {
				int num=rs.getInt("num"); 
				String name= rs.getString("name");
				String city= rs.getString("city");
				int age= rs.getInt("age");
				String team= rs.getString("team");
				System.out.println(num+"\t"+name+"\t"+city+"\t"+age+"\t"+team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				//ºô·Á¿Â con¹Ý³³,pstmt,rs´Â close
			pool.freeConnection(con,pstmt,rs);
		}
	}

	public static void main(String[] args) {
		MySQLConnection2 mcon=new MySQLConnection2();
		mcon.selectTeam();

	}

}
