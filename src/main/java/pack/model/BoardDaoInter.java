package pack.model;

import java.util.ArrayList;
import java.util.List;


import pack.controller.StudyBoardBean;

public interface BoardDaoInter {

	ArrayList<BoardDto> getList(String studyNo);
	int totalBoardRecord(String studyNo);
	String getManager(String studyNo);
	boolean withdraw(StudyBoardBean bean);
	boolean removeStudy(int studyNo);
	String selectName(int userNo);
	int currentMaxnum(int studyNo);
	boolean insert(StudyBoardBean bean);
	int selectStudymemberno(StudyBoardBean bean);
	ArrayList<BoardDto> selectSearchTitle(StudyBoardBean bean);
	ArrayList<BoardDto> selectSearchName(StudyBoardBean bean);
	boolean deletePost(PostDto dto);
	int selectUserNo(int PostNo);
	boolean updatePost(PostDto dto);
	
}
