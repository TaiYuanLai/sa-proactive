package bean;

public class CartCustomerlizeBean {
	
	/*-----database-----*/
	
	private int CusID;
	private String MemberAccount;
	private int Quantity;
	/*-----other-----*/
	private int UnitPrice;
	
	public int getCusID() {
		return CusID;
	}
	public void setCusID(int cusID) {
		CusID = cusID;
	}
	public String getMemberAccount() {
		return MemberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		MemberAccount = memberAccount;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public int getUnitPrice() {
		return UnitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		UnitPrice = unitPrice;
	}
	
	
	
	
}
