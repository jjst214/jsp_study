package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//와일드 카드를 사용하면 uri 패턴이 .one에 해당하는 모든 요청을
//이 서블릿과 매핑함
@WebServlet("*.one")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		System.out.println(commandStr);
		req.setAttribute("url", uri);
		req.setAttribute("commandStr", commandStr);
		
		if(commandStr.equals("/regist.one")) {
			registFunc(req);
		}else if(commandStr.equals("/login.one")) {
			loginFunc(req);
		}else {
			freeboardFunc(req);
		}
		req.getRequestDispatcher("/myservlet/frontController.jsp").forward(req, resp);
	}
	//페이지별 처리 메소드
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h2>회원가입</h2>");
	}
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h2>로그인</h2>");
	}
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h2>자유게시판</h2>");
	}
}
