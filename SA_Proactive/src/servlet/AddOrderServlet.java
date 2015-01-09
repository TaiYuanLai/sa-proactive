package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.OrderBean;
import database.OrderDB;



public class AddOrderServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		OrderDB orderDB = new OrderDB();
		OrderBean orderBean = new OrderBean();
		
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		int totalPrice=Integer.parseInt(String.valueOf(session.getAttribute("totalPrice")));
		String orderAddress=req.getParameter("orderAddress");
		String orderPhone=req.getParameter("orderPhone");
		String payway=req.getParameter("payway");
		
		try {
			int orderID=orderDB.getOrderID();
			orderBean.setOrderID(orderID);
			orderBean.setMemberAccount(memberAccount);
			orderBean.setTotalPrice(totalPrice);
			orderBean.setOrderAddress(orderAddress);
			orderBean.setOrderPhone(orderPhone);
			orderBean.setPayway(payway);
			
			orderDB.addOrder(orderBean);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		resp.sendRedirect("payOrder.jsp");
	}
	
}
