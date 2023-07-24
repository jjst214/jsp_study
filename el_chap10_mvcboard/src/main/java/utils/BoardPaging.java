package utils;

public class BoardPaging {
	public static String pagingstr(int totalCount, int pageSize, int blockPage,
			int pageNum, String reqUrl) {
		String pagingStr = "";
		
		//전체 페이지 수 : 전체 레코드 수(55) / 한 페이지당 레코드 수(10) 5.5 --> 6
		int totalPages = (int) Math.ceil((double) totalCount/pageSize);
		//이전 페이지 블록 바로가기
		//현재 페이지 1~5 = 1, 6~10 = 6, 11~15 = 11
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp+1)+"'>[이전]</a>";
		}
		//각 페이지 번호 출력
		int blockcount = 1;
		while(blockcount <= blockPage && pageTemp <= totalPages) {
			//현재 페이지는 링크를 걸지 않음
			if(pageTemp == pageNum) {
				pagingStr += " "+pageTemp+" "; 
			}else {
				pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>";
			}
			pageTemp++;
			blockcount++;
		}
		//마지막 페이지, 다음블럭 출력
		//pageTemp가 전체페이지수 이하일때 다음블록과 마지막페이지 링크 출력
		if(pageTemp <= totalPages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"'>[다음]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";
		}
		
		return pagingStr;
	}
	public static String pagingStr(int totalCount, int totalPages, int pageSize
			, int blockPage, int pageNum, String reqUrl, String searchField, String searchWord) {
		String pageStr = "";
		
		//블럭번호 변수 선언
		//1~5페이지 = 1
		//6~10페이지 = 6
		int pageTemp = ((pageNum-1) / blockPage*blockPage) + 1;
		//블럭번호(pageTemp) 가 1이 아닐때만 이전블럭 첫페이지 가기가 나타나게됨
		if(pageTemp != 1) {
			//http://localhost:8090/el_chap05/boardlist.jsp?pageNum=1
			if(searchWord != null && !searchWord.equals("")) {
				pageStr += "&nbsp;<a href='"+ reqUrl +"?searchField="+searchField+
						"&searchWord="+searchWord+"&pageNum=1'>[첫페이지]</a>&nbsp;";
				pageStr += "&nbsp;<a href='"+ reqUrl +"?searchField="+searchField+
						"&searchWord="+searchWord+"&pageNum="+(pageTemp-1)+"'>[이전]</a>&nbsp;";
			}else {
				pageStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
				pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전]</a>";
			}
			
		}
		//각 페이지 번호 출력(1,2,3,4,5 또는 6,7,8,9,10)
		int blockCount = 1;
		//blockCount 1->5까지 반복
		//시작은 pageTemp값으로 1씩 증가
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			//현재 페이지일때는 링크를 걸지않음
			if(pageTemp == pageNum) {
				//&nbsp; 빈 칸을 나타냄 html 문자첨부기호
				pageStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				if(searchWord != null && !searchWord.equals("")) {
					pageStr += "&nbsp;<a href='"+ reqUrl +"?searchField="+searchField+
							"&searchWord="+searchWord+"&pageNum="+ pageTemp +"'>" + pageTemp +"</a>&nbsp;";
				}else {
					pageStr += "&nbsp;<a href='"+reqUrl+"?pageNum="+pageTemp+"'>" + pageTemp +"</a>&nbsp;";
				}
				
			}
			pageTemp++;
			blockCount++;
		}
		//다음페이지 블럭 바로가기
		if(pageTemp <= totalPages) {
			if(searchWord != null && !searchWord.equals("")) {
				pageStr += "&nbsp;<a href='"+ reqUrl +"?searchField="+searchField+
						"&searchWord="+searchWord+"&pageNum="+(pageTemp+1)+"'>[다음]</a>&nbsp;";
				pageStr += "&nbsp;<a href='"+ reqUrl +"?searchField="+searchField+
						"&searchWord="+searchWord+"&pageNum="+totalPages+"'>[마지막페이지]</a>&nbsp;";
			}else {
				pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp+1)+"'>[다음]</a>";
				pageStr += "<a href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";
			}
		}
		
		
		return pageStr;
	}
}
