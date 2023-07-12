package mvc_con;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

@WebServlet("/mvc_con/add.do")
public class ProductController extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Add.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*1000;
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {
			//파일 업로드 실패
			return;
		}
		//파일 업로드 처리
		ProductDTO dto = new ProductDTO();
		dto.setPname(mr.getParameter("name"));
		dto.setPprice(mr.getParameter("price"));
		dto.setPstock(mr.getParameter("stock"));
		dto.setPdetail(mr.getParameter("detail"));
		
		String file = mr.getFilesystemName("file1");
		if(file != null) {
			String now = new SimpleDateFormat("yyMMdd_HmsS").format(new Date());
			String file_ext = file.substring(file.lastIndexOf("."));
			String newFileName = "product_" + now + file_ext;
			
			File oFile = new File(saveDirectory + File.separator + file);
			File nFile = new File(saveDirectory + File.separator + newFileName);
			oFile.renameTo(nFile);
			
			dto.setPimage(newFileName);
		}
		ProductDAO dao = new ProductDAO();
		int result = dao.addProduct(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("../index.jsp");
		}else {
			resp.sendRedirect("add.do");
		}
	}
	
}
