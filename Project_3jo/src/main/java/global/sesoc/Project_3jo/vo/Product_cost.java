package global.sesoc.Project_3jo.vo;

public class Product_cost {
	private int pd_cost;
	private float pd_dc;
	private float pd_save;
	private String pd_id;
	public Product_cost(int pd_cost, float pd_dc, float pd_save, String pd_id) {
		super();
		this.pd_cost = pd_cost;
		this.pd_dc = pd_dc;
		this.pd_save = pd_save;
		this.pd_id = pd_id;
	}
	public Product_cost() {}
	public int getPd_cost() {
		return pd_cost;
	}
	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}
	public float getPd_dc() {
		return pd_dc;
	}
	public void setPd_dc(float pd_dc) {
		this.pd_dc = pd_dc;
	}
	public float getPd_save() {
		return pd_save;
	}
	public void setPd_save(float pd_save) {
		this.pd_save = pd_save;
	}
	public String getPd_id() {
		return pd_id;
	}
	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}
	@Override
	public String toString() {
		return "Product_cost [pd_cost=" + pd_cost + ", pd_dc=" + pd_dc + ", pd_save=" + pd_save + ", pd_id=" + pd_id
				+ ", getPd_cost()=" + getPd_cost() + ", getPd_dc()=" + getPd_dc() + ", getPd_save()=" + getPd_save()
				+ ", getPd_id()=" + getPd_id() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
