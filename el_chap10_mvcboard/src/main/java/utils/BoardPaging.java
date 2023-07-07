package utils;

public class BoardPaging {
	public static String pagingstr(int totalCount, int pageSize,
			int blockPage, int pageNum, String reqUrl) {
		String pagingStr = "";
		
		//전체페이지 수	 = 전체레코드 수(55) / 한페이지당 레코드 수(10) 5.5(ceil) --> 6페이지
		int totalPages = (int)Math.ceil((double)totalCount/pageSize);
		//이전페이지 블록 바로가기
		//현재 페이지 1~5 : 1이나오게, 6~10 : 6, 11~15 : 11
		int pageTemp = (((pageNum-1)/blockPage)*blockPage) + 1;
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전블록]</a>";
		}
		//각 페이지 번호 출력
		int blockcount = 1;
		while(blockcount <= blockPage && pageTemp <= totalPages) {
			//현재 보고있는 페이지는 링크를 걸지 않음
			if(pageTemp == pageNum) {
				pagingStr += " "+pageTemp+" ";
			}else {
				pagingStr += "<a href='"+reqUrl+"?pageNum='"+pageTemp+"'>"+pageTemp+"</a>";
			}
			pageTemp++;
			blockcount++;
		}
		//마지막페이지, 다음블록 출력
		//pageTemp가 전체페이지수 이하일때 다음블록과 마지막페이지 링크 활성화
		if(pageTemp<=totalPages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"'>[다음블록]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";
		}
		return pagingStr;
	}
}
