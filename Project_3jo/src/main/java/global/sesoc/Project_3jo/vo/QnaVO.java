package global.sesoc.Project_3jo.vo;

/**
 * 1:1문의 게시글 정보 VO
 */
public class QnaVO {
	int q_num;				//글번호
	String po_id;			//작성자=회원아이디
	String q_title;			//문의제목
	String q_content;		//문의내용
	String q_originalfile;	//첨부파일 원래이름
	String q_savedfile;		//첨부파일 저장된 이름
	String q_date;			//등록일
	String a_content;		//답변내용
	String a_date;			//답변일
	String a_status;		//답변상태
	String list_cg;			//분류
	

	public QnaVO() {
	}
	
	public QnaVO(int q_num, String po_id, String q_title, String q_content, String q_originalfile, String q_savedfile,
				 String q_date, String a_content, String a_date, String a_status, String list_cg) {
		this.q_num = q_num;
		this.po_id = po_id;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.a_content = a_content;
		this.a_date = a_date;
		this.a_status = a_status;
		this.list_cg =list_cg;
	}

	
	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	
	public String getQ_originalfile() {
		return q_originalfile;
	}

	public void setQ_originalfile(String q_originalfile) {
		this.q_originalfile = q_originalfile;
	}

	public String getQ_savedfile() {
		return q_savedfile;
	}

	public void setQ_savedfile(String q_savedfile) {
		this.q_savedfile = q_savedfile;
	}
	
	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	public String getA_status() {
		return a_status;
	}

	public void setA_status(String a_status) {
		this.a_status = a_status;
	}

	public String getList_cg() {
		return list_cg;
	}

	public void setList_cg(String list_cg) {
		this.list_cg = list_cg;
	}

	@Override
	public String toString() {
		return "QnaVO [q_num=" + q_num + ", po_id=" + po_id + ", q_title=" + q_title + ", q_content=" + q_content
				+ ", q_originalfile=" + q_originalfile + ", q_savedfile=" + q_savedfile + ", q_date=" + q_date
				+ ", a_content=" + a_content + ", a_date=" + a_date + ", a_status=" + a_status + ", list_cg=" + list_cg
				+ "]";
	}


}
