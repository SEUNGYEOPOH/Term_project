package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.PDetailimage;
import my.util.JdbcUtil;

public class PDetailimageDao {
	
	public void insert(Connection conn, PDetailimage pDetailimage) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into pDetailimage (pid,detailimage)"
					+ " values(?,?)");
			pstmt.setInt(1, pDetailimage.getPid());
			pstmt.setString(2, pDetailimage.getDetailimage());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public PDetailimage selectById(Connection conn, int iid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		PDetailimage pDetailimage = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from pDetailimage where iid = ?");
			pstmt.setInt(1, iid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				pDetailimage = new PDetailimage(); 
				pDetailimage.setIid(rs.getInt(1));
				pDetailimage.setPid(rs.getInt(2));
				pDetailimage.setDetailimage(rs.getString(3));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return pDetailimage;
	}
	
	public List<PDetailimage> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		PDetailimage pDetailimage = null; 
		List<PDetailimage> pDetailimages = new ArrayList<PDetailimage>();
		try {
			pstmt = conn.prepareStatement
			("select * from pDetailimage where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				pDetailimage = new PDetailimage(); 
				pDetailimage.setIid(rs.getInt(1));
				pDetailimage.setPid(rs.getInt(2));
				pDetailimage.setDetailimage(rs.getString(3));
				pDetailimages.add(pDetailimage);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return pDetailimages;
	}
	
	public void update(Connection conn, PDetailimage pDetailimage) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update pDetailimage set pid=?, "
					+ "  Detailimage=? where iid=?");
			pstmt.setInt(1, pDetailimage.getPid());
			pstmt.setString(2, pDetailimage.getDetailimage());
			pstmt.setInt(3, pDetailimage.getIid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int iid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from pDetailimage where iid = ?");
			pstmt.setInt(1, iid);
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
			rs = stmt.executeQuery("select count(*) from pDetailimage");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<PDetailimage> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PDetailimage> pDetailimageList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from pDetailimage ");			
			rs  = pstmt.executeQuery(); 
			pDetailimageList = new ArrayList<PDetailimage>();
			while (rs.next()){
				PDetailimage pDetailimage = new PDetailimage();
				pDetailimage.setIid(rs.getInt(1));
				pDetailimage.setPid(rs.getInt(2));
				pDetailimage.setDetailimage(rs.getString(3));
				pDetailimageList.add(pDetailimage);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return pDetailimageList;
	}
}




















