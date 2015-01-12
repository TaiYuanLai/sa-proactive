package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ShoppingListBean;
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

	public List<ShoppingListCombinationBean> getShoppingListCombinationByMemberAccount(
			int orderID) throws Exception {
		String sql = "SELECT a.*, c.CombinationName, c.ComImage FROM shoppinglist_combination a JOIN `order` b ON a.OrderID = b.OrderID JOIN combination c ON a.CombinationID=c.CombinationID "
				+ "WHERE b.OrderID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderID);
		rs = smt.executeQuery();
		List<ShoppingListCombinationBean> allshoppinglistcombination = new ArrayList<ShoppingListCombinationBean>();
		while (rs.next()) {
			ShoppingListCombinationBean shoppingListcombinationBean = new ShoppingListCombinationBean();
			shoppingListcombinationBean.setCombinationID(rs.getString("CombinationID"));
			shoppingListcombinationBean.setUnitPrice(rs.getInt("UnitPrice"));
			shoppingListcombinationBean.setQuantity(rs.getInt("Quantity"));
			shoppingListcombinationBean.setCombinationName(rs.getString("CombinationName"));
			shoppingListcombinationBean.setComImage(rs.getString("ComImage"));
			allshoppinglistcombination.add(shoppingListcombinationBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allshoppinglistcombination;
	}

}