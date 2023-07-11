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
		
		String file1 = mr.getFilesystemName("file1");
		String file2 = mr.getFilesystemName("file2");
		if(file1 != null && file2 != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String file1_ext = file1.substring(file1.lastIndexOf("."));
			String file2_ext = file2.substring(file2.lastIndexOf("."));
			String newFileName1 = "thumb_" + now + file1_ext;
			String newFileName2 = "detail_" + now + file2_ext;
			
			File oFile1 = new File(saveDirectory + File.separator + file1);
			File oFile2 = new File(saveDirectory + File.separator + file2);
			File nFile1 = new File(saveDirectory + File.separator + newFileName1);
			File nFile2 = new File(saveDirectory + File.separator + newFileName2);
			oFile1.renameTo(nFile1);
			oFile2.renameTo(nFile2);
			
			dto.setPimage1(newFileName1);
			dto.setPimage2(newFileName2);
		}
		ProductDAO dao = new ProductDAO();
		int result = dao.addProduct(dto);
		dao.close();
		
		if(result == 1) {
			resp.sendRedirect("index.jsp");
		}else {
			resp.sendRedirect("add.do");
		}
	}
	
}
