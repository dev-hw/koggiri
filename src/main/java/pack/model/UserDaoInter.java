package pack.model;

import pack.controller.UserBean;

public interface UserDaoInter {

	boolean insert(UserBean bean);
	boolean login(UserBean bean);
	
	int currentMaxnum();
	boolean useId(UserBean bean);
	boolean useName(UserBean bean);
	boolean updateUinfo(UserBean bean);
	boolean deleteUser(int userNo);
	
	String selectName(UserBean bean);
	UserBean selectidUser(String id);
	UserBean selectNameUser(String name);
	boolean selectNameUser2(String name);
	String selectidhint(String id);
	String selectidanswer(String id);
	
	String selectUsernoName(int userNo);
	
	UserBean selectunoUser(int userNo);
	
	String selectNoPwd(int userNo);
	int selectNameUserno(String name);
}
