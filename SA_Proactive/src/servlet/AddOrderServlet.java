package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import bean.CartCombinationBean;
import bean.OrderBean;
import bean.ProductBean;
import bean.ShoppingListBean;
import bean.ShoppingListCombinationBean;
import database.CartCombinationDB;
import database.CartDB;
import database.OrderDB;
import database.ShoppingListCombinationDB;
import database.ShoppingListDB;



public class AddOrderServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		OrderDB orderDB = new OrderDB();
		OrderBean orderBean = new OrderBean();
	
		ShoppingListDB shoppingListDB=new ShoppingListDB();
		ShoppingListCombinationDB shoppingListCombinationDB=new ShoppingListCombinationDB();
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		int totalPrice=Integer.parseInt(String.valueOf(session.getAttribute("totalPrice")));
		String orderAddress=req.getParameter("orderAddress");
		String orderPhone=req.getParameter("orderPhone");
		String payway=req.getParameter("payway");
		
		CartDB cartDB=new CartDB();
		CartCombinationDB cartCombinationDB=new CartCombinationDB();
		
		
		try {
			int orderID=orderDB.getOrderID();
			//零件商品
			List<CartBean> cartBeanList=new ArrayList<CartBean>();
			cartBeanList=cartDB.getCartListbyMemberAccount(memberAccount);
			for(CartBean cartBean:cartBeanList){
				ShoppingListBean shoppingListBean=new ShoppingListBean();
				shoppingListBean.setOrderID(orderID);
				shoppingListBean.setProductID(cartBean.getProductID());
				shoppingListBean.setQuantity(cartBean.getQuantity());
				shoppingListBean.setUnitPrice(cartBean.getUnitPrice());
				shoppingListDB.addShoppingList(shoppingListBean);
			}
			
			//優惠組合
			List<CartCombinationBean> cartCombinationBeanList=new ArrayList<CartCombinationBean>();
			cartCombinationBeanList=cartCombinationDB.getCartCombinationListbyMemberAccount(memberAccount);
			for(CartCombinationBean cartCombinationBean:cartCombinationBeanList){
				ShoppingListCombinationBean shoppingListCombinationBean=new ShoppingListCombinationBean();
				shoppingListCombinationBean.setOrderID(orderID);
				shoppingListCombinationBean.setCombinationID(cartCombinationBean.getCombinationID());
				shoppingListCombinationBean.setQuantity(cartCombinationBean.getQuantity());
				shoppingListCombinationBean.setUnitPrice(cartCombinationBean.getUnitPrice());
				shoppingListCombinationDB.addShoppingListCombination(shoppingListCombinationBean);
			}
			
			orderBean.setOrderID(orderID);
			orderBean.setMemberAccount(memberAccount);
			orderBean.setTotalPrice(totalPrice);
			orderBean.setOrderAddress(orderAddress);
			orderBean.setOrderPhone(orderPhone);
			orderBean.setPayway(payway);
			
			orderDB.addOrder(orderBean);
			cartDB.delAllCartbyMemberAccount(memberAccount);
			cartCombinationDB.delAllCartCombinationbyMemberAccount(memberAccount);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		try {
//			int orderID=orderDB.getOrderID();
//			orderBean.setOrderID(orderID);
//			orderBean.setMemberAccount(memberAccount);
//			orderBean.setTotalPrice(totalPrice);
//			orderBean.setOrderAddress(orderAddress);
//			orderBean.setOrderPhone(orderPhone);
//			orderBean.setPayway(payway);
//			
//			
//			orderDB.addOrder(orderBean);
//			
//		} catch (Exception e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		
		resp.sendRedirect("payOrder.jsp");
	}
	
}
