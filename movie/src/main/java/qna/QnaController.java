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

@WebServlet("/qna/qna.do")
public class QnaController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DAO 생성
		QnaDAO dao = new QnaDAO();
		//뷰에 전달할 매개변수 저장용 Map 생성
		Map<String, Object> map = new HashMap<>();
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물 수
		int totalCount = dao.selectCount(map);
		int pageSize = 10;
		int blockPage = 5;
		
		//현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			//요청받은 페이지로 수정
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//목록에 출력할 게시물 범위 계산
		//1페이지 1, 2페이지 11
		int start = (pageNum-1)*pageSize+1; //첫 게시물 번호
		int end = pageNum*pageSize; //마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		//페이징 처리 완료
		
		//게시물 목록 받기
		List<QnaDTO> boardlists = dao.selectListPage(map);
		dao.close();
		
		//뷰에 전달할 매개변수 추가
		String pagingStr = BoardPaging.pagingstr(totalCount, pageSize, 
				blockPage, pageNum, "/mall/qna/qna.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		req.setAttribute("boardlists", boardlists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/Qna.jsp").forward(req, resp);
				
	}
}
