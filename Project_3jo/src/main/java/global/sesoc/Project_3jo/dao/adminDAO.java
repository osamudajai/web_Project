package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.controller.adminController;
import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.adminVO;

@Repository
public class adminDAO {
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Autowired
	SqlSession sqlSession;

	public ArrayList<Ord_baseVO> selectorder(int startRecord, int countPerPage) {
			adminMapper mapper = sqlSession.getMapper(adminMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<Ord_baseVO> base = mapper.selectorder(rb);
			
			logger.debug("가져온값 값{}", base);
			
			return base;
		}

	public adminVO getadmin(String admin_id) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		adminVO admin = mapper.getadmin(admin_id);
		return admin;
	}

	public int getTotal(SearchVO search) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		int total = mapper.getTotal(search);
		return total;
	}
	
	public ArrayList<NoticeVO> listNotice(SearchVO search, int startRecord, int countPerPage) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		//검색어와 읽을 범위를 전달
		ArrayList<NoticeVO> noticelist = mapper.listNotice(search, rb);
		return noticelist;
	}

	public int insert(NoticeVO notice) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		int result = 0;

		result = mapper.insert(notice);
		return result;
	}

	public NoticeVO getNotice(int nt_num) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		//해당 번호의 글정보 읽기
		NoticeVO notice = mapper.getNotice(nt_num);
		//조회수 1증가
		mapper.addHits(nt_num);
		return notice;
	}

	public void noticedelete(int nt_num) {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
	mapper.noticedelete(nt_num);
		
	}

	public int order_total() {
		adminMapper mapper = sqlSession.getMapper(adminMapper.class);
		 int adminTotal = mapper.order_total();
         return adminTotal;	
	}
}
