package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.SearchVO;


/**
 * 공지사항 글 관련 Mybatis 사용 메서드
 */
public interface NoticeMapper {
	
	//글번호로 해당 게시글 검색
	public NoticeVO getNotice(int nt_num);
	//조회수 1 증가
	public void addHits(int nt_num);
	//검색 후의 총 글 개수
	public int getTotal(SearchVO search);
	//검색 후의 현재 페이지 목록
	public ArrayList<NoticeVO> listNotice(SearchVO search, RowBounds rb);

	
}
