package global.sesoc.Project_3jo.vo;

public class ProductInfo {
	private String pd_id;
	private String big_id;
	private String br_id;
	private String pd_name;
	private String pd_img1;
	private String pd_img2;
	private String desc_img;
	private int pd_stock;
	private String pd_isview;
	private String pd_date;
	public ProductInfo(String pd_id, String big_id, String br_id, String pd_name, String pd_img1, String pd_img2,
			String desc_img, int pd_stock, String pd_isview, String pd_date) {
		super();
		this.pd_id = pd_id;
		this.big_id = big_id;
		this.br_id = br_id;
		this.pd_name = pd_name;
		this.pd_img1 = pd_img1;
		this.pd_img2 = pd_img2;
		this.desc_img = desc_img;
		this.pd_stock = pd_stock;
		this.pd_isview = pd_isview;
		this.pd_date = pd_date;
	}
	public ProductInfo() {}
	public String getPd_id() {
		return pd_id;
	}
	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}
	public String getBig_id() {
		return big_id;
	}
	public void setBig_id(String big_id) {
		this.big_id = big_id;
	}
	public String getBr_id() {
		return br_id;
	}
	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_img1() {
		return pd_img1;
	}
	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
	}
	public String getPd_img2() {
		return pd_img2;
	}
	public void setPd_img2(String pd_img2) {
		this.pd_img2 = pd_img2;
	}
	public String getDesc_img() {
		return desc_img;
	}
	public void setDesc_img(String desc_img) {
		this.desc_img = desc_img;
	}
	public int getPd_stock() {
		return pd_stock;
	}
	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}
	public String getPd_isview() {
		return pd_isview;
	}
	public void setPd_isview(String pd_isview) {
		this.pd_isview = pd_isview;
	}
	public String getPd_date() {
		return pd_date;
	}
	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
	}
	@Override
	public String toString() {
		return "ProductInfo [pd_id=" + pd_id + ", big_id=" + big_id + ", br_id=" + br_id + ", pd_name=" + pd_name
				+ ", pd_img1=" + pd_img1 + ", pd_img2=" + pd_img2 + ", desc_img=" + desc_img + ", pd_stock=" + pd_stock
				+ ", pd_isview=" + pd_isview + ", pd_date=" + pd_date + ", getPd_id()=" + getPd_id() + ", getBig_id()="
				+ getBig_id() + ", getBr_id()=" + getBr_id() + ", getPd_name()=" + getPd_name() + ", getPd_img1()="
				+ getPd_img1() + ", getPd_img2()=" + getPd_img2() + ", getDesc_img()=" + getDesc_img()
				+ ", getPd_stock()=" + getPd_stock() + ", getPd_isview()=" + getPd_isview() + ", getPd_date()="
				+ getPd_date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
