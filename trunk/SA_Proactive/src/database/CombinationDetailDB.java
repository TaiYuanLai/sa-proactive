package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CombinationDetailBean;
import shared.JDBCUtil;

public class CombinationDetailDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public List<CombinationDetailBean> getCombinationDetail(String productID) throws Exception{
		String sql = "SELECT a.*,c.ProductName FROM combination_detail a JOIN combination b ON a.CombinationID = b.CombinationID JOIN product c ON a.ProductID = c.ProductID WHERE a.CombinationID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, productID);
		rs = smt.executeQuery();
		List<CombinationDetailBean> combinationDetail= new ArrayList<CombinationDetailBean>();
		while(rs.next()) {
			CombinationDetailBean combinationDetailBean = new CombinationDetailBean();
			combinationDetailBean.setCombinationID(rs.getString("CombinationID"));
			combinationDetailBean.setProductID(rs.getString("ProductID"));
			combinationDetailBean.setProductName(rs.getString("ProductName"));
			combinationDetail.add(combinationDetailBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return combinationDetail;
	}

}
