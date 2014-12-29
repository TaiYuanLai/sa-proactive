package bean;

public class CartBean {
	/*-----database-----*/
	private String MemberAccount;
	private String ProductID;
	private int Quantity;
	/*-----other-----*/
	public String getMemberAccount() {
		return MemberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		MemberAccount = memberAccount;
	}
	public String getProductID() {
		return ProductID;
	}
	public void setProductID(String productID) {
		ProductID = productID;
	}
	
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	
}
