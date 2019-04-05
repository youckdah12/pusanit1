package ch07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection {

	private String driver="org.gjt.mm.mysql.Driver";
	private String url="jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR";
	private String user="root";
	private String pwd="1234";
	Connection con;

	public  MySQLConnection() {
		try {
			//DB접속 공식
			Class.forName(driver);
			con= DriverManager.getConnection(url,user,pwd);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public void listTeam() {
		try {
			String sql="select * from tblTeam";
			PreparedStatement pstmt=con.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			System.out.println("번호\t성 명\t사는곳\t나이\t팀 명");
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
		}
	}

	public void insertTeam(String name,String city,int age,String team) {
		try {
			//String sql="insert  tblTeam(name,city,age,team)"+"values(?,?,?,?)";
			String sql="insert  tblTeam set name=?,city=?,age=?,team=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, city);
			pstmt.setInt(3, age);
			pstmt.setString(4, team);
			int cnt=pstmt.executeUpdate();//insert,update 
			if(cnt==1)
				System.out.println("입력성공");
			else
				System.out.println("입력실패");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateTeam(String name,int num) {
		try {
			//String sql="update tblTeam (set name,where num)"+"values(?,?)";
			String sql="update tblTeam set name=? where num=?";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}		
	}
	
	public void deleteTeam(int num) {
		try {
			//String sql="delete from tblTeam where num=?";
			String sql="delete from tblTeam where num"+"value(?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	

	public static void main(String[] args) {
		MySQLConnection mcon=
				new MySQLConnection();
		//mcon.insertTeam("유창모", "인천", 33, "MC");
		mcon.updateTeam("강호동",1);
		//mcon.deleteTeam(2);
		mcon.listTeam();

	}
}
