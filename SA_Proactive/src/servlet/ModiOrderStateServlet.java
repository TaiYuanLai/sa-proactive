package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OrderBean;
import database.OrderDB;

public class ModiOrderStateServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		int orderID=Integer.parseInt(req.getParameter("orderID"));
		int orderState=Integer.parseInt(req.getParameter("orderState"));
		System.out.print("11");
		OrderBean orderBean=new OrderBean();
		orderBean.setOrderID(orderID);
		orderBean.setOrderState(orderState);
		
		OrderDB orderDB=new OrderDB();
		try {
			orderDB.modiOrderState(orderState, orderID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp.sendRedirect("management/manageOrder.jsp");
		
		
	}

}
