package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.SearchVO;



/**
 * FAQ 관련 Mybatis 사용 메서드
 */
public interface FaqMapper {

	//검색 후의 총 글 개수
	public int getTotal(SearchVO search);
	//검색 후의 현재 페이지 목록
	public ArrayList<FaqVO> listFaq(SearchVO search, RowBounds rb);
	//글번호로 해당 게시글 검색
	public FaqVO getFaq(int faq_num);
	//조회수 1 증가
	public void addHits(int faq_num);


}
