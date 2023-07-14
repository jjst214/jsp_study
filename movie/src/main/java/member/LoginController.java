package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login/Login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id, pwd);
		resp.setContentType("text/html;charset=UTF-8");
		
		
		if(dto.getmID() != null) {
			//로그인이 성공했을 경우 세션에 저장하기위해 UserId값과 관리자와 일반고객을 분류할 Grade를 셋팅 (1:일반고객, 10:관리자)
			HttpSession session = req.getSession();
			session.setAttribute("UserId", dto.getmID());
			session.setAttribute("Grade", dto.getmGRADE());
			
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}else {
			PrintWriter wr = resp.getWriter();
			wr.println("<script>");
			wr.println("alert('로그인 실패.');");
			wr.println("location.href='"+req.getContextPath()+"/index.jsp'");
			wr.println("</script>");
			wr.close();
		}
	}
	
}
