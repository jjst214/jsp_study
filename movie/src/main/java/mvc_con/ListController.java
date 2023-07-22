package mvc_con;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/mvc_con/list.do")
public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate = req.getParameter("cate");
		String word = req.getParameter("searchWord");
		if(word != null) {
			resp.sendRedirect(req.getContextPath()+"/ProductList.jsp?&cate="+cate+"&searchWord="+word+"");
		}else {
			resp.sendRedirect(req.getContextPath()+"/ProductList.jsp?&cate="+cate+"");
		}
		
	}
	
}
