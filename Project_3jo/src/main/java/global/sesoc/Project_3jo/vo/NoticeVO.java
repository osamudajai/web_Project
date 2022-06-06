package global.sesoc.Project_3jo.vo;

/**
 * Notice 게시판 정보 VO
 */
public class NoticeVO {
	int nt_num;				//글번호  
	String nt_title;		//제목
	String nt_content;		//내용
	int nt_hits;			//조회수
	String nt_date;			//작성일

	public NoticeVO() {
	}  
	
	public NoticeVO(int nt_num, String nt_title, String nt_content, int nt_hits, String nt_date) {
		this.nt_num = nt_num;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.nt_hits = nt_hits;
		this.nt_date = nt_date;
	}

	public int getNt_num() {
		return nt_num;
	}

	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public int getNt_hits() {
		return nt_hits;
	}

	public void setNt_hits(int nt_hits) {
		this.nt_hits = nt_hits;
	}

	public String getNt_date() {
		return nt_date;
	}

	public void setNt_date(String nt_date) {
		this.nt_date = nt_date;
	}

	@Override
	public String toString() {
		return "NoticeVO [nt_num=" + nt_num + ", nt_title=" + nt_title + ", nt_content=" + nt_content + ", nt_hits=" + nt_hits
				+ ", nt_date=" + nt_date + "]";
	}
}
