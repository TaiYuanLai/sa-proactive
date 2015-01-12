package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public int getOrderID() throws Exception {
		String sql = "SELECT IFNULL(MAX(OrderID),0)+1 AS size FROM `order`";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		int size = 0;
		if (rs.next()) {
			size = rs.getInt("size");
		}
		rs.close();
		smt.close();
		conn.close();
		return size;
	}

	public List<OrderBean> getOrderList() throws Exception {
		List<OrderBean> orderList = new ArrayList<OrderBean>();
		String sql = "SELECT * FROM `order`";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			OrderBean orderBean = new OrderBean();
			orderBean.setOrderID(rs.getInt("OrderID"));
			orderBean.setMemberAccount(rs.getString("MemberAccount"));
			orderBean.setOrderDate(rs.getString("OrderDate"));
			orderBean.setTotalPrice(rs.getInt("TotalPrice"));
			orderBean.setOrderState(rs.getInt("OrderState"));
			orderBean.setOrderAddress(rs.getString("OrderAddress"));
			orderBean.setOrderPhone(rs.getString("OrderPhone"));
			orderBean.setPayway(rs.getString("Payway"));
			orderList.add(orderBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return orderList;
	}

	public List<OrderBean> getOrderListbyMemberAccount(String memberAccount)
			throws Exception {
		List<OrderBean> orderBeanList = new ArrayList<OrderBean>();
		String sql = "SELECT * FROM `order` WHERE MemberAccount=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		while (rs.next()) {
			OrderBean orderBean = new OrderBean();
			orderBean.setOrderID(rs.getInt("OrderID"));
			orderBean.setMemberAccount(rs.getString("MemberAccount"));
			orderBean.setOrderDate(rs.getString("OrderDate"));
			orderBean.setTotalPrice(rs.getInt("TotalPrice"));
			orderBean.setOrderState(rs.getInt("OrderState"));
			orderBean.setOrderAddress(rs.getString("OrderAddress"));
			orderBean.setOrderPhone(rs.getString("OrderPhone"));
			orderBean.setPayway(rs.getString("Payway"));
			orderBeanList.add(orderBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return orderBeanList;
	}

	public void modiOrderState(OrderBean orderbean) throws Exception {
		String sql = "UPDATE `order` SET OrderState=? WHERE OrderID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderbean.getOrderState());
		smt.setInt(2, orderbean.getOrderID());
		smt.execute();
		smt.close();
		conn.close();

	}

	public OrderBean getOrder(int orderID) throws Exception {
		OrderBean orderBean = new OrderBean();
		String sql = "SELECT * FROM `order` WHERE OrderID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setInt(1, orderID);
		rs = smt.executeQuery();
		if (rs.next()) {
			orderBean.setOrderID(orderID);
			orderBean.setOrderState(rs.getInt("OrderState"));
		}
		rs.close();
		smt.close();
		conn.close();
		return orderBean;

	}

}
