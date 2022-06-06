package global.sesoc.Project_3jo.vo;

public class ProductBrand {
	private String br_id;
	private String br_name;
	private String big_id;
	private String br_desc;
	private String br_img;
	public ProductBrand(String br_id, String br_name, String big_id, String br_desc, String br_img) {
		super();
		this.br_id = br_id;
		this.br_name = br_name;
		this.big_id = big_id;
		this.br_desc = br_desc;
		this.br_img = br_img;
	}
	public ProductBrand() {}
	public String getBr_id() {
		return br_id;
	}
	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public String getBig_id() {
		return big_id;
	}
	public void setBig_id(String big_id) {
		this.big_id = big_id;
	}
	public String getBr_desc() {
		return br_desc;
	}
	public void setBr_desc(String br_desc) {
		this.br_desc = br_desc;
	}
	public String getBr_img() {
		return br_img;
	}
	public void setBr_img(String br_img) {
		this.br_img = br_img;
	}
	@Override
	public String toString() {
		return "ProductBrand [br_id=" + br_id + ", br_name=" + br_name + ", big_id=" + big_id + ", br_desc=" + br_desc
				+ ", br_img=" + br_img + ", getBr_id()=" + getBr_id() + ", getBr_name()=" + getBr_name()
				+ ", getBig_id()=" + getBig_id() + ", getBr_desc()=" + getBr_desc() + ", getBr_img()=" + getBr_img()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
}
