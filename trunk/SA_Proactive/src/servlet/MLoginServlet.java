package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ManagerBean;
import database.ManagerDB;


public class MLoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		ManagerDB managerDB = new ManagerDB();
		ManagerBean managerBean = new ManagerBean();
		String managerAccount = req.getParameter("managerAccount");
		String managerPassword = req.getParameter("managerPassword");
		
		String flag = "";
		try {
			managerBean = managerDB.checkLogin(managerAccount, managerPassword);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(managerBean.getManagerAccount() != null){
			req.getSession(true); //create new session
			req.getSession().setAttribute("managerAccount", managerBean.getManagerAccount());
			req.getSession().setAttribute("managerName", managerBean.getManagerName());
			flag = "1";
			}
		
		resp.setContentType("text/html;charset=UTF-8"); 
		resp.setHeader("Cache-Control","no-cache"); 
		PrintWriter out = resp.getWriter();
		out.print(flag);
	}
}

