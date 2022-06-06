package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.QnaVO;
import global.sesoc.Project_3jo.vo.SearchVO;

/**
 * 1:1문의 관련 DAO
 */
@Repository
public class QnaDAO {
	@Autowired
	SqlSession sqlSession;

	/**
	 * 검색 결과 레코드 수
	 * @param search 검색어
	 * @return 글개수
	 */
	public int getTotal(SearchVO search) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}

	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param searchText 검색어
	 * @param startRecord 전체 결과중 읽을 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 수 (한 페이지당 글 개수)
	 * @return 글목록
	 */
	public ArrayList<QnaVO> listQna(SearchVO search, int startRecord, int countPerPage) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<QnaVO> qnalist = mapper.listQna(search, rb);
		return qnalist;
	}

	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param q_num 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null.
	 */
	public QnaVO getQna(int q_num) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		//해당 번호의 글정보 읽기
		QnaVO qna = mapper.getQna(q_num);
		return qna;
	}

	/**
	 * 글 저장
	 * @param qna 저장할 게시글 정보
	 * @return 
	 * @return 저장된 레코드 수
	 */
	public int insertQna(QnaVO qna) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int result = mapper.insertQna(qna);
		return result;
	}

	/**
	 * 글 번호로 해당 게시글 삭제
	 * @param 삭제할 글 번호와 로그인 아이디가 포함된 정보
	 * @return 삭제된 글 개수
	 */
	public int deleteQna(QnaVO qna) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		int result = mapper.deleteQna(qna);
		return result;
	}

	//faq 목록 가져오기
	public ArrayList<FaqVO> callfaq(String select_cg) {
		QnaMapper mapper = sqlSession.getMapper(QnaMapper.class);
		ArrayList<FaqVO> callFaq = null;
		try {
			callFaq = mapper.callfaq(select_cg);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return callFaq;
	}	
	
}