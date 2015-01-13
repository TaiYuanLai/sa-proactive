package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.MemberBean;
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
	
	public void modiProduct(String productName,String productBrand,String clock,String processorSocket,String specifications,String cache,int unitPrice,String warranty,String productID)throws Exception{
		String sql = "UPDATE product SET ProductName=?,ProductBrand=?,Clock=?,ProcessorSocket=?,Specifications=?,`Cache`=?,UnitPrice=?,Warranty=? WHERE ProductID = ?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		
		smt.setString(1, productName);
		smt.setString(2, productBrand);
		smt.setString(3, clock);
		smt.setString(4, processorSocket);
		
		smt.setString(5, specifications);
		smt.setString(6, cache);
		smt.setInt(7, unitPrice);
		smt.setString(8, warranty);
		smt.setString(9, productID);
		smt.execute();

		smt.close();
		conn.close();
	}
	
	public void minusInventorybyProduct(String productID,int quantity) throws Exception {
		String sql = "UPDATE product SET Inventory=Inventory-" + quantity + " WHERE ProductID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1,productID);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public void addSalesbyProduct(String productID,int quantity) throws Exception {
		String sql = "UPDATE product SET Sales=Sales+" + quantity + " WHERE ProductID=?";
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		smt.setString(1,productID);
		smt.execute();
		smt.close();
		conn.close();
	}
	
	public List<ProductBean> getRank(String productType) throws Exception {

		String sql = "SELECT ProductID FROM product WHERE ProductType='" + productType + "' ORDER BY Sales DESC LIMIT 3";
		List<ProductBean> allproduct = new ArrayList<ProductBean>();
		List<String> temp = new ArrayList<String>();
		conn = db.makeConnection();
		smt = conn.prepareStatement(sql);
		ResultSet rs2 = smt.executeQuery();
		while(rs2.next()){
			temp.add(rs2.getString("ProductID"));
		}
		
		for(int i=0;i<temp.size();i++){
			allproduct.add(this.getProduct(temp.get(i)));
		}
		
		
		smt.close();
		rs2.close();
		conn.close();
		return allproduct;
	}
	
	public void addProduct(ProductBean productBean) throws Exception{
		String sql = "INSERT INTO product(ProductID,ProductName,ProductType,ProductBrand,Clock,Chipset,ProcessorSocket,CPUSlot,MemorySlot,DriveSpecifications,Specifications,Cache,WRSpeed,Speed,GPU,PinNumber,MemorySize,Color,Size,Wattage,Noise,UnitPrice,Inventory,Sales,Warranty)" + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,?)"; 
		conn = db.makeConnection();
		
		smt=conn.prepareStatement(sql);
		smt.setString(1,productBean.getProductID());
		smt.setString(2,productBean.getProductName());
		smt.setString(3,productBean.getProductType());
		
		smt.setString(4,productBean.getProductBrand());
		smt.setString(5,productBean.getClock());
		
		smt.setString(6,productBean.getChipset());
		smt.setString(7,productBean.getProcessorSocket());
		
		smt.setString(8,productBean.getCPUSlot());
		smt.setString(9,productBean.getMemorySlot());
		
		smt.setString(10,productBean.getDriveSpecifications());
		smt.setString(11,productBean.getSpecifications());
		
		smt.setString(12,productBean.getCache());
		smt.setString(13,productBean.getWRSpeed());
		
		smt.setString(14,productBean.getSpeed());
		smt.setString(15,productBean.getGPU());
		
		smt.setInt(16,productBean.getPinNumber());
		smt.setString(17,productBean.getMemorySize());
		
		smt.setString(18,productBean.getColor());
		smt.setString(19,productBean.getSize());
		
		smt.setString(20,productBean.getWattage());
		smt.setString(21,productBean.getNoise());
		
		smt.setInt(22,productBean.getUnitPrice());
		smt.setInt(23,productBean.getInventory());

		smt.setString(24,productBean.getWarranty());
		
		
		smt.execute();
		smt.close();
		conn.close();
	}
	

}
