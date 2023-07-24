package qna;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentDAO;
import comment.CommentDTO;
import utils.BoardPaging;

@WebServlet("/qna/view.do")
public class QnaViewController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = (String) req.getSession().getAttribute("qid");	
		String qID = req.getParameter("qID");
		if(qID == null) {
			qID = qid;
		}
		
		//게시물 불러오기
		QnaDAO qnadao = new QnaDAO();		
		//조회수 업데이트
		qnadao.updateQhit(qID);
		//게시물 조회하기
		QnaDTO dto = qnadao.selectView(qID);
		//선 연결 끊기
		qnadao.close();
		req.setAttribute("dto", dto);
	
		//DAO 생성
		CommentDAO dao = new CommentDAO();
		//뷰에 전달할 매개변수 저장용 Map 생성
		Map<String, Object> map = new HashMap<>();
		map.put("qid", qID);

		//게시물 목록 받기
		List<CommentDTO> comlists = dao.selectListPage(map);
		dao.close();
		
		req.setAttribute("comlists", comlists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/QnaView.jsp").forward(req, resp);
				
	}
}
