package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.SearchVO;

public interface adminfaqMapper {

	public int getTotal(SearchVO search);

	public ArrayList<FaqVO> listFaq(SearchVO search, RowBounds rb);

	public FaqVO getFaq(int faq_num);

	public void addHits(int faq_num);

	public int insert(FaqVO faq);

	public void faqdelete(int faq_num);

}
