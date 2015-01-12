package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ShoppingListBean;
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
	public List<ShoppingListCustomerlizeBean> getShoppingListCustomerlizeByMemberAccount(
			int orderID) throws Exception {
		String sql = "SELECT a.* FROM shoppinglist_customerlize a JOIN `order` b ON a.OrderID = b.OrderID JOIN customized c ON a.CusID=c.CusID WHERE b.OrderID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderID);
		rs = smt.executeQuery();
		List<ShoppingListCustomerlizeBean> allshoppinglistcustomerlize = new ArrayList<ShoppingListCustomerlizeBean>();
		while (rs.next()) {
			ShoppingListCustomerlizeBean shoppingListcustomerlizeBean = new ShoppingListCustomerlizeBean();
			shoppingListcustomerlizeBean.setCusID(rs.getInt("cusID"));
			shoppingListcustomerlizeBean.setUnitPrice(rs.getInt("UnitPrice"));
			shoppingListcustomerlizeBean.setQuantity(rs.getInt("Quantity"));
			allshoppinglistcustomerlize.add(shoppingListcustomerlizeBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allshoppinglistcustomerlize;
	}
}
