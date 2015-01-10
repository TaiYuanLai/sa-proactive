package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CartDB;
import database.CombinationDB;
import database.CombinationDetailDB;
import database.ProductDB;
import bean.CombinationBean;
import bean.CombinationDetailBean;
import bean.MemberBean;
import bean.ProductBean;

public class ModiCombinationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				req.setCharacterEncoding("UTF-8");
				ProductBean productBean = new ProductBean();
			
				String combinationID = req.getParameter("combinationID");
				String productID = req.getParameter(productBean.getProductType());
								
				
				CombinationDetailDB combinationDetailDB = new CombinationDetailDB();
				CombinationDetailBean combinationDetailBean = new CombinationDetailBean();
				combinationDetailBean.setProductID(productID);  
				combinationDetailBean.setCombinationID(combinationID);
			
				
				try {
					combinationDetailDB.updateCombinationdetail(productID,combinationID);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				String combinationName = req.getParameter("combinationName");
				String combinationDescription =req.getParameter("combinationDescription");
			
				
				CombinationDB combinationDB = new CombinationDB();
				CombinationBean combinationBean =new CombinationBean();
				combinationBean.setCombinationName(combinationName);
				combinationBean.setCombinationDescription(combinationDescription);
				
				try {
					
					combinationDB.updateCombination(combinationName,combinationDescription,combinationID);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				resp.sendRedirect("management/manageCombination.jsp");
	}
	

}
