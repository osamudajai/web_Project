package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.QnaVO;
import global.sesoc.Project_3jo.vo.SearchVO;

/**
 * 1:1문의 관련 Mybatis 사용 메서드
 */
public interface QnaMapper {

	public int getTotal(SearchVO search);
	public ArrayList<QnaVO> listQna(SearchVO search, RowBounds rb);
	public QnaVO getQna(int q_num);
	public int insertQna(QnaVO qna);
	public int deleteQna(QnaVO qna);
	//faq 목록 일부 불러오기
	public ArrayList<FaqVO> callfaq(String select_cg);
	

}
