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
import bean.CartCustomerlizeBean;
import bean.OrderBean;
import bean.ProductBean;
import bean.ShoppingListBean;
import bean.ShoppingListCombinationBean;
import bean.ShoppingListCustomerlizeBean;
import database.CartCombinationDB;
import database.CartCustomerlizeDB;
import database.CartDB;
import database.OrderDB;
import database.ProductDB;
import database.ShoppingListCombinationDB;
import database.ShoppingListCustomerlizeDB;
import database.ShoppingListDB;



public class AddOrderServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		OrderDB orderDB = new OrderDB();
		OrderBean orderBean = new OrderBean();
		
		ProductDB productDB=new ProductDB();
		ShoppingListDB shoppingListDB=new ShoppingListDB();
		ShoppingListCombinationDB shoppingListCombinationDB=new ShoppingListCombinationDB();
		ShoppingListCustomerlizeDB shoppingListCustomerlizeDB=new ShoppingListCustomerlizeDB();
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		int totalPrice=Integer.parseInt(String.valueOf(session.getAttribute("totalPrice")));
		String orderAddress=req.getParameter("orderAddress");
		String orderPhone=req.getParameter("orderPhone");
		String payway=req.getParameter("payway");
		
		CartDB cartDB=new CartDB();
		CartCombinationDB cartCombinationDB=new CartCombinationDB();
		CartCustomerlizeDB cartCustomerlizeDB=new CartCustomerlizeDB();
		
//		ArrayList<ProductBean> productBeanList = new ArrayList<ProductBean>();
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
			
			//客製化
			List<CartCustomerlizeBean> cartCustomerlizeBeanList=new ArrayList<CartCustomerlizeBean>();
			cartCustomerlizeBeanList=cartCustomerlizeDB.getCartCustomerlizeListbyMemberAccount(memberAccount);		
			for(CartCustomerlizeBean cartCustomerlizeBean:cartCustomerlizeBeanList){
				ShoppingListCustomerlizeBean shoppingListCustomerlizeBean=new ShoppingListCustomerlizeBean();
				shoppingListCustomerlizeBean.setOrderID(orderID);
				shoppingListCustomerlizeBean.setCusID(cartCustomerlizeBean.getCusID());
				shoppingListCustomerlizeBean.setQuantity(cartCustomerlizeBean.getQuantity());
				shoppingListCustomerlizeBean.setUnitPrice(cartCustomerlizeBean.getUnitPrice());
				shoppingListCustomerlizeDB.addShoppingListCustomerlize(shoppingListCustomerlizeBean);
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
			cartCustomerlizeDB.delAllCartCustomerlizebyMemberAccount(memberAccount);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
//		String productID[] = req.getParameterValues("productID");
//		
//		System.out.print(productID);
//		ProductDB productDB=new ProductDB();
//		String productID[] = req.getParameterValues("productID");
//		for (int i = 0; i < productID.length; i++) {
//			ProductBean productBean = new ProductBean();
//			productBean.setProductID(productID[i]);
//			productBeanList.add(productBean);
//			
//		}
//		for (int i = 0; i < productBeanList.size(); i++) {
//			try {
//				productDB.minusInventorybyProduct(productBeanList.get(i));
//			} catch (Exception e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//		}
		
		resp.sendRedirect("payOrder.jsp");
	}
	
}
