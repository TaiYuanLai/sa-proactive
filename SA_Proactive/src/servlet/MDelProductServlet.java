package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDB;



public class MDelProductServlet extends HttpServlet{
	
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String productID = req.getParameter("productID");	
		
		ProductDB productDB=new ProductDB();
		
		try {
			productDB.delProduct(productID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("management/manageProduct.jsp");
	}

}



