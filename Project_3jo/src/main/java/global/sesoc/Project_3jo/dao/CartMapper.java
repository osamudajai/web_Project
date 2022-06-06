package global.sesoc.Project_3jo.dao;

import java.util.List;

import global.sesoc.Project_3jo.vo.CartVO;

public interface CartMapper {
	public void ba_insert(CartVO cart);
	
	public List<CartVO> ba_list(String po_id);
	
	public void ba_delete(int cart_id);
	
	public void modifyCart(CartVO cart);
	
	public int totalPrice(String po_id);
	
	public int amount(String pd_id, String po_id);
	
	public void ba_update(CartVO cart);
	
	public void ba_select(String pd_id);
	
	public void delete_all(String po_id);


}
