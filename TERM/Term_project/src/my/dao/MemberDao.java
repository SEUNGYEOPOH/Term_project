package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Member;
import my.util.JdbcUtil;

public class MemberDao {
	
	public void insert(Connection conn, Member member) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into member (mid, password, mname, mtel, email, sns_yn, email_yn, reg_dt)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMtel());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getSns_yn());
			pstmt.setString(7, member.getEmail_yn());
			pstmt.setTimestamp(8, 
					new Timestamp(member.getReg_dt().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public boolean checkPassword(Connection conn, String mid, String password) throws SQLException {
	      Member member = selectById(conn,mid);
	      if (member == null ) {
	    	  return false;
	      } else if (member.getPassword().equals(password)) {
	         return true;
	      } else
	         return false;
	   }
	
	public Member selectById(Connection conn, String mid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Member member = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from member where mid = ?");
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				member = new Member(); 
				member.setMid(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setMname(rs.getString(3));
				member.setMtel(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setSns_yn(rs.getString(6));
				member.setEmail_yn(rs.getString(7));
				member.setReg_dt(rs.getTimestamp(8));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return member;
	}
	
	public List<Member> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Member member = null; 
		List<Member> members = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement
			("select * from member where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				member = new Member(); 
				member.setMid(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setMname(rs.getString(3));
				member.setMtel(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setSns_yn(rs.getString(6));
				member.setEmail_yn(rs.getString(7));
				member.setReg_dt(rs.getTimestamp(8));
				members.add(member);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return members;
	}
	
	public void update(Connection conn, Member member) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update member set password=?, mname=?, mtel=?, "
					+ " email=?, sns_yn=?, email_yn=?, reg_dt=?  where mid=?");
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getMtel());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getSns_yn());
			pstmt.setString(6, member.getEmail_yn());
			pstmt.setTimestamp(7, new Timestamp(member.getReg_dt().getTime()));
			pstmt.setString(8, member.getMid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, String mid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from member where mid = ?");
			pstmt.setString(1, mid);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from member");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Member> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> memberList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from member ");			
			rs  = pstmt.executeQuery(); 
			memberList = new ArrayList<Member>();
			while (rs.next()){
				Member member = new Member();
				member.setMid(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setMname(rs.getString(3));
				member.setMtel(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setSns_yn(rs.getString(6));
				member.setEmail_yn(rs.getString(7));
				member.setReg_dt(rs.getTimestamp(8));
				memberList.add(member);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return memberList;
	}
}




















