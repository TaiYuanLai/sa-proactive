package bean;

public class CartCombinationBean {
	/*-----database-----*/
	String CombinationID;
	String MemberAccount;
	int Quantity;
	/*-----other-----*/
	private int UnitPrice;
	public String getCombinationID() {
		return CombinationID;
	}
	public void setCombinationID(String combinationID) {
		CombinationID = combinationID;
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
