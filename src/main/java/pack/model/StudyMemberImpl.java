package pack.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyMemberImpl  extends SqlSessionDaoSupport implements StudyMemberInter {

	@Autowired
	public StudyMemberImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public boolean insertStudyMember(StudyMemberDto studyMemberDto) {
		// ���͵�� �߰�
		int re = getSqlSession().insert("insertStudyMember", studyMemberDto);
		if(re > 0)
			return true;
		else
			return false;
	}
	
	@Override
	public boolean selectStudyExist(StudyMemberDto studyMemberDto) {
		// ���͵� �ߺ� ���� �����ϸ� false
		int re = getSqlSession().selectOne("selectStudyExist", studyMemberDto);
		if (re>0) return true;
		else return false;
	}

	@Override
	public boolean selectalMember(StudyMemberDto studyMemberDto) {
		int re = getSqlSession().selectOne("selectalMember",studyMemberDto);
		if (re>0) {
			return true;
		}
		else {
			return false; 
		}
	}

	@Override
	public int selectStudymemberno(StudyMemberDto studyMemberDto) {
		
		return getSqlSession().selectOne("selectStudymemberno",studyMemberDto);
	}

	@Override
	public boolean selectNoUser(StudyMemberDto studyMemberDto) {
		int re = getSqlSession().selectOne("selectNoUser",studyMemberDto);
		if (re>0) {
			return true;
		}
		else {
			return false; 
		}
	}
}
