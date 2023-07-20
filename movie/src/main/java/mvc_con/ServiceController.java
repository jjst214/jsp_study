package mvc_con;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/mvc_con/order.do")
public class ServiceController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		HttpSession pid_session = req.getSession();
		pid_session.setAttribute("pid", pid);
		
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.selectProduct(pid);
		
		resp.sendRedirect(req.getContextPath()+"/order.jsp");
	}
	
}
