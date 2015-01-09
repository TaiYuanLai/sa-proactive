package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.CartCustomerlizeBean;

import database.CartCustomerlizeDB;

public class AddCartCustomerlizeServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		CartCustomerlizeDB cartCustomerlizeDB = new CartCustomerlizeDB();
		CartCustomerlizeBean cartCustomerlizeBean = new CartCustomerlizeBean();

		int cusID = Integer.parseInt(req.getParameter("cusID"));
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");

		cartCustomerlizeBean.setCusID(cusID);
		cartCustomerlizeBean.setMemberAccount(memberAccount);

		try {
			cartCustomerlizeDB.addCartCustomerlize(cartCustomerlizeBean);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 resp.sendRedirect("customerlizeDetail.jsp?ID="+cusID);
		 
	}
	
	
}
