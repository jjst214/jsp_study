package mvc_con;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvc_con/cart.do")
public class ShoppingController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String type = req.getParameter("type");
		
		String pid = req.getParameter("pid");
		if(type.equals("add")) {
			String mid = req.getParameter("mid");
			String qty = req.getParameter("qty");
			int result = 0;
			int chk = 0;
			PrintWriter pw = resp.getWriter();
			CartDAO dao = new CartDAO();
			chk = dao.cartCheck(pid, mid);
			if(chk == 0) {
				result = dao.insertCart(mid, pid, qty);
				dao.close();
				if(result != 0) {
					pw.println("<script>");
					pw.println("alert('상품이 카트에 추가되었습니다.');");
					pw.println("history.back();");
					pw.println("</script>");
				}else {
					pw.println("<script>");
					pw.println("alert('오류가 발생했습니다.');");
					pw.println("history.back();");
					pw.println("</script>");
				}
			}else {
				pw.println("<script>");
				pw.println("alert('장바구니에 이미 존재하는 상품입니다.');");
				pw.println("location.href='"+req.getContextPath()+"/basket.jsp'");
				pw.println("</script>");
			}
			
		}else if(type.equals("delete")) {
			PrintWriter pw = resp.getWriter();
			String mid = req.getParameter("mid");
			int result = 0;
			CartDAO dao = new CartDAO();
			result = dao.remove(mid, pid);
			if(result != 0) {
				pw.println("<script>");
				pw.println("alert('상품이 삭제되었습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/mvc_con/service.do?type=cart'");
				pw.println("</script>");
			}else {
				pw.println("<script>");
				pw.println("alert('삭제실패');");
				pw.println("location.href='"+req.getContextPath()+"/index.jsp'");
				pw.println("</script>");
			}
		}
	}
	
}
