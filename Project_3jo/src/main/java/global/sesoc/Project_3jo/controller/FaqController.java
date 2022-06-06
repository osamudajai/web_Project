package global.sesoc.Project_3jo.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.Project_3jo.dao.FaqDAO;
import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.SearchVO;


@Controller
@RequestMapping ("faq")
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	FaqDAO dao;
	
	// 게시판 관련 상수값들
	final int countPerPage = 5; // 페이지당 글 수
	final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수
	
	/**
	 * faq, qna 목록 보기
	 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String faqMain(@RequestParam(value="page", defaultValue="1") int page
			  , SearchVO search, FaqVO faq,
			  @RequestParam(value="type", defaultValue="1") String type, Model model) {
		
		logger.info("page: {}, search: {}", page, search);
		
		int faq_num = faq.getFaq_num();
		
		int total = dao.getTotal(search);
		logger.debug("total: {}", total);
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기 (전체)
		ArrayList<FaqVO> faqlist = dao.listFaq(search, navi.getStartRecord(), navi.getCountPerPage());
		
		/* 삽질의 흔적-조건 탭 (dao-mapper-xml 에 lisgFaq 복붙했던 코드는 삭제했음)
		 * //주문결제 읽기 ArrayList<FaqVO> paylist = dao.listPay(search,
		 * navi.getStartRecord(), navi.getCountPerPage());
		 */
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("faqlist", faqlist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		
		/* 삽질의 흔적-조건 탭
		 * //조건 탭 모델 model.addAttribute("paylist", paylist);
		 */
	
		logger.debug("faqlist: {}", faqlist);
		//faqlist의 값 갯수
		
		// 게시글 읽기 부분
		// 전달된 글 번호로 해당 글정보 읽기
		faq = dao.getFaq(faq_num);
		
		// 본문글정보를 모델에 저장
		model.addAttribute("faq", faq);
		logger.debug("faq: {}", faq);
		//type 도 모델을 담아
		model.addAttribute("type", type);
		logger.debug("type: {}", type);
		
		return "faqjsp/faq";
		
	}
	@ResponseBody
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public void faqupdate(int faq_num) {

	dao.addHits(faq_num); 
	}
}
