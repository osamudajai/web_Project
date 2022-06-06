package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.QnaVO;
import global.sesoc.Project_3jo.vo.SearchVO;


@Repository
public class adminQnaDAO {
	
	@Autowired
	SqlSession sqlSession;
	

	public int getTotal(SearchVO search) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}

	public ArrayList<QnaVO> listQna(SearchVO search, int startRecord, int countPerPage) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<QnaVO> qnalist = mapper.listQna(search, rb);
		return qnalist;
	}

	public QnaVO getQna(int q_num) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		//해당 번호의 글정보 읽기
		QnaVO qna = mapper.getQna(q_num);
		return qna;
	}

	public int insertQna(QnaVO qna) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		int result = mapper.insertQna(qna);
		return result;
	}
	
	public int deleteQna(QnaVO qna) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		int result = mapper.deleteQna(qna);
		return result;
	}

	public ArrayList<FaqVO> callfaq(String select_cg) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
		ArrayList<FaqVO> callFaq = null;
		try {
			callFaq = mapper.callfaq(select_cg);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return callFaq;
	}

	public int henji_qna(QnaVO qna) {
		adminQnaMapper mapper = sqlSession.getMapper(adminQnaMapper.class);
	      int result = mapper.henji_qna(qna);
		return result;
	}


}
