package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/join.do")
public class JoinController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("../join/Join.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		req.setCharacterEncoding("UTF-8");

		dto.setmID(req.getParameter("id"));
		dto.setmPW(req.getParameter("pwd"));
		dto.setmNAME(req.getParameter("name"));
		dto.setmBIRTH(req.getParameter("year")+"-"+req.getParameter("month")+"-"+req.getParameter("day"));
		dto.setmPOST(req.getParameter("postcode"));
		dto.setmADDRESS(req.getParameter("address")+req.getParameter("detailAddress"));
		dto.setmPHONE(req.getParameter("phone1")+req.getParameter("phone2")+req.getParameter("phone3"));
				
		int result = dao.insertMember(dto);
		if(result == 1) {
			resp.sendRedirect("index.do");
		}else {
			resp.sendRedirect("join.do");
		}
	}
	
}
