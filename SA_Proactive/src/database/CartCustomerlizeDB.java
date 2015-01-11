package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shared.JDBCUtil;
import bean.CartCustomerlizeBean;

public class CartCustomerlizeDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public void addCartCustomerlize(CartCustomerlizeBean cartCustomerlizeBean)throws Exception{
		String sql = "INSERT INTO cart_customerlize (CusID,MemberAccount,Quantity) "
				+ "VALUES (?,?,1)";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setInt(1,cartCustomerlizeBean.getCusID());
		smt.setString(2,cartCustomerlizeBean.getMemberAccount());
		smt.execute();
		smt.close();
		conn.close();	
}
	public List<CartCustomerlizeBean> getCartCustomerlizeList() throws Exception {
		List<CartCustomerlizeBean> cartCustomerlizeList = new ArrayList<CartCustomerlizeBean>();
		String sql = "SELECT * FROM cart_customerlize";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			CartCustomerlizeBean cartCustomerlizeBean = new CartCustomerlizeBean();
			cartCustomerlizeBean.setCusID(rs.getInt("CusID"));
			cartCustomerlizeBean.setMemberAccount(rs.getString("MemberAccount"));
			cartCustomerlizeBean.setQuantity(rs.getInt("Quantity"));
			cartCustomerlizeList.add(cartCustomerlizeBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return cartCustomerlizeList;
	}
	
	public List<CartCustomerlizeBean> getCartCustomerlizeListbyMemberAccount(String memberAccount) throws Exception {
		List<CartCustomerlizeBean> cartCustomerlizeBeanList = new ArrayList<CartCustomerlizeBean>();
		String sql = "SELECT a.*,b.TotalPrice FROM cart_customerlize a JOIN customized b ON a.CusID=b.CusID WHERE a.MemberAccount=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		while (rs.next()) {
			CartCustomerlizeBean cartCustomerlizeBean = new CartCustomerlizeBean();
			cartCustomerlizeBean.setCusID(rs.getInt("CusID"));
			cartCustomerlizeBean.setQuantity(rs.getInt("Quantity"));
			cartCustomerlizeBean.setUnitPrice(rs.getInt("TotalPrice"));
			cartCustomerlizeBeanList.add(cartCustomerlizeBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return cartCustomerlizeBeanList;
	}
	
	public void modiQuantityCustomized(CartCustomerlizeBean cartCustomerlizeBean) throws Exception {
		String sql = "UPDATE cart_customerlize SET Quantity =? WHERE MemberAccount = ? AND CusID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, cartCustomerlizeBean.getQuantity());
		smt.setString(2, cartCustomerlizeBean.getMemberAccount());
		smt.setInt(3, cartCustomerlizeBean.getCusID());
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public void delCartCustomerlize(String memberAccount, int cusID) throws Exception{
		String sql = "DELETE FROM cart_customerlize WHERE MemberAccount=? AND CusID=?";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,memberAccount);
		smt.setInt(2,cusID);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public void delAllCartCustomerlizebyMemberAccount(String memberAccount)
			throws Exception {
		String sql = "DELETE FROM cart_customerlize WHERE MemberAccount=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	

}
