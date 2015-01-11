package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ProductBean;
import shared.JDBCUtil;

public class ProductDB {
	JDBCUtil db = new JDBCUtil();
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement smt = null;

	public List<ProductBean> getProductList() throws Exception {
		List<ProductBean> productList = new ArrayList<ProductBean>();
		String sql = "SELECT * FROM product";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		rs = smt.executeQuery();
		while (rs.next()) {
			ProductBean productBean = new ProductBean();
			productBean.setProductID(rs.getString("ProductID"));
			productBean.setProductName(rs.getString("ProductName"));
			productBean.setProductType(rs.getString("ProductType"));
			productBean.setProductBrand(rs.getString("ProductBrand"));
			productBean.setClock(rs.getString("Clock"));
			productBean.setChipset(rs.getString("Chipset"));
			productBean.setProcessorSocket(rs.getString("ProcessorSocket"));
			productBean.setCPUSlot(rs.getString("CPUSlot"));
			productBean.setMemorySlot(rs.getString("MemorySlot"));
			productBean.setDriveSpecifications(rs.getString("DriveSpecifications"));
			productBean.setSpecifications(rs.getString("Specifications"));
			productBean.setExpansionSlot(rs.getString("ExpansionSlot"));
			productBean.setCache(rs.getString("Cache"));
			productBean.setWRSpeed(rs.getString("WRSpeed"));
			productBean.setSpeed(rs.getString("Speed"));
			productBean.setGPU(rs.getString("GPU"));
			productBean.setPinNumber(rs.getInt("PinNumber"));
			productBean.setMemorySize(rs.getString("MemorySize"));
			productBean.setColor(rs.getString("Color"));
			productBean.setSize(rs.getString("Size"));
			productBean.setWattage(rs.getString("Wattage"));
			productBean.setNoise(rs.getString("Noise"));
			productBean.setUnitPrice(rs.getInt("UnitPrice"));
			productBean.setInventory(rs.getInt("Inventory"));
			productBean.setSales(rs.getInt("Sales"));
			productBean.setWarranty(rs.getString("Warranty"));
			productBean.setImage(rs.getString("Image"));
			productList.add(productBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return productList;
	}
	
	public ProductBean getProduct(String productID)throws Exception{
		ProductBean productBean = new ProductBean();
		String sql = "SELECT * FROM product WHERE ProductID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, productID);
		rs = smt.executeQuery();
		if(rs.next()){
			productBean.setProductID(productID);
			productBean.setProductName(rs.getString("ProductName"));
			productBean.setProductType(rs.getString("ProductType"));
			productBean.setProductBrand(rs.getString("ProductBrand"));
			productBean.setClock(rs.getString("Clock"));
			productBean.setChipset(rs.getString("Chipset"));
			productBean.setProcessorSocket(rs.getString("ProcessorSocket"));
			productBean.setCPUSlot(rs.getString("CPUSlot"));
			productBean.setMemorySlot(rs.getString("MemorySlot"));
			productBean.setDriveSpecifications(rs.getString("DriveSpecifications"));
			productBean.setSpecifications(rs.getString("Specifications"));
			productBean.setExpansionSlot(rs.getString("ExpansionSlot"));
			productBean.setCache(rs.getString("Cache"));
			productBean.setWRSpeed(rs.getString("WRSpeed"));
			productBean.setSpeed(rs.getString("Speed"));
			productBean.setGPU(rs.getString("GPU"));
			productBean.setPinNumber(rs.getInt("PinNumber"));
			productBean.setMemorySize(rs.getString("MemorySize"));
			productBean.setColor(rs.getString("Color"));
			productBean.setSize(rs.getString("Size"));
			productBean.setWattage(rs.getString("Wattage"));
			productBean.setNoise(rs.getString("Noise"));
			productBean.setUnitPrice(rs.getInt("UnitPrice"));
			productBean.setInventory(rs.getInt("Inventory"));
			productBean.setSales(rs.getInt("Sales"));
			productBean.setWarranty(rs.getString("Warranty"));
			productBean.setImage(rs.getString("Image"));
		}
		rs.close();
		smt.close();
		conn.close();
		return productBean;
		
	}
	
	public boolean checkCartByMemberAccount(String productID, String memberAccount) throws Exception {
		String sql = "SELECT MemberAccount FROM cart WHERE ProductID = ? AND MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, productID);
		smt.setString(2, memberAccount);
		rs = smt.executeQuery();
		boolean result = false;
		if (rs.next()) {
			result = true;
		}
		rs.close();
		smt.close();
		conn.close();
		return result;
	}
	
	public List<ProductBean> getProductListByMemberAccount(
			String memberAccount) throws Exception {
		String sql = "SELECT * FROM product a JOIN cart b ON a.ProductID = b.ProductID "
				+ "WHERE b.MemberAccount = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1, memberAccount);
		rs = smt.executeQuery();
		List<ProductBean> allproduct = new ArrayList<ProductBean>();
		while (rs.next()) {
			ProductBean productBean = new ProductBean();
			productBean.setProductID(rs.getString("ProductID"));
			productBean.setProductName(rs.getString("ProductName"));
			productBean.setProductType(rs.getString("ProductType"));
			productBean.setProductBrand(rs.getString("ProductBrand"));
			productBean.setClock(rs.getString("Clock"));
			productBean.setChipset(rs.getString("Chipset"));
			productBean.setProcessorSocket(rs.getString("ProcessorSocket"));
			productBean.setCPUSlot(rs.getString("CPUSlot"));
			productBean.setMemorySlot(rs.getString("MemorySlot"));
			productBean.setDriveSpecifications(rs.getString("DriveSpecifications"));
			productBean.setSpecifications(rs.getString("Specifications"));
			productBean.setExpansionSlot(rs.getString("ExpansionSlot"));
			productBean.setCache(rs.getString("Cache"));
			productBean.setWRSpeed(rs.getString("WRSpeed"));
			productBean.setSpeed(rs.getString("Speed"));
			productBean.setGPU(rs.getString("GPU"));
			productBean.setPinNumber(rs.getInt("PinNumber"));
			productBean.setMemorySize(rs.getString("MemorySize"));
			productBean.setColor(rs.getString("Color"));
			productBean.setSize(rs.getString("Size"));
			productBean.setWattage(rs.getString("Wattage"));
			productBean.setNoise(rs.getString("Noise"));
			productBean.setUnitPrice(rs.getInt("UnitPrice"));
			productBean.setInventory(rs.getInt("Inventory"));
			productBean.setSales(rs.getInt("Sales"));
			productBean.setWarranty(rs.getString("Warranty"));
			productBean.setImage(rs.getString("Image"));
			productBean.setQuantity(rs.getInt("Quantity"));
			allproduct.add(productBean);
		}
		rs.close();
		smt.close();
		conn.close();
		return allproduct;
	}
	
	public void delProduct(String productID) throws Exception{
		String sql = "DELETE FROM product WHERE ProductID=?";
		conn = db.makeConnection();
		smt=conn.prepareStatement(sql);
		smt.setString(1,productID);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public void minusInventorybyProduct(ProductBean productBean) throws Exception {
		String sql = "UPDATE product a JOIN shoppinglist b ON a.ProductID=b.ProductID SET a.Inventory=a.Inventory-b.Quantity WHERE b.ProductID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1,productBean.getProductID());
		smt.execute();
		smt.close();
		conn.close();
	}

}
