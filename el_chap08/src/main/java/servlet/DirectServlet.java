package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myservlet/DirectPrint.do")
public class DirectServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트 응답하기위해 response 내장객체에 응답 콘텐츠 타입을 지정
		resp.setContentType("text/html;charset=UTF-8");
		//response내장객체에서 PrintWriter객체 리턴
		//PrintWriter객체는 println()메소드를 가지고 있음
		PrintWriter writer =resp.getWriter();
		writer.println("<html>");
		writer.println("<head><title>직접 서블릿에서 출력</title></head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력</h2>");
		writer.println("<p>jsp로 포워딩 하지않음</p>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	
}
