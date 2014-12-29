package bean;

public class OrderBean {
	
	/*-----database-----*/
	
	private int OrderID;
	private String MemberAccount;
	private String OrderDate;
	private int TotalPrice;
	private int OrderState;
	private String OrderAddress;
	private String OrderPhone;
	private String Payway;
	
	/*-----other-----*/
	
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getMemberAccount() {
		return MemberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		MemberAccount = memberAccount;
	}
	public String getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}
	public int getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}
	public int getOrderState() {
		return OrderState;
	}
	public void setOrderState(int orderState) {
		OrderState = orderState;
	}
	public String getOrderAddress() {
		return OrderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		OrderAddress = orderAddress;
	}
	public String getOrderPhone() {
		return OrderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		OrderPhone = orderPhone;
	}
	public String getPayway() {
		return Payway;
	}
	public void setPayway(String payway) {
		Payway = payway;
	}
	
	

}
