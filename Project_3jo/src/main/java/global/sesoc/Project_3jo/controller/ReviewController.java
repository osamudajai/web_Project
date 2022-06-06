package global.sesoc.Project_3jo.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.Project_3jo.dao.ReviewDAO;
import global.sesoc.Project_3jo.util.FileService;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.ReviewVO;
import global.sesoc.Project_3jo.vo.SearchVO;


@Controller
@RequestMapping ("review")
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ReviewDAO dao;
	
	// 게시판 관련 상수값들
	final int countPerPage = 5; // 페이지당 글 수
	final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/reviewfile";	//파일 업로드 경로
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String reviewList(@RequestParam(value="page", defaultValue="1") int page
			,SearchVO search, ReviewVO review, Model model) {
		
		int rv_num = review.getRv_num(); //글번호 가져오기
		
		int total = dao.getTotal(search); //전체 글 수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		logger.debug("navi : {}", navi);
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기 (전체)
		ArrayList<ReviewVO> reviewlist = dao.listReview(search, navi.getStartRecord(), navi.getCountPerPage());
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("reviewlist", reviewlist);
		logger.debug("reviewlist : {}", reviewlist); //reviewlist 찍어보기
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		
		// 게시글 읽기 부분
		// 전달된 글 번호로 해당 글정보 읽기
		review = dao.getReview(rv_num);
		// 본문글정보를 모델에 저장
		model.addAttribute("review", review);
		logger.debug("review: {}", review);
		
		return "reviewjsp/reviewList";
	}
	
	/**
	 * 구매후기 작성 폼 보기
	 */
	@RequestMapping (value="write", method=RequestMethod.GET)
	public String write() {
		return "reviewjsp/reviewWrite";
	}
	/**
	 * 구매후기 저장
	 */
	@RequestMapping (value="write", method=RequestMethod.POST)
	public String write(
			HttpSession session
			, Model model
			, ReviewVO review 
			, MultipartFile upload) {
		
		  String po_id = (String) session.getAttribute("po_id");
		  review.setPo_id(po_id);
		
		logger.debug("저장할 글 정보 : {}", review);
		
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 ReviewVO객체에 세팅
		if (!upload.isEmpty()) {
			String rv_savedfile = FileService.saveFile(upload, uploadPath);
			review.setRv_originalfile(upload.getOriginalFilename());
			review.setRv_savedfile(rv_savedfile);
		}
		
		dao.insertReview(review);
		return "redirect:list";
	}
	
	/**
	 * 파일 다운로드
	 * @param rv_num 파일이 첨부된 글 번호
	 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int rv_num, Model model, HttpServletResponse response) {
		ReviewVO review = dao.getReview(rv_num);
		
		//원래의 파일명
		String rv_originalfile = new String(review.getRv_originalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(rv_originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + review.getRv_savedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
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

	/**
	 * 글 삭제
	 */
	@RequestMapping (value="delete", method=RequestMethod.GET)
	public String delete(HttpSession session, int rv_num) {
		String po_id = (String) session.getAttribute("po_id");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
		ReviewVO review = new ReviewVO();
		review.setRv_num(rv_num);
		review.setPo_id(po_id);
		
		//첨부된 파일이 있는지 먼저 확인
		String savedfile = dao.getReview(rv_num).getRv_savedfile();
		
		//글 삭제
		int result = dao.deleteReview(review);
		
		//글 삭제 성공 and 첨부된 파일이 있는 경우 파일도 삭제
		if (result == 1 && savedfile != null) {
			FileService.deleteFile(uploadPath + "/" + savedfile);
		}
		
		return "redirect:list";
	}
	
	/**
	 * 글 수정 폼으로 이동
	 */
	@RequestMapping (value="edit", method=RequestMethod.GET)
	public String editForm(HttpSession session, Model model, int rv_num) {
		
		ReviewVO review = dao.getReview(rv_num);
		model.addAttribute("review", review);
		return "reviewjsp/reviewEdit";
	}
	
	/**
	 * 글 수정 처리
	 * @param review 수정할 글 정보
	 */
	@RequestMapping (value="edit", method=RequestMethod.POST)
	public String edit(
			HttpSession session
			, ReviewVO review
			, MultipartFile upload) {
		
		//수정할 글이 로그인한 본인 글인지 확인
		String po_id = (String) session.getAttribute("po_id");
		ReviewVO oldReview = dao.getReview(review.getRv_num());
		if (oldReview == null || !oldReview.getPo_id().equals(po_id)) {
			return "redirect:list";
		}
		
		//수정할 정보에 로그인 아이디 저장
		review.setPo_id(po_id);
		
		//수정 시 새로 첨부한 파일이 있으면 기존 파일을 삭제하고 새로 업로드
		if (!upload.isEmpty()) {
			//기존 글에 첨부된 파일의 실제 저장된 이름
			String rv_savedfile = oldReview.getRv_savedfile();
			//기존 파일이 있으면 삭제
			if (rv_savedfile != null) {
				FileService.deleteFile(uploadPath + "/" + rv_savedfile);
			}
			
			//새로 업로드한 파일 저장
			rv_savedfile = FileService.saveFile(upload, uploadPath);
			
			//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
			review.setRv_originalfile(upload.getOriginalFilename());
			review.setRv_savedfile(rv_savedfile);
		}
		
		//글 수정 처리
		dao.updateReview(review);
		//원래의 글읽기 화면으로 이동 
		return "redirect:read?rv_num=" + review.getRv_num();
	}

}
