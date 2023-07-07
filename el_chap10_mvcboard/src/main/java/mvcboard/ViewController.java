package mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		MVCboardDAO dao = new MVCboardDAO();
		MVCboardDTO dto = dao.viewBoard(idx);
		dao.close();
		System.err.println(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./View.jsp").forward(req, resp);
		
	}
	
}
