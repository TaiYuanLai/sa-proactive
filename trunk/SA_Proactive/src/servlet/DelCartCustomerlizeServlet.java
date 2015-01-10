package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CartCustomerlizeDB;

public class DelCartCustomerlizeServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		String cusID = req.getParameter("cusID");	
		
		CartCustomerlizeDB cartCustomerlizeDB=new CartCustomerlizeDB();
		
		try {
			cartCustomerlizeDB.delCartCustomerlize(memberAccount, cusID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("cart.jsp");
	}

}

