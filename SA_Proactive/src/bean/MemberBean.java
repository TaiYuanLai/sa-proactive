package bean;

public class MemberBean {
	
	/*-----database-----*/
	
	private String MemberAccount;
	private String MemberPassword;
	private String MemberName;
	
	/*-----other-----*/
	
	public String getMemberAccount() {
		return MemberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		MemberAccount = memberAccount;
	}
	public String getMemberPassword() {
		return MemberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		MemberPassword = memberPassword;
	}
	public String getMemberName() {
		return MemberName;
	}
	public void setMemberName(String memberName) {
		MemberName = memberName;
	}

}
