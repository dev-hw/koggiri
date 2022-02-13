package pack.model;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.UserBean;

@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDaoInter{
	@Autowired
	public UserDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	
	@Override
	public boolean insert(UserBean bean) {
		//유저 정보 추가
		int re=getSqlSession().insert("insertUser",bean);
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public int currentMaxnum() {
		//회원번호 자동 증가
		if(getSqlSession().selectOne("selectUserMaxnum")==null)return 0;
		return getSqlSession().selectOne("selectUserMaxnum");
	}

	
	@Override
	public boolean login(UserBean bean) {
		// 로그인 기능 - 회원이 맞는지(올바른 아이디와 비밀번호인지) 확인하기
		int i=getSqlSession().selectOne("selectLogin", bean);
		
		if(i>0)
			return true;
		else              
			return false;
	}


	@Override
	public boolean useId(UserBean bean) {
		//아이디 중복확인 - 아이디를 사용할 수 있는지
		int i=getSqlSession().selectOne("selectId",bean);
		
		if(i>0)
			return false;
		else              
			return true;
	}


	@Override
	public boolean useName(UserBean bean) {
		//닉네임 중복확인 - 닉네임을 사용할 수 있는지
		int i=getSqlSession().selectOne("selectName2",bean);
		
		if(i>0)
			return false;
		else              
			return true;
	}


	@Override
	public String selectName(UserBean bean) {
		// 아이디로 닉네임찾기
		
		return getSqlSession().selectOne("selectName3",bean);
	}


	@Override
	public UserBean selectidUser(String id) {
		// 아이디로 유저 정보 찾기
		return getSqlSession().selectOne("selectidUser",id);
	}


	@Override
	public UserBean selectNameUser(String name) {
		// 닉네임으로 유저 정보 찾기
		if(getSqlSession().selectOne("selectNameUser",name)==null)return null;
		return getSqlSession().selectOne("selectNameUser",name);
	}
	
	@Override
	public boolean selectNameUser2(String name) {
		// 닉네임으로 유저 정보 찾기
		if(getSqlSession().selectOne("selectNameUser",name)==null)return false;
		return true;
	}


	@Override
	public String selectNoPwd(int userNo) {
		return getSqlSession().selectOne("selectNoPwd",userNo);
	}


	@Override
	public int selectNameUserno(String name) {
		if (getSqlSession().selectOne("selectNameUserno",name)==null)return 0;
		return getSqlSession().selectOne("selectNameUserno",name);
	}


	@Override
	public String selectUsernoName(int userNo) {
		return getSqlSession().selectOne("selectUsernoName",userNo);
	}


	@Override
	public UserBean selectunoUser(int userNo) {
		return getSqlSession().selectOne("selectunoUser",userNo);
	}


	@Override
	public boolean updateUinfo(UserBean bean) {
		//닉네임 중복확인 - 닉네임을 사용할 수 있는지
		int i=getSqlSession().update("updateUinfo",bean);
		
		if(i>0)
			return true;
		else              
			return false;
	}


	@Override
	public boolean deleteUser(int userNo) {
		int re=getSqlSession().delete("deleteUser",userNo);
		if(re>0) {
			return true;
		}else {
			return false;
		}
	}


	@Override
	public String selectidhint(String id) {
		if (getSqlSession().selectOne("selectidhint", id)==null) return "";
		return getSqlSession().selectOne("selectidhint", id);
	}


	@Override
	public String selectidanswer(String id) {
		if(getSqlSession().selectOne("selectidanswer", id)==null) return "";
		return getSqlSession().selectOne("selectidanswer", id);
	}
	
	
	
	
	
}
