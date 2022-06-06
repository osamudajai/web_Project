package global.sesoc.Project_3jo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.Project_3jo.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	//장바구니 삽입
	public void ba_insert(CartVO cart) {
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	mapper.ba_insert(cart);
	}
	//장바구니 전체 출력
	public List<CartVO> ba_list(String po_id){
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	List<CartVO> ba_list = mapper.ba_list(po_id);
	return ba_list;
	}
	//장바구니 하나 지우기
	public void ba_delete(int cart_id) {
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	mapper.ba_delete(cart_id);
	}
	
	
	//장바구니 수정
	public void modifyCart(CartVO cart) {
	sqlSession.update("global.sesoc.Project_3jo.dao.CartMapper.modifyCart", cart);
	}
	
	//장바구니 금액 합계
	public int totalPrice(String po_id) {
	sqlSession.selectOne("global.sesoc.Project_3jo.dao.CartMapper.totalPrice", po_id);
	return sqlSession.selectOne("global.sesoc.Project_3jo.dao.CartMapper.totalPrice", po_id);
	}
	
	//장바구니 동일한 상품 확인
	public int amount(String pd_id, String po_id) {
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("po_id", po_id);
	map.put("pd_id", pd_id);
	return sqlSession.selectOne("global.sesoc.Project_3jo.dao.CartMapper.amount",map);
	}
	
	//장바구니 상품수량 변경
	public void ba_update(CartVO cart) {
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	mapper.ba_update(cart);	
	}
	
	
	public void ba_select(String pd_id) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		mapper.ba_select(pd_id);		
	}
	public void delete_all(String po_id) {
		sqlSession.delete("global.sesoc.Project_3jo.dao.CartMapper.delete_all", po_id);
	}
	
	

}
