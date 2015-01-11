package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import shared.JDBCUtil;
import bean.CustomizedBean;



public class CustomizedDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public List<CustomizedBean> getCustomizedList() throws Exception {
		List<CustomizedBean> customizedList = new ArrayList<CustomizedBean>();
		String sql = "SELECT * FROM customized";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			CustomizedBean customizedBean = new CustomizedBean();
			customizedBean.setCusID(rs.getInt("CusID"));
			customizedBean.setMemberAccount(rs.getString("MemberAccount"));
			customizedBean.setCPU(rs.getString("CPU"));
			customizedBean.setMD(rs.getString("MD"));
			customizedBean.setHD(rs.getString("HD"));
			customizedBean.setMemory(rs.getString("Memory"));
			customizedBean.setVga(rs.getString("Vga"));
			customizedBean.setPower(rs.getString("Power"));
			customizedBean.setBox(rs.getString("Box"));
			customizedBean.setDVD(rs.getString("DVD"));
			customizedBean.setFan(rs.getString("Fan"));
			customizedBean.setCharge(rs.getInt("Charge"));
			customizedBean.setTotalPrice(rs.getInt("TotalPrice"));
			customizedList.add(customizedBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return customizedList;
}
	public CustomizedBean getCustomized(String cusID)
			throws Exception {
		CustomizedBean customizedBean = new CustomizedBean();
		String sql = "SELECT * FROM customized WHERE CusID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, cusID);
		rs = smt.executeQuery();
		if (rs.next()) {
			customizedBean.setCusID(rs.getInt("CusID"));
			customizedBean.setMemberAccount(rs.getString("MemberAccount"));
			customizedBean.setCPU(rs.getString("CPU"));
			customizedBean.setMD(rs.getString("MD"));
			customizedBean.setHD(rs.getString("HD"));
			customizedBean.setMemory(rs.getString("Memory"));
			customizedBean.setVga(rs.getString("Vga"));
			customizedBean.setPower(rs.getString("Power"));
			customizedBean.setBox(rs.getString("Box"));
			customizedBean.setDVD(rs.getString("DVD"));
			customizedBean.setFan(rs.getString("Fan"));
			customizedBean.setCharge(rs.getInt("Charge"));
			customizedBean.setTotalPrice(rs.getInt("TotalPrice"));
		}
		rs.close();
		smt.close();
		conn.close();
		return customizedBean;

	}

	public boolean checkCartCustomerlizeByMemberAccount(String cusID, String memberAccount) throws Exception {
		String sql = "SELECT MemberAccount FROM cart_customerlize WHERE CusID = ? AND MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, cusID);
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

	public List<CustomizedBean> getCustomizedListByMemberAccount(
			String memberAccount) throws Exception {
		String sql = "SELECT * FROM customized a JOIN cart_customerlize b ON a.CusID = b.CusID "
				+ "WHERE b.MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		List<CustomizedBean> allcustomized = new ArrayList<CustomizedBean>();
		while (rs.next()) {
			CustomizedBean customizedBean = new CustomizedBean();
			customizedBean.setCusID(rs.getInt("CusID"));
			customizedBean.setMemberAccount(rs.getString("MemberAccount"));
			customizedBean.setCPU(rs.getString("CPU"));
			customizedBean.setMD(rs.getString("MD"));
			customizedBean.setHD(rs.getString("HD"));
			customizedBean.setMemory(rs.getString("Memory"));
			customizedBean.setVga(rs.getString("Vga"));
			customizedBean.setPower(rs.getString("Power"));
			customizedBean.setBox(rs.getString("Box"));
			customizedBean.setDVD(rs.getString("DVD"));
			customizedBean.setFan(rs.getString("Fan"));
			customizedBean.setCharge(rs.getInt("Charge"));
			customizedBean.setTotalPrice(rs.getInt("TotalPrice"));
			customizedBean.setQuantity(rs.getInt("Quantity"));
			allcustomized.add(customizedBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allcustomized;
	}
		
		public void addCustomized(CustomizedBean customizedBean) throws Exception {
			String sql = "INSERT INTO `customized`(CusID,MemberAccount,CPU,MD,HD,Memory,Vga,Power,Box,DVD,Fan,Charge,TotalPrice)" 
					 +"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

			conn = db.makeConnection();
			smt = conn.prepareStatement(sql);
			smt.setInt(1, customizedBean.getCusID());
			smt.setString(2, customizedBean.getMemberAccount());
			smt.setString(3, customizedBean.getCPU());
			smt.setString(4, customizedBean.getMD());
			smt.setString(5, customizedBean.getHD());
			smt.setString(6, customizedBean.getMemory());
			smt.setString(7, customizedBean.getVga());
			smt.setString(8, customizedBean.getPower());
			smt.setString(9, customizedBean.getBox());
			smt.setString(10, customizedBean.getDVD());
			smt.setString(11, customizedBean.getFan());
			smt.setInt(12, customizedBean.getCharge());
			smt.setInt(13, customizedBean.getTotalPrice());
			smt.execute();
			smt.close();
			conn.close();
		}
		
		
		public int getCusID() throws Exception{
			String sql = "SELECT IFNULL(MAX(CusID),0)+1 AS size FROM `customized`";
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
		
		public void delCustomized(String memberAccount, int cusID)
				throws Exception {
			String sql = "DELETE FROM customized WHERE MemberAccount=? AND CusID=?";
			conn = db.makeConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, memberAccount);
			smt.setInt(2, cusID);
			smt.execute();
			smt.close();
			conn.close();
		}

}
