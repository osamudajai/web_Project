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

import global.sesoc.Project_3jo.dao.NoticeDAO;
import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.SearchVO;



/**
 * Notice 콘트롤러 공지사항에 목록 읽기, 게시글 읽기
 */
@Controller
@RequestMapping ("notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	NoticeDAO dao;

	// 게시판 관련 상수값들
	final int countPerPage = 5; // 페이지당 글 수
	final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile"; // 파일 업로드 경로


	/**
	 * 공지사항 목록 보기
	 */
	  @RequestMapping (value="main", method=RequestMethod.GET)
	  public String noticeList(@RequestParam(value="page", defaultValue="1") int page
	  , SearchVO search, String type, Model model) {
	  
		  logger.info("page: {}, search: {}", page, search);
		  
		  int total = dao.getTotal(search); //전체 글 개수
		  
		  //페이지 계산을 위한 객체 생성
		  PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		  
		  //검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		  ArrayList<NoticeVO> noticelist = dao.listNotice(search, navi.getStartRecord(), navi.getCountPerPage());
		  
		  //페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		  model.addAttribute("noticelist", noticelist);
		  model.addAttribute("navi", navi);
		  model.addAttribute("search", search);
		  model.addAttribute("type", type);
		  
		  logger.debug("noticelist: {}", noticelist);
		  return "noticejsp/noticeList";
	  }
		 


	/**
	 * 공지사항 글 읽기
	 * 
	 * @param nt_num 읽을 글번호
	 * @return 해당 글 정보
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(@RequestParam(value="page", defaultValue="1") int page
			  , SearchVO search, int nt_num, String type, Model model) {
		
		// 전달된 글 번호로 해당 글정보 읽기
		NoticeVO notice = dao.getNotice(nt_num);
		if (notice == null) {
			return "redirect:notice";
		}
		
		// 본문글정보를 모델에 저장
		model.addAttribute("notice", notice);
				  
		//noticeList 불러오기
		int total = dao.getTotal(search);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		logger.info("page: {}, search: {}", page, search);
		logger.debug("total: {}", total);
		
		ArrayList<NoticeVO> noticelist = dao.listNotice(search, navi.getStartRecord(), navi.getCountPerPage());
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		model.addAttribute("type", type);
		
		return "noticejsp/noticeRead";
	}
}
