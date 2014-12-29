package bean;

public class CombinationBean {
	/*-----database-----*/
	private String CombinationID;
	private String CombinationName;
	private String CombinationDescription;
	private int TotalPrice;
	private String ComImage;
	/*-----other-----*/
	private int Quantity;//from cart_combination
	
	public String getCombinationID() {
		return CombinationID;
	}
	public void setCombinationID(String combinationID) {
		CombinationID = combinationID;
	}
	public String getCombinationName() {
		return CombinationName;
	}
	public void setCombinationName(String combinationName) {
		CombinationName = combinationName;
	}
	public String getCombinationDescription() {
		return CombinationDescription;
	}
	public void setCombinationDescription(String combinationDescription) {
		CombinationDescription = combinationDescription;
	}
	public int getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getComImage() {
		return ComImage;
	}
	public void setComImage(String comImage) {
		ComImage = comImage;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}

}
