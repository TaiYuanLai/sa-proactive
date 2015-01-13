package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import bean.ProductBean;
import database.ProductDB;


public class AddProductServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String productID = req.getParameter("ProductID");
		String productName = req.getParameter("ProductName");
		String productType = req.getParameter("ProductType");
		String productBrand = req.getParameter("ProductBrand");
		String clock = req.getParameter("Clock");
		
		String chipset = req.getParameter("Chipset");
		String processorSocket = req.getParameter("ProcessorSocket");
		
		String cPUSlot = req.getParameter("CPUSlot");
		String memorySlot = req.getParameter("MemorySlot");
		
		String driveSpecifications = req.getParameter("DriveSpecifications");
		String specifications = req.getParameter("Specifications");

		String cache = req.getParameter("Cache");
		String wRSpeed = req.getParameter("WRSpeed");
		
		String speed = req.getParameter("Speed");
		String gPU = req.getParameter("GPU");
		
		int pinNumber = req.getParameter("PinNumber")==null?0:Integer.parseInt(req.getParameter("PinNumber"));
		String memorySize = req.getParameter("MemorySize");
		
		String color = req.getParameter("Color");
		String size = req.getParameter("Size");
		
		String wattage = req.getParameter("Wattage");
		String noise = req.getParameter("Noise");
		
		int unitPrice=req.getParameter("UnitPrice")==null?0:Integer.parseInt(req.getParameter("UnitPrice"));
		int inventory=req.getParameter("Inventory")==null?0:Integer.parseInt(req.getParameter("Inventory"));
		
		String warranty = req.getParameter("Warranty");
		
		
		
		ProductBean productBean = new ProductBean(); //new一個bean物件
		productBean.setProductID(productID);  //用set存入
	
		productBean.setProductName(productName);
		productBean.setProductType(productType);
		
		productBean.setProductBrand(productBrand);
		productBean.setClock(clock);
		
		productBean.setChipset(chipset);
		productBean.setProcessorSocket(processorSocket);
		
		productBean.setCPUSlot(cPUSlot);
		productBean.setMemorySlot(memorySlot);
		
		productBean.setDriveSpecifications(driveSpecifications);
		productBean.setSpecifications(specifications);
		
		productBean.setCache(cache);
		productBean.setWRSpeed(wRSpeed);
		
		productBean.setSpeed(speed);
		productBean.setGPU(gPU);
		
		productBean.setPinNumber(pinNumber);
		productBean.setMemorySize(memorySize);
		
		productBean.setColor(color);
		productBean.setSize(size);

		productBean.setWattage(wattage);
		productBean.setNoise(noise);
		
		productBean.setUnitPrice(unitPrice);
		productBean.setInventory(inventory);
		
		productBean.setWarranty(warranty);
		
		ProductDB productDB = new ProductDB();
		
		try {
			productDB.addProduct(productBean);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 resp.sendRedirect("management/manageProduct.jsp");
		
	}

}
