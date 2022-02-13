package pack.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FormDaoImpl extends SqlSessionDaoSupport implements FormDaoInter{
	@Autowired
	public FormDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public boolean insert(FormDto dto) {
		int i=getSqlSession().insert("insertStudyform",dto);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int selectInfoNo(FormDto dto) {
		
		return getSqlSession().selectOne("selectInfoNo",dto);
	}

	@Override
	public int getFormNo() {
		
		return getSqlSession().selectOne("getFormNo");
	}

	@Override
	public boolean selectalSub(FormDto dto) {
		int re=getSqlSession().selectOne("selectalSub", dto);
		if (re>0) {
			return true;
		}
		else {
			return false; 
		}
	}
}
