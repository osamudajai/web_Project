package global.sesoc.Project_3jo.vo;

/**
 * Review 게시판 정보 VO
 */
public class ReviewVO {
	int rv_num;				//글번호
	String pd_id;			//상품 ID
	String pd_name;			//상품명
	String po_id;			//작성자
	String rv_title;		//후기제목
	String rv_content;		//후기내용
	String rv_originalfile;	//첨부파일 원래이름
	String rv_savedfile;	//첨부파일 저장된 이름
	String rv_date;			//작성일

	public ReviewVO() {
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
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

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public String getRv_originalfile() {
		return rv_originalfile;
	}

	public void setRv_originalfile(String rv_originalfile) {
		this.rv_originalfile = rv_originalfile;
	}

	public String getRv_savedfile() {
		return rv_savedfile;
	}

	public void setRv_savedfile(String rv_savedfile) {
		this.rv_savedfile = rv_savedfile;
	}

	public String getRv_date() {
		return rv_date;
	}

	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}

	public ReviewVO(int rv_num, String pd_id, String pd_name, String po_id, String rv_title, String rv_content,
			String rv_originalfile, String rv_savedfile, String rv_date) {
		super();
		this.rv_num = rv_num;
		this.pd_id = pd_id;
		this.pd_name = pd_name;
		this.po_id = po_id;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
		this.rv_originalfile = rv_originalfile;
		this.rv_savedfile = rv_savedfile;
		this.rv_date = rv_date;
	}

	@Override
	public String toString() {
		return "ReviewVO [rv_num=" + rv_num + ", pd_id=" + pd_id + ", pd_name=" + pd_name + ", po_id=" + po_id
				+ ", rv_title=" + rv_title + ", rv_content=" + rv_content + ", rv_originalfile=" + rv_originalfile
				+ ", rv_savedfile=" + rv_savedfile + ", rv_date=" + rv_date + "]";
	}
	
	
}
