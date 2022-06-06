package global.sesoc.Project_3jo.vo;

public class Product_ml {
	private String ml_id1;
	private String ml_id2;
	private String ml_id3;
	private int ml_price1;
	private int ml_price2;
	private int ml_price3;
	private String pd_id;
	public Product_ml(String ml_id1,String ml_id2,String ml_id3, int ml_price1,int ml_price2,int ml_price3, String pd_id) {
		super();
		this.ml_id1 = ml_id1;
		this.ml_id1 = ml_id2;
		this.ml_id1 = ml_id3;
		this.ml_price1 = ml_price1;
		this.ml_price1 = ml_price2;
		this.ml_price1 = ml_price3;
		this.pd_id = pd_id;
	}
	
	public Product_ml() {}

	public String getMl_id1() {
		return ml_id1;
	}

	public void setMl_id1(String ml_id1) {
		this.ml_id1 = ml_id1;
	}

	public String getMl_id2() {
		return ml_id2;
	}

	public void setMl_id2(String ml_id2) {
		this.ml_id2 = ml_id2;
	}

	public String getMl_id3() {
		return ml_id3;
	}

	public void setMl_id3(String ml_id3) {
		this.ml_id3 = ml_id3;
	}

	public int getMl_price1() {
		return ml_price1;
	}

	public void setMl_price1(int ml_price1) {
		this.ml_price1 = ml_price1;
	}

	public int getMl_price2() {
		return ml_price2;
	}

	public void setMl_price2(int ml_price2) {
		this.ml_price2 = ml_price2;
	}

	public int getMl_price3() {
		return ml_price3;
	}

	public void setMl_price3(int ml_price3) {
		this.ml_price3 = ml_price3;
	}

	public String getPd_id() {
		return pd_id;
	}

	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}

	@Override
	public String toString() {
		return "Product_ml [ml_id1=" + ml_id1 + ", ml_id2=" + ml_id2 + ", ml_id3=" + ml_id3 + ", ml_price1=" + ml_price1
				+ ", ml_price2=" + ml_price2 + ", ml_price3=" + ml_price3 + ", pd_id=" + pd_id + ", getMl_id1()="
				+ getMl_id1() + ", getMl_id2()=" + getMl_id2() + ", getMl_id3()=" + getMl_id3() + ", getMl_price1()="
				+ getMl_price1() + ", getMl_price2()=" + getMl_price2() + ", getMl_price3()=" + getMl_price3()
				+ ", getPd_id()=" + getPd_id() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
