package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;
import pack.model.AlarmDto;
import pack.model.FormDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;

@Controller
public class AlarmController {

	@Autowired
	private AlarmDaoInter inter;
	
	@Autowired
	private StudyMemberInter studyMemberInter;
	
	@Autowired
	private StudyDaoInter studyDaoInter;
	
	@Autowired
	private FormDaoInter daoInter;
	
	//알림 페이지로 이동
	@RequestMapping("alarmList")
	public ModelAndView alarmList(@RequestParam("userNo") int userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		
		ArrayList<AlarmBean> dto = inter.getAlarmList(userNo);
		andView.addObject("dto",dto);
		andView.addObject("managerNo",userNo);
		return andView;
		
	}
	
	//가입 신청 확인 페이지로 이동
	@RequestMapping(value = "alarmform", method = RequestMethod.GET)
	public ModelAndView alarm(@RequestParam("formNo") int formNo) {
		
		
		
		if(inter.updateAlarm(formNo)) {
			ModelAndView andView = new ModelAndView("alarmform");
			FormDetailBean dto = inter.getFormInfo(formNo);
			andView.addObject("dto", dto);
			return andView;
		}
		else {
			return new ModelAndView("error2");
		}
		
		
	}
	
	//가입 신청 승인시
	@RequestMapping("approval")
	public String alarm2(StudyMemberDto dto,@RequestParam("formNo") int formNo,@RequestParam("manager_userNo") int manager_userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		if(!studyMemberInter.insertStudyMember(dto)) return "redirect:/error2";
		if(!inter.updateApprovalState(formNo)) return "redirect:/error2";
		//추가하기
		studyDaoInter.updateNowPeople(dto.getStudyNo());
		
		return "redirect:/alarmList?userNo="+manager_userNo;
	}
	
	//가입 신청 거절시
	@RequestMapping("refusal")
	public String alarm3(@RequestParam("formNo") int formNo,@RequestParam("manager_userNo") int manager_userNo) {
		
		ModelAndView andView = new ModelAndView("alarmList");
		if(!inter.updateRefusalState(formNo)) return "redirect:/error2";
		return "redirect:/alarmList?userNo="+manager_userNo;
	}
	
	
	
	
	//알림보내기
	@RequestMapping(value="ssindex", method=RequestMethod.GET)
	public String ssindex(
			@RequestParam("state")int state,
			@RequestParam("studyNo")int studyNo,
			@RequestParam("applicant")int applicant,
			@RequestParam("content")String content) {
		
		//스터디장에게 가입신청했다고 알림 보내기
		AlarmDto adto=new AlarmDto();
		
		FormDto fdto=new FormDto();
		fdto.setState(state);
		fdto.setStudyNo(studyNo);
		fdto.setApplicant(applicant);
		fdto.setContent(content);
		
		int formNo=daoInter.selectInfoNo(fdto);
		adto.setFormNo(formNo);
	
		System.out.println("formNo의 값은 : "+formNo);
		
		StudyDto sdto=studyDaoInter.selectNoStudyInfo(studyNo);
		//StudyDto를 통해서 스터디장의 번호를 얻어오고, AlarmDto에 값 넣어주기
		int suserNo=sdto.getManager_userNo();
		adto.setUserNo(suserNo);
		//알람 추가하기!
		inter.insertAlarm(adto);
		
		
		return "../../index";
	}
}
