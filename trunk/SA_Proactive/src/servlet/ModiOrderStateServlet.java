package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import bean.CartCustomerlizeBean;
import bean.OrderBean;
import database.OrderDB;

public class ModiOrderStateServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		OrderDB orderDB=new OrderDB();
		ArrayList<OrderBean> orderBeanList = new ArrayList<OrderBean>();
		
		if (req.getParameterValues("orderID") != null) {
			String orderID[]= req.getParameterValues("orderID");
			String orderState[] = req.getParameterValues("orderState");
			
			if (orderID.length > 0) {
				for (int i = 0; i < orderID.length; i++) {
					OrderBean orderBean = new OrderBean();
					orderBean.setOrderID(Integer.parseInt(orderID[i]));
					orderBean.setOrderState(Integer.parseInt(orderState[i]));
					orderBeanList.add(orderBean);
				}
			}
			
			try {
				if (orderBeanList.size() > 0) {
					for (int i = 0; i < orderBeanList.size(); i++) {
						orderDB.modiOrderState(orderBeanList.get(i));
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		resp.sendRedirect("management/manageOrder.jsp");
		
		
	}

}
