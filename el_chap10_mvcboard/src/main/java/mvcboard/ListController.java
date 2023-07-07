package mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPaging;

public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DAO 생성
		MVCboardDAO dao = new MVCboardDAO();
		//뷰에 전달할 매개변수 저장용 Map생성
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
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//목록에 출력할 게시물 범위 계산
		//1페이지의 첫번째 페이지넘버는 1, 2페이지는 11이 나와야함
		int start = (pageNum-1)*pageSize + 1;	//첫 게시물 번호
		int end = pageNum * pageSize;	//마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		
		//페이징 처리 end
		
		//게시물 목록 받기
		List<MVCboardDTO> boardlists = dao.selectListPage(map);
		dao.close();
		
		//뷰에 전달할 매개변수 추가
		String pagingStr = BoardPaging.pagingstr(totalCount, pageSize, blockPage, pageNum, "./mvcboard/list.do");
		map.put("pagingStr", pagingStr);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		req.setAttribute("boardlists", boardlists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/List.jsp").forward(req, resp);
		
	}
	
}
