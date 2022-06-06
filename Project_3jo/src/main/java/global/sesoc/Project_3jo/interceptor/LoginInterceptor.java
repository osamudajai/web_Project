package global.sesoc.Project_3jo.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 사용자 로그인 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String po_id = (String) session.getAttribute("po_id");
		
		//로그인되지 않은 경우 로그인 페이지로 이동
		if (po_id == null) {
			response.sendRedirect(request.getContextPath() + "/join");
			response.sendError(500);
			return false;
			
		}
		//로그인 된 경우 요청한 경로로 진행
		return super.preHandle(request, response, handler);
	}
	//인터셉터란 요청이 들어왔을때 컨트롤러 앞에서 실행하ㅏ는 클래스입니다 이것을 사용할려면 오버라이딩을 필수로 해줘야합니다.
}