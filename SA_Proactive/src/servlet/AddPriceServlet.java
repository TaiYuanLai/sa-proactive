package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPriceServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int totalPrice=Integer.parseInt(req.getParameter("totalPrice"));
		req.getSession(true); // create new session
		req.getSession().setAttribute("totalPrice", totalPrice);
		
		resp.sendRedirect("payInfo.jsp");
		
		
		
	}

}
