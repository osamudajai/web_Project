package global.sesoc.Project_3jo.vo;

public class ProductDetail {
	private String pd_id;		//상품아이디
	private String big_id;		//대분류아이디
	private String big_name;	//대분류이름
	private String br_id;		//브랜드아이디
	private String br_name;		//브랜드이름
	private String pd_name;		//상품이름
	private String pd_img1;		//상품이미지
	private String desc_img;	//상품설명이미지
	private int pd_cost;		//상품가격
	private int pdCnt;			//수량
	private int pd_stock;		//재고량
	private String ml_id1;		//용량1ID
	private String ml_id2;		//용량2ID
	private String ml_id3;		//용량3ID
	private int ml_price1;		//용량가격1
	private int ml_price2;		//용량가격2
	private int ml_price3;		//용량가격3
	private float pd_dc;		//할인율
	private float pd_save;		//적립율
	private int origin_cost;
	private String season;      //계졀
	   private String weather;      //날씨
	   private String age_birth;   //
	   private String scent;      //
	   private String pd_image;   //상품이미지
	   private String sunmoon;      //낮, 밤
	   private String gender;      //성별
	   private String sunmoon2;   //낮, 밤
	
	
	public ProductDetail () {}


	@Override
	public String toString() {
		return "ProductDetail [pd_id=" + pd_id + ", big_id=" + big_id + ", big_name=" + big_name + ", br_id=" + br_id
				+ ", br_name=" + br_name + ", pd_name=" + pd_name + ", pd_img1=" + pd_img1 + ", desc_img=" + desc_img
				+ ", pd_cost=" + pd_cost + ", pdCnt=" + pdCnt + ", pd_stock=" + pd_stock + ", ml_id1=" + ml_id1
				+ ", ml_id2=" + ml_id2 + ", ml_id3=" + ml_id3 + ", ml_price1=" + ml_price1 + ", ml_price2=" + ml_price2
				+ ", ml_price3=" + ml_price3 + ", pd_dc=" + pd_dc + ", pd_save=" + pd_save + ", origin_cost="
				+ origin_cost + ", season=" + season + ", weather=" + weather + ", age_birth=" + age_birth + ", scent="
				+ scent + ", pd_image=" + pd_image + ", sunmoon=" + sunmoon + ", gender=" + gender + ", sunmoon2="
				+ sunmoon2 + "]";
	}


	public ProductDetail(String pd_id, String big_id, String big_name, String br_id, String br_name, String pd_name,
			String pd_img1, String desc_img, int pd_cost, int pdCnt, int pd_stock, String ml_id1, String ml_id2,
			String ml_id3, int ml_price1, int ml_price2, int ml_price3, float pd_dc, float pd_save, int origin_cost,
			String season, String weather, String age_birth, String scent, String pd_image, String sunmoon,
			String gender, String sunmoon2) {
		super();
		this.pd_id = pd_id;
		this.big_id = big_id;
		this.big_name = big_name;
		this.br_id = br_id;
		this.br_name = br_name;
		this.pd_name = pd_name;
		this.pd_img1 = pd_img1;
		this.desc_img = desc_img;
		this.pd_cost = pd_cost;
		this.pdCnt = pdCnt;
		this.pd_stock = pd_stock;
		this.ml_id1 = ml_id1;
		this.ml_id2 = ml_id2;
		this.ml_id3 = ml_id3;
		this.ml_price1 = ml_price1;
		this.ml_price2 = ml_price2;
		this.ml_price3 = ml_price3;
		this.pd_dc = pd_dc;
		this.pd_save = pd_save;
		this.origin_cost = origin_cost;
		this.season = season;
		this.weather = weather;
		this.age_birth = age_birth;
		this.scent = scent;
		this.pd_image = pd_image;
		this.sunmoon = sunmoon;
		this.gender = gender;
		this.sunmoon2 = sunmoon2;
	}


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


	public String getBig_name() {
		return big_name;
	}


	public void setBig_name(String big_name) {
		this.big_name = big_name;
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


	public String getDesc_img() {
		return desc_img;
	}


	public void setDesc_img(String desc_img) {
		this.desc_img = desc_img;
	}


	public int getPd_cost() {
		return pd_cost;
	}


	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}


	public int getPdCnt() {
		return pdCnt;
	}


	public void setPdCnt(int pdCnt) {
		this.pdCnt = pdCnt;
	}


	public int getPd_stock() {
		return pd_stock;
	}


	public void setPd_stock(int pd_stock) {
		this.pd_stock = pd_stock;
	}


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


	public int getOrigin_cost() {
		return origin_cost;
	}


	public void setOrigin_cost(int origin_cost) {
		this.origin_cost = origin_cost;
	}


	public String getSeason() {
		return season;
	}


	public void setSeason(String season) {
		this.season = season;
	}


	public String getWeather() {
		return weather;
	}


	public void setWeather(String weather) {
		this.weather = weather;
	}


	public String getAge_birth() {
		return age_birth;
	}


	public void setAge_birth(String age_birth) {
		this.age_birth = age_birth;
	}


	public String getScent() {
		return scent;
	}


	public void setScent(String scent) {
		this.scent = scent;
	}


	public String getPd_image() {
		return pd_image;
	}


	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}


	public String getSunmoon() {
		return sunmoon;
	}


	public void setSunmoon(String sunmoon) {
		this.sunmoon = sunmoon;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getSunmoon2() {
		return sunmoon2;
	}


	public void setSunmoon2(String sunmoon2) {
		this.sunmoon2 = sunmoon2;
	}


}
