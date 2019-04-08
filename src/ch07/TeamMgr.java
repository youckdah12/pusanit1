package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;

/*
 * DB�� ���õ� ����� �޼ҵ带 ������ Ŭ����
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
				//sql="insert tblTeam(name,city,age,team) values(?,?,?,?)"; ���� ����
				pstmt=con.prepareStatement(sql);
				//?����
				pstmt.setString(1,bean.getName());
				pstmt.setString(2,bean.getCity());
				pstmt.setInt(3,bean.getAge());
				pstmt.setString(4,bean.getTeam());
				int cnt=pstmt.executeUpdate();//���� ����
				if(cnt==1)
					flag=true;
				
				/*jsp���� TeamBean bean=new TeamBean()
				 * bean.setName("�ڿ��");
				 * bean.setCity("���ֵ�");
				 * bean.setAge(18);
				 * bean.setTeam("�л�");*/
				
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
