package mvc_con;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/mvc_con/directorder.do")
public class DirectOrderController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		String qty = req.getParameter("qty");
		String mid = req.getSession().getAttribute("UserId").toString();
		int chk = 0;
		CartDAO dao = new CartDAO();
		chk = dao.cartCheck(pid, mid);
		if(chk == 0) {
			dao.insertCart(mid, pid, qty);
		}
		HttpSession session = req.getSession();
		session.setAttribute("pid", pid);
		session.setAttribute("qty", qty);
		resp.sendRedirect(req.getContextPath()+"/directorder.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		String mid = req.getSession().getAttribute("UserId").toString();
		String name = req.getParameter("name");
		String postcode = req.getParameter("postcode");
		String addr = req.getParameter("address") + "/" + req.getParameter("detailAddress");
		String phone = req.getParameter("phone1") + req.getParameter("phone2") + req.getParameter("phone3");
		String paytype = req.getParameter("payment");
		String qty = req.getParameter("qty");
		String total = req.getParameter("total");
		String pid = req.getParameter("pid");
		int orderResult = 0;
		int detailResult = 0;
		int sellResult = 0;
		PrintWriter pw = resp.getWriter();
		
		OrdersDAO odao = new OrdersDAO();
		OrdersDTO odto = new OrdersDTO();
		odto.setMid(mid);
		odto.setOname(name);
		odto.setOphone(phone);
		odto.setOaddress(addr);
		odto.setOpost(postcode);
		odto.setOamount(total);
		odto.setOpayment(paytype);
		orderResult = odao.insertOrders(odto);
		odao.close();
		if(orderResult == 0) {
			pw.println("<script>");
			pw.println("alert('주문 도중 오류가 발생했습니다. 상품 페이지로 이동합니다.1');");
			pw.println("location.href='"+req.getContextPath()+"/mvc_con/list.do?cate=all'");
			pw.println("</script>");
			pw.close();
		}else {
			
			OrdersDetailDAO ddao = new OrdersDetailDAO();
			detailResult = ddao.addOrderDetail(pid, qty);
			ddao.close();
			ProductDAO pdao = new ProductDAO();
			sellResult = pdao.sell(pid, qty);
			pdao.close();
			
			if(detailResult != 0 && sellResult != 0) {
				pw.println("<script>");
				pw.println("alert('주문이 완료되었습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/mvc_con/service.do?type=olist'");
				pw.println("</script>");
				pw.close();
			}else {
				pw.println("<script>");
				pw.println("alert('주문 도중 오류가 발생했습니다. 상품 페이지로 이동합니다.2');");
				pw.println("location.href='"+req.getContextPath()+"/mvc_con/list.do?cate=all'");
				pw.println("</script>");
				pw.close();
			}
		}
	}
	
}
