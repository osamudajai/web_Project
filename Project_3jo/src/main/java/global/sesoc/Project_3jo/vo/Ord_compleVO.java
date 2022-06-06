package global.sesoc.Project_3jo.vo;

public class Ord_compleVO {
	
	private String po_id;
	private String pd_id;
	private int amount;
	private int money;
	private String order_id;
	private int r_boardnum;
	private String cart_id;
	
	public Ord_compleVO() {}

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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public int getR_boardnum() {
		return r_boardnum;
	}

	public void setR_boardnum(int r_boardnum) {
		this.r_boardnum = r_boardnum;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	@Override
	public String toString() {
		return "Ord_compleVO [po_id=" + po_id + ", pd_id=" + pd_id + ", amount=" + amount + ", money=" + money
				+ ", order_id=" + order_id + ", r_boardnum=" + r_boardnum + ", cart_id=" + cart_id + "]";
	}

	public Ord_compleVO(String po_id, String pd_id, int amount, int money, String order_id, int r_boardnum,
			String cart_id) {
		super();
		this.po_id = po_id;
		this.pd_id = pd_id;
		this.amount = amount;
		this.money = money;
		this.order_id = order_id;
		this.r_boardnum = r_boardnum;
		this.cart_id = cart_id;
	}
	
	
	
}