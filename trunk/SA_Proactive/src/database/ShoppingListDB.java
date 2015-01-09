package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;




import bean.ShoppingListBean;
import shared.JDBCUtil;

public class ShoppingListDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;
	
	public void addShoppingList(ShoppingListBean shoppingListBean) throws Exception {
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
	
//	public int getOrderID() throws Exception{
//		String sql = "SELECT IFNULL(MAX(OrderID),0)+1 AS size FROM shoppinglist";
//		conn = db.makeConnection();
//		smt = conn.prepareStatement(sql);
//		rs = smt.executeQuery();
//		int size = 0;
//		if(rs.next()) {
//			size = rs.getInt("size");
//		}
//		rs.close();
//		smt.close();
//		conn.close();
//		return size;
//	}

}
