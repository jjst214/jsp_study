package mvc_con;

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

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

@WebServlet("/mvc_con/product.do")
public class ProductController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		//상품 추가, 수정, 삭제 등 관리할 타입을 받음
		String type = req.getParameter("p_type");
		//상품추가 (type값이 add일때)
		if(type.equals("add")) {
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
			PrintWriter pw = resp.getWriter();
			if(result == 1) {
				pw.println("<script>");
				pw.println("alert('상품이 정상적으로 등록되었습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/index.jsp'");
				pw.println("</script>");
				pw.close();
			}else {
				pw.println("<script>");
				pw.println("alert('상품 등록이 실패했습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/index.jsp'");
				pw.println("</script>");
				pw.close();
			}
		}else if(type.equals("delete")) {
			resp.sendRedirect(req.getContextPath()+"/ProductList.jsp");
			
		}
	}
	
}
