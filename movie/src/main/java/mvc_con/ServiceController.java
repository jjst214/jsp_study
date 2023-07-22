package mvc_con;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/mvc_con/service.do")
public class ServiceController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String viewType = req.getParameter("type");
		
		if(viewType.equals("olist")) {
			resp.sendRedirect(req.getContextPath()+"/orderList.jsp");
		}else if(viewType.equals("cart")) {
			
		}
	}
	
}
