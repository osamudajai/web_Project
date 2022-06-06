package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;


/**
 * Review 관련 DAO
 */
@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sqlSession;

	//구매후기글 수
	public int getTotal(SearchVO search) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}
	
	//구매후기 목록
	public ArrayList<ReviewVO> listReview(SearchVO search, int startRecord, int countPerPage) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		//전체 검색 결과 중 읽을 시작 위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		//검색어와 읽을 범위를 전달
		ArrayList<ReviewVO> reviewlist = mapper.listReview(search, rb);
		return reviewlist;
	}

	//글번호로 게시글 읽기
	public ReviewVO getReview(int rv_num) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		ReviewVO review = mapper.getReview(rv_num);
		return review;
	}
	
	/**
	 * 글 저장
	 * @param review 저장할 게시글 정보
	 * @return 저장된 레코드 수
	 */
	public int insertReview(ReviewVO review) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int result = mapper.insertReview(review);
		return result;
	}
	
	/**
	 * 글 번호로 해당 게시글 삭제
	 * @param 삭제할 글 번호와 로그인 아이디가 포함된 정보
	 * @return 삭제된 글 개수
	 */
	public int deleteReview(ReviewVO review) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int result = mapper.deleteReview(review);
		return result;
	}

	/**
	 * 게시글 수정
	 * @param review 수정할 글 정보
	 * @return 수정된 글 개수
	 */
	public int updateReview(ReviewVO review) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		int result = mapper.updateReview(review);
		return result;
	}
}