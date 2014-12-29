package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CartCombinationBean;
import database.CartCombinationDB;

public class AddCartCombinationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		CartCombinationDB cartCombinationDB = new CartCombinationDB();
		CartCombinationBean cartCombinationBean = new CartCombinationBean();

		String combinationID = req.getParameter("CombinationID")==null?"":req.getParameter("CombinationID");
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");

		cartCombinationBean.setCombinationID(combinationID);
		cartCombinationBean.setMemberAccount(memberAccount);

		try {
			cartCombinationDB.addCartCombination(cartCombinationBean);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 resp.sendRedirect("combinationDetail.jsp?ID="+combinationID);
	}

}
