package kr.or.tco;

import java.util.List;


//페이징 처리를 위한 클래스
//게시글 데이터와 페이징 관련 정보를 담고 있다.
public class ArticlePage {
	//페이징 관련 멤버 변수
	//전체글의 행의 수
	private int total;
	
	//현재페이지 번호
	private int currentPage;
	
	//전체 페이지 수
	private int totalPages;
	
	//시작페이지 번호
	private int startPage;
	
	//마지막 페이지 번호
	private int endPage;
	
	//페이지의 개수
	private int pagingCount;
	
	
	//--------------------------페이지의 내용---------------------------------------
	
	
	
	private List<?> content;
	
	//생성자
	//size: 한 화면에 보여질 행의 수
		
		public ArticlePage(int total, int currentPage, int size, int pagingCount,
				List<?> content) {
			super();
			this.total = total;
			this.currentPage = currentPage;
			this.content = content;
			this.pagingCount = pagingCount;
			//select 결과가 없다면
			if(total==0) {
				totalPages = 0;
				startPage = 0;
				endPage = 0;
			}else{
				//전체 페이지 개수 구하기(전체 글의 수 / 한 화면에 보여질 행의 수)
				//정수와 정수의 나눗셈 결과는 정수이므로 13/7 => 1
				totalPages = total/size;
				//보정해줘야 할 경우는? 15/ 7 = 2 인 경우처럼 나머지가 0보다 큰 경우!
				if((total%size)>0) {
					//전체 페이지수를 1증가 시킨다.
					totalPages++;
				}
				
				//startPage : 이전 [1] [2] [3] [4] [5] 다음 일시 1을 의미
				//공식 : 현재 페이지 / 페이징의 개수 * 페이징의 개수 + 1;
				startPage = (currentPage / pagingCount * pagingCount) + 1 ;
				//보정해줘야할 경우? 5 / 5 * 5 + 1 = 6 처럼
				//			현재페이지 % 5 = 0 일 때 
				if(currentPage%pagingCount==0) {
					startPage -= pagingCount;
				}
				//endPage : 이전 [1] [2] [3] [4] [5] 다음 일시 5을 의미
				endPage = startPage + (pagingCount-1);
				//보정해야할 경우는 endPage 5 > totalPages가 3일 시
				// 			  endPage 5를 totalPages 3으로 바꾸어야한다.
				if(endPage>totalPages) {
					endPage = totalPages;
				}
			}//end else
		}

		
	
	
		//전체 행의 수를 리턴
		public int getTotal() {
			return this.total;
		}
		//select결과가 없는가? check
		public boolean hasNoArticles() {
			return this.total == 0;
		}
		//select결과가 있는가? true일 시 결과가 있음.
		public boolean hasArticles() {
			return this.total > 0;
		}
		//현재 페이지 번호 리턴
		public int getCurrentPage() {
			return currentPage;
		}
		//전체 페이지의 개수 리턴
		public int getTotalPages() {
			return totalPages;
		}
		
		
		
		 
		//데이터 VO List리턴
		public List<?> getContent() {
			return this.content;
		}
		
		
		
		
		//목록 하단의 시작 번호를 리턴
		public int getStartPage() {
			return this.startPage;
		}
		//목록 하단의 마지막 번호를 리턴
		public int getEndPage() {
			return this.endPage;
		}
	
		
		
		
}
