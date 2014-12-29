package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MemberDB;
import bean.MemberBean;
import shared.MD5;

public class AddMemberServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); //設定UTF-8 才不會有亂碼
		String memberAccount = req.getParameter("memberAccount");
		String memberPassword = MD5.encrypt(req.getParameter("memberPassword"));
		String memberName = req.getParameter("memberName");
		
		MemberBean memberBean = new MemberBean(); //new一個bean物件
		memberBean.setMemberAccount(memberAccount);  //用set存入
		memberBean.setMemberPassword(memberPassword);
		memberBean.setMemberName(memberName);
		
		MemberDB memberDB = new MemberDB();
		try {
			memberDB.addMember(memberBean); //新增輸入的物件
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("index.jsp");
	}

}


