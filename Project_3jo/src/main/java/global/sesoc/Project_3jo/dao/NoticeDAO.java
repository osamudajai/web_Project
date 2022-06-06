package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.SearchVO;

/**
 * Notice 관련 DAO
 */
@Repository
public class NoticeDAO {
	@Autowired
	SqlSession sqlSession;

	
	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param nt_num 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null.
	 */
	public NoticeVO getNotice(int nt_num) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		//해당 번호의 글정보 읽기
		NoticeVO notice = mapper.getNotice(nt_num);
		//조회수 1증가
		mapper.addHits(nt_num);
		return notice;
	}
	
	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	/*
	 * public int getTotal(String searchText) { NoticeMapper mapper =
	 * sqlSession.getMapper(NoticeMapper.class); int total =
	 * mapper.getTotal(searchText); return total; }
	 */
	
	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	public int getTotal(SearchVO search) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
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
	public ArrayList<NoticeVO> listNotice(SearchVO search, int startRecord, int countPerPage) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<NoticeVO> noticelist = mapper.listNotice(search, rb);
		return noticelist;
	}

}
