package pack.model;

import java.util.ArrayList;
import java.util.List;

import pack.controller.StudyDetailBean;
import pack.controller.StudySearchBean;

public interface StudyDaoInter {

	ArrayList<StudyDto> getStudyList();
	ArrayList<StudyDto> getStudyListLogin(int userNo);
	ArrayList<StudyDto> getSelectSearchLanguageStudyList(StudySearchBean bean);
	ArrayList<StudyDto> getSelectSearchTitleStudyList(StudySearchBean bean);
	ArrayList<StudyDto> getSelectImgBtnStudyList(List<String> langList);
	StudyDetailBean getStudyDetail(int studyNo);
	
	
	boolean createStudy(StudyDto studyDto);
	boolean insert(StudySearchBean bean);
	ArrayList<StudyDto> selectMyStudyAsMember(String userNo);
	ArrayList<StudyDto> selectMyStudyAsManager(String userNo);
	int getStudyNo(int manager_userNo);
	StudyDto selectNoStudyInfo(int studyNo);
	boolean updateNowPeople(int studyNo);
	
	boolean selectstudyName(StudyDto studyDto);
	int selectNowPeople(int studyNo);
	
	int selectManagerno(int studyNo);
	
	boolean upStudyManage(StudyDto studyDto);
	
	boolean downNowpnum(int studyNo);
	boolean updateStudyinfo(StudyDto studyDto);
	
	String selectSnoName(int studyNo);
}
