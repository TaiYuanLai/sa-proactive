package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CartDB;

public class DelCartServlet extends HttpServlet{
	
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		String productID = req.getParameter("productID");	
		
		CartDB cartDB=new CartDB();
		
		try {
			cartDB.delCart(memberAccount,productID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("cart.jsp");
	}

}



