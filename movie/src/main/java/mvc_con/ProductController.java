package mvc_con;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
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
		}else if(type.equals("manage")) {
			resp.sendRedirect(req.getContextPath()+"/mvc_con/list.do?cate=all");
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
		int maxPostSize = 1024*5000;
		
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
			if(mr.getParameter("detail") == null) {
				dto.setPdetail("");
			}else {
				dto.setPdetail(mr.getParameter("detail"));
			}
			dto.setPcate(mr.getParameter("categori"));
			
			String file1 = mr.getFilesystemName("file1");
			String file2 = mr.getFilesystemName("file2");
			if(file1 != null && file2 != null) {
				String now = new SimpleDateFormat("yyMMdd_HmsS").format(new Date());
				String file_ext = file1.substring(file1.lastIndexOf("."));
				String file2_ext = file2.substring(file2.lastIndexOf("."));
				String newFileName = "product_" + now + file_ext;
				String newFileName2 = "detail_" + now + file2_ext;
				
				//게시물 사진 폴더관리
				String path = saveDirectory + File.separator + "product_" + now;
				File folder = new File(path);
				if(!folder.exists()) {
					try{
						//폴더 생성합니다.
					    folder.mkdir();
					    File oFile = new File(saveDirectory + File.separator + file1);
						File nFile = new File(path + File.separator + newFileName);
						File oFile2 = new File(saveDirectory + File.separator + file2);
						File nFile2 = new File(path + File.separator + newFileName2);
						oFile.renameTo(nFile);
						oFile2.renameTo(nFile2);
						
						dto.setPimage(newFileName);
						dto.setPimage2(newFileName2);
				    }catch(Exception e){
					    e.getStackTrace();
					}        
			    }else {
					System.out.println("이미 폴더가 생성되어 있습니다.");
				}
				
				
				
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
			//상품 삭제
			String[] arr = req.getParameterValues("chkbox");
			if(arr == null) {
				//아무 상품도 체크하지 않고 삭제버튼을 누르면 경고창 띄우고 이전페이지로 돌아감 
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert('삭제할 상품을 1개 이상 선택해주세요.');");
				pw.println("history.back();");
				pw.println("</script>");
				pw.close();
			}else {
				ProductDAO dao = new ProductDAO();
				int result = 0;
				for(String a:arr) {
					result = dao.delProduct(a);
				}
				dao.close();
				if(result == 1) {
					resp.sendRedirect(req.getContextPath()+"/ProductList.jsp");
				}else {
					PrintWriter pr = resp.getWriter();
					pr.println("<script>");
					pr.println("alert('삭제실패');");
					pr.println("history.back();");
					pr.println("</script>");
					pr.close();
				}
					
				
				
			}
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
			String oldFileName2 = oldProduct.getPimage2();
			System.out.println("oldFileName 이름 : "+oldFileName);
			System.out.println("oldFileName2 이름 : "+oldFileName2);
			dto.setPid(oldProduct.getPid());
			dto.setPname(pname);
			dto.setPprice(pprice);
			dto.setPstock(pstock);
			dto.setPdetail(pdetail);
			dto.setPimage(oldProduct.getPimage());
			dto.setPimage2(oldProduct.getPimage2());
			//파일 업로드 처리
			
			String file1 = mr.getFilesystemName("updateFile");
			String file2 = mr.getFilesystemName("updateFile2");
			String path = saveDirectory + File.separator + oldFileName.substring(0,oldFileName.lastIndexOf("."));
			System.out.println(path);
			System.out.println("file1 경로는 : " + file1);
			System.out.println("file2 경로는 : " + file2);
			if(file1 != null) {
				
				//기존 상품 사진삭제
				File old = new File(path+"/"+oldFileName);
				old.delete();
				
				File oFile = new File(saveDirectory + File.separator + file1);
				File nFile = new File(path + File.separator + oldFileName);
				
				oFile.renameTo(nFile);
				
			}
			if(file2 != null) {
				
				File old = new File(path+"/"+oldFileName2);
				System.out.println("old 경로 : " + old);
				old.delete();
				
				File oFile = new File(saveDirectory + File.separator + file2);
				File nFile = new File(path + File.separator + oldFileName2);
				System.out.println("ofile 경로 : " + oFile);
				System.out.println("nfile 경로 : " + nFile);
				oFile.renameTo(nFile);
				
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
