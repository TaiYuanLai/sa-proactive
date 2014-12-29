package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MemberBean;
import shared.MD5;
import database.MemberDB;

public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		req.getSession().invalidate(); // clear session
		MemberDB memberDB = new MemberDB();
		String memberAccount = req.getParameter("memberAccount");
		String memberPassword = MD5.encrypt(req.getParameter("memberPassword"));
		boolean flag = false;

		try {
			flag = memberDB.checkLogin(memberAccount, memberPassword);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (flag) {
			MemberBean memberBean = new MemberBean();
			try {
				memberBean = memberDB.getMember(memberAccount);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getSession(true); // create new session
			req.getSession().setAttribute("memberAccount", memberAccount);
			req.getSession().setAttribute("memberName",memberBean.getMemberName());

			resp.sendRedirect("index.jsp");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("errorMsg", "帳號或密碼輸入錯誤，請重新輸入或點選忘記密碼!");
			resp.sendRedirect("login.jsp");
		}
	}
}
