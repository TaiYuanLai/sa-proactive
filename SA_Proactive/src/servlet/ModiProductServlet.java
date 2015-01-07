package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ModiProductServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		String productID = req.getParameter("ProductID")==null?"":req.getParameter("ProductID");
		
		
		 resp.sendRedirect("productDetail.jsp?ID="+productID);
		
	}

}
