package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.ManagerBean;
import shared.JDBCUtil;

public class ManagerDB {		
		
		JDBCUtil db = new JDBCUtil();
		private Connection conn = null ;
		private ResultSet rs = null ;
		private PreparedStatement smt = null ;
		
		
		public List<ManagerBean> getManagerList()throws Exception{
			List<ManagerBean> managerList = new ArrayList<ManagerBean>();
			String sql = "SELECT * FROM manager";
			conn = db.makeConnection();
			smt = conn.prepareStatement(sql);
			rs = smt.executeQuery();
			while(rs.next()) {
				ManagerBean managerBean = new ManagerBean();
				managerBean.setManagerAccount(rs.getString("ManagerAccount"));
				managerBean.setManagerPassword(rs.getString("ManagerPassword"));
				managerBean.setManagerName(rs.getString("ManagerName"));
				managerList.add(managerBean);
			}
			rs.close();
			smt.close();
			conn.close();
			return managerList;
		}
		
		public ManagerBean getManager(String managerAccount)throws Exception{
			ManagerBean managerBean = new ManagerBean();
			String sql = "SELECT * FROM manager WHERE ManagerAccount = ?";
			conn = db.makeConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, managerAccount);
			rs = smt.executeQuery();
			if(rs.next()){
				managerBean.setManagerAccount(managerAccount);
				managerBean.setManagerPassword(rs.getString("ManagerPassword"));
				managerBean.setManagerName(rs.getString("ManagerName"));
			}
			rs.close();
			smt.close();
			conn.close();
			return managerBean;
			
		}
		
		public ManagerBean checkLogin(String managerAccount, String managerPassword)throws Exception{
			ManagerBean managerBean = new ManagerBean();
			String sql = "SELECT * FROM manager WHERE ManagerAccount = ? AND ManagerPassword = ?";
			conn = db.makeConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, managerAccount);
			smt.setString(2, managerPassword);
			rs = smt.executeQuery();
			if(rs.next()) {
				managerBean.setManagerAccount(rs.getString("ManagerAccount"));
				managerBean.setManagerName(rs.getString("ManagerName"));
			}
			rs.close();
			smt.close();
			conn.close();
			return managerBean;
		}
	}
