package servlet;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MemberDB;
import bean.MemberBean;
import shared.HtmlUtil;
import shared.MD5;
import shared.Mail;

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
		
//		HtmlUtil htmlUtil = new HtmlUtil();
//		String subject = "Proactive：會員註冊驗證";
//		String message = "";
//		try {
//			message = htmlUtil.htmlToString(req.getServletContext().getRealPath("html/mail.html"));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		Mail mail = new Mail();
//		message = message.replaceAll("link_url", "http://www.proactive.tw/active?aid="+memberBean.getMemberAccount());
//		message = message.replaceAll("user_name", memberBean.getMemberName());
//		mail.sendMail(subject, memberBean.getMemberAccount(), message);
		
		resp.sendRedirect("login.jsp");
	}

}


