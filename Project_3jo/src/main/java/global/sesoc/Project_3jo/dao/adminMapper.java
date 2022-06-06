package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.adminVO;

public interface adminMapper {

	ArrayList<Ord_baseVO> selectorder(RowBounds rb);
	
	public adminVO getadmin(String admin_id);

	public int getTotal(SearchVO search);

	public ArrayList<NoticeVO> listNotice(SearchVO search, RowBounds rb);

	public int insert(NoticeVO notice);

	public NoticeVO getNotice(int nt_num);

	public void addHits(int nt_num);

	public void noticedelete(int nt_num);

	public int order_total();


}
