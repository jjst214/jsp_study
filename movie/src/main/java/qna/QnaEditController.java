package qna;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

@WebServlet("/qna/edit.do")
public class QnaEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String qid = req.getParameter("qID");
		QnaDAO dao = new QnaDAO();
		QnaDTO dto = dao.selectView(qid);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/QnaEdit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		//1. 파일 업로드 처리
		//2. 업로드 디렉토리의 물리적 경로확인
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*1000;
		//파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		//파일 업로드와 처리
		//수정내용을 매개변수에서 얻어옴
		String qid = mr.getParameter("qID");		
		String title = mr.getParameter("title");
		String cate = mr.getParameter("cate");
		String content = mr.getParameter("content");
		
		//비밀번호는 session에서 가지고옴
		HttpSession session = req.getSession();
		String pass = (String) session.getAttribute("pass");
		
		//DTO에 저장하기
		QnaDTO dto = new QnaDTO();
		dto.setqID(qid);		
		dto.setqCATE(cate);		
		dto.setqTITLE(title);
		dto.setqCONTENT(content);
		dto.setqPW(pass);
		
				
		String fileName = mr.getFilesystemName("qFILE");	
		dto.setqFILE(fileName);
					
		//데이터 베이스에 update 사용
		QnaDAO dao = new QnaDAO();
		int result = dao.updatePost(dto);		
		
		PrintWriter write = resp.getWriter();
		String script = "<script>alert('게시글이 수정되었습니다');"
				+ " location.href='./qna.do'</script>";
		write.print(script);
		write.close();
	}
	
}
