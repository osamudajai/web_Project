package global.sesoc.Project_3jo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.Project_3jo.dao.adminDAO;
import global.sesoc.Project_3jo.vo.NoticeVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.adminVO;

@Controller
@RequestMapping("admin") 
public class adminController {
	private static final Logger logger = LoggerFactory.getLogger(adminController.class);
	
	@Autowired
	adminDAO dao;
	
	final int countPerPage = 5; // 페이지당 글 수
	final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수
	
	
	@RequestMapping (value="admin_order", method=RequestMethod.GET)
	public String order_inquiry(@RequestParam(value="page", defaultValue="1")int page,HttpSession session,Model model) {
		int order_Total = dao.order_total();
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, order_Total);
		
		 ArrayList<Ord_baseVO> base_all = null;
		 
		 base_all =  dao.selectorder(navi.getStartRecord(), navi.getCountPerPage());
		  
		 logger.debug("가져온값 값{}", base_all);
		 
		 model.addAttribute("base_all", base_all);
		 
		 model.addAttribute("navi", navi);
		
		return "admin/admin_order";
	}
	
	@RequestMapping(value = "admin_login", method = RequestMethod.GET)
	public String admin_login() {
		
		return "admin/admin_login";
	}
	
	
	@RequestMapping (value="adlogin", method=RequestMethod.POST)
	public String adlogin(String admin_id, String password, Model model, HttpSession session) {
		
		adminVO admin = dao.getadmin(admin_id);
		
		//ID와 비밀번호가 맞으면 세션에 ID와 회원이름을 저장하고 메인화면으로 이동
		if (admin != null && admin.getPassword().equals(password)) {
			session.setAttribute("admin_id", admin.getAdmin_id());
			session.setAttribute("admin_name", admin.getName());
			return "admin/admin";
		}
		//맞지 않으면 로그인폼으로 이동
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "admin/admin_login";
		}
	}
	
	 @RequestMapping (value="admin_notice", method=RequestMethod.GET)
	  public String admin_notice(@RequestParam(value="page", defaultValue="1") int page
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
		  
		  logger.debug("어드민 로거 입니다.: {}", noticelist);
		  return "admin/admin_notice";
	  }
	 
	 @RequestMapping(value = "admin_notice_write", method = RequestMethod.GET)
	 public String admin_notice_writeform() {
		 
		 return "admin/admin_notice_write";
	 }
	 
	 @RequestMapping(value = "admin_notice_write", method = RequestMethod.POST)
	 public String admin_notice_write(NoticeVO notice) {
		 int result = dao.insert(notice);
		 
		 if (result != 1) {
			 return "admin/admin_notice";
		 }
		 return "admin/admin_notice";
	 }
	
	 @RequestMapping(value = "read", method = RequestMethod.GET)
		public String read(@RequestParam(value="page", defaultValue="1") int page
				  , SearchVO search, int nt_num, String type, Model model) {
			
			// 전달된 글 번호로 해당 글정보 읽기
			NoticeVO notice = dao.getNotice(nt_num);
			if (notice == null) {
				return "redirect:admin";
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
			
			return "admin/admin_noticeRead";
		}
	 
	 @RequestMapping(value = "noticedelete", method=RequestMethod.GET)
		public String noticedelete(@RequestParam int nt_num) {
			logger.debug("전달된 아이디 : {} ", nt_num);
			dao.noticedelete(nt_num);
			return "redirect:admin_notice";
		}
}
