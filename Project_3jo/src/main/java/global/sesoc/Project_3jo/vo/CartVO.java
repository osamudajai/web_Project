package global.sesoc.Project_3jo.vo;

public class CartVO {
	 	private int cart_id;
		private String po_id;
	    private String pd_id;
	    private int amount;
	    private String pd_name;
	    private int pd_cost;
	    private int money;
	    private int totalmoney;
	    private String big_id;
		private String br_id;
		private String br_name;
		private String big_name;
		private String pd_img1;
		private int mlmoney;
		
	    
	    public CartVO() {}


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


		public int getAmount() {
			return amount;
		}


		public void setAmount(int amount) {
			this.amount = amount;
		}


		public String getPd_name() {
			return pd_name;
		}


		public void setPd_name(String pd_name) {
			this.pd_name = pd_name;
		}


		public int getPd_cost() {
			return pd_cost;
		}


		public void setPd_cost(int pd_cost) {
			this.pd_cost = pd_cost;
		}


		public int getMoney() {
			return money;
		}


		public void setMoney(int money) {
			this.money = money;
		}


		public int getTotalmoney() {
			return totalmoney;
		}


		public void setTotalmoney(int totalmoney) {
			this.totalmoney = totalmoney;
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


		public String getBr_name() {
			return br_name;
		}


		public void setBr_name(String br_name) {
			this.br_name = br_name;
		}


		public String getBig_name() {
			return big_name;
		}


		public void setBig_name(String big_name) {
			this.big_name = big_name;
		}


		public String getPd_img1() {
			return pd_img1;
		}


		public void setPd_img1(String pd_img1) {
			this.pd_img1 = pd_img1;
		}


		public int getMlmoney() {
			return mlmoney;
		}


		public void setMlmoney(int mlmoney) {
			this.mlmoney = mlmoney;
		}


		public CartVO(int cart_id, String po_id, String pd_id, int amount, String pd_name, int pd_cost, int money,
				int totalmoney, String big_id, String br_id, String br_name, String big_name, String pd_img1,
				int mlmoney) {
			super();
			this.cart_id = cart_id;
			this.po_id = po_id;
			this.pd_id = pd_id;
			this.amount = amount;
			this.pd_name = pd_name;
			this.pd_cost = pd_cost;
			this.money = money;
			this.totalmoney = totalmoney;
			this.big_id = big_id;
			this.br_id = br_id;
			this.br_name = br_name;
			this.big_name = big_name;
			this.pd_img1 = pd_img1;
			this.mlmoney = mlmoney;
		}


		@Override
		public String toString() {
			return "CartVO [cart_id=" + cart_id + ", po_id=" + po_id + ", pd_id=" + pd_id + ", amount=" + amount
					+ ", pd_name=" + pd_name + ", pd_cost=" + pd_cost + ", money=" + money + ", totalmoney="
					+ totalmoney + ", big_id=" + big_id + ", br_id=" + br_id + ", br_name=" + br_name + ", big_name="
					+ big_name + ", pd_img1=" + pd_img1 + ", mlmoney=" + mlmoney + "]";
		}



}
	   