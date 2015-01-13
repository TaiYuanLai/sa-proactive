package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import database.ProductDB;
import bean.ProductBean;


public class ModiProductServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		String productID = req.getParameter("ProductID");
		String productName = req.getParameter("ProductName");
		String productBrand = req.getParameter("ProductBrand");
		String clock = req.getParameter("Clock");
		String processorSocket = req.getParameter("ProcessorSocket");
		
		String specifications = req.getParameter("Specifications");
		String cache = req.getParameter("Cache");
		int unitPrice=Integer.parseInt(req.getParameter("UnitPrice"));
		String warranty = req.getParameter("Warranty");
		
	
		ProductBean productBean =new ProductBean();
		productBean.setProductName(productName);
		productBean.setProductBrand(productBrand);
		productBean.setClock(clock);
		productBean.setProcessorSocket(processorSocket);
		productBean.setSpecifications(specifications);
		productBean.setCache(cache);
		productBean.setUnitPrice(unitPrice);
		productBean.setWarranty(warranty);
		
		System.out.println(productName);
		System.out.println(productID);
		
		ProductDB productDB = new ProductDB();
		
		try {
			productDB.modiProduct(productName,productBrand,clock,processorSocket,specifications,cache,unitPrice,warranty,productID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp.sendRedirect("management/manageProduct.jsp");
	}

}
