package global.sesoc.Project_3jo.vo;

public class ProductBig {

	private String big_id;
	private String big_name;
	private String big_img;
	private String big_desc;
	
	public ProductBig(String big_id, String big_name, String big_img, String big_desc) {
		super();
		this.big_id = big_id;
		this.big_name = big_name;
		this.big_img = big_img;
		this.big_desc = big_desc;
	}
	public ProductBig() {}
	public String getBig_id() {
		return big_id;
	}
	public void setBig_id(String big_id) {
		this.big_id = big_id;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	public String getBig_img() {
		return big_img;
	}
	public void setBig_img(String big_img) {
		this.big_img = big_img;
	}
	public String getBig_desc() {
		return big_desc;
	}
	public void setBig_desc(String big_desc) {
		this.big_desc = big_desc;
	}
	
	@Override
	public String toString() {
		return "ProductBig [big_id=" + big_id + ", big_name=" + big_name + ", big_img=" + big_img + ", big_desc="
				+ big_desc + ", getBig_id()=" + getBig_id() + ", getBig_name()=" + getBig_name() + ", getBig_img()="
				+ getBig_img() + ", getBig_desc()=" + getBig_desc() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
}