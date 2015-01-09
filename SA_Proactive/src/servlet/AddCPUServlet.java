package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.ProductDB;
import bean.ProductBean;

public class AddCPUServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("intel").equals("") && req.getParameter("amd").equals("")){
			resp.sendRedirect("customerlize1.jsp");
		}else{
		
			String cpuid = "";
			if(req.getParameter("intel").equals("")){
				cpuid = req.getParameter("amd");
			}else if(req.getParameter("amd").equals("")){
				cpuid = req.getParameter("intel");
			}else{
				cpuid = "error";
			}
			
			ProductDB productDB = new ProductDB();
			ProductBean cpu = new ProductBean();
			try {
				cpu = productDB.getProduct(cpuid);
	
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			req.getSession(true); // create new session
			req.getSession().setAttribute("CPUID", cpuid);
			req.getSession().setAttribute("CPUName", cpu.getProductName());
			req.getSession().setAttribute("TotalPrice", cpu.getUnitPrice());
			
			resp.sendRedirect("customerlize2.jsp");
		}
	}
}