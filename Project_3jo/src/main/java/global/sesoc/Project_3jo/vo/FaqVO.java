package global.sesoc.Project_3jo.vo;

/**
 * FAQ 게시글 정보 VO
 */
public class FaqVO {
	int faq_num;			//글번호
	String faq_title;		//질문 제목
	String faq_content;		//답변 내용
	String list_cg;			//분류
	int faq_hits;			//조회수


	public FaqVO() {
	}
	
	public FaqVO(String faq_title, String faq_content, String list_cg) {
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.list_cg = list_cg;
	}

	
	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getList_cg() {
		return list_cg;
	}

	public void setList_cg(String list_cg) {
		this.list_cg = list_cg;
	}
	
	public int getFaq_hits() {
		return faq_hits;
	}

	public void setFaq_hits(int faq_hits) {
		this.faq_hits = faq_hits;
	}

	@Override
	public String toString() {
		return "FaqVO [faq_num=" + faq_num + ", faq_title=" + faq_title + ", faq_content=" + faq_content + ", list_cg="
				+ list_cg + ", faq_hits=" + faq_hits + "]";
	}
	
}
