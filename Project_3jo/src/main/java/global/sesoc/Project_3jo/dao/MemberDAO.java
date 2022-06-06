package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.controller.MemberController;
import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.pointVO;

@Repository
public class MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	SqlSession sqlSession;

	public int insertMember(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertMember(member);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int idChk(MemberVO member){
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.idChk(member);
		return result;
	}
	
	public MemberVO getMember(String id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = mapper.getMember(id);
		return member;
	}
	
	 public MemberVO findId(MemberVO member) { 
		 System.out.println("아이디 찾기 기능처리입니다.");
		 return sqlSession.selectOne("global.sesoc.Project_3jo.dao.MemberMapper.findid", member);
	 }

	public MemberVO findpw(MemberVO member) {
		 System.out.println("비밀번호 찾기 기능처리입니다.");
		 return sqlSession.selectOne("global.sesoc.Project_3jo.dao.MemberMapper.findpw", member);
	}

	public MemberVO select(String id) {
	      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	      MemberVO member = mapper.select(id);
	      return member;
	   }

	   public int update(MemberVO member) {
	      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	      int result = mapper.update(member);
	      return result;
	   }

	   public MemberVO select_pw(String id) {
	      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	      MemberVO member = mapper.select_pw(id);
	      return member;
	   }

	   public int update_pw(MemberVO member) {
	      MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	      int result = mapper.update_pw(member);
	      return result;
	   }

	


	/*
	 * public MemberVO getMember2(String password) { MemberMapper mapper =
	 * sqlSession.getMapper(MemberMapper.class); MemberVO member =
	 * mapper.getMember2(password); return member; }
	 */

	public List<Ord_baseVO> selectorder(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		List<Ord_baseVO> base = mapper.selectorder(po_id);
		
		logger.debug("가져온값 값{}", base);
		
		return base;
	}

	public List<Ord_baseVO> select_order(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		List<Ord_baseVO> base = mapper.select_order(po_id);
		
		logger.debug("가져온값 값{}", base);
		
		return base;
	}

	public List<pointVO> select_point(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		List<pointVO> result = mapper.select_point(po_id);
		
		return result;
	}

	public pointVO no_select_point(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		pointVO result = mapper.no_select_point(po_id);
		
		return result;
	}

	public pointVO use_point_sum(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		pointVO result = mapper.use_point_sum(po_id);
		
		return result;
	}

	public pointVO rm_point_sum(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		pointVO result = mapper.rm_point_sum(po_id);
		
		return result;
	}

	public int insert_pointMember(String po_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		try {
			result = mapper.insert_pointMember(po_id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//구매후기 저장
		public int insertReview(ReviewVO review) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.insertReview(review);
			return result;
		}
		//나의 리뷰 목록
		public int getTotal(SearchVO search) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int total = mapper.getTotal(search);
			return total;
		}
		public ArrayList<ReviewVO> listReview(SearchVO search, int startRecord, int countPerPage) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			ArrayList<ReviewVO> reviewlist = mapper.listReview(search, rb);
			return reviewlist;
		}
		public ReviewVO getReview(int rv_num) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			ReviewVO review = mapper.getReview(rv_num);
			return review;
		}


		public int emailchk(MemberVO member) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			int result = mapper.emailchk(member);
			return result;
		}

}
