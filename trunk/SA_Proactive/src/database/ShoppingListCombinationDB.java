package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.ShoppingListCombinationBean;
import shared.JDBCUtil;

public class ShoppingListCombinationDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;
	
	public void addShoppingListCombination(ShoppingListCombinationBean shoppingListCombinationBean) throws Exception {
		String sql = "INSERT INTO shoppinglist_combination (OrderID,CombinationID,UnitPrice,Quantity) "
				+ "VALUES (?,?,?,?)";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, shoppingListCombinationBean.getOrderID());
		smt.setString(2, shoppingListCombinationBean.getCombinationID());
		smt.setInt(3, shoppingListCombinationBean.getUnitPrice());
		smt.setInt(4, shoppingListCombinationBean.getQuantity());
		smt.execute();
		smt.close();
		conn.close();
	}



}