
package global.sesoc.Project_3jo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.Project_3jo.HomeController;
import global.sesoc.Project_3jo.dao.CartDAO;
import global.sesoc.Project_3jo.dao.CartMapper;
import global.sesoc.Project_3jo.vo.CartVO;

@Controller
public class CartContrroller {
	private static final Logger logger = LoggerFactory.getLogger(CartContrroller.class);

	@Autowired
	CartDAO dao;
	
	
	@ResponseBody
	@RequestMapping(value="ba_insert", method=RequestMethod.POST)
	public void ba_insert(@ModelAttribute CartVO cart, HttpSession session, String pd_id, int mlmoney){
		System.out.println(cart);
		
		String po_id = (String) session.getAttribute("po_id");
		cart.setPo_id(po_id);
		
		//리젠트는 개별가격입니다 (+포함입니다)
		int rezent = mlmoney/cart.getAmount(); 
		cart.setMlmoney(rezent);
		logger.debug("가격객체:{}", mlmoney);
		logger.debug("card객체:{}", cart);
		int count = dao.amount(cart.getPd_id(),po_id);
		logger.debug("count : {}", count);
		
		if (count==0) {
				dao.ba_insert(cart);
		}else {
			 dao.ba_update(cart);
		}
	}
	
	@RequestMapping(value="ba_list", method=RequestMethod.GET)
	public String ba_list(HttpSession session, Model model) {
		String po_id = (String) session.getAttribute("po_id");
		Map<String,Object> map =new HashMap<String,Object>();
		List<CartVO> list = dao.ba_list(po_id);
		int totalPrice = dao.totalPrice(po_id);
		int fee = totalPrice >=100 ? 0 : 2500;
		logger.info("list:{}", list);
		map.put("list", list);
		map.put("count", list.size());
		map.put("totalPrice", totalPrice);
		map.put("fee", fee);
		map.put("allSum", totalPrice+fee);
		model.addAttribute("map", map);
		return "po_baguni";
		}
	
	@RequestMapping(value = "ba_delete", method=RequestMethod.GET)
	public String ba_delete(@RequestParam int cart_id) {
		logger.debug("전달된 아이디 : {} ", cart_id);
		dao.ba_delete(cart_id);
		return "redirect:ba_list";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "ba_update" , method=RequestMethod.POST)
	public String ba_update(@RequestParam int amount, @RequestParam String pd_id, @RequestParam int cart_id, HttpSession session) {
		String po_id = (String) session.getAttribute("po_id");
			CartVO cart = new CartVO();
			cart.setCart_id(cart_id);
			cart.setPo_id(po_id);
			cart.setAmount(amount);
			cart.setPd_id(pd_id);
			logger.debug("수정객체CartVO:{}", cart);
			dao.modifyCart(cart);
			
			return "";
	}
	
	
	//전체삭제
	@RequestMapping(value="delete_all" , method=RequestMethod.GET)
    public String delete_all(HttpSession session) {
        String po_id=(String)session.getAttribute("po_id");
        if(po_id!=null) {
            dao.delete_all(po_id);
        }
        return "redirect:ba_list";
    }
	
	
}
