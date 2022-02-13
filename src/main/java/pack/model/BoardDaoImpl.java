package pack.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.StudyBoardBean;

@Repository
public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDaoInter{
	@Autowired
	public BoardDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public ArrayList<BoardDto> getList(String studyNo) {
		
		return (ArrayList)getSqlSession().selectList("selectBoardList",studyNo);
	}

	
	@Override
	public int totalBoardRecord(String studyNo) {
		return getSqlSession().selectOne("totalBoardRecord",studyNo);
	}

	@Override
	public String getManager(String studyNo) {
		
		return getSqlSession().selectOne("selectManager",studyNo);
	}

	@Override
	public boolean withdraw(StudyBoardBean bean) {
		System.out.println(bean);
		try {
		int result = getSqlSession().delete("deleteMemberFromStudy",bean);
		if (result>0)
			return true;
		else return false;
		}catch(Exception e) {
			return false;
		}
	}

	@Override
	public boolean removeStudy(int studyNo) {
		
		try {
			int result = getSqlSession().delete("removeStudy",studyNo);
			if (result>0)
				return true;
			else return false;
			
		} catch (Exception e) {
			return false;
			
		}
		
	}

	@Override
	public String selectName(int userNo) {
		
		return getSqlSession().selectOne("selectName",userNo);
	}

	@Override
	public int currentMaxnum(int studyNo) {
		if(getSqlSession().selectOne("currentMaxnum",studyNo)==null) {
			return 0;
		}
		return getSqlSession().selectOne("currentMaxnum",studyNo);
		
	}

	@Override
	public boolean insert(StudyBoardBean bean) {
		int re = getSqlSession().insert("insertIntoBoard",bean);
		if(re>0) return true;
		else return false;
	}

	@Override
	public int selectStudymemberno(StudyBoardBean bean) {
		
		return getSqlSession().selectOne("selectStudymemberno",bean);
	}

	

	@Override
	public ArrayList<BoardDto> selectSearchTitle(StudyBoardBean bean) {
		
		return (ArrayList)getSqlSession().selectList("selectSearchTitle",bean);
	}

	@Override
	public ArrayList<BoardDto> selectSearchName(StudyBoardBean bean) {
		// TODO Auto-generated method stub
		return (ArrayList)getSqlSession().selectList("selectSearchName",bean);
	}

	@Override
	public boolean deletePost(PostDto dto) {
		int re = getSqlSession().delete("deletePost",dto);
		if(re>0) return true;
		else return false;
	}
	
	@Override
	public int selectUserNo(int PostNo) {
		return getSqlSession().selectOne("selectPostUserNo", PostNo);
	}

	@Override
	public boolean updatePost(PostDto dto) {
		int re = getSqlSession().update("updatePost",dto);
		if(re>0) return true;
		else return false;
	}
	
}
