package bean;

public class ManagerBean {
/*-----database-----*/
	
	private String ManagerAccount;
	private String ManagerPassword;
	private String ManagerName;
	/*-----other-----*/
	public String getManagerAccount() {
		return ManagerAccount;
	}
	public void setManagerAccount(String managerAccount) {
		ManagerAccount = managerAccount;
	}
	public String getManagerPassword() {
		return ManagerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		ManagerPassword = managerPassword;
	}
	public String getManagerName() {
		return ManagerName;
	}
	public void setManagerName(String managerName) {
		ManagerName = managerName;
	}		
}
