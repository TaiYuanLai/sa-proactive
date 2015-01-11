package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.CombinationBean;
import bean.CombinationDetailBean;
import shared.JDBCUtil;

public class CombinationDetailDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public List<CombinationDetailBean> getCombinationDetailList(String productID) throws Exception{
		List<CombinationDetailBean> combinationDetailList= new ArrayList<CombinationDetailBean>();
		String sql = "SELECT combination.CombinationID, product.ProductType, product.ProductName, product.ProductID FROM combination_detail JOIN product ON combination_detail.ProductID=product.ProductID JOIN Combination  ON combination.CombinationID=combination_detail.CombinationID" ;
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while(rs.next()) {
			CombinationDetailBean combinationDetailBean = new CombinationDetailBean();
			combinationDetailBean.setCombinationID(rs.getString("CombinationID"));
			combinationDetailBean.setProductID(rs.getString("ProductID"));
			combinationDetailBean.setProductName(rs.getString("ProductName"));
			combinationDetailBean.setProductType(rs.getString("ProductType"));
			combinationDetailList.add(combinationDetailBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return combinationDetailList;
	}
	public void updateCombinationdetail(String productID, String combinationID) throws Exception{
		String sql = "UPDATE combination_detail SET ProductID=? WHERE CombinationID=? AND ProductID LIKE 'A%' ;";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,productID);
		smt.setString(2,combinationID);
		
		smt.execute();
		smt.close();
		conn.close();
		
		
	}
	
	

}
