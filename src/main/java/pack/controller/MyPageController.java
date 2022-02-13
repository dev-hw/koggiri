package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;
import pack.model.BoardDaoInter;
import pack.model.BoardDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;

@Controller
public class MyPageController {
	@Autowired
	private	StudyDaoInter inter;
	@Autowired
	private AlarmDaoInter adinter;
	
	//마이페이지로 이동
	@RequestMapping(value="mypage",method=RequestMethod.POST)
	public ModelAndView firstMyPage(@RequestParam("userNo") int userNo) {
		ModelAndView andView = new ModelAndView();

		ArrayList<AlarmBean> dto = adinter.getAlarmList(userNo);
		andView.addObject("dto",dto);
		andView.addObject("managerNo",userNo);
		
		andView.addObject("userNo",userNo);
		return andView;
		
	}
	
	//스터디 조회 페이지로 이동
	@RequestMapping(value="mystudyinfo",method=RequestMethod.POST)
	public ModelAndView mystudyinfo(@RequestParam("userNo") int userNo) {
		ModelAndView andView = new ModelAndView();
		
		ArrayList<AlarmBean> dto = adinter.getAlarmList(userNo);
		andView.addObject("dto",dto);
		andView.addObject("managerNo",userNo);
		
		andView.addObject("userNo",userNo);
		return andView;
		
	}
	
	
	@RequestMapping(value="mypageNew",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> createmyPage(
			@RequestParam("userNo") String userNo,
			@RequestParam("memberOrManager") String memberOrManager) {
		List<Map<String,Object>> datalist = new ArrayList<Map<String,Object>>();
		Map<String,Object> data = null;
		List<StudyDto> result = null;
		System.out.println("userNo");
		System.out.println(userNo);
		
		if(memberOrManager.equals("member")) {
			result = inter.selectMyStudyAsMember(userNo);
			System.out.println(result);
		}else if(memberOrManager.equals("manager")) {
			System.out.println("thisismanager");
			result = inter.selectMyStudyAsManager(userNo);
		}
		for(StudyDto tmp:result) {
			System.out.println(tmp.getStudyName());
			data = new HashMap<String, Object>();
			data.put("studyNo",tmp.getStudyNo());
			data.put("content",tmp.getContent());
			data.put("manager_userNo",tmp.getManager_userNo());
			data.put("studyName",tmp.getStudyName());
			data.put("content",tmp.getContent());
			data.put("maxPeopleNum",tmp.getMaxPeopleNum());
			data.put("nowPeopleNum",tmp.getNowPeopleNum());
			data.put("language",tmp.getLanguage());
			datalist.add(data);
		}
		Map<String,Object> resultList = new HashMap<String, Object>();
		
		resultList.put("datalist",datalist);
		System.out.println(resultList);
		return  resultList;
		
	}

}
