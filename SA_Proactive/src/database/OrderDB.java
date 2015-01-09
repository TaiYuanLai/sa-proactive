package database;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import shared.JDBCUtil;
import bean.OrderBean;

public class OrderDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public void addOrder(OrderBean orderBean) throws Exception {
		String sql = "INSERT INTO `order`(OrderID,MemberAccount,OrderDate,TotalPrice,OrderState,OrderAddress,OrderPhone,Payway) "
				+ "VALUES(?,?,NOW(),?,0,?,?,?)";

		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderBean.getOrderID());
		smt.setString(2, orderBean.getMemberAccount());
		smt.setInt(3, orderBean.getTotalPrice());
		smt.setString(4, orderBean.getOrderAddress());
		smt.setString(5, orderBean.getOrderPhone());
		smt.setString(6, orderBean.getPayway());
		smt.execute();
		smt.close();
		conn.close();
	}
	
	
	public int getOrderID() throws Exception{
		String sql = "SELECT IFNULL(MAX(OrderID),0)+1 AS size FROM `order`";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		int size = 0;
		if(rs.next()) {
			size = rs.getInt("size");
		}
		rs.close();
		smt.close();
		conn.close();
		return size;
	}

}
