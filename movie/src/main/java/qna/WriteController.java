package qna;

import java.io.File;

import java.io.IOException;	

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

@WebServlet("/qna/QnaWrite.do")
public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/QnaWrite.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일 업로드 처리
		//업로드 폴더의 물리적 경로
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*5000;
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {
			//파일 업로드 실패			
			return;
		}
		//파일 업로드외 처리
		QnaDTO dto = new QnaDTO();
		dto.setqTITLE(mr.getParameter("title"));
		dto.setqCONTENT(mr.getParameter("content"));
		dto.setqPW(mr.getParameter("pass"));
		dto.setmID(mr.getParameter("mid"));
		dto.setqCATE(mr.getParameter("cate"));
		
		//원본 파일명과 저장된 파일 이름 설정
		String fileName = mr.getFilesystemName("qfile");
		dto.setqFILE(fileName);
					
		//DAO를 통해 DB 게시 내용 저장
		QnaDAO dao = new QnaDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		System.out.println(result);
		if(result == 1) {
			resp.sendRedirect(req.getContextPath()+"/qna/qna.do");
		}else {
			resp.sendRedirect(req.getContextPath()+"/qna/QnaWrite.do");
		}
	}
	
}
