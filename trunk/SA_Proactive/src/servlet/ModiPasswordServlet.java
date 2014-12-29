package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shared.MD5;
import database.MemberDB;

public class ModiPasswordServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		MemberDB memberDB = new MemberDB();
		String memberAccount = session.getAttribute("memberAccount").toString();
		String oldPassword = "";
		String newPassword = "";
		boolean flag = false;
		
		try {
			oldPassword = MD5.encrypt(req.getParameter("oldPassword"));
			newPassword = MD5.encrypt(req.getParameter("password1"));
			flag = memberDB.checkPassword(memberAccount, oldPassword);
			if(flag){
				memberDB.modiPassword(memberAccount, newPassword);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.setContentType("text/html;charset=UTF-8"); 
		resp.setHeader("Cache-Control","no-cache"); 
		PrintWriter out = resp.getWriter();
		out.print(flag);
	}
}
