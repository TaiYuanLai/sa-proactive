package bean;

public class ShoppingListCombinationBean {
	/*-----database-----*/
	private int OrderID;
	private String CombinationID;
	private int UnitPrice;
	private int Quantity;
	/*-----other-----*/
	private String CombinationName;
	private String ComImage;
	
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getCombinationID() {
		return CombinationID;
	}
	public void setCombinationID(String combinationID) {
		CombinationID = combinationID;
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
	public String getCombinationName() {
		return CombinationName;
	}
	public void setCombinationName(String combinationName) {
		CombinationName = combinationName;
	}
	public String getComImage() {
		return ComImage;
	}
	public void setComImage(String comImage) {
		ComImage = comImage;
	}
	
	
	
}
