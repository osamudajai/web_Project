package global.sesoc.Project_3jo.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.Project_3jo.dao.MemberDAO;
import global.sesoc.Project_3jo.util.FileService;
import global.sesoc.Project_3jo.vo.MemberVO;
import global.sesoc.Project_3jo.vo.Ord_baseVO;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;
import global.sesoc.Project_3jo.vo.pointVO;


@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping (value="join_loginForm", method=RequestMethod.GET)
	public String join_loginForm() {
		return "join_loginForm";
	}
	
	@RequestMapping (value="join", method=RequestMethod.POST)
	public String join(MemberVO member) {
		int result = dao.insertMember(member);
		
		int result1 = dao.insert_pointMember(member.getPo_id());
		
		if (result != 1 & result1 != 1) {
			//DB저장에 실패한 경우 가입폼으로 이동
			return "join&loginForm";
		}
		//저장 성공한 경우 메인화면으로 이동
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="idChk", method = RequestMethod.POST)
	public int idChk(MemberVO member){
		int result = dao.idChk(member);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="emailchk", method = RequestMethod.POST)
	public int emailchk(MemberVO member){
		int result = dao.emailchk(member);
		return result;
	}
	
	//아디비번 찾을때 사용할꺼임
	@RequestMapping (value="findid", method=RequestMethod.GET)
	public String findForm() {
		return "findForm";
	}
	
	@RequestMapping (value="findpw", method=RequestMethod.GET)
	public String findForm2() {
		return "findForm2";
	}
	
	
	
	  @RequestMapping (value="findid", method=RequestMethod.POST)
	  public String findid (MemberVO member, Model model) {
		  
		  MemberVO find_member = dao.findId(member);
			
			if(find_member == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("id", find_member.getPo_id());
			}
			
			return "findForm";
		}
	  
	  @RequestMapping (value="findpw", method=RequestMethod.POST)
	  public String findpw (MemberVO member, Model model) {
		  
		  MemberVO find_member = dao.findpw(member);
			
			if(find_member == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("pw", find_member.getPassword());
			}
			
			return "findForm2";
		}
	
	
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("po_id");
		session.removeAttribute("po_name");
		return "redirect:/";
	}
	
	
	@RequestMapping (value="login", method=RequestMethod.POST)
	public String login(String po_id, String password, Model model, HttpSession session) {
		
		MemberVO member = dao.getMember(po_id);
		
		//ID와 비밀번호가 맞으면 세션에 ID와 회원이름을 저장하고 메인화면으로 이동
		if (member != null && member.getPassword().equals(password)) {
			session.setAttribute("po_id", member.getPo_id());
			session.setAttribute("po_name", member.getName());
			return "redirect:/";
		}
		//맞지 않으면 로그인폼으로 이동
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "join_loginForm";
		}
	}
	
	@RequestMapping (value="myPage", method=RequestMethod.GET)
	public String myPage(Model model, HttpSession session) {
		
		String po_id = (String) session.getAttribute("po_id");
		
		 List<Ord_baseVO> base = dao.selectorder(po_id);
		  
		 logger.debug("가져온값 값{}", base);
		 
		 model.addAttribute("base", base);
		 
		return "myPage";
	}
	
	
	@RequestMapping (value="update", method=RequestMethod.GET)
	   public String update(HttpSession session, Model model) {
	      
	      String po_id = (String) session.getAttribute("po_id");
	      MemberVO member = dao.select(po_id);
	      
	      model.addAttribute("member", member);
	      return "update";
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "update", method = RequestMethod.POST)
	   public String update(MemberVO member, HttpSession session) {
	      logger.debug("정보 수정폼에서 전달된 값{}", member);
	      String po_id = (String) session.getAttribute("po_id");
	      member.setPo_id(po_id);
	      dao.update(member);
	      return "update";
	   }
	   
	   
	   @RequestMapping (value="update_pw", method=RequestMethod.GET)
	   public String update_pw_(HttpSession session, Model model) {
	      
	      
	      String po_id = (String) session.getAttribute("po_id");
	      MemberVO member = dao.select_pw(po_id);
	      
	      model.addAttribute("member", member);
	      return "update_pw";
	   }
	   
	   @ResponseBody
	   @RequestMapping(value = "update_pw", method = RequestMethod.POST)
	   public String update_pw(MemberVO member, HttpSession session) {
	      
	      String po_id = (String) session.getAttribute("po_id");
	      member.setPo_id(po_id);
	      dao.update_pw(member);
	      return "update";
	   }
	
	@RequestMapping (value="point", method=RequestMethod.GET)
	public String point(HttpSession session,pointVO point, Model model) {
		
		String po_id = (String) session.getAttribute("po_id");
		 point.setPo_id(po_id);
		
		 List<pointVO> member_po =dao.select_point(po_id);
		 
		 pointVO member_po1 = dao.no_select_point(po_id);
		 
		 pointVO member_po2 = dao.use_point_sum(po_id);
		 
		 pointVO member_po3 = dao.rm_point_sum(po_id);
		 
		 model.addAttribute("member_po",member_po);
		 
		 model.addAttribute("member_po1",member_po1);
		 
		 model.addAttribute("member_po2",member_po2);
		 
		 model.addAttribute("member_po3",member_po3);
		 
		return "point";
	}	
	
	@RequestMapping(value="my_order", method = RequestMethod.GET)
	public String my_order() {
		
		
		return "myPage";
	}
	
	@RequestMapping (value="order_inquiry", method=RequestMethod.GET)
	public String order_inquiry(Model model, HttpSession session) {
		String po_id = (String) session.getAttribute("po_id");
		
		List<Ord_baseVO> base_all = dao.select_order(po_id);
		
		logger.debug("가져온값 값{}", base_all);
		
		model.addAttribute("base_all", base_all);
		
		return "order_inquiry";
	}
	
	//상품 리뷰쓰기 폼 보기
	 	@RequestMapping (value="write", method=RequestMethod.GET)
	 	public String write(String pd_id, String pd_name, Model model) {
	 		
	 		model.addAttribute("pd_id", pd_id);
	 		model.addAttribute("pd_name", pd_name);
	 		 
	 		return "reviewjsp/reviewWrite";
	 	}
	 	//폼 저장
	 	@RequestMapping (value="write", method=RequestMethod.POST)
	 	public String write(
	 			HttpSession session
	 			, Model model
	 			, ReviewVO review
	 			, String pd_id
	 			, String pd_name
	 			, MultipartFile upload) {
	 		
	 		//세션에서 로그인한 사용자의 아이디를 읽어서 ReviewVO객체의 작성자 정보에 세팅
	 	    String po_id = (String) session.getAttribute("po_id");
	 	    review.setPo_id(po_id);
	 		
	 	    //상품 아이디를 모델에 저장
	 		logger.debug("저장할 글 정보 : {}", review);
	 		final String uploadPath = "/reviewfile";
	 		
	 		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 ReviewVO객체에 세팅
	 		if (!upload.isEmpty()) {
	 			String rv_savedfile = FileService.saveFile(upload, uploadPath);
	 			review.setRv_originalfile(upload.getOriginalFilename());
	 			review.setRv_savedfile(rv_savedfile);
	 		}
	 		
	 		dao.insertReview(review);
	 		return "redirect:order_inquiry";
	 	}
	 	
	 	//나의 리뷰 페이지
	 	@RequestMapping(value="myReview", method=RequestMethod.GET)
		public String myReview(@RequestParam(value="page", defaultValue="1") int page
				,SearchVO search, ReviewVO review, String type,
				HttpSession session, Model model) {
	 		
	 		logger.debug("page: {}", page);
	 		
	 		final int countPerPage = 5;
	 		final int pagePerGroup = 5;
	 		
	 		String po_id = (String) session.getAttribute("po_id");	//세션 로그인 아이디
	 		search.setPo_id(po_id);
	 		
			int rv_num = review.getRv_num(); //글번호 가져오기
			int total = dao.getTotal(search); //전체 글 수
			
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
			ArrayList<ReviewVO> reviewlist = dao.listReview(search, navi.getStartRecord(), navi.getCountPerPage());
			
			model.addAttribute("reviewlist", reviewlist);	//글 목록
			model.addAttribute("navi", navi);				//페이지 계산 객체
			model.addAttribute("search", search);			//검색용 전달값
			
			review = dao.getReview(rv_num);			//글 번호로 글 정보 읽기
			model.addAttribute("review", review);	//본문 글 정보
			model.addAttribute("type", type);		//선택박스
			
			logger.debug("review: {}", review);
			
			return "myReview";
		}
	 	//첨부파일
	 	@RequestMapping(value = "showfile", method = RequestMethod.GET)
		public String fileDownload(int rv_num, Model model, HttpServletResponse response) {
			
	 		ReviewVO review = dao.getReview(rv_num);
			
			String rv_originalfile = new String(review.getRv_originalfile());
			try {
				response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(rv_originalfile, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			final String uploadPath = "/reviewfile";
			String fullPath = uploadPath + "/" + review.getRv_savedfile();	//파일 저장 경로
			
			FileInputStream filein = null;			//서버로부터 읽을 입력 스트림
			ServletOutputStream fileout = null;		//클라이언트에게 전달할 출력스트림
			
			try {
				filein = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				//Spring의 파일 관련 유틸 이용하여 출력
				FileCopyUtils.copy(filein, fileout);
				
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			return null;
		}
		


}
