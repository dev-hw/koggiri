package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.controller.AlarmBean;
import pack.controller.FormDetailBean;

@Repository
public class AlarmDaoImpl extends SqlSessionDaoSupport implements AlarmDaoInter{

	@Autowired
	public AlarmDaoImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	@Override
	public ArrayList<AlarmBean> getAlarmList(int userNo) {
		return (ArrayList) getSqlSession().selectList("alarmList", userNo);
	}

	@Override
	public boolean insertAlarm(AlarmDto dto) {
		int i=getSqlSession().insert("insertAlarm",dto);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public FormDetailBean getFormInfo(int formNo) {
		return getSqlSession().selectOne("selectformInfo", formNo);
	}
	
	@Override
	public boolean updateApprovalState(int formNo) {
		int i=getSqlSession().update("updateApprovalState", formNo);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public boolean updateRefusalState(int formNo) {
		int i=getSqlSession().update("updateRefusalState", formNo);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public boolean updateAlarm(int formNo) {
		int i=getSqlSession().update("updateAlarm",formNo);
		if(i>0) {
			return true;
		}else {
			return false;
		}
	}
}
