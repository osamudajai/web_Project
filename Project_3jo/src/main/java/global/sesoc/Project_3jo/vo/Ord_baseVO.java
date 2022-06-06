package global.sesoc.Project_3jo.vo;

public class Ord_baseVO {
	private int cart_id;
	private String po_id;
	private String pd_id;
	private String pd_name;
	private int amount;
	private String big_id;
	private String big_name;
	private String br_name;
	private String br_id;
	private int money;
	private int pd_cost;
	private String pd_img1;
	private int r_boardnum;
	private int totalmoney;
	private int pd_save;
	private int savapoint;
	private String order_id;
	private String totalPrice;
	
	public Ord_baseVO() {
		
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	public String getPd_id() {
		return pd_id;
	}

	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

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

	public String getBr_name() {
		return br_name;
	}

	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}

	public String getBr_id() {
		return br_id;
	}

	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPd_cost() {
		return pd_cost;
	}

	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}

	public String getPd_img1() {
		return pd_img1;
	}

	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
	}

	public int getR_boardnum() {
		return r_boardnum;
	}

	public void setR_boardnum(int r_boardnum) {
		this.r_boardnum = r_boardnum;
	}

	public int getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(int totalmoney) {
		this.totalmoney = totalmoney;
	}

	public int getPd_save() {
		return pd_save;
	}

	public void setPd_save(int pd_save) {
		this.pd_save = pd_save;
	}

	public int getSavapoint() {
		return savapoint;
	}

	public void setSavapoint(int savapoint) {
		this.savapoint = savapoint;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Ord_baseVO(int cart_id, String po_id, String pd_id, String pd_name, int amount, String big_id,
			String big_name, String br_name, String br_id, int money, int pd_cost, String pd_img1, int r_boardnum,
			int totalmoney, int pd_save, int savapoint, String order_id, String totalPrice) {
		super();
		this.cart_id = cart_id;
		this.po_id = po_id;
		this.pd_id = pd_id;
		this.pd_name = pd_name;
		this.amount = amount;
		this.big_id = big_id;
		this.big_name = big_name;
		this.br_name = br_name;
		this.br_id = br_id;
		this.money = money;
		this.pd_cost = pd_cost;
		this.pd_img1 = pd_img1;
		this.r_boardnum = r_boardnum;
		this.totalmoney = totalmoney;
		this.pd_save = pd_save;
		this.savapoint = savapoint;
		this.order_id = order_id;
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Ord_baseVO [cart_id=" + cart_id + ", po_id=" + po_id + ", pd_id=" + pd_id + ", pd_name=" + pd_name
				+ ", amount=" + amount + ", big_id=" + big_id + ", big_name=" + big_name + ", br_name=" + br_name
				+ ", br_id=" + br_id + ", money=" + money + ", pd_cost=" + pd_cost + ", pd_img1=" + pd_img1
				+ ", r_boardnum=" + r_boardnum + ", totalmoney=" + totalmoney + ", pd_save=" + pd_save + ", savapoint="
				+ savapoint + ", order_id=" + order_id + ", totalPrice=" + totalPrice + "]";
	}

	
	
	
}
