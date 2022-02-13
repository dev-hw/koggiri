package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.AlarmDaoInter;
import pack.model.FormDaoInter;
import pack.model.FormDto;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;
import pack.model.UserDaoInter;

@Controller
public class StudyController {

	@Autowired
	private StudyDaoInter inter;
	
	@Autowired
	private StudyMemberInter sminter;
	
	@Autowired
	private FormDaoInter finter;
	
	@Autowired
	private UserDaoInter udaoInter;
	
	@Autowired
	private AlarmDaoInter adaoInter;
	
	

	//스터디 찾기 페이지, 스터디 목록
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public ModelAndView studyinfo(HttpSession session) {

		String name = (String) session.getAttribute("namekey");
		ArrayList<StudyDto> study = null;


		study = inter.getStudyList();


		ModelAndView andView = new ModelAndView("home");

		for (StudyDto dto : study) {
			dto.setLanguage(dto.getLanguage().replaceAll("/", " #"));
			dto.setLanguage(dto.getLanguage().substring(0, dto.getLanguage().length()-1));
			System.out.println("dto : " + dto.getLanguage());
		}
		andView.addObject("size", study.size());
		andView.addObject("study", study);
		return andView;
	}

	//스터디 검색하기
	@RequestMapping(value = "searchStudy", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> searchStudy(HttpSession session, StudySearchBean bean) {

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;

		ArrayList<StudyDto> study = null;

		List<StudyDto> tmpList = null;
		if (bean.getSearchOption().equals("language")) {
			tmpList = inter.getSelectSearchLanguageStudyList(bean);
		} else if (bean.getSearchOption().equals("studyName")) {
			tmpList = inter.getSelectSearchTitleStudyList(bean);
		}

		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

	//스터디 목록에서 이미지 클릭하기
	@RequestMapping(value = "imgBtnClick", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ImgBtnClickStudy(@RequestParam(value = "langList[]") List<String> langList) {

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		List<StudyDto> tmpList = null;

		tmpList = inter.getSelectImgBtnStudyList(langList);
		
		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

	//스터디 목록에서 이미지 클릭하기
	@RequestMapping(value = "imgBtnClick", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ImgBtnClickStudy_total(HttpSession session) {

		int userNo = (Integer) session.getAttribute("userNo");

		List<Map<String, Object>> studyList = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		List<StudyDto> tmpList = null;

		tmpList = inter.getStudyList();

		for (StudyDto tmp : tmpList) {
			data = new HashMap<String, Object>();
			data.put("studyNo", tmp.getStudyNo());
			data.put("content", tmp.getContent());
			data.put("manager_userNo", tmp.getManager_userNo());
			data.put("studyName", tmp.getStudyName());
			data.put("content", tmp.getContent());
			data.put("maxPeopleNum", tmp.getMaxPeopleNum());
			data.put("nowPeopleNum", tmp.getNowPeopleNum());
			tmp.setLanguage(tmp.getLanguage().replaceAll("/", "#"));
			data.put("language", tmp.getLanguage());
			studyList.add(data);
		}

		Map<String, Object> studyLists = new HashMap<String, Object>();
		studyLists.put("datas", studyList);
		System.out.println(studyLists);
		return studyLists;
	}

	//스터디 생성 페이지 이동
	@RequestMapping(value = "newStudyForm", method = RequestMethod.GET)
	public ModelAndView write(@RequestParam("userNo") int manager_userNo) {
		ModelAndView andView = new ModelAndView("newStudyForm");
		andView.addObject("manager_userNo", manager_userNo);
		return andView;
	}
	
	//스터디 생성 처리
	@RequestMapping(value = "newStudyForm", method = RequestMethod.POST)
	public String process(StudyDto studyDto,
			StudyMemberDto studyMemberDto,
			@RequestParam("languageChk") List<String> languageChk) {
		String str="/";
		str += String.join("/",languageChk);
		str+="/";
		studyDto.setLanguage(str);
		
		
		if(!inter.createStudy(studyDto)) return "redirect:/error2";
		studyMemberDto.setUserNo(studyDto.getManager_userNo());
		studyMemberDto.setStudyNo(inter.getStudyNo(studyDto.getManager_userNo()));
		if(!sminter.insertStudyMember(studyMemberDto)) return "redirect:/error2";
		return "redirect:/home";
	}
	
	//스터디 자세히 보기
	@RequestMapping("studyDetail")
	public ModelAndView detail(
			@RequestParam("studyNo") int studyNo,
			HttpSession session) {
		
		ModelAndView andView = new ModelAndView("studyDetail");

		System.out.println(studyNo);
		StudyDetailBean dto = inter.getStudyDetail(studyNo);
		

		String str = dto.getLanguage().replaceAll("/", "#");
		str = str.substring(0,str.length()-1);
		dto.setLanguage(str);
		System.out.println("dto : " + dto.getLanguage());

		String time=dto.getAddTime();
		//System.out.println(time);
		time=time.substring(0,4)+"년 "+time.substring(5,7)+"월";
		
		//사용언어의 #의 위치를 찾고, String.subString을 이용해서 만들기..는 다음에 시간 남으면 하기
		
		StudyMemberDto smdto=new StudyMemberDto();
		int no=0;
		String result="";
		//가입되어있는 스터디인지 여부
		if(session.getAttribute("userNo")!=null) {
			no=(Integer)session.getAttribute("userNo");

			smdto.setUserNo(no);
			smdto.setStudyNo(studyNo);
			boolean b=sminter.selectalMember(smdto);
			
			
			if(b) {
				result="";
			}else {
				result="가입가능";
			}
			andView.addObject("result",result);
		}else {
			result="가입가능";
			andView.addObject("result",result);
		}
		
		
		String result2="";
		//가입신청을 한 스터디인지 여부
		FormDto fdto=new FormDto();
		fdto.setStudyNo(studyNo);
		if(no==0) {
			result2="가입가능";
		}else {
			fdto.setApplicant(no);
			boolean b2=finter.selectalSub(fdto);
			
			System.out.println("결과값 : "+fdto.getStudyNo());
			if(b2) {
				result2="";
			}else {
				result2="가입가능";
			}
		}
		andView.addObject("result2",result2);
		//모집인원이 다 찼을 경우
		String result3="";
		System.out.println("결과값 : "+dto.getNowPeopleNum());
		System.out.println("결과값 : "+dto.getMaxPeopleNum());
		System.out.println(dto.getNowPeopleNum()==dto.getMaxPeopleNum());
		if(dto.getNowPeopleNum()==dto.getMaxPeopleNum()) {
			result3="";
		}else {
			result3="1";
		}
		andView.addObject("result3",result3);
		
		
		andView.addObject("studyNo",studyNo);
		andView.addObject("dto",dto);
		andView.addObject("time",time);
		return andView;
		
	}
	//스터디 가입 페이지로 이동
	@RequestMapping(value="studysignup", method=RequestMethod.GET)
	public ModelAndView signup(
			HttpSession session,
			@RequestParam("studyNo") int studyNo) {
		String namekey=(String)session.getAttribute("namekey");
		
		
		ModelAndView andView=new ModelAndView("studysignup");
		andView.addObject("studyNo",studyNo);
		andView.addObject("namekey",namekey);
		return andView;
	}
	
	//스터디 가입 신청 처리
	@RequestMapping(value="studysignup", method=RequestMethod.POST)
	public String signupsubmit(
			@RequestParam("studyNo") int studyNo,
			@RequestParam("namekey") String namekey,
			FormDto dto,
			Model model) {
		//dto에는 content만 들어있다.
		dto.setStudyNo(studyNo);
		System.out.println("namekey 값 : "+namekey);
		
		//닉네임으로 유저 정보 찾아서 applicant에 userNo 값 넣어주기
		UserBean ubean=udaoInter.selectNameUser(namekey);
		int applicant=ubean.getUserNo();
		
		dto.setApplicant(applicant);
		
		boolean b=finter.insert(dto);
				
		if(b) {
			
			model.addAttribute("dto", dto);
			
			return "studysignsuccess";
		}else {
			return "error2";
		}
	}
	
	//스터디 이름 사용 가능한지
	@RequestMapping(value="usestudyName", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useName(@RequestParam("studyName")String studyName){
		StudyDto sdto=new StudyDto();
		sdto.setStudyName(studyName);
		
		boolean b=inter.selectstudyName(sdto);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 스터디명입니다.");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("사용 불가합니다.");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
	}
}
