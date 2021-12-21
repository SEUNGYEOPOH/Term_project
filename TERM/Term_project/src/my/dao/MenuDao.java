package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Menu;
import my.util.JdbcUtil;

public class MenuDao {
	
	public void insert(Connection conn, Menu menu) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into menu (pmenuseq,menuname)"
					+ " values(?,?)");
			pstmt.setInt(1, menu.getPmenuseq());
			pstmt.setString(2, menu.getMenuname());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Menu selectById(Connection conn, int menuseq) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Menu menu = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from menu where menuseq = ?");
			pstmt.setInt(1, menuseq);
			rs = pstmt.executeQuery();
			if (rs.next()){
				menu = new Menu(); 
				menu.setMenuseq(rs.getInt(1));
				menu.setPmenuseq(rs.getInt(2));
				menu.setMenuname(rs.getString(3));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return menu;
	}
	
	public List<Menu> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Menu menu = null; 
		List<Menu> menus = new ArrayList<Menu>();
		try {
			pstmt = conn.prepareStatement
			("select * from menu where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				menu = new Menu(); 
				menu.setMenuseq(rs.getInt(1));
				menu.setPmenuseq(rs.getInt(2));
				menu.setMenuname(rs.getString(3));
				menus.add(menu);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return menus;
	}
	
	public void update(Connection conn, Menu menu) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update menu set pmenuseq=?, "
					+ "  menuname=? where menuseq=?");
			pstmt.setInt(1, menu.getPmenuseq());
			pstmt.setString(2, menu.getMenuname());
			pstmt.setInt(3, menu.getMenuseq());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int menuseq) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from menu where menuseq = ?");
			pstmt.setInt(1, menuseq);
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
			rs = stmt.executeQuery("select count(*) from menu");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Menu> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Menu> menuList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from menu ");			
			rs  = pstmt.executeQuery(); 
			menuList = new ArrayList<Menu>();
			while (rs.next()){
				Menu menu = new Menu();
				menu.setMenuseq(rs.getInt(1));
				menu.setPmenuseq(rs.getInt(2));
				menu.setMenuname(rs.getString(3));
				menuList.add(menu);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return menuList;
	}
}




















