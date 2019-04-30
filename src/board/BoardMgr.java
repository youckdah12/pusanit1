package board;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import guestbook.GuestBookBean;

public class BoardMgr {
	
		private DBConnectionMgr pool;
		public static final String SAVEFOLDER = "C:/Jsp/eclipse-workspace/myapp/WebContent/board/fileupload/";
		public static final String ENCTYPE="EUC-KR";
		public static int MAXSIZE=10*1024*1024;
		
		public BoardMgr() {
			pool=DBConnectionMgr.getInstance();
		}
		//Board Insert:파일업로드 ,contenttype,ref산대적인 위치값
		public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		String sql = null;
		try {//파일 업로드 ////////
			File dir =new File(SAVEFOLDER);
			if(!dir.exists()) {
				dir.mkdirs();//폴드가 없다면 새로만들어라.
			}
			MultipartRequest multi= new MultipartRequest(req, SAVEFOLDER,MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy());
			String filename=null;
			int filesize=0;
			if(multi.getFilesystemName("filename")!=null) {
				filename=multi.getFilesystemName("filename");
				filesize=(int)multi.getFile("filename").length();
			}
			//////////////////
			//게시물 내용(contentType:TEXT,HTML)
			String content =multi.getParameter("content");
			if(multi.getParameter("contentType").equals("TEXT")) {
				content=UtilMgr.replace(content,"<","&lt;");
			}
			////////////////////////////////////
			con = pool.getConnection();
			sql = "select  max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();	
			int ref=1;
			if(rs.next())
					ref=rs.getInt(1)+1;//현재 저장된 num의 1증가해서 ref으로 리턴
			//////////////////////////////////////////////
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,multi.getParameter("name"));
			pstmt.setString(2,content);
			pstmt.setString(3,multi.getParameter("subject"));
			pstmt.setInt(4,ref);
			pstmt.setString(5,multi.getParameter("pass"));
			pstmt.setString(6,multi.getParameter("ip"));
			pstmt.setString(7,filename);
			pstmt.setInt(8,filesize);
		
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt,rs);
		}
		return;
		}
		
		//Board Total Count(총 게시물 갯수)
		public int getTotalCount(String keyField,String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount =0;
			try {
				con = pool.getConnection();
				if(keyWord.equals("null")||keyWord.equals("")) {
					//검색 아닌경우
					sql = "select count(*) from tblBoard";
					pstmt = con.prepareStatement(sql);
				}else {
					//검색인 경우 
					sql = "SELECT COUNT(*) FROM tblboard WHERE " + keyField + " like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,"%" + keyWord + "%");
					}
					
					rs = pstmt.executeQuery();
					if(rs.next())
					{
						totalCount = rs.getInt(1);
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
		//Board List
		public Vector<BoardBean> getBoardList(String keyField,String keyWord,int start,int end){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<BoardBean> vlist=new Vector<>();
			try {
				con = pool.getConnection();
				if(keyWord.equals("null")||keyWord.equals("")) {
					//1차로 ref 내림차순 ,2차로 pos 오름차순
					sql = "select * from tblBoard order by ref desc, pos limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);
				}else {
					sql = "select * from tblBoard where " + keyField + " like ? order by ref desc, pos limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyWord+"%");
					pstmt.setInt(2, start);
					pstmt.setInt(3, end);
				}
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardBean bean=new BoardBean();
					bean.setNum(rs.getInt("num"));
					bean.setName(rs.getString("name"));
					bean.setSubject(rs.getString("subject"));
					bean.setPos(rs.getInt("pos"));
					bean.setRef(rs.getInt("ref"));
					bean.setDepth(rs.getInt("depth"));
					//regdate DB에서 DATE타입이지만 모든타입은 getString가능
					bean.setRegdate(rs.getString("regdate"));
					bean.setCount(rs.getInt("count"));
					bean.setFilename(rs.getString("filename"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		//Board Get
		
		//Count Up(조회수 증가)
		
		//Board Delete
		
		//Board Update
		
		//Board Reply(답변)
		
		//Board Reply Up(답변 위치값 증가)
		
		//Board Download
		
		//Post 1000
		public void post1000(){
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
				sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < 1000; i++) {
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		//Main
		public static void main(String[] args) {
			BoardMgr mgr=new BoardMgr();
			mgr.post1000();
			System.out.println("성공~~");
		}
}
