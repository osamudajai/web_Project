package global.sesoc.Project_3jo.vo;

public class SearchVO {
	private String type = "1";
	private String searchText = "";
	private String po_id;
	private String pd_id;
	private String pd_name;
	

	public SearchVO() {
		
	}


	public SearchVO(String type, String searchText, String po_id, String pd_id, String pd_name) {
		super();
		this.type = type;
		this.searchText = searchText;
		this.po_id = po_id;
		this.pd_id = pd_id;
		this.pd_name = pd_name;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getSearchText() {
		return searchText;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
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


	@Override
	public String toString() {
		return "SearchVO [type=" + type + ", searchText=" + searchText + ", po_id=" + po_id + ", pd_id=" + pd_id
				+ ", pd_name=" + pd_name + "]";
	}
	
}
