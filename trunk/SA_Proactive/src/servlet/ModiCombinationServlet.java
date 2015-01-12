package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import database.CombinationDB;
import database.CombinationDetailDB;
import database.ProductDB;
import bean.CombinationBean;
import bean.CombinationDetailBean;
import bean.ProductBean;

public class ModiCombinationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				req.setCharacterEncoding("UTF-8");
				String combinationID = req.getParameter("combinationID");
				
				
				
				String[] productTypeList = new String[9];
				productTypeList[0]="中央處理器";
				productTypeList[1]="主機板";
				productTypeList[2]="硬碟/SSD";
				productTypeList[3]="記憶體";
				productTypeList[4]="顯示/繪圖卡";
				productTypeList[5]="電源供應器";
				productTypeList[6]="電腦機殼";
				productTypeList[7]="DVD燒錄器";
				productTypeList[8]="CPU散熱風扇";
				
				for(int i=0;i<=8;i++){
				String productID = req.getParameter(productTypeList[i]);
						
				
				
				
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
