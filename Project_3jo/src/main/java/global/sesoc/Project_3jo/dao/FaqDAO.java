package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.SearchVO;




/**
 * FAQ 관련 DAO
 */
@Repository
public class FaqDAO {
	@Autowired
	SqlSession sqlSession;

	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	public int getTotal(SearchVO search) {
		FaqMapper mapper = sqlSession.getMapper(FaqMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}

	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param search 검색어
	 * @param startRecord 전체 결과중 읽을 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 수 (한 페이지당 글 개수)
	 * @return 글목록
	 */
	public ArrayList<FaqVO> listFaq(SearchVO search, int startRecord, int countPerPage) {
		FaqMapper mapper = sqlSession.getMapper(FaqMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<FaqVO> faqlist = mapper.listFaq(search, rb);
		return faqlist;
	}

	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param faq_num 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null.
	 */
	public FaqVO getFaq(int faq_num) {
		FaqMapper mapper = sqlSession.getMapper(FaqMapper.class);
		//해당 번호의 글정보 읽기
		FaqVO faq = mapper.getFaq(faq_num);
		
		//조회수 1증가
		/* mapper.addHits(faq_num); */
		
		return faq;
	}

	/*
	 * 글 번호로 addHits 주기
	 * */
	public void addHits(int faq_num) {
		FaqMapper mapper = sqlSession.getMapper(FaqMapper.class);
		//조회수 1증가
		mapper.addHits(faq_num);
		
		return ;
	}


}
