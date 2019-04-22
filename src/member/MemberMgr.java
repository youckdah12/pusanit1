package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	//ID�ߺ�Ȯ��
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();//sql�� ����
			flag=rs.next();//true�̸� �ߺ�,false�ߺ��ƴ�.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//�����ȣ�˻�
	public Vector<ZipcodeBean>zipcodeRead(String area3) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ZipcodeBean> vlist=new Vector<ZipcodeBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblzipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+area3+"%"); //'%�������%'
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeBean bean =new ZipcodeBean();
				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;

	}
	//ȸ������
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql="insert tblMember(id,pwd,name,gender,birthday,email,zipcode,address,hobby,job)"+"values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2,bean.getPwd());
			pstmt.setString(3,bean.getName());
			pstmt.setString(4,bean.getGender());
			pstmt.setString(5,bean.getBirthday());
			pstmt.setString(6,bean.getEmail());
			pstmt.setString(7,bean.getZipcode());
			pstmt.setString(8,bean.getAddress());
			
			////////////////////////////////
			//{"���ͳ�","����","��ȭ"}
			String hobby[] =bean.getHobby();
			char hb[]= {'0','0','0','0','0'};
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			for(int i=0;i<hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hb[j]='1';
						break;
					}//--if
				}//--for2
			}//--for1
			//new String(char value[])
			pstmt.setString(9,new String(hb));
			///////////////////////////////////
			
			pstmt.setString(10,bean.getJob());
			if(pstmt.executeUpdate()==1)
					flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//�α���
	public boolean loginMember(String id,String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			flag=rs.next();//���ǿ� �´�id�� �ִٸ� true
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	//ȸ������ ��������
	public MemberBean getMember(String id) {
	//hobby=>10101=>�迭�� ����	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	MemberBean bean=new MemberBean();
	try {
		con = pool.getConnection();
		sql = "select * from tblMember where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bean.setId(rs.getString("id"));
			bean.setPwd(rs.getString("pwd"));
			bean.setName(rs.getString("name"));
			bean.setGender(rs.getString("gender"));
			bean.setBirthday(rs.getString("birthday"));
			bean.setEmail(rs.getString("email"));
			bean.setZipcode(rs.getString("zipcode"));
			bean.setAddress(rs.getString("address"));
			//hobby=>10101=>�迭�� ����	{"1","0","1","0","1"}
			//table����hobby�� ������
			String hobby =rs.getString("hobby");
			//��� ������ �迭�� ����->
			String hobbys[] =new String[5];
			for (int i = 0; i < hobbys.length; i++) {
				//hobby[0]=
				hobbys[i]=hobby.substring(i,i+1);
			}
			bean.setHobby(hobbys);
			bean.setJob(rs.getString("job"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		pool.freeConnection(con, pstmt, rs);
	}
	return bean;

	}
		
	
	
	//ȸ����������
	public boolean updateMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql="update tblMember set pwd=?,name=?,gender=?,birthday=?,email=?,zipcode=?,address=?,hobby=?,job=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getPwd());
			pstmt.setString(2,bean.getName());
			pstmt.setString(3,bean.getGender());
			pstmt.setString(4,bean.getBirthday());
			pstmt.setString(5,bean.getEmail());
			pstmt.setString(6,bean.getZipcode());
			pstmt.setString(7,bean.getAddress());
			String hobby[] =bean.getHobby();
			char hb[]= {'0','0','0','0','0'};
			String lists[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
			for(int i=0;i<hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if(hobby[i].equals(lists[j])) {
						hb[j]='1';
						break;
					}//--if
				}//--for2
			}//--for1
			//new String(char value[])
			pstmt.setString(8,new String(hb));
			pstmt.setString(9,bean.getJob());
			pstmt.setString(10,bean.getId());
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
