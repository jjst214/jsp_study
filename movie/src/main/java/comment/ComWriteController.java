package comment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("/comment/CommentWrite.do")
public class ComWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/QnaView.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		CommentDTO dto = new CommentDTO();		
		dto.setComContent(req.getParameter("content"));		
		dto.setmID(req.getParameter("mid"));
		dto.setqID(req.getParameter("qid"));
		String qid = req.getParameter("qid");		
		//DAO를 통해 DB 게시 내용 저장
		CommentDAO dao = new CommentDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		if(result == 1) {
			req.getSession().setAttribute("qid", qid);
//			RequestDispatcher dispatcher = req.getRequestDispatcher("/comment/comment.do");
//			dispatcher.forward(req, resp);
			//req.getRequestDispatcher("/comment/comment.do").forward(req, resp);
			resp.sendRedirect(req.getContextPath()+"/qna/view.do");
		}else {
			resp.sendRedirect(req.getContextPath()+"/qna/view.do");
		}
	}
}
