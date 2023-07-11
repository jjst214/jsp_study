package mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		MVCboardDAO dao = new MVCboardDAO();
//		String idx = req.getParameter("idx");
//		dao.updateVisitcount(idx);
//		MVCboardDTO dto = dao.selectView(idx);
//		dao.close();
//		req.setAttribute("dto", dto);
//		req.getRequestDispatcher("/View.jsp").forward(req, resp);
		
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		MVCboardDAO dao = new MVCboardDAO();
		String idx = req.getParameter("idx");
		dao.updateVisitcount(idx);
		MVCboardDTO dto = dao.selectView(idx);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/View.jsp").forward(req, res);
	}

	
}
