package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.QnaVO;
import global.sesoc.Project_3jo.vo.SearchVO;

public interface adminQnaMapper {

	public int getTotal(SearchVO search);

	public ArrayList<QnaVO> listQna(SearchVO search, RowBounds rb);

	public QnaVO getQna(int q_num);

	public int insertQna(QnaVO qna);

	public int deleteQna(QnaVO qna);

	public ArrayList<FaqVO> callfaq(String select_cg);

	public int henji_qna(QnaVO qna);

}
