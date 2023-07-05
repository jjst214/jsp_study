package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		//DAO생성
		dao = new MemberDAO();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서블릿 초기화 할때 매개변수에서 관리자 id받기
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		//회원테이블에서 인증 요청한 id/pass에 해당하는 회원찾기
		MemberDTO dto = dao.getMemberDTO(id, pass);
		
		//찾는 회원의 이름에 따른 처리
		String memberName = dto.getName();
		if(memberName != null) {
			req.setAttribute("authMessage", memberName+"회원님 어서오세요");
		}else {
			if(admin_id.equals(id)) {
				req.setAttribute("authMessage", admin_id+"는 최고관리자 입니다.");
			}else {
				req.setAttribute("authMessage", "회원이 아닙니다.");
			}
		}
		req.getRequestDispatcher("/myservlet/memberauth.jsp").forward(req, resp);
	}

	@Override
	public void destroy() {
		dao.close();
	}
	
}
