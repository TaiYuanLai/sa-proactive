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
import bean.CustomizedBean;
import bean.OrderBean;
import bean.ProductBean;
import bean.ShoppingListBean;
import bean.ShoppingListCombinationBean;
import bean.ShoppingListCustomerlizeBean;
import database.CartCombinationDB;
import database.CartCustomerlizeDB;
import database.CartDB;
import database.CombinationDB;
import database.CustomizedDB;
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
		CombinationDB combinationDB=new CombinationDB();
		CustomizedDB customizedDB=new CustomizedDB();
		
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
				productDB.addSalesbyProduct(cartBean.getProductID(),cartBean.getQuantity());//增加銷量
				productDB.minusInventorybyProduct(cartBean.getProductID(),cartBean.getQuantity());//扣庫存
			}
			
			
			//優惠組合
			List<CartCombinationBean> cartCombinationBeanList=new ArrayList<CartCombinationBean>();
			cartCombinationBeanList=cartCombinationDB.getCartCombinationListbyMemberAccount(memberAccount);
			for(CartCombinationBean cartCombinationBean:cartCombinationBeanList){
				List<String> productIDbycombination=combinationDB.getProductIDbyCombination(cartCombinationBean.getCombinationID());
				ShoppingListCombinationBean shoppingListCombinationBean=new ShoppingListCombinationBean();
				shoppingListCombinationBean.setOrderID(orderID);
				shoppingListCombinationBean.setCombinationID(cartCombinationBean.getCombinationID());
				shoppingListCombinationBean.setQuantity(cartCombinationBean.getQuantity());
				shoppingListCombinationBean.setUnitPrice(cartCombinationBean.getUnitPrice());
				shoppingListCombinationDB.addShoppingListCombination(shoppingListCombinationBean);
				for(int i=0;i<productIDbycombination.size();i++){
					productDB.addSalesbyProduct(productIDbycombination.get(i),cartCombinationBean.getQuantity());
					productDB.minusInventorybyProduct(productIDbycombination.get(i),cartCombinationBean.getQuantity());//扣庫存
				}

			}
			
			//客製化
			List<CartCustomerlizeBean> cartCustomerlizeBeanList=new ArrayList<CartCustomerlizeBean>();
			cartCustomerlizeBeanList=cartCustomerlizeDB.getCartCustomerlizeListbyMemberAccount(memberAccount);		
			for(CartCustomerlizeBean cartCustomerlizeBean:cartCustomerlizeBeanList){
				ShoppingListCustomerlizeBean shoppingListCustomerlizeBean=new ShoppingListCustomerlizeBean();
				CustomizedBean customizedBean=new CustomizedBean();
				customizedBean=customizedDB.getCustomized(String.valueOf(cartCustomerlizeBean.getCusID()));
				shoppingListCustomerlizeBean.setOrderID(orderID);
				shoppingListCustomerlizeBean.setCusID(cartCustomerlizeBean.getCusID());
				shoppingListCustomerlizeBean.setQuantity(cartCustomerlizeBean.getQuantity());
				shoppingListCustomerlizeBean.setUnitPrice(cartCustomerlizeBean.getUnitPrice());
				shoppingListCustomerlizeDB.addShoppingListCustomerlize(shoppingListCustomerlizeBean);
				//1
				productDB.addSalesbyProduct(customizedBean.getCPU(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getCPU(), cartCustomerlizeBean.getQuantity());
				//2
				productDB.addSalesbyProduct(customizedBean.getMD(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getMD(), cartCustomerlizeBean.getQuantity());
				//3
				productDB.addSalesbyProduct(customizedBean.getHD(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getHD(), cartCustomerlizeBean.getQuantity());
				//4
				productDB.addSalesbyProduct(customizedBean.getMemory(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getMemory(), cartCustomerlizeBean.getQuantity());
				//5
				productDB.addSalesbyProduct(customizedBean.getVga(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getVga(), cartCustomerlizeBean.getQuantity());
				//6
				productDB.addSalesbyProduct(customizedBean.getPower(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getPower(), cartCustomerlizeBean.getQuantity());
				//7
				productDB.addSalesbyProduct(customizedBean.getBox(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getBox(), cartCustomerlizeBean.getQuantity());
				//8
				productDB.addSalesbyProduct(customizedBean.getDVD(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getDVD(), cartCustomerlizeBean.getQuantity());
				//9
				productDB.addSalesbyProduct(customizedBean.getFan(), cartCustomerlizeBean.getQuantity());
				productDB.minusInventorybyProduct(customizedBean.getFan(), cartCustomerlizeBean.getQuantity());
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
		
		
		
		resp.sendRedirect("payOrder.jsp");
	}
	
}
