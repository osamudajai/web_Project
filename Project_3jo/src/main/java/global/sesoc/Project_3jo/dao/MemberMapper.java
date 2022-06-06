package global.sesoc.Project_3jo.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.pointVO;

public interface MemberMapper {

	public int insertMember(MemberVO member);
	
	public MemberVO getMember(String id);
	
	public MemberVO findid(MemberVO member);
	
	public MemberVO findpw(MemberVO member);

	public MemberVO select(String id);

	public int update(MemberVO member);

	public MemberVO select_pw(String po_id);

	public int update_pw(MemberVO member);

	public List<Ord_baseVO> selectorder(String po_id);

	public List<Ord_baseVO> select_order(String po_id);

	public List<pointVO> select_point(String po_id);

	public pointVO no_select_point(String po_id);

	public pointVO use_point_sum(String po_id);

	public pointVO rm_point_sum(String po_id);

	public int insert_pointMember(String po_id);
	
	//구매후기 저장
		public int insertReview(ReviewVO review);
		//전체 리뷰 수
		public int getTotal(SearchVO search);
		//나의 리뷰 목록
		public ArrayList<ReviewVO> listReview(SearchVO search, RowBounds rb);
		//글 번호로 리뷰 읽기
		public ReviewVO getReview(int rv_num);

		public int idChk(MemberVO member);

		public int emailchk(MemberVO member);

}
