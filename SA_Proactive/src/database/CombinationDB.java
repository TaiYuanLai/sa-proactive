package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CombinationBean;
import shared.JDBCUtil;

public class CombinationDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public List<CombinationBean> getCombinationList() throws Exception {
		List<CombinationBean> combinationList = new ArrayList<CombinationBean>();
		String sql = "SELECT * FROM combination";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			CombinationBean combinationBean = new CombinationBean();
			combinationBean.setCombinationID(rs.getString("CombinationID"));
			combinationBean.setCombinationName(rs.getString("CombinationName"));
			combinationBean.setCombinationDescription(rs.getString("CombinationDescription"));
			combinationBean.setTotalPrice(rs.getInt("TotalPrice"));
			combinationBean.setComImage(rs.getString("ComImage"));
			combinationList.add(combinationBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return combinationList;
	}

	public CombinationBean getCombination(String combinationID)
			throws Exception {
		CombinationBean combinationBean = new CombinationBean();
		String sql = "SELECT * FROM combination WHERE CombinationID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, combinationID);
		rs = smt.executeQuery();
		if (rs.next()) {
			combinationBean.setCombinationID(combinationID);
			combinationBean.setCombinationName(rs.getString("CombinationName"));
			combinationBean.setCombinationDescription(rs.getString("CombinationDescription"));
			combinationBean.setTotalPrice(rs.getInt("TotalPrice"));
			combinationBean.setComImage(rs.getString("ComImage"));
		}
		rs.close();
		smt.close();
		conn.close();
		return combinationBean;

	}

	public boolean checkCartCombinationByMemberAccount(String combinationID, String memberAccount) throws Exception {
		String sql = "SELECT MemberAccount FROM cart_combination WHERE CombinationID = ? AND MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, combinationID);
		smt.setString(2, memberAccount);
		rs = smt.executeQuery();
		boolean result = false;
		if (rs.next()) {
			result = true;
		}
		rs.close();
		smt.close();
		conn.close();
		return result;
	}

	public List<CombinationBean> getCombinationListByMemberAccount(String memberAccount) throws Exception {
		String sql = "SELECT * FROM combination a JOIN cart_combination b ON a.CombinationID = b.CombinationID "
				+ "WHERE b.MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		List<CombinationBean> allcombination = new ArrayList<CombinationBean>();
		while (rs.next()) {
			CombinationBean combinationBean = new CombinationBean();
			combinationBean.setCombinationID(rs.getString("CombinationID"));
			combinationBean.setCombinationName(rs.getString("CombinationName"));
			combinationBean.setCombinationDescription(rs.getString("CombinationDescription"));
			combinationBean.setTotalPrice(rs.getInt("TotalPrice"));
			combinationBean.setComImage(rs.getString("ComImage"));
			combinationBean.setQuantity(rs.getInt("Quantity"));
			allcombination.add(combinationBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allcombination;
	}

}
