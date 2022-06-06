package global.sesoc.Project_3jo.dao;


import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.Ord_compleVO;
import global.sesoc.Project_3jo.vo.pointVO;

public interface Ord_MemberMapper {

	public Ord_MemberVO orderconfirmed(int num);

	public ArrayList<Ord_baseVO> select_cart(List<Integer> arrayList);

	public int insertMember(Ord_MemberVO ord_member);

	public int nextVal();

	public void insertpd(Ord_baseVO vo);

	public pointVO select_point(String po_id);

	public void insert_point(pointVO point);
}
