package bean;

public class ShoppingListCustomerlizeBean {
	/*-----database-----*/
	private int OrderID;
	private String CusID;
	private int UnitPrice;
	private int Quantity;
	/*-----other-----*/
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getCusID() {
		return CusID;
	}
	public void setCusID(String cusID) {
		CusID = cusID;
	}
	public int getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		UnitPrice = unitPrice;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	
	
	
	

}
