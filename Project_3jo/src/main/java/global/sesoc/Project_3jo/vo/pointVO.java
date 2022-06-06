package global.sesoc.Project_3jo.vo;

public class pointVO {
	
	public int idx;
	public String po_id;
	public String usedate;
	public String rmdate;
	public int usepoint;
	public int rmpoint;
	public String kind;
	public int po_use;
	public int savapoint;
	public int all_use;
	public int all_rm;
	
	public pointVO() {}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPo_id() {
		return po_id;
	}

	public void setPo_id(String po_id) {
		this.po_id = po_id;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String usedate) {
		this.usedate = usedate;
	}

	public String getRmdate() {
		return rmdate;
	}

	public void setRmdate(String rmdate) {
		this.rmdate = rmdate;
	}

	public int getUsepoint() {
		return usepoint;
	}

	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}

	public int getRmpoint() {
		return rmpoint;
	}

	public void setRmpoint(int rmpoint) {
		this.rmpoint = rmpoint;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getPo_use() {
		return po_use;
	}

	public void setPo_use(int po_use) {
		this.po_use = po_use;
	}

	public int getSavapoint() {
		return savapoint;
	}

	public void setSavapoint(int savapoint) {
		this.savapoint = savapoint;
	}

	public int getAll_use() {
		return all_use;
	}

	public void setAll_use(int all_use) {
		this.all_use = all_use;
	}

	public int getAll_rm() {
		return all_rm;
	}

	public void setAll_rm(int all_rm) {
		this.all_rm = all_rm;
	}

	@Override
	public String toString() {
		return "pointVO [idx=" + idx + ", po_id=" + po_id + ", usedate=" + usedate + ", rmdate=" + rmdate
				+ ", usepoint=" + usepoint + ", rmpoint=" + rmpoint + ", kind=" + kind + ", po_use=" + po_use
				+ ", savapoint=" + savapoint + ", all_use=" + all_use + ", all_rm=" + all_rm + "]";
	}

	public pointVO(int idx, String po_id, String usedate, String rmdate, int usepoint, int rmpoint, String kind,
			int po_use, int savapoint, int all_use, int all_rm) {
		super();
		this.idx = idx;
		this.po_id = po_id;
		this.usedate = usedate;
		this.rmdate = rmdate;
		this.usepoint = usepoint;
		this.rmpoint = rmpoint;
		this.kind = kind;
		this.po_use = po_use;
		this.savapoint = savapoint;
		this.all_use = all_use;
		this.all_rm = all_rm;
	}

}
