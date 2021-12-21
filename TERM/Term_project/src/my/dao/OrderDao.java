package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Order;
import my.util.JdbcUtil;

public class OrderDao {
	
	public void insert(Connection conn, Order order) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement("insert into ordertable (mid, pid, odate, amount, address, pcolor, totalPrice) "
					+ "values(?,?,?,?,?,?,?)");
			pstmt.setString(1, order.getMid());
			pstmt.setInt(2, order.getPid());
			pstmt.setTimestamp(3, new Timestamp(order.getOdate().getTime()));
			pstmt.setInt(4, order.getAmount());
			pstmt.setString(5, order.getAddress());
			pstmt.setString(6, order.getOption());
			pstmt.setInt(7, order.getTotal_price());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Order selectById(Connection conn, int oid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Order order = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from order where oid = ?");
			pstmt.setInt(1, oid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				order = new Order(); 
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setOption(rs.getString(7));
				order.setTotal_price(8);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return order;
	}
	
	public List<Order> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Order order = null; 
		List<Order> orders = new ArrayList<Order>();
		try {
			pstmt = conn.prepareStatement
			("select * from order where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				order = new Order(); 
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setOdate(rs.getTimestamp(4));
				order.setAmount(rs.getInt(5));
				order.setAddress(rs.getString(6));
				order.setOption(rs.getString(7));
				order.setTotal_price(8);
				orders.add(order);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return orders;
	}
	
	public void update(Connection conn, Order order) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update order set mid=?,  pid=?, odate=?, "
					+ " amount=?, address=?, option=?, total_price=?  where oid=?");
			pstmt.setString(1, order.getMid());
			pstmt.setInt(2, order.getPid());
			pstmt.setTimestamp(3, new Timestamp(order.getOdate().getTime()));
			pstmt.setInt(4, order.getAmount());
			pstmt.setString(5, order.getAddress());
			pstmt.setString(6, order.getOption());
			pstmt.setInt(7, order.getTotal_price());
			pstmt.setInt(8, order.getOid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int oid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from order where oid = ?");
			pstmt.setInt(1, oid);
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
			rs = stmt.executeQuery("select count(*) from order");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Order> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order> orderList = null;
		try {
			pstmt = conn.prepareStatement
					("select ot.oid, ot.MID, ot.pid, p.pname, p.pimage, ot.odate, ot.amount, ot.address, ot.pcolor, ot.totalPrice from ordertable ot join product p WHERE ot.pid = p.pid ");			
			rs  = pstmt.executeQuery(); 
			orderList = new ArrayList<Order>();
			while (rs.next()){
				Order order = new Order();
				order.setOid(rs.getInt(1));
				order.setMid(rs.getString(2));
				order.setPid(rs.getInt(3));
				order.setPname(rs.getString(4));
				order.setPimage(rs.getString(5));
				order.setOdate(rs.getTimestamp(6));
				order.setAmount(rs.getInt(7));
				order.setAddress(rs.getString(8));
				order.setOption(rs.getString(9));
				order.setTotal_price(rs.getInt(10));
				orderList.add(order);
	
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return orderList;
	}
}




















