package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartCustomerlizeBean;
import bean.CustomizedBean;
import database.CartCustomerlizeDB;
import database.CustomizedDB;

public class AddCartCustomerlizeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		CustomizedDB customizedDB = new CustomizedDB();
		CustomizedBean customizedBean = new CustomizedBean();

		CartCustomerlizeDB cartCustomerlizeDB = new CartCustomerlizeDB();
		CartCustomerlizeBean cartCustomerlizeBean = new CartCustomerlizeBean();
		
		String memberAccount = (String) req.getSession().getAttribute("memberAccount");
		String cPU = (String) req.getSession().getAttribute("CPUID");
		String mD = (String) req.getSession().getAttribute("BoardID");
		String hD = (String) req.getSession().getAttribute("SSDID");
		String memory = (String) req.getSession().getAttribute("MemoryID");
		String vga = (String) req.getSession().getAttribute("DisplayCardID");
		String power = (String) req.getSession().getAttribute("PowerID");
		String box = (String) req.getSession().getAttribute("CaseID");
		String dVD = (String) req.getSession().getAttribute("DVDID");
		String fan = (String) req.getSession().getAttribute("FanID");
		int charge=session.getAttribute("check")==null?0:Integer.parseInt(String.valueOf(session.getAttribute("check")));
		int totalPrice = Integer.parseInt(String.valueOf(session.getAttribute("TotalPrice")));
		
		try {
			int cusID=customizedDB.getCusID();
			customizedBean.setCusID(cusID);
			customizedBean.setMemberAccount(memberAccount);
			customizedBean.setCPU(cPU);
			customizedBean.setMD(mD);
			customizedBean.setHD(hD);
			customizedBean.setMemory(memory);
			customizedBean.setVga(vga);
			customizedBean.setPower(power);
			customizedBean.setBox(box);
			customizedBean.setDVD(dVD);
			customizedBean.setFan(fan);
			customizedBean.setCharge(charge);
			customizedBean.setTotalPrice(totalPrice);
			customizedDB.addCustomized(customizedBean);
			
			cartCustomerlizeBean.setCusID(cusID);
			cartCustomerlizeBean.setMemberAccount(memberAccount);
			cartCustomerlizeDB.addCartCustomerlize(cartCustomerlizeBean);
			    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		resp.sendRedirect("cart.jsp");
		
	}

}
