package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MemberBean;
import shared.JDBCUtil;

public class MemberDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public void addMember(MemberBean memberBean) throws Exception{
		String sql = "INSERT INTO member(MemberAccount,MemberPassword,MemberName)" +
				"VALUES(?,?,?)"; 
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,memberBean.getMemberAccount());
		smt.setString(2,memberBean.getMemberPassword());
		smt.setString(3,memberBean.getMemberName());
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public List<MemberBean> getMemberList()throws Exception{
		List<MemberBean> memberList = new ArrayList<MemberBean>();
		String sql = "SELECT * FROM member";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while(rs.next()) {
			MemberBean memberBean = new MemberBean();
			memberBean.setMemberAccount(rs.getString("MemberAccount"));
			memberBean.setMemberPassword(rs.getString("MemberPassword"));
			memberBean.setMemberName(rs.getString("MemberName"));
			memberList.add(memberBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return memberList;
	}
	
	public MemberBean getMember(String memberAccount)throws Exception{
		MemberBean memberBean = new MemberBean();
		String sql = "SELECT * FROM member WHERE MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		if(rs.next()){
			memberBean.setMemberAccount(memberAccount);
			memberBean.setMemberPassword(rs.getString("MemberPassword"));
			memberBean.setMemberName(rs.getString("MemberName"));
		}
		rs.close();
		smt.close();
		conn.close();
		return memberBean;
		
	}
	
	public boolean checkAccount(String memberAccount)throws Exception{
		String sql = "SELECT * FROM member WHERE MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		if(rs.next()){
			return false;
		}
		rs.close();
		smt.close();
		conn.close();
		return true;
		
	}
	
	public boolean checkLogin(String memberAccount, String memberPassword)throws Exception{
		boolean flag = false;
		String sql = "SELECT * FROM member WHERE MemberAccount = ? AND MemberPassword = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		smt.setString(2, memberPassword);
		rs = smt.executeQuery();
		if(rs.next()) {
			flag = true;
		}
		rs.close();
		smt.close();
		conn.close();
		return flag;
	}
	
	public boolean checkPassword(String memberAccount, String oldPassword)throws Exception{
		String sql = "SELECT * FROM member WHERE MemberAccount = ? AND MemberPassword = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		smt.setString(2, oldPassword);
		rs = smt.executeQuery();
		if(rs.next()) {
			return true;
		}
		rs.close();
		smt.close();
		conn.close();
		
		return false;
	}
	
	public void modiPassword(String memberAccount, String newPassword)throws Exception{
		String sql = "UPDATE member SET MemberPassword = ? WHERE MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		
		smt.setString(1, newPassword);
		smt.setString(2, memberAccount);
		smt.execute();

		smt.close();
		conn.close();
	}
	
}
