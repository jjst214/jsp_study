package mvcboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//mode매개변수값을 request영역에 저장한다음 Pass.jsp로 포워드
		req.setAttribute("mode", req.getAttribute("mode"));
		req.setAttribute("idx", req.getAttribute("idx"));
		req.getRequestDispatcher("../Pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//매개변수 저장
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//비밀번호 확인
		MVCboardDAO dao = new MVCboardDAO();
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		if(confirmed) {
			//검증완료시 삭제인지 수정인지 구분해서 처리
			if(mode.equals("delete")) {
				dao = new MVCboardDAO();
				int result = dao.deletePost(idx);
				if(result == 1) {
					PrintWriter write = resp.getWriter();
					String script = "<script>alert('게시글이 삭제되었습니다..')"
							+ "location.href='./list.do'</script>";
					write.print(script);
					write.close();
				}else {
					resp.setContentType("text/html;charset=UTF-8");
					PrintWriter write = resp.getWriter();
					String script = "<script>alert('삭제되지 않았습니다.')"
							+ "location.href='./list.do'</script>";
					write.print(script);
					write.close();
				}
			}else if(mode.equals("edit")) {
				//서블릿에서는 getSession()을 사용해 session 내장객체를 생성
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("./edit.do?idx=" + idx);
			}
		}else {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter write = resp.getWriter();
			String script = "<script>alert('비밀번호가 틀립니다.');"
					+ "location.href='./list.do'</script>";
			write.print(script);
			write.close();
		}
	}
	
}
