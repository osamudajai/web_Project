package global.sesoc.Project_3jo.vo;

public class adminVO {
	
	String admin_id;					//회원 ID
	String password;			//비밀번호
	String name;
	
	public adminVO() {}
	
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "adminVO [admin_id=" + admin_id + ", password=" + password + ", name=" + name + "]";
	}
	public adminVO(String admin_id, String password, String name) {
		super();
		this.admin_id = admin_id;
		this.password = password;
		this.name = name;
	}	
	
	
	
}
