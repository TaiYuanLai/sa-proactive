package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import bean.CartCombinationBean;
import database.CartCombinationDB;
import database.CartDB;

public class ModiQuantityServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		CartDB cartDB = new CartDB();
		CartCombinationDB cartCombinationDB = new CartCombinationDB();

		ArrayList<CartBean> cartBeanList = new ArrayList<CartBean>();
		ArrayList<CartCombinationBean> cartCombinationBeanList = new ArrayList<CartCombinationBean>();
		String memberAccount = (String) session.getAttribute("memberAccount");
		if (req.getParameterValues("productID") != null) {
			String productID[] = req.getParameterValues("productID");
			String productQuantity[] = req.getParameterValues("productQuantity");

			if (productID.length > 0) {
				for (int i = 0; i < productID.length; i++) {
					CartBean cartBean = new CartBean();
					cartBean.setProductID(productID[i]);
					cartBean.setMemberAccount(memberAccount);
					cartBean.setQuantity(Integer.parseInt(productQuantity[i]));
					cartBeanList.add(cartBean);
				}
			}

			try {
				if (cartBeanList.size() > 0) {
					for (int i = 0; i < cartBeanList.size(); i++) {
						cartDB.modiQuantityProduct(cartBeanList.get(i));
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (req.getParameterValues("combinationID") != null) {
			String combinationID[] = req.getParameterValues("combinationID");
			String combinationQuantity[] = req.getParameterValues("combinationQuantity");

			if (combinationID.length > 0) {
				for (int i = 0; i < combinationID.length; i++) {
					CartCombinationBean cartCombinationBean = new CartCombinationBean();
					cartCombinationBean.setCombinationID(combinationID[i]);
					cartCombinationBean.setMemberAccount(memberAccount);
					cartCombinationBean.setQuantity(Integer.parseInt(combinationQuantity[i]));
					cartCombinationBeanList.add(cartCombinationBean);
				}
			}

			try {

				if (cartCombinationBeanList.size() > 0) {
					for (int i = 0; i < cartCombinationBeanList.size(); i++) {
						cartCombinationDB.modiQuantityCombination(cartCombinationBeanList.get(i));
					}

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		resp.sendRedirect("payCheck.jsp");

	}

}
