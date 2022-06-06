package global.sesoc.Project_3jo.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.Project_3jo.dao.ProductDAO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.ProductBig;
import global.sesoc.Project_3jo.vo.ProductBrand;
import global.sesoc.Project_3jo.vo.ProductDetail;
import global.sesoc.Project_3jo.vo.ProductInfo;
import global.sesoc.Project_3jo.vo.ProductList;
import global.sesoc.Project_3jo.vo.Product_cost;
import global.sesoc.Project_3jo.vo.Product_ml;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;

@Controller	
@RequestMapping("product")
public class productController {

	@Autowired
	ProductDAO dao;
	
	//목록 관련 상수값들
	final int countPerPage = 12;			//페이지당 보여줄 상품 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
	private static final Logger logger = LoggerFactory.getLogger(productController.class);
	
	//상품목록페이지로 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String cata,  String cataSmall, String cate,
			@RequestParam(value="page", defaultValue="1") int page, Model model) {
			logger.debug("page: {}", page);
			
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("cata", cata);
			map.put("cataSmall", cataSmall);
			int total = dao.getTotal(map);			//전체 상품 개수	
			
			logger.debug("최초 total 확인 : {}", total);
			
			//페이지 계산을 위한 객체 생성
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
			
			ArrayList<ProductList> list = null;
			ArrayList<ProductList> bList = null;
			logger.debug("확인 : {}", cate);
			  
			  if(cata != null && cataSmall != null){
				  HashMap<String,Object> map1 = new HashMap<String,Object>();
				  map1.put("cata", cata);
				  map1.put("cataSmall", cataSmall);
				  map1.put("cate", cate);
				  list = dao.productlist(map1, navi.getStartRecord(), navi.getCountPerPage());		//브랜드상품목록 출력
				  bList = dao.selectBb(map1);		//브랜드페이지에서 브랜드명 출력
				  
			  }else if(cata!= null) {
				  HashMap<String,Object> map1 = new HashMap<String,Object>();
				  map1.put("cata",cata); 
				  map1.put("cate", cate);
					/*
					 * map.put("navi.getStartRecord", navi.getStartRecord());
					 * map.put("navi.getCountPerPage()", navi.getCountPerPage());
					 */
				  list = dao.selectCata(map1, navi.getStartRecord(), navi.getCountPerPage());		//대분류상품목록 출력
				  logger.debug("count22확인 : {}", total);
				  bList = dao.selectBig(cata);		//대분류상품목록에서 브랜드명 출력
			  } else {
				  list = dao.select(cate, navi.getStartRecord(), navi.getCountPerPage());	//전체상품목록과 정렬기능, 페이징기능 출력				 
				  logger.debug("count11확인 : {}", total);
				  bList = dao.selectBrand();		//중복제거한 브랜드 이름을 출력하는 기능		  
			  } 
			  
			  if(cataSmall == null) {		//클릭하는 부분이 브랜드가 null이면
				  model.addAttribute("title", cata);		//cata만 모델에 담음
			  }else {						//클릭하는 부분이 브랜드가 null이 아니면
				  model.addAttribute("title", cataSmall);	//cataSmall만 모델에 담음				  
			  }
		model.addAttribute("list", list);
		logger.debug("확인확인 list:{}", list);
		model.addAttribute("bList", bList);
		model.addAttribute("cata", cata);			//대분류명을 모델에 담음
		model.addAttribute("cataSmall", cataSmall);	//브랜드명을 모델에 담음
		model.addAttribute("cate", cate);			//정렬쿼리를 모델에 담음
		model.addAttribute("navi", navi);
		logger.debug("확인 navi:{}", navi);
		logger.debug("cata : {}, cataSmall : {}", cata, cataSmall);
		logger.debug(", cate : {}", cate);
		
		return "list";
	}
	
	//상품목록페이지로 이동
	@RequestMapping(value = "list/view", method = RequestMethod.GET)
	public String view(String cata, String cataSmall, String pdID, Model model,String season, String weather, String sunmoon) {
		
		ArrayList<ProductDetail> relatedList = null;
		ArrayList<ProductDetail> listDetail = null;
		if(cata != null && cataSmall!=null && pdID != null){
			  HashMap<String,Object> map = new HashMap<String,Object>();
			  map.put("cata", cata);
			  map.put("cataSmall", cataSmall);
			  map.put("pdID", pdID);
			  map.put("season", season);
	          map.put("weather", weather);
	          map.put("sunmoon", sunmoon);
	           listDetail = dao.pdView(map);  
	           relatedList = dao.selectAll(map);
			  
			  listDetail = dao.pdView(map);
			  
		  }else if(cata != null) { 
			  listDetail = dao.selectDetail(cata); 
		  } else {
			  listDetail = dao.selectView();
		  } logger.debug("결과 : {}", listDetail);
		  
		model.addAttribute("list", listDetail);
		model.addAttribute("relatedList", relatedList);
		return "view";
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
	
	@ResponseBody
	@RequestMapping(value = "list/callreview", method = RequestMethod.GET)
	public HashMap<String, Object> callreview(@RequestParam("type") String type, @RequestParam("searchText") String searchText,
			@RequestParam(value = "page", defaultValue = "1") int page , String pd_id, String pd_name, Model model, SearchVO search, ReviewVO review) {

		search.setType(type);
		search.setSearchText(searchText);
		logger.debug("type: {}", type);
		logger.debug("searchText: {}", searchText);
		logger.debug("pd_id: {}", pd_id);
		logger.debug("pd_name: {}", pd_name);
	
	    
		final int countPerPage = 5; // 페이지당 보여줄 상품 수
		final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수

		int total = dao.getTotalRv(search); // 전체 구매후기 글 수
		PageNavigator pageinfo = new PageNavigator(countPerPage, pagePerGroup, page, total); //페이지 계산 객체
		logger.debug("페이지 계산 객체: {}", pageinfo);
		
		
		logger.debug("!@#!@#!@#!@#: {}", search);
		ArrayList<ReviewVO> reviewList = dao.listReview(search, pageinfo.getStartRecord(), pageinfo.getCountPerPage()); //구매후기 목록
		logger.debug("들어오는 ReviewVO 객체 배열 값{}", reviewList);
		

		HashMap<String, Object> reviewmap = new HashMap<String, Object>();
		reviewmap.put("pageinfo", pageinfo);
		reviewmap.put("reviewList", reviewList);
		
		return reviewmap;
	}

	// 구매후기 게시판 첨부파일 읽기
	@RequestMapping(value = "list/showfile", method = RequestMethod.GET)
	public String fileDownload(int rv_num, Model model, HttpServletResponse response) {

		final String uploadPath = "/reviewfile"; // 구매후기 파일 업로드 경로
		
		ReviewVO review = dao.getReview(rv_num);
		String rv_originalfile = new String(review.getRv_originalfile());
		try {
			response.setHeader("Content-Disposition",
					" attachment;filename=" + URLEncoder.encode(rv_originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + review.getRv_savedfile();
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			FileCopyUtils.copy(filein, fileout);
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}