package pack.controller;

public class StudySearchBean {
	int studyNo, manager_userNo;
	String studyName, content, maxPeopleNum, NowPeopleNum, language;
	private String searchOption, searchValue;

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getManager_userNo() {
		return manager_userNo;
	}

	public void setManager_userNo(int manager_userNo) {
		this.manager_userNo = manager_userNo;
	}

	public String getStudyName() {
		return studyName;
	}

	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMaxPeopleNum() {
		return maxPeopleNum;
	}

	public void setMaxPeopleNum(String maxPeopleNum) {
		this.maxPeopleNum = maxPeopleNum;
	}

	public String getNowPeopleNum() {
		return NowPeopleNum;
	}

	public void setNowPeopleNum(String nowPeopleNum) {
		NowPeopleNum = nowPeopleNum;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

}
