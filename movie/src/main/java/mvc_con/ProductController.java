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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		//상품 추가, 수정, 삭제 등 관리할 타입을 받음
		String type = req.getParameter("p_type");
		if(type.equals("add")) {
			resp.sendRedirect(req.getContextPath()+"/Add.jsp");
		}else if(type.equals("delete")) {
			resp.sendRedirect(req.getContextPath()+"/ProductList.jsp");
		}else if(type.equals("detail")) {
			//상세보기시 폼에서 넘겨받은 상품번호를 상세화면 페이지에 담아 넘겨줌 
			String num = req.getParameter("num");
			resp.sendRedirect(req.getContextPath()+"/ProductDetail.jsp?num="+num+"");
		}else if(type.equals("edit")) {
			String pid = req.getParameter("pid");
			resp.sendRedirect(req.getContextPath()+"/ProductEdit.jsp?pid="+pid+"");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		int maxPostSize = 1024*1000;
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		//상품 추가, 수정, 삭제 등 관리할 타입을 받음
		String type="";
		try {
			type = req.getParameter("p_type");
			if(type == null) {
				type = mr.getParameter("p_type");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		//상품추가 (type값이 add일때)
		if(type.equals("add")) {
			
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
			String[] arr = req.getParameterValues("chkbox");
			ProductDAO dao = new ProductDAO();
			int result = 0;
			for(String a:arr) {
				result = dao.delProduct(a);
			}
			dao.close();
			resp.sendRedirect(req.getContextPath()+"/ProductList.jsp");
		}else if(type.equals("edit")) {
			String pid = mr.getParameter("pid");
			String pname = mr.getParameter("pname");
			String pprice = mr.getParameter("pprice");
			String pstock = mr.getParameter("pstock");
			String pdetail = mr.getParameter("pdetail");
			
			ProductDAO dao = new ProductDAO();
			ProductDTO dto = new ProductDTO();
			ProductDTO oldProduct = dao.selectProduct(pid);
			dao.close();
			String oldFileName = oldProduct.getPimage();
			dto.setPid(oldProduct.getPid());
			dto.setPname(pname);
			dto.setPprice(pprice);
			dto.setPstock(pstock);
			dto.setPdetail(pdetail);
			dto.setPimage(oldProduct.getPimage());
			//파일 업로드 처리
			
			String file = mr.getFilesystemName("updateFile");
			if(file != null) {
				String now = new SimpleDateFormat("yyMMdd_HmsS").format(new Date());
				String file_ext = file.substring(file.lastIndexOf("."));
				String newFileName = "product_" + now + file_ext;
				
				File oFile = new File(saveDirectory + File.separator + file);
				File nFile = new File(saveDirectory + File.separator + newFileName);
				oFile.renameTo(nFile);
				
				dto.setPimage(newFileName);
				//기존 상품 사진삭제
				File old = new File(saveDirectory+"/"+oldFileName);
				old.delete();
			}
			ProductDAO dao2 = new ProductDAO();
			int result = dao2.editProduct(dto);
			dao2.close();
			PrintWriter pw = resp.getWriter();
			if(result == 1) {
				pw.println("<script>");
				pw.println("alert('상품이 수정되었습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/index.jsp'");
				pw.println("</script>");
				pw.close();
			}else {
				pw.println("<script>");
				pw.println("alert('상품 수정에 실패했습니다.');");
				pw.println("location.href='"+req.getContextPath()+"/index.jsp'");
				pw.println("</script>");
				pw.close();
			}
		}
	}
	
}
