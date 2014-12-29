package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import database.CartDB;

public class AddCartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		CartDB cartDB = new CartDB();
		CartBean cartBean = new CartBean();
		
		String productID = req.getParameter("ProductID")==null?"":req.getParameter("ProductID");
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		
		cartBean.setProductID(productID);
		cartBean.setMemberAccount(memberAccount);
		
		try {
			cartDB.addCart(cartBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 resp.sendRedirect("productDetail.jsp?ID="+productID);
		
	}

}
