package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;

import bean.ShoppingListBean;
import shared.JDBCUtil;

public class ShoppingListDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public void addShoppingList(ShoppingListBean shoppingListBean)
			throws Exception {
		String sql = "INSERT INTO shoppinglist (OrderID,ProductID,UnitPrice,Quantity) "
				+ "VALUES (?,?,?,?)";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, shoppingListBean.getOrderID());
		smt.setString(2, shoppingListBean.getProductID());
		smt.setInt(3, shoppingListBean.getUnitPrice());
		smt.setInt(4, shoppingListBean.getQuantity());
		smt.execute();
		smt.close();
		conn.close();
	}

	public List<ShoppingListBean> getShoppingListByMemberAccount(
			int orderID) throws Exception {
		String sql = "SELECT a.*, c.ProductName, c.Image FROM shoppinglist a JOIN `order` b ON a.OrderID = b.OrderID JOIN product c ON a.ProductID=c.ProductID "
				+ "WHERE b.OrderID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderID);
		rs = smt.executeQuery();
		List<ShoppingListBean> allshoppinglist = new ArrayList<ShoppingListBean>();
		while (rs.next()) {
			ShoppingListBean shoppingListBean = new ShoppingListBean();
			shoppingListBean.setProductID(rs.getString("ProductID"));
			shoppingListBean.setUnitPrice(rs.getInt("UnitPrice"));
			shoppingListBean.setQuantity(rs.getInt("Quantity"));
			shoppingListBean.setProductName(rs.getString("ProductName"));
			shoppingListBean.setImage(rs.getString("Image"));
			allshoppinglist.add(shoppingListBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allshoppinglist;
	}

	// public int getOrderID() throws Exception{
	// String sql = "SELECT IFNULL(MAX(OrderID),0)+1 AS size FROM shoppinglist";
	// conn = db.makeConnection();
	// smt = conn.prepareStatement(sql);
	// rs = smt.executeQuery();
	// int size = 0;
	// if(rs.next()) {
	// size = rs.getInt("size");
	// }
	// rs.close();
	// smt.close();
	// conn.close();
	// return size;
	// }

}
