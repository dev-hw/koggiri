package pack.model;

import java.util.ArrayList;

public interface CommDaoInter {
	boolean insert(CommentDto dto);
	boolean delete(CommentDto dto);
	boolean deletepostCom(CommentDto dto);
	boolean deleteMemCom(CommentDto dto);
	boolean updateNamecom(CommentDto dto);
	
	ArrayList<CommentDto> getList(CommentDto dto);
	int selectMaxCom(CommentDto dto);
	int selectComcount(CommentDto dto);
	
	int selectNamecom(String userName);
	
	ArrayList<CommentDto> selectUsercom(String userName);
}
