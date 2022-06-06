package global.sesoc.Project_3jo.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.Project_3jo.dao.Ord_MemberDAO;
import global.sesoc.Project_3jo.vo.CartVO;
import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.Ord_compleVO;
import global.sesoc.Project_3jo.vo.home_product;
import global.sesoc.Project_3jo.vo.pointVO;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	Ord_MemberDAO dao;
	
	
	@RequestMapping(value = "order", method = RequestMethod.GET)
	public String order() {
		
		return "order";
	}
	
	
	
	//수령인 등록처리..?
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(@RequestParam int[] q_nums, Model model, pointVO point,HttpSession session) {
		
		String po_id = (String) session.getAttribute("po_id");
		 point.setPo_id(po_id);
		
		 pointVO member_po =dao.select_point(po_id);
		 
		logger.info("포인트 가져옴? : {}", member_po);
		
		
		logger.info("장바구니에서 전달된 값 param : {}", q_nums);
		
		ArrayList<Ord_baseVO> order_ed = null;
		
		List<Integer> arrayList = Arrays.stream(q_nums).boxed().collect(Collectors.toList());
		
		order_ed = dao.select_cart(arrayList);
		
		
		
		logger.info("장바구니에서 전달된 값 param : {}", order_ed);
		
		model.addAttribute("order_ed", order_ed);
		model.addAttribute("member_po", member_po);
		return "order";

	}	
	
	
	@RequestMapping(value = "orderconfirmed", method = RequestMethod.POST)
	public String orderconfirmed(Ord_MemberVO ord_member, Ord_compleVO ord_cople,int [] cart_id, Ord_baseVO ord_base
			,pointVO point,HttpSession session) {	
		
		
		 String po_id = (String) session.getAttribute("po_id");
		 point.setPo_id(po_id);
		 
		 dao.insert_point(point);
		
		ArrayList<Ord_baseVO> order_ed = null;
		
		List<Integer> arrayList = Arrays.stream(cart_id).boxed().collect(Collectors.toList());
		//카트아이디 들고 찾아가는놈
		order_ed = dao.select_cart(arrayList);
		
		
		int nextVal= dao.nextVal();
		
		//고객의 기본 정보만 인서트하는문 
		ord_member.setR_boardnum(nextVal);
		
		logger.debug("기본적인 정보는 가저가냐? {}", ord_member);
		
		int result = dao.insertMember(ord_member);
		
		
		//상품 수량까지 가져가는놈
		
		dao.insertpd(order_ed, nextVal);
		
		

		
		return "orderconfirmed";
	}
	
	@RequestMapping(value = "orderconfirmed", method = RequestMethod.GET)
	public String orderconfirmed() {
		
		return "orderconfirmed";
	}
	

	
}
