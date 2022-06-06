package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;

/**
 * Review 관련 Mybatis 사용 메서드
 */
public interface ReviewMapper {

	//전체 게시글 수
	public int getTotal(SearchVO search);
	//글 목록
	public ArrayList<ReviewVO> listReview(SearchVO search, RowBounds rb);
	//글 번호로 게시글 읽기
	public ReviewVO getReview(int rv_num);
	//글 저장
	public int insertReview(ReviewVO review);
	//글번호와 아이디로 해당 게시글 삭제
	public int deleteReview(ReviewVO review);
	//글 수정
	public int updateReview(ReviewVO review);

}
