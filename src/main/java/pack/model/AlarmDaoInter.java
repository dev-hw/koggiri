package pack.model;

import java.util.ArrayList;

import pack.controller.AlarmBean;
import pack.controller.FormDetailBean;

public interface AlarmDaoInter {

	ArrayList<AlarmBean> getAlarmList(int userNo);
	boolean insertAlarm(AlarmDto dto);
	FormDetailBean getFormInfo(int formNo);
	boolean updateApprovalState(int formNo);
	boolean updateRefusalState(int formNo);
	
	boolean updateAlarm(int formNo);
}
