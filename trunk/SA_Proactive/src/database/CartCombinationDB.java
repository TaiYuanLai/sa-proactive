package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CartBean;
import bean.CartCombinationBean;
import bean.CombinationBean;
import shared.JDBCUtil;

public class CartCombinationDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public void addCartCombination(CartCombinationBean cartCombinationBean)throws Exception{
		String sql = "INSERT INTO cart_combination (CombinationID,MemberAccount,Quantity) "
				+ "VALUES (?,?,1)";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,cartCombinationBean.getCombinationID());
		smt.setString(2,cartCombinationBean.getMemberAccount());
		smt.execute();
		smt.close();
		conn.close();	
	}
	
	public List<CartCombinationBean> getCartCombinationList() throws Exception {
		List<CartCombinationBean> cartCombinationList = new ArrayList<CartCombinationBean>();
		String sql = "SELECT * FROM cart_combination";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			CartCombinationBean cartCombinationBean = new CartCombinationBean();
			cartCombinationBean.setCombinationID(rs.getString("CombinationID"));
			cartCombinationBean.setMemberAccount(rs.getString("MemberAccount"));
			cartCombinationBean.setQuantity(rs.getInt("Quantity"));
			cartCombinationList.add(cartCombinationBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return cartCombinationList;
	}
	
	public void delCartCombination(String memberAccount, String combinationID) throws Exception{
		String sql = "DELETE FROM cart_combination WHERE MemberAccount=? AND CombinationID=?";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,memberAccount);
		smt.setString(2,combinationID);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public void modiQuantityCombination(CartCombinationBean cartCombinationBean) throws Exception {
		String sql = "UPDATE cart_combination SET Quantity =? WHERE MemberAccount = ? AND CombinationID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, cartCombinationBean.getQuantity());
		smt.setString(2, cartCombinationBean.getMemberAccount());
		smt.setString(3, cartCombinationBean.getCombinationID());
		smt.execute();
		smt.close();
		conn.close();
	}

	
	

}
