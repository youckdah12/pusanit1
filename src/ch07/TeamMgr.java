package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;

/*
 * DB와 관련된 기능의 메소드를 선언한 클래스
 * */

public class TeamMgr {

		private DBConnectionMgr pool;
		
		public TeamMgr() {
			pool=DBConnectionMgr.getInstance();
		}
		
		//Insert
		public boolean insertTeam(TeamBean  bean) {
			Connection con=null;
			PreparedStatement pstmt=null;
			boolean flag = false;
			String sql=null;
			try {
				con =pool.getConnection();
				sql="insert tblTeam(name,city,age,team) " + "values(?,?,?,?)";
				//sql="insert tblTeam(name,city,age,team) values(?,?,?,?)"; 위와 같음
				pstmt=con.prepareStatement(sql);
				//?세팅
				pstmt.setString(1,bean.getName());
				pstmt.setString(2,bean.getCity());
				pstmt.setInt(3,bean.getAge());
				pstmt.setString(4,bean.getTeam());
				int cnt=pstmt.executeUpdate();//실제 실행
				if(cnt==1)
					flag=true;
				
				/*jsp에서 TeamBean bean=new TeamBean()
				 * bean.setName("박용민");
				 * bean.setCity("제주도");
				 * bean.setAge(18);
				 * bean.setTeam("학생");*/
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con, pstmt);
			}
			return flag;
		}
		
		//Select
		
		//Get
		
		//Update
		
		//Delete
}
