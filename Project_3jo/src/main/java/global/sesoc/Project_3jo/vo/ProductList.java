package global.sesoc.Project_3jo.vo;

public class ProductList {
	private String big_name;	//대분류이름(ex.MEN WOMEN UNISEX ETC)
	private String big_img;		//대분류이미지
	private String big_desc;	//대분류설명text(text)
	private String br_name;		//브랜드이름(ex.PRADA HERMES)
	private String br_img;		//브랜드이미지
	private String br_desc;		//브랜드설명text(text)
	private String pd_img1;		//상품이미지
	private String pd_name;		//상품이름
	private int pd_cost;
	private String pd_id;
	private String season;      //계졀
	private String pd_date;
	   private String weather;      //날씨
	   private String age_birth;   //
	   private String scent;      //
	   private String pd_image;   //상품이미지
	   private String sunmoon;      //낮, 밤
	   private String gender;      //성별
	   private String sunmoon2;   //낮, 밤
	
	public ProductList ()	{}

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

	public String getBr_name() {
		return br_name;
	}

	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}

	public String getBr_img() {
		return br_img;
	}

	public void setBr_img(String br_img) {
		this.br_img = br_img;
	}

	public String getBr_desc() {
		return br_desc;
	}

	public void setBr_desc(String br_desc) {
		this.br_desc = br_desc;
	}

	public String getPd_img1() {
		return pd_img1;
	}

	public void setPd_img1(String pd_img1) {
		this.pd_img1 = pd_img1;
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

	public String getPd_id() {
		return pd_id;
	}

	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getPd_date() {
		return pd_date;
	}

	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
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

	@Override
	public String toString() {
		return "ProductList [big_name=" + big_name + ", big_img=" + big_img + ", big_desc=" + big_desc + ", br_name="
				+ br_name + ", br_img=" + br_img + ", br_desc=" + br_desc + ", pd_img1=" + pd_img1 + ", pd_name="
				+ pd_name + ", pd_cost=" + pd_cost + ", pd_id=" + pd_id + ", season=" + season + ", pd_date=" + pd_date
				+ ", weather=" + weather + ", age_birth=" + age_birth + ", scent=" + scent + ", pd_image=" + pd_image
				+ ", sunmoon=" + sunmoon + ", gender=" + gender + ", sunmoon2=" + sunmoon2 + "]";
	}

	public ProductList(String big_name, String big_img, String big_desc, String br_name, String br_img, String br_desc,
			String pd_img1, String pd_name, int pd_cost, String pd_id, String season, String pd_date, String weather,
			String age_birth, String scent, String pd_image, String sunmoon, String gender, String sunmoon2) {
		super();
		this.big_name = big_name;
		this.big_img = big_img;
		this.big_desc = big_desc;
		this.br_name = br_name;
		this.br_img = br_img;
		this.br_desc = br_desc;
		this.pd_img1 = pd_img1;
		this.pd_name = pd_name;
		this.pd_cost = pd_cost;
		this.pd_id = pd_id;
		this.season = season;
		this.pd_date = pd_date;
		this.weather = weather;
		this.age_birth = age_birth;
		this.scent = scent;
		this.pd_image = pd_image;
		this.sunmoon = sunmoon;
		this.gender = gender;
		this.sunmoon2 = sunmoon2;
	}

	
}