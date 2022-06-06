package global.sesoc.Project_3jo.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import global.sesoc.Project_3jo.dao.ProductDAO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.ProductBig;
import global.sesoc.Project_3jo.vo.ProductBrand;
import global.sesoc.Project_3jo.vo.ProductInfo;
import global.sesoc.Project_3jo.vo.ProductList;
import global.sesoc.Project_3jo.vo.Product_cost;
import global.sesoc.Project_3jo.vo.Product_ml;

@Controller	
@RequestMapping("admin")
public class adminProductController {

	@Autowired
	ProductDAO dao;
	
	final int countPerPage = 10;         //페이지당 보여줄 상품 수
	final int pagePerGroup = 5;            //페이지 이동 링크를 표시할 페이지 수
	   
	private static final Logger logger = LoggerFactory.getLogger(productController.class);
	//상품조회
	@RequestMapping(value = "select", method = RequestMethod.GET)
		public String productList(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		logger.debug("page: {}", page);
			int adminTotal = dao.getAdminTotal();	  
			
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, adminTotal);
		
			ArrayList<ProductList> adminList = null;   	        
			  adminList = dao.adminSelect(navi.getStartRecord(), navi.getCountPerPage());  
		           
		      model.addAttribute("adminList", adminList);
		      
		      logger.debug("확인 : {}", adminList);
		      model.addAttribute("navi", navi);

		return "admin/admin_productList";
	}
	
	//상품등록 폼으로 이동
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String inPdt() {
		logger.debug("상품등록페이지로 이동");
		//DB로 가서 필요한 데이터 model에 담아서 화면에 뿌려주기
						
		return "register_form";
		}
	
	//상품정보등록
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String inPdt(ProductInfo pdInfo,ProductBig pdBig, ProductBrand pdBrand, Product_ml pdml, Product_cost pdct) {
		logger.debug("전달된 param : {}", pdBig);
		logger.debug("전달된 param : {}", pdBrand);
		logger.debug("전달된 param : {}", pdInfo);
		logger.debug("전달된 param : {}", pdml);
		logger.debug("전달된 param : {}", pdct);
			dao.insertPdbi(pdBig);
			dao.insertPdbr(pdBrand);
			dao.insertPdt(pdInfo);
			dao.insertPdml(pdml);
			dao.insertPdct(pdct);
		return "admin_productList";
		}	
}
