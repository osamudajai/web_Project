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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.Project_3jo.dao.QnaDAO;
import global.sesoc.Project_3jo.dao.adminQnaDAO;
import global.sesoc.Project_3jo.util.FileService;
import global.sesoc.Project_3jo.vo.FaqVO;
import global.sesoc.Project_3jo.vo.PageNavigator;
import global.sesoc.Project_3jo.vo.QnaVO;
import global.sesoc.Project_3jo.vo.SearchVO;

@Controller
@RequestMapping ("admin")
public class adminqnaController {
	   private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	   
	   @Autowired
	   adminQnaDAO dao;
	   
	   // 게시판 관련 상수값들
	   final int countPerPage = 5; // 페이지당 글 수
	   final int pagePerGroup = 5; // 페이지 이동 링크를 표시할 페이지 수
	   final String uploadPath = "/qnafile"; // 파일 업로드 경로
	   
	   /**
	    * 1:1문의 목록 보기
	    */
	     @RequestMapping (value="admin_QNA", method=RequestMethod.GET)
	     public String qnaList(@RequestParam(value="page", defaultValue="1") int page
	     , SearchVO search, Model model) {
	     
			  
	        logger.info("page: {}, search: {}", page, search);
	        
	        int total = dao.getTotal(search); //전체 글 개수
	        logger.info("total: {}", total);
	        
	        //페이지 계산을 위한 객체 생성
	        PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
	        
	        //검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
	        ArrayList<QnaVO> qnalist = dao.listQna(search, navi.getStartRecord(), navi.getCountPerPage());
	        
	        //페이지 정보 객체와 글 목록, 검색어를 모델에 저장
	        model.addAttribute("qnalist", qnalist);
	        model.addAttribute("navi", navi);
	        model.addAttribute("search", search);
	        
	        model.addAttribute("type", search.getType());
	        
	        logger.debug("qnaList: {}", qnalist);
	        return "admin/admin_QNA";
	     }	
	     
	   /**
	    * 1:1문의 글 읽기 
	    * @param q_num 읽을 글번호
	    * @return 해당 글 정보
	    */
	   @RequestMapping(value = "admin_QNA_read", method = RequestMethod.GET)
	   public String qnaRead(@RequestParam(value="page", defaultValue="1") int page
	           , SearchVO search, int q_num, Model model, HttpSession session) {
		 
	      // 전달된 글 번호로 해당 글정보 읽기
	      QnaVO qna = dao.getQna(q_num);
	      if (qna == null) {
	         return "redirect:admin_QNA";
	      }
	      // 본문글정보를 모델에 저장
	      model.addAttribute("qna", qna);
	              
	      //qnaList 불러오기
	      int total = dao.getTotal(search);
	      PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
	      
	      logger.info("page: {}, search: {}", page, search);
	      logger.debug("total: {}", total);
	      
	      
	      ArrayList<QnaVO> qnalist = dao.listQna(search, navi.getStartRecord(), navi.getCountPerPage());
	      logger.debug("첨부파일 확인 컨트롤러{}", qna);
	      model.addAttribute("qnalist", qnalist);
	      model.addAttribute("navi", navi);
	      model.addAttribute("search", search);
	      
	      return "admin/admin_QNA_read";
	   }
	   
	   /**
	    * 문의글 작성 폼 보기
	    */
	   @RequestMapping (value="write", method=RequestMethod.GET)
	   public String write() {
	      return "qnajsp/qnaWrite";
	   }
	   
		@ResponseBody
		@RequestMapping (value="callfaq", method=RequestMethod.GET)
		public ArrayList<FaqVO> callfaq(String select_cg) {
			ArrayList<FaqVO> callFaq = dao.callfaq(select_cg);
			logger.debug("라디오 버튼 값~~~~~~~~~~{}", select_cg);
			logger.debug("들어오는 FaqVO 객체 배열 값 ~~~~~~~~~~~~~~~~{}", callFaq);
			return callFaq;
		}
		
	   /**
	    * 파일 다운로드 (파일이 첨부된 글 번호 q_num)
	    */
	   @RequestMapping(value = "showfile", method = RequestMethod.GET)
	   public String fileDownload(int q_num, Model model, HttpServletResponse response) {
	      QnaVO qna = dao.getQna(q_num);
	      logger.info("쇼파일에 글 번호 {}", q_num);
	      logger.info("쇼파일에 2{}", qna);
	      
	      //원래의 파일명
	      String q_originalfile = new String(qna.getQ_originalfile());
	      try {
	         response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(q_originalfile, "UTF-8"));
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
	      
	      //저장된 파일 경로
	      String fullPath = uploadPath + "/" + qna.getQ_savedfile();
	      logger.info("쇼파일에 1{}", fullPath);
	      
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
	   @RequestMapping (value="delete", method=RequestMethod.POST)
	   public String delete(HttpSession session, int[] q_nums) {
	      logger.info("{}", q_nums.length);
	      
		  //삭제할 글 번호와 본인 글인지 확인할 로그인아이디
	      QnaVO qna = null;
	      String q_savedfile = null;
	      int result = 0;
	      
		  for (int n : q_nums) {
			  //첨부된 파일이 있는지 먼저 확인
			  qna = dao.getQna(n);
			  q_savedfile = qna.getQ_savedfile();
		  
			  //글 삭제
			  result = dao.deleteQna(qna);
		  
			  //글 삭제 성공 and 첨부된 파일이 있는 경우 파일도 삭제
			  if (result == 1 && q_savedfile != null) {
				  FileService.deleteFile(uploadPath + "/" + q_savedfile); 
			  }
		  }       
	      return "redirect:admin_QNA";
	   }
	   @RequestMapping (value="admin_henji", method=RequestMethod.POST)
	   public String admin_henji(HttpSession session, QnaVO qna) {
		  //답변할 글 번호와 본인 글인지 확인할 로그인아이디
			  //글 답변
			   dao.henji_qna(qna);
			  //글 삭제 성공 and 첨부된 파일이 있는 경우 파일도 삭제
	      return "redirect:admin_QNA";
	   }
	   
}
