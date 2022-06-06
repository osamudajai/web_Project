package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.Ord_compleVO;
import global.sesoc.Project_3jo.vo.pointVO;

@Repository
public class Ord_MemberDAO {
	private static final Logger logger = LoggerFactory.getLogger(Ord_MemberDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	public ArrayList<Ord_baseVO> select_cart(List<Integer> arrayList) {
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		
		ArrayList<Ord_baseVO> list = mapper.select_cart(arrayList);
		
		return list;
	}

	
	public int insertMember(Ord_MemberVO ord_member) {
		
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertMember(ord_member);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}


	public int insertpd(ArrayList<Ord_baseVO> order_ed, int nextVal) {
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		int cnt = 0;
		Ord_baseVO vo = null;
		
		logger.debug("전달된 parm : {}", order_ed);
		for(int i = 0 ; i<order_ed.size() ; i++) {
			vo = order_ed.get(i);
			vo.setR_boardnum(nextVal);
			logger.debug("insert로 전달된 vo:{}", vo);
			mapper.insertpd(vo);
			cnt++;
		}
		
		return cnt;
		
	}


	public int nextVal() {
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		
		int result = mapper.nextVal();
		
		return result;
	}


	public pointVO select_point(String po_id) {
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		
		pointVO result = mapper.select_point(po_id);
		
		return result;
	}


	public void insert_point(pointVO point) {
		
		Ord_MemberMapper mapper = sqlSession.getMapper(Ord_MemberMapper.class);
		
		mapper.insert_point(point);
	}


}
