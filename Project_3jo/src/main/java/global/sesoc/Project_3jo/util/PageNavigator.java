package global.sesoc.Project_3jo.util;

/**
 * 페이징 처리 클래스
 */
public class PageNavigator {
	//페이지 관련 정보 
		private int countPerPage;		//페이지당 글목록 수
		private int pagePerGroup;		//그룹당 페이지 수 
		private int currentPage;		//현재 페이지 (최근 글이 1부터 시작)
		private int totalRecordsCount;	//전체 글 수
		private int totalPageCount;		//전체 페이지 수
		private int currentGroup;		//현재 그룹 (최근 그룹이 0부터 시작)
		private int startPageGroup;		//현재 그룹의 첫 페이지
		private int endPageGroup;		//현재 그룹의 마지막 페이지
		private int startRecord;		//전체 레코드 중 현재 페이지 첫 글의 위치 (0부터 시작)

		/*
		 * 생성자
		 */
		public PageNavigator(int countPerPage, int pagePerGroup, int currentPage, int totalRecordsCount) {
			//페이지당 글 수, 그룹당 페이지 수, 현재 페이지, 전체 글 수를 전달받음
			this.countPerPage = countPerPage;
			this.pagePerGroup = pagePerGroup;
			this.totalRecordsCount = totalRecordsCount;
			
			//전체 페이지 수
			totalPageCount = (totalRecordsCount + countPerPage - 1) / countPerPage;
			
			//페이지 수가 무조건 1 이상이 나와야 하니까 1페이지를 위한 최소 글 수를 기본값으로 부여하고 이것이 괄호 안의 countPerPage 이다
			//문제는 실제 글 수가 여기에 더해지면서 발생한다
			//기본값을 기본값으로 나누면 1로 유지가 되지만 여기에 실제 글 수가 1만 부여되어도 페이지값이 값자기 1을 넘겨버린다.
			//기본값 countPerPage 와 전체 글 수가 같으면 그냥 페이지는 하나이다. 그런데 2/1 이므로 몫이 2가 되어 두 페이지가 된다.
			//그래서 정수 1을 빼주어서 몫이 1에서 그치도록 만들어주는 것이다.

			//전달된 현재 페이지가 1보다 작으면 현재페이지를 1페이지로 지정
			if (currentPage < 1)	currentPage = 1;
			//전달된 현재 페이지가 마지막 페이지보다 크면 현재페이지를 마지막 페이지로 지정
			if (currentPage > totalPageCount)	currentPage = totalPageCount; //갱신해주는 거지?
			
			this.currentPage = currentPage;

			//현재 그룹
			currentGroup = (currentPage - 1) / pagePerGroup;
			
			//현재 그룹의 첫 페이지 (현재 그룹은 0부터 시작한다고 변수 선언 주석에서 정의했음)
			startPageGroup = currentGroup * pagePerGroup + 1;
			//현재 그룹의 첫 페이지가 1보다 작으면 1로 처리
			startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
			//현재 그룹의 마지막 페이지
			endPageGroup = startPageGroup + pagePerGroup - 1;
			//현재 그룹의 마지막 페이지가 전체 페이지 수보다 작으면 전체페이지 수를 마지막으로.
			endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;
			//Q.이게 왜 필요하지? 만일 로직에 오류가 생길 경우를 대비하는 건가? 식 대로라면 일어날 일이 없지 않나? 

			//전체 레코드 중 현재 페이지 첫 글의 위치
			startRecord = (currentPage - 1) * countPerPage;
			//첫 페이지 첫 글의 위치는 0에서 시작하니까! 1페이지라면 -1을 해야 곱했을 때 0값이 나와
			//예시로 페이지 당 글 수 5에 4페이지인 첫 글의 경우를 가정해보면 -1 없이는 20 번째는  5페이지의 시작이 된다.
			//15~19가 4페이지의 위치 값이므로 -1을 해주어 실제 글 수보다 1더한 값이 새 페이지 글 위치로 시작할 수 있다.
		}
		
		/*
		 * Getters and Setters
		 */
		public int getCountPerPage() {
			return countPerPage;
		}

		public void setCountPerPage(int countPerPage) {
			this.countPerPage = countPerPage;
		}

		public int getPagePerGroup() {
			return pagePerGroup;
		}

		public void setPagePerGroup(int pagePerGroup) {
			this.pagePerGroup = pagePerGroup;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getTotalRecordsCount() {
			return totalRecordsCount;
		}

		public void setTotalRecordsCount(int totalRecordsCount) {
			this.totalRecordsCount = totalRecordsCount;
		}

		public int getTotalPageCount() {
			return totalPageCount;
		}

		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}

		public int getCurrentGroup() {
			return currentGroup;
		}

		public void setCurrentGroup(int currentGroup) {
			this.currentGroup = currentGroup;
		}

		public int getStartPageGroup() {
			return startPageGroup;
		}

		public void setStartPageGroup(int startPageGroup) {
			this.startPageGroup = startPageGroup;
		}

		public int getEndPageGroup() {
			return endPageGroup;
		}

		public void setEndPageGroup(int endPageGroup) {
			this.endPageGroup = endPageGroup;
		}

		public int getStartRecord() {
			return startRecord;
		}

		public void setStartRecord(int startRecord) {
			this.startRecord = startRecord;
		}

		@Override
		public String toString() {
			return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
					+ currentPage + ", totalRecordsCount=" + totalRecordsCount + ", totalPageCount=" + totalPageCount
					+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
					+ endPageGroup + ", startRecord=" + startRecord + "]";
		}
		
		
}
