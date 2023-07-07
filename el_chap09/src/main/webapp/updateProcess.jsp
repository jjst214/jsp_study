<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/uploads");
	int maxPostSize = 1024*1000; //파일 최대크기
	String encoding = "UTF-8";	//인코딩 방식
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,
			maxPostSize, encoding);
	String fileName = mr.getFilesystemName("attachedFile"); //현재 파일이름을 받아옴
	String ext = fileName.substring(fileName.lastIndexOf(".")); //파일의 확장자만 떼서 저장
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now+ext;	//업로드일시.확장자(새로운파일명)
	//파일명 변경
	//File 객체 생성
	File oldFile = new File(saveDirectory+File.separator + fileName);
	File newFile = new File(saveDirectory+File.separator + newFileName);
	oldFile.renameTo(newFile);
	
	String idx = mr.getParameter("num");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if(cateArray == null){
		cateBuf.append("선택 없음");
	}else{
		for(String s: cateArray){
			cateBuf.append(s + ", ");
		}
	}
	
	MyFileDAO dao = new MyFileDAO();
	out.println("여기여기" + idx);
	MyFileDTO dto = dao.detailview(idx);
	
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	int result = 0;
	
	result = dao.updatePost(dto);
	dao.close();
	
	if(result == 1){
		response.sendRedirect("detail.jsp?num=" + dto.getIdx());
	}else{
		%>
		<script>
			alert("글 수정에 실패했습니다.");
			response.sendRedirect("filelist.jsp");
		</script>
		<%
	}
%>