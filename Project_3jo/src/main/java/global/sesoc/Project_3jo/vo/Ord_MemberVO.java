	package global.sesoc.Project_3jo.vo;

//수취인 정보 VO
public class Ord_MemberVO {
	private int r_boardnum;
	private String r_name;
	private String r_zip;
	private String r_add1;
	private String r_add2;
	private String r_phone1;
	private String r_phone2;
	private String r_msg;
	private String pd_img1;
	private int cart_id;
	private int totalprice;
	private String po_id;
	private String r_card;
	
	public Ord_MemberVO() {}

	public int getR_boardnum() {
		return r_boardnum;
	}

	public void setR_boardnum(int r_boardnum) {
		this.r_boardnum = r_boardnum;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_zip() {
		return r_zip;
	}

	public void setR_zip(String r_zip) {
		this.r_zip = r_zip;
	}

	public String getR_add1() {
		return r_add1;
	}

	public void setR_add1(String r_add1) {
		this.r_add1 = r_add1;
	}

	public String getR_add2() {
		return r_add2;
	}

	public void setR_add2(String r_add2) {
		this.r_add2 = r_add2;
	}

	public String getR_phone1() {
		return r_phone1;
	}

	public void setR_phone1(String r_phone1) {
		this.r_phone1 = r_phone1;
	}

	public String getR_phone2() {
		return r_phone2;
	}

	public void setR_phone2(String r_phone2) {
		this.r_phone2 = r_phone2;
	}

	public String getR_msg() {
		return r_msg;
	}

	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
	}

	public String getPd_img1() {
		return pd_img1;
	}

	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	public String getR_card() {
		return r_card;
	}

	public void setR_card(String r_card) {
		this.r_card = r_card;
	}

	@Override
	public String toString() {
		return "Ord_MemberVO [r_boardnum=" + r_boardnum + ", r_name=" + r_name + ", r_zip=" + r_zip + ", r_add1="
				+ r_add1 + ", r_add2=" + r_add2 + ", r_phone1=" + r_phone1 + ", r_phone2=" + r_phone2 + ", r_msg="
				+ r_msg + ", pd_img1=" + pd_img1 + ", cart_id=" + cart_id + ", totalprice=" + totalprice + ", po_id="
				+ po_id + ", r_card=" + r_card + "]";
	}

	public Ord_MemberVO(int r_boardnum, String r_name, String r_zip, String r_add1, String r_add2, String r_phone1,
			String r_phone2, String r_msg, String pd_img1, int cart_id, int totalprice, String po_id, String r_card) {
		super();
		this.r_boardnum = r_boardnum;
		this.r_name = r_name;
		this.r_zip = r_zip;
		this.r_add1 = r_add1;
		this.r_add2 = r_add2;
		this.r_phone1 = r_phone1;
		this.r_phone2 = r_phone2;
		this.r_msg = r_msg;
		this.pd_img1 = pd_img1;
		this.cart_id = cart_id;
		this.totalprice = totalprice;
		this.po_id = po_id;
		this.r_card = r_card;
	}

	
	
	
}