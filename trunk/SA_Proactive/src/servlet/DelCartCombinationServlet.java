package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CartCombinationDB;

public class DelCartCombinationServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		String combinationID = req.getParameter("combinationID");	
		
		CartCombinationDB cartCombinationDB=new CartCombinationDB();
		
		try {
			cartCombinationDB.delCartCombination(memberAccount,combinationID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("cart.jsp");
	}

}
