package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommDaoImpl extends SqlSessionDaoSupport implements CommDaoInter{

	@Autowired
	public CommDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public boolean insert(CommentDto dto) {
		int i=getSqlSession().insert("insertCom",dto);
		
		if(i>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean delete(CommentDto dto) {
		int i=getSqlSession().delete("deleteCom",dto);
		
		if(i>0)
			return true;
		else
			return false;
	}

	@Override
	public ArrayList<CommentDto> getList(CommentDto dto) {
		
		return (ArrayList)getSqlSession().selectList("selectCom", dto);
	}

	@Override
	public int selectMaxCom(CommentDto dto) {
		if(getSqlSession().selectOne("selectMaxCom",dto)==null) return 0;
		return getSqlSession().selectOne("selectMaxCom", dto);
	}

	@Override
	public int selectComcount(CommentDto dto) {
		if(getSqlSession().selectOne("selectComcount",dto)==null) return 0;
		return getSqlSession().selectOne("selectComcount",dto);
	}

	@Override
	public boolean deletepostCom(CommentDto dto) {
		int i=getSqlSession().delete("deletepostCom",dto);
		
		if(i>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteMemCom(CommentDto dto) {
		int i=getSqlSession().delete("deleteMemCom",dto);
		
		if(i>0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateNamecom(CommentDto dto) {
		int i=getSqlSession().update("updateNamecom",dto);
		
		if(i>0)
			return true;
		else
			return false;
	}

	@Override
	public int selectNamecom(String userName) {
		
		if(getSqlSession().selectOne("selectNamecom",userName)==null) return 0;
		return getSqlSession().selectOne("selectNamecom",userName);
	}

	@Override
	public ArrayList<CommentDto> selectUsercom(String userName) {
		
		return (ArrayList)getSqlSession().selectList("selectUsercom",userName);
	}

}
