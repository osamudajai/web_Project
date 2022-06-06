package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.SearchVO;

@Repository
public class adminfaqDAO {
	
	@Autowired
	SqlSession sqlSession;

	public int getTotal(SearchVO search) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}

	public ArrayList<FaqVO> listFaq(SearchVO search, int startRecord, int countPerPage) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<FaqVO> faqlist = mapper.listFaq(search, rb);
		return faqlist;
	}

	public FaqVO getFaq(int faq_num) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		//해당 번호의 글정보 읽기
		FaqVO faq = mapper.getFaq(faq_num);
		
		//조회수 1증가
		/* mapper.addHits(faq_num); */
		
		return faq;
	}
	public void addHits(int faq_num) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		//조회수 1증가
		mapper.addHits(faq_num);
		
		return ;
	}

	public int faq_insert(FaqVO faq) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		int result = 0;

		result = mapper.insert(faq);
		return result;
	}

	public void faqdelete(int faq_num) {
		adminfaqMapper mapper = sqlSession.getMapper(adminfaqMapper.class);
		mapper.faqdelete(faq_num);
		
	}


}
