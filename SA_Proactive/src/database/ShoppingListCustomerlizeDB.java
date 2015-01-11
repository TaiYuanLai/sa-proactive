package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.ShoppingListCustomerlizeBean;
import shared.JDBCUtil;

public class ShoppingListCustomerlizeDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;
	
	public void addShoppingListCustomerlize(ShoppingListCustomerlizeBean shoppingListCustomerlizeBean) throws Exception {
		String sql = "INSERT INTO shoppinglist_customerlize (OrderID,CusID,UnitPrice,Quantity) "
				+ "VALUES (?,?,?,?)";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, shoppingListCustomerlizeBean.getOrderID());
		smt.setInt(2, shoppingListCustomerlizeBean.getCusID());
		smt.setInt(3, shoppingListCustomerlizeBean.getUnitPrice());
		smt.setInt(4, shoppingListCustomerlizeBean.getQuantity());
		smt.execute();
		smt.close();
		conn.close();
	}

}
