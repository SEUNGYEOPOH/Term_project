package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.Product;
import my.model.ProductListView;
import my.service.ServiceException;
import my.util.JdbcUtil;

public class ProductDao {
	
	public void insert(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into product (pname, pcolor, price, pimage, pdate, menu,menu_detail)"
					+ " values(?,?,?,?,?,?,?)");
			pstmt.setString(1, product.getPname());
			pstmt.setString(2, product.getPcolor());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, product.getPimage());
			pstmt.setTimestamp(5, 
					new Timestamp(product.getPdate().getTime()));
			pstmt.setString(6, product.getMenu());
			pstmt.setString(7, product.getMenu_detail());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Product selectById(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from product where pid = ?");
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			if (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPcolor(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setPimage(rs.getString(5));
				product.setPdate(rs.getTimestamp(6));
				product.setMenu(rs.getString(7));
				product.setMenu_detail(rs.getString(8));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return product;
	}
	
	public List<Product> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		List<Product> products = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement
			("select * from product where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				product = new Product(); 
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPcolor(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setPimage(rs.getString(5));
				product.setPdate(rs.getTimestamp(6));
				product.setMenu(rs.getString(7));
				product.setMenu_detail(rs.getString(8));
				products.add(product);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return products;
	}
	
	public void update(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update product set pname=?,  pcolor=?, price=?, "
					+ " pimage=?, pdate=?, menu=?, menu_detail=?  where pid=?");
			pstmt.setString(1, product.getPname());
			pstmt.setString(2, product.getPcolor());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, product.getPimage());
			pstmt.setTimestamp(5, new Timestamp(product.getPdate().getTime()));
			pstmt.setString(6, product.getMenu());
			pstmt.setString(7, product.getMenu_detail());
			pstmt.setInt(8, product.getPid());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int pid) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from product where pid = ?");
			pstmt.setInt(1, pid);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn, String menu, String detail_menu, String keyword, String target) throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null; 
		try {
			if (detail_menu==null && menu==null) {
				pstmt = conn.prepareStatement("select  count(*)  from product");
			}
			else if (detail_menu==null && keyword==null || detail_menu.equals("null")) {
				pstmt = conn.prepareStatement("select  count(*)  from product where menu = ? ");
				pstmt.setString(1, menu);
				
			}
			else if (detail_menu==null && keyword!=null || detail_menu.equals("null")) {
				pstmt = conn.prepareStatement("select  count(*)  from product where menu = ? and "+target+" like ? ");
				pstmt.setString(1, menu);
				pstmt.setString(2, "%"+keyword+"%");
				
			}
			else if (detail_menu!=null && keyword==null) {
				pstmt = conn.prepareStatement("select  count(*)  from product where menu = ? and menu_detail = ? ");
				pstmt.setString(1, menu);
				pstmt.setString(2, detail_menu);
				
			}
			else if (detail_menu!=null && keyword!=null) {
				pstmt = conn.prepareStatement("select  count(*)  from product where menu = ? and menu_detail = ? and " +target+" like ? ");
				pstmt.setString(1, menu);
				pstmt.setString(2, detail_menu);
				pstmt.setString(3, "%"+keyword+"%");
				
			}
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	public List<Product> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product ");			
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPcolor(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setPimage(rs.getString(5));
				product.setPdate(rs.getTimestamp(6));
				product.setMenu(rs.getString(7));
				product.setMenu_detail(rs.getString(8));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	private static final int PRODUCT_COUNT_PER_PAGE = 9;

	public ProductListView getProductList(int pageNumber, Connection conn, String menu, String detail_menu, String keyword, String target)
			throws SQLException {

		int currentPageNumber = pageNumber;
		try {
			int productTotalCount = selectCount(conn, menu, detail_menu, keyword, target);

			List<Product> productList = null;
			int firstRow = 0;
			int endRow = 0;
			if (productTotalCount > 0) {
				firstRow = (pageNumber - 1) * PRODUCT_COUNT_PER_PAGE;
				endRow = PRODUCT_COUNT_PER_PAGE;
				productList =selectLimit(conn, firstRow, endRow, menu, detail_menu, keyword, target);
			} else {
				currentPageNumber = 0;
				productList = Collections.emptyList();
			}
			return new ProductListView(productList,
					productTotalCount, currentPageNumber,
					PRODUCT_COUNT_PER_PAGE);
		} catch (SQLException e) {
			throw new ServiceException("상품 목록 구하기 실패: "
					+ e.getMessage(), e);
		} finally {
			//JdbcUtil.close(conn);
		}
	}




public List<Product> selectLimit(Connection conn, int firstRow,  int endRow, String menu, String detail_menu, String keyword, String target) 
		throws SQLException {
	PreparedStatement pstmt=null; 
	ResultSet rs = null;
	Product product = null; 
	List<Product> list = null;
	try {
		 if (detail_menu==null && menu==null) {
				pstmt = conn.prepareStatement("select  *  from product LIMIT ?, ?");
				pstmt.setInt(1, firstRow);
				pstmt.setInt(2, endRow);
		}	
		else if (detail_menu==null && keyword==null || detail_menu.equals("null")) {
			pstmt = conn.prepareStatement("select  *  from product where menu = ? LIMIT ?, ?");
			pstmt.setString(1, menu);
			pstmt.setInt(2, firstRow);
			pstmt.setInt(3, endRow);
		}
		else if (detail_menu==null && keyword!=null || detail_menu.equals("null")) {
			pstmt = conn.prepareStatement("select  *  from product where menu = ? and "+target+" like ? LIMIT ?, ?");
			pstmt.setString(1, menu);
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setInt(3, firstRow);
			pstmt.setInt(4, endRow);
		}
		else if (detail_menu!=null && keyword==null) {
			pstmt = conn.prepareStatement("select  *  from product where menu = ? and menu_detail = ? LIMIT ?, ?");
			pstmt.setString(1, menu);
			pstmt.setString(2, detail_menu);
			pstmt.setInt(3, firstRow);
			pstmt.setInt(4, endRow);
		}
		else if (detail_menu!=null && keyword!=null) {
			pstmt = conn.prepareStatement("select  *  from product where menu = ? and menu_detail = ? and " +target+" like ? LIMIT ?, ?");
			pstmt.setString(1, menu);
			pstmt.setString(2, detail_menu);
			pstmt.setString(3, "%"+keyword+"%");
			pstmt.setInt(4, firstRow);
			pstmt.setInt(5, endRow);
		}
		
		rs = pstmt.executeQuery();
		list = new ArrayList<Product>();
		while (rs.next()){
			product = new Product(); 
			product.setPid(rs.getInt(1));
			product.setPname(rs.getString(2));
			product.setPcolor(rs.getString(3));
			product.setPrice(rs.getInt(4));
			product.setPimage(rs.getString(5));
			product.setPdate(rs.getTimestamp(6));
			product.setMenu(rs.getString(7));
			product.setMenu_detail(rs.getString(8));
			list.add(product);
		}
	} catch (SQLException e){
		e.printStackTrace();
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);
	}
	return list;
	}
	
public List<Product> selectListDetail(Connection conn, String menu, String menuDetail) 
	      throws SQLException {
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   List<Product> productList = null;
	   try {
	      if(menuDetail == null) {
	         pstmt = conn.prepareStatement
	               ("select * from product where menu=?");   
	         pstmt.setString(1, menu);
	      } else {
	         pstmt = conn.prepareStatement
	               ("select* from product where menu=? and menu_detail=?");
	         pstmt.setString(1, menu);
	         pstmt.setString(2, menuDetail);
	      }
	      rs  = pstmt.executeQuery(); 
	      productList = new ArrayList<Product>();
	      while (rs.next()){
	         Product product = new Product();
	         product.setPid(rs.getInt(1));
	         product.setPname(rs.getString(2));
	         product.setPcolor(rs.getString(3));
	         product.setPrice(rs.getInt(4));
	         product.setPimage(rs.getString(5));
	         product.setPdate(rs.getTimestamp(6));
	         product.setMenu(rs.getString(7));
	         product.setMenu_detail(rs.getString(8));
	         productList.add(product);
	      }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         JdbcUtil.close(conn);
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	      }
	      return productList;
	   }

public List<Product> listByPdate(Connection conn) 
        throws SQLException {
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     List<Product> productList = null;
     try {
        pstmt = conn.prepareStatement
              ("select * from product order by pdate desc");         
        rs  = pstmt.executeQuery(); 
        productList = new ArrayList<Product>();
        while (rs.next()){
           Product product = new Product();
           product.setPid(rs.getInt(1));
	         product.setPname(rs.getString(2));
	         product.setPcolor(rs.getString(3));
	         product.setPrice(rs.getInt(4));
	         product.setPimage(rs.getString(5));
	         product.setPdate(rs.getTimestamp(6));
	         product.setMenu(rs.getString(7));
	         product.setMenu_detail(rs.getString(8));
           productList.add(product);
        }
     } finally {
        JdbcUtil.close(conn);
        JdbcUtil.close(rs);
        JdbcUtil.close(pstmt);
     }
     return productList;
  }
  
	
}




















