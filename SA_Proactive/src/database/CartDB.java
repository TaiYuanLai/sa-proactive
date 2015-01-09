package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CartBean;
import shared.JDBCUtil;

public class CartDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public void addCart(CartBean cartBean) throws Exception {
		String sql = "INSERT INTO cart (MemberAccount,ProductID,Quantity) VALUES (?,?,1)";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, cartBean.getMemberAccount());
		smt.setString(2, cartBean.getProductID());

		smt.execute();
		smt.close();
		conn.close();
	}

	public List<CartBean> getCartList() throws Exception {
		List<CartBean> cartList = new ArrayList<CartBean>();
		String sql = "SELECT * FROM cart";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			CartBean cartBean = new CartBean();
			cartBean.setProductID(rs.getString("ProductID"));
			cartBean.setMemberAccount(rs.getString("MemberAccount"));
			cartBean.setQuantity(rs.getInt("Quantity"));
			cartList.add(cartBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return cartList;
	}

	public void delCart(String memberAccount, String productID)
			throws Exception {
		String sql = "DELETE FROM cart WHERE MemberAccount=? AND ProductID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		smt.setString(2, productID);
		smt.execute();
		smt.close();
		conn.close();
	}

	public void modiQuantityProduct(CartBean cartBean) throws Exception {
		String sql = "UPDATE cart SET Quantity =? WHERE MemberAccount = ? AND ProductID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, cartBean.getQuantity());
		smt.setString(2, cartBean.getMemberAccount());
		smt.setString(3, cartBean.getProductID());
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public List<CartBean> getCartListbyMemberAccount(String memberAccount) throws Exception {
		List<CartBean> cartBeanList = new ArrayList<CartBean>();
		String sql = "SELECT a.*,b.UnitPrice FROM cart a JOIN product b ON a.ProductID=b.ProductID WHERE MemberAccount=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		while (rs.next()) {
			CartBean cartBean = new CartBean();
			cartBean.setProductID(rs.getString("ProductID"));
			cartBean.setQuantity(rs.getInt("Quantity"));
			cartBean.setUnitPrice(rs.getInt("UnitPrice"));
			cartBeanList.add(cartBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return cartBeanList;
	}

}