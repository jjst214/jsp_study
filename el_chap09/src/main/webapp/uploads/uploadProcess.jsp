<%@page import="fileupload.MyFileDAO"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//getRealPath ==> 물리적 경로를 리턴
	String saveDirectory = application.getRealPath("/uploads");
	int maxPostSize = 1024*1000; //파일 최대크기
	String encoding = "UTF-8";	//인코딩 방식
	
	try{
		//MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory,
				maxPostSize, encoding);
		//파일명 생성
		String fileName = mr.getFilesystemName("attachedFile"); //현재 파일이름을 받아옴
		String ext = fileName.substring(fileName.lastIndexOf(".")); //파일의 확장자만 떼서 저장
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now+ext;	//업로드일시.확장자(새로운파일명)
		//파일명 변경
		//File 객체 생성
		File oldFile = new File(saveDirectory+File.separator + fileName);
		File newFile = new File(saveDirectory+File.separator + newFileName);
		oldFile.renameTo(newFile);
		//다른 폼값 처리
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		//StringBuffer 문자열을 추가하거나 변경할때 주로 사용하는 자료형
		StringBuffer cateBuf = new StringBuffer();
		if(cateArray == null){
			cateBuf.append("선택 없음");
		}else{
			for(String s: cateArray){
				cateBuf.append(s + ", ");
			}
		}
		
		//DTO생성
		MyFileDTO dto = new MyFileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		//DAO를 이용하여 DB에 반영
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
		
		//파일 목록 jsp로 Redirection
		response.sendRedirect("../filelist.jsp");
	}
	catch(Exception e){
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("fileUpload.jsp")
		.forward(request, response);
	}
	
%>