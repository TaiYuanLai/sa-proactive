package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.ProductDB;
import bean.ProductBean;

public class AddOtherServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
	int check =400;
	
	
	String BoardID = req.getParameter("BoardID");
	String SSDID = req.getParameter("SSDID");
	String MemoryID = req.getParameter("MemoryID");
	String DisplayCardID = req.getParameter("DisplayCardID");
	String PowerID = req.getParameter("PowerID");
	String CaseID = req.getParameter("CaseID");
	String DVDID = req.getParameter("DVDID");
	String FanID = req.getParameter("FanID");

	
	Object total = req.getSession().getAttribute("TotalPrice");
	int TotalPrice = (int)total;
	ProductDB productDB = new ProductDB();
	ProductBean Board = new ProductBean();
	ProductBean SSD = new ProductBean();
	ProductBean Memory = new ProductBean();
	ProductBean DisplayCard = new ProductBean();
	ProductBean Power = new ProductBean();
	ProductBean Case = new ProductBean();
	ProductBean DVD = new ProductBean();
	ProductBean Fan = new ProductBean();
	try {
		Board = productDB.getProduct(BoardID);
		SSD = productDB.getProduct(SSDID);
		Memory = productDB.getProduct(MemoryID);
		DisplayCard = productDB.getProduct(DisplayCardID);
		Power = productDB.getProduct(PowerID);
		Case = productDB.getProduct(CaseID);
		DVD = productDB.getProduct(DVDID);
		Fan = productDB.getProduct(FanID);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	HttpSession session = req.getSession();
	
	req.getSession(true); // create new session
	
	session.removeAttribute("check");
	
	if(req.getParameter("check")!=null){
		req.getSession().setAttribute("check", check);
		TotalPrice += check;
	}
	
	
	req.getSession().setAttribute("BoardID", BoardID);
	req.getSession().setAttribute("BoardName",Board.getProductName());
	TotalPrice += Board.getUnitPrice();
	
	req.getSession().setAttribute("SSDID", SSDID);
	req.getSession().setAttribute("SSDName",SSD.getProductName());
	TotalPrice += SSD.getUnitPrice();
	
	req.getSession().setAttribute("MemoryID", MemoryID);
	req.getSession().setAttribute("MemoryName",Memory.getProductName());
	TotalPrice += Memory.getUnitPrice();
	
	req.getSession().setAttribute("DisplayCardID", DisplayCardID);
	req.getSession().setAttribute("DisplayName",DisplayCard.getProductName());
	TotalPrice += DisplayCard.getUnitPrice();
	
	req.getSession().setAttribute("PowerID", PowerID);
	req.getSession().setAttribute("PowerName",Power.getProductName());
	TotalPrice += Power.getUnitPrice();
	
	req.getSession().setAttribute("CaseID", CaseID);
	req.getSession().setAttribute("CaseName",Case.getProductName());
	TotalPrice += Case.getUnitPrice();
	
	req.getSession().setAttribute("DVDID", DVDID);
	req.getSession().setAttribute("DVDName",DVD.getProductName());
	TotalPrice += DVD.getUnitPrice();
	
	req.getSession().setAttribute("FanID", FanID);
	req.getSession().setAttribute("FanName",Fan.getProductName());
	TotalPrice += Fan.getUnitPrice();
	
	req.getSession().setAttribute("TotalPrice", TotalPrice);
	resp.sendRedirect("customerlizeDetail.jsp");
}
}
