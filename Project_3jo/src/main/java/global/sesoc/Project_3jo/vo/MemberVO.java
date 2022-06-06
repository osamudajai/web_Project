package global.sesoc.Project_3jo.vo;

public class MemberVO {
	String po_id;					//회원 ID
	String password;			//비밀번호
	String name;				//회원 이름
	String birth;
	String phone;
	String email;
	String address;
	String address2;
	String address3;
	String gender;

	public MemberVO(String po_id, String password, String name, String birth, String phone, String email,
			String address, String address2, String address3, String gender) {
		super();
		this.po_id = po_id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.address2 = address2;
		this.address3 = address3;
		this.gender = gender;
	}

	public MemberVO() {
	}

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberVO [po_id=" + po_id + ", password=" + password + ", name=" + name + ", birth=" + birth
				+ ", phone=" + phone + ", email=" + email + ", address=" + address + ", address2=" + address2
				+ ", address3=" + address3 + ", gender=" + gender + "]";
	}
	

}
	