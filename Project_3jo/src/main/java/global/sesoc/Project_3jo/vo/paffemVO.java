package global.sesoc.Project_3jo.vo;

public class paffemVO {
	
	private String pd_id;
	private String big_id;
	private String br_id;
	private String br_name;
	private String big_name;
	private String pd_name;
	private int pd_dc;
	private int pd_cost;
	private int pd_save;
	private String pd_isview;
	private String pd_date;
	private String pd_img1;
	private String pd_img2;
	private String season;
	private String weather;
	private String age_birth;
	private String scent;
	private String pd_image;
	private String sunmoon;
	private String gender;
	private String sunmoon2;

	public paffemVO()	{}

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

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public int getPd_dc() {
		return pd_dc;
	}

	public void setPd_dc(int pd_dc) {
		this.pd_dc = pd_dc;
	}

	public int getPd_cost() {
		return pd_cost;
	}

	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}

	public int getPd_save() {
		return pd_save;
	}

	public void setPd_save(int pd_save) {
		this.pd_save = pd_save;
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

	@Override
	public String toString() {
		return "paffemVO [pd_id=" + pd_id + ", big_id=" + big_id + ", br_id=" + br_id + ", br_name=" + br_name
				+ ", big_name=" + big_name + ", pd_name=" + pd_name + ", pd_dc=" + pd_dc + ", pd_cost=" + pd_cost
				+ ", pd_save=" + pd_save + ", pd_isview=" + pd_isview + ", pd_date=" + pd_date + ", pd_img1=" + pd_img1
				+ ", pd_img2=" + pd_img2 + ", season=" + season + ", weather=" + weather + ", age_birth=" + age_birth
				+ ", scent=" + scent + ", pd_image=" + pd_image + ", sunmoon=" + sunmoon + ", gender=" + gender
				+ ", sunmoon2=" + sunmoon2 + "]";
	}

	public paffemVO(String pd_id, String big_id, String br_id, String br_name, String big_name, String pd_name,
			int pd_dc, int pd_cost, int pd_save, String pd_isview, String pd_date, String pd_img1, String pd_img2,
			String season, String weather, String age_birth, String scent, String pd_image, String sunmoon,
			String gender, String sunmoon2) {
		super();
		this.pd_id = pd_id;
		this.big_id = big_id;
		this.br_id = br_id;
		this.br_name = br_name;
		this.big_name = big_name;
		this.pd_name = pd_name;
		this.pd_dc = pd_dc;
		this.pd_cost = pd_cost;
		this.pd_save = pd_save;
		this.pd_isview = pd_isview;
		this.pd_date = pd_date;
		this.pd_img1 = pd_img1;
		this.pd_img2 = pd_img2;
		this.season = season;
		this.weather = weather;
		this.age_birth = age_birth;
		this.scent = scent;
		this.pd_image = pd_image;
		this.sunmoon = sunmoon;
		this.gender = gender;
		this.sunmoon2 = sunmoon2;
	}

	
}
