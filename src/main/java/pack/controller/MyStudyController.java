package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.BoardDto;
import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyDaoInter;
import pack.model.StudyDto;
import pack.model.StudyMemberDto;
import pack.model.StudyMemberInter;
import pack.model.UserDaoInter;
import pack.model.UserDto;

@Controller
public class MyStudyController {
	@Autowired
	private BoardDaoInter inter;
	
	@Autowired
	private PostingInter pinter;
	
	@Autowired
	private StudyMemberInter sminter;
	
	@Autowired
	private CommDaoInter cdinter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	@Autowired
	private UserDaoInter uinter;
	
	private int totalRecord; 	
	private int numInOnePage=5;
	private int totalPageNum;
	
	//스터디 게시판 가기
	@RequestMapping(value = "studyboard", method = RequestMethod.GET)
	public ModelAndView process(
			@RequestParam("studyNo") String studyNo, 
			@RequestParam("page") String page,
			HttpSession session) { 
		ModelAndView andView = new ModelAndView();
		
		int userNo=(Integer)session.getAttribute("userNo");
		
		andView.addObject("studyNo",studyNo);
		andView.addObject("userNo",userNo);
		int p = 0;
		try {
			p = Integer.parseInt(page);
		} catch (Exception e) {
			p = 1;
		}
		if(p<=0) {
			p=1;
		}
		totalRecord = inter.totalBoardRecord(studyNo);
		
		
		ArrayList<BoardDto> list = inter.getList(studyNo);
		ArrayList<BoardDto> result = getListData(list,p);
		
		andView.addObject("data",result);	
		andView.addObject("totalPageNum",getTotalPageNum());
		andView.addObject("page",p);
		
		String manager = inter.getManager(studyNo);
		andView.setViewName("studyBoard");
		
		String user=""+userNo+"";
		System.out.println(user);
		
		if(user.equals(manager)) {
			andView.addObject("manager", true);
		}
		else {
			
			andView.addObject("manager", false);
		}
		
		System.out.println("M결과값 : "+manager+" "+user+" "+user.equals(manager));
		
		//System.out.println("���� ���� : " +list.get(0).getUserNo());
		
		return andView;
	}
	
	
	public ArrayList<BoardDto> getListData(ArrayList<BoardDto> list, int page){
		ArrayList<BoardDto> result = new ArrayList<BoardDto>();
		
		int start = (page-1)*numInOnePage; //0,2,4 ...
		
		int size=numInOnePage<=list.size()-start?numInOnePage:list.size()-start;
		
		for(int i=0;i<size;i++) {
			result.add(i,list.get(start+i));
		}
		return result;
	}
	
	public int getTotalPageNum() {

		
		totalPageNum = totalRecord/numInOnePage; 

		if(totalRecord%numInOnePage>0) totalPageNum+=1;	
		return totalPageNum;
	}
	
	
	//게시글 작성 페이지 이동
	@RequestMapping(value="write",method=RequestMethod.GET)
	public ModelAndView write(
			@RequestParam("studyNo") int studyNo,
			HttpSession session) {
		
		
		int userNo=(Integer)session.getAttribute("userNo");
		
		ModelAndView andView = new ModelAndView();
		andView.addObject("userNo",userNo);
		andView.addObject("studyNo",studyNo);
		
		String name =inter.selectName(userNo);
		andView.addObject("name",name);
		return andView;
	}
	
	
	//게시글 작성 처리
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String writeSubmit(
			StudyBoardBean bean,
			@RequestParam("userNo") int userNo, 
			@RequestParam("studyNo") int studyNo) {
		
		int postNo = inter.currentMaxnum(bean.getStudyNo())+1;
		bean.setPostNo(postNo);
		int studyMemberNo = inter.selectStudymemberno(bean);
		
		bean.setuNo(userNo);
		bean.setsNo(studyNo);
		
		bean.setStudyMemberNo(studyMemberNo);
		boolean b = inter.insert(bean);
		
		if(b)
			return "redirect:studyboard?userNo="+userNo+"&studyNo="+studyNo+"&page=1";
		else
			return "err";
	}
	
	
	//게시글 수정 페이지 이동
	@RequestMapping(value = "updatePost", method = RequestMethod.GET)
	public ModelAndView updatePost(
			@RequestParam("postNo") int postNo, 
			@RequestParam("studyNo") int studyNo,
			HttpSession session) {
		
		StudyMemberDto smdto=new StudyMemberDto();
		int userNo=(Integer)session.getAttribute("userNo");
		smdto.setStudyNo(studyNo);
		smdto.setUserNo(userNo);
		int smno=sminter.selectStudymemberno(smdto);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setStudyMemberNo(smno);
		
		PostDto dto = pinter.getDetail(pdto);
		ModelAndView andView = new ModelAndView();
		andView.addObject("data", dto);
		andView.addObject("userNo", userNo);
		andView.addObject("studyNo", studyNo);

		return andView;

	}

	//게시글 수정 처리
	@RequestMapping(value = "updatePost", method = RequestMethod.POST)
	public String doSqlUpdate(
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo,
			PostDto dto) {

		dto.setsNo(studyNo);
		
		if (pinter.updatePost(dto))
			return "redirect:/studyboard?userNo="+userNo+"&studyNo="+studyNo +"&page=1";
		else
			return "redirect:/error2";
	}
	
	//게시판에서 게시글 삭제 처리
	@RequestMapping("deletePost")
	public String deletePost(@RequestParam("postNo") int postNo,
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo) {
		
		
		CommentDto cdto=new CommentDto();
		cdto.setStudyNo(studyNo);
		cdto.setPostNo(postNo);
		cdinter.deletepostCom(cdto);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setsNo(studyNo);
		
		if(inter.deletePost(pdto)) {
			return "redirect:/studyboard?&studyNo=" + studyNo + "&page=1";
		}
		else return "redirect:/error2";

	}
	
	//마이페이지에서 게시글 삭제 처리
	@RequestMapping("deletePost2")
	public String deletePost2(@RequestParam("postNo") int postNo,
			@RequestParam("userNo") String userNo,
			@RequestParam("studyNo") int studyNo){
		
		
		CommentDto cdto=new CommentDto();
		cdto.setStudyNo(studyNo);
		cdto.setPostNo(postNo);
		cdinter.deletepostCom(cdto);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setsNo(studyNo);
		
		
		if(inter.deletePost(pdto)) {
			return "redirect:/board?&userNo=" + userNo + "&cpage=0";
		}
		else return "redirect:/error2";

	}
	
	
	//스터디 수정 페이지로 이동
	@RequestMapping(value="sujungStudy", method=RequestMethod.GET)
	public ModelAndView sujungStudy(
			@RequestParam("studyNo")int studyNo) {
		ModelAndView andView=new ModelAndView("sujungStudy");
		
		StudyDto sdto=sdinter.selectNoStudyInfo(studyNo);
		
		andView.addObject("studyNo", studyNo);
		andView.addObject("sdto", sdto);
		/*
		andView.addObject("studyName", sdto.getStudyName());
		andView.addObject("content", sdto.getContent());
		andView.addObject("maxPeopleNum", sdto.getMaxPeopleNum());
		andView.addObject("language", sdto.getLanguage());
		*/
		
		return andView;
	}
	
	
	//스터디 수정 처리하기
	@RequestMapping(value="sujungStudy", method=RequestMethod.POST)
	public String sujungStudy2(
			@RequestParam("studyNo")int studyNo,
			@RequestParam("languageChk") List<String> languageChk,
			StudyDto sdto) {
		
		String str="/";
		str += String.join("/",languageChk);
		str+="/";
		sdto.setLanguage(str);
		boolean b=sdinter.updateStudyinfo(sdto);
		if(b) {
			return "redirect:/studyDetail?studyNo="+studyNo;
		}else {
			return "error.jsp";
		}
	}
	
	//스터디 삭제하기
	@RequestMapping(value="removeStudy",method=RequestMethod.POST)
	public ModelAndView removeStudy(StudyBoardBean bean) {
		int studyNo = bean.getStudyNo();
		int nowP=sdinter.selectNowPeople(studyNo);
		//System.out.println("nowP결과 값 : "+nowP+" "+studyNo);
		
		
		if(nowP==1) {
			ModelAndView andView=new ModelAndView("../../index");
			boolean result = inter.removeStudy(studyNo);
			if(result) { 
				System.out.println("체크");
				return andView;
			}
			else {
				ModelAndView andView2=new ModelAndView("err");
				System.out.println("에러");
				return andView2;
			}
			
		}else {
			ModelAndView andView=new ModelAndView("remove_study");
			andView.addObject("studyNo",studyNo);
			return andView;
			
		}
	}
	
	//스터디 삭제하기
	@RequestMapping(value="removeStudy2",method=RequestMethod.GET)
	public ModelAndView removeStudy2(
			@RequestParam("studyNo") int studyNo) {
		
		ModelAndView andView=new ModelAndView("removeStudy2");
		andView.addObject("studyNo", studyNo);
		
		return andView;
	}
	
	//스터디장 위임 페이지로 이동
	@RequestMapping(value="changeStudyM",method=RequestMethod.GET)
	public ModelAndView changeStudyM(
			@RequestParam("studyNo") int studyNo) {
	
		ModelAndView andView=new ModelAndView("changeStudyM");
		andView.addObject("studyNo", studyNo);
		
		return andView;
	}
	
	
	//스터디장 위임하기
	@RequestMapping(value="changeStudyM",method=RequestMethod.POST)
	public ModelAndView changeStudyM2(
			@RequestParam("studyNo") int studyNo,
			UserDto udto) {
		String name=udto.getName();
		Integer uno=uinter.selectNameUserno(name);
		
		StudyDto sdto=new StudyDto();
		sdto.setManager_userNo(uno);
		sdto.setStudyNo(studyNo);
		
		boolean b=sdinter.upStudyManage(sdto);
		
		if (b) {
			ModelAndView andView=new ModelAndView("changeSuccess");
			return andView;
		}else {
			ModelAndView andView=new ModelAndView("error");
			return andView;
		}
		
		
	}
	
	
	
	
	//스터디 회원 탈퇴
	@RequestMapping(value ="withdraw",method=RequestMethod.POST)
	public String doWithdrawal(
			StudyBoardBean bean,
			@RequestParam("studyNo") int studyNo,
			@RequestParam("name") String name) {
		
		boolean result = inter.withdraw(bean);
		boolean result2=sdinter.downNowpnum(studyNo);
		
		System.out.println("name 값:"+name);
		CommentDto cdto=new CommentDto();
		cdto.setUserName(name);
		cdto.setStudyNo(studyNo);
		
		boolean result3=cdinter.deleteMemCom(cdto);
		
		
		if(result && result2) { 
			System.out.println("체크");
			return "../../index";
			//return "home";
		}
		else {
			System.out.println("에러");
			return "error2";
		}
	}
	
	
	
	
	
	
	//댓글 페이징 처리 준비
	private int tot;		//전체 레코드 수
	private int plist=5;	//한 페이지 당 출력 행 수
	private int cpageSu;		//전체 페이지 수
	
	public ArrayList<CommentDto> getcListData(ArrayList<CommentDto> clist, int cpage){
		ArrayList<CommentDto> result=new ArrayList<CommentDto>();
		
		int start=(cpage-1)*plist;	//0, 10, 20 ...
		//clist.size()에서 start를 뺐을때 plist가 작거나 같은가? 참이면 :의 왼쪽값, 거짓이면 :의 오른쪽값 
		int size=plist<=clist.size()-start?plist:clist.size()-start;
		
		for(int i=0; i<size; i++) {
			result.add(i, clist.get(start+i));
		}
		
		return result;
	}
	public int getCpageSu() {
		cpageSu=tot/plist;
		if(tot%plist>0)cpageSu+=1;
		return cpageSu;
	}
	
	
	//게시글 자세히 보기 페이지 이동
	@RequestMapping("postDetail")
	public ModelAndView postdetailProcess(
			@RequestParam("postNo")int postNo,
			@RequestParam("cpage")int cpage,
			@RequestParam("studyNo")int studyNo) {
		
		PostDto pdto1=new PostDto();
		
		pdto1.setsNo(studyNo);
		pdto1.setPostNo(postNo);
		int userNo=pinter.selectNosUno(pdto1);
		
		StudyMemberDto smdto=new StudyMemberDto();
		smdto.setStudyNo(studyNo);
		smdto.setUserNo(userNo);

		
		int studyMemberNo=sminter.selectStudymemberno(smdto);
		
		System.out.println("studyMemberNo 결과값:"+studyMemberNo);
		
		PostDto pdto=new PostDto();
		pdto.setPostNo(postNo);
		pdto.setStudyMemberNo(studyMemberNo);
		
		if(cpage<=0) {
		//조회수 증가
		pinter.updatePostcnt(pdto);
		}
		
		
		CommentDto dto=new CommentDto();
		dto.setPostNo(postNo);
		dto.setStudyNo(studyNo);
		
		//댓글 불러오기(postDetail.jsp에서 댓글 출력하기 위함)
		ArrayList<CommentDto> clist=cdinter.getList(dto);
		
		//댓글 페이징 처리
		tot=cdinter.selectComcount(dto);
		//페이지 값 넘겨주기
		
		if(cpage<=0) cpage=1;
		
		ArrayList<CommentDto> result=getcListData(clist, cpage);
		
		String name=uinter.selectUsernoName(userNo);
		
		
		ModelAndView view = new ModelAndView("postDetail");
		view.addObject("pdata", pinter.getDetail(pdto));
		view.addObject("cdata", result);
		view.addObject("cpage", cpage);
		view.addObject("cpageSu",getCpageSu());
		view.addObject("postNo",postNo);
		view.addObject("studyNo", studyNo);
		view.addObject("name", name);
		//view.addObject("userNo", userNo);
		return view;
		
	}
	
	
	
	
	
	//댓글 추가기능
	@RequestMapping(value="insertcom", method=RequestMethod.POST)
	public String insertComm(CommentDto dto,
			@RequestParam("postNo")int postNo,
			@RequestParam("studyNo")int studyNo,
			@RequestParam("userNo")int userNo,
			HttpSession session) {
		
		
		int num=cdinter.selectMaxCom(dto)+1;
		dto.setCommentNo(num);
		
		String name=(String)session.getAttribute("namekey");
		System.out.println("네임 값 결과 : "+name);
		dto.setUserName(name);
		dto.setTime();
		boolean b=cdinter.insert(dto);
		
		
		if(b) {
			
			return "redirect:/postDetail?postNo="+postNo+"&cpage=1&studyNo="+studyNo;
		}
		else {
			return "error2";
		}
		
	}
	
	//댓글 삭제기능
	@RequestMapping("deletecom")
	public String deletecom(
			@RequestParam("commentNo")int commentNo,
			@RequestParam("postNo")int postNo,
			@RequestParam("studyNo")int studyNo) {
		CommentDto dto=new CommentDto();
		dto.setCommentNo(commentNo);
		dto.setPostNo(postNo);
		dto.setStudyNo(studyNo);
		
		boolean b=cdinter.delete(dto);
		
		if(b) {
			
			return "redirect:/postDetail?postNo="+postNo+"&cpage=1&studyNo="+studyNo;
		}
		else {
			return "error2";
		}
		
	}
	
	
	
	
	
	
	//게시글 찾기
	@RequestMapping(value="searchPost",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> searchPost(StudyBoardBean bean){
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		List<BoardDto> result = null;
		
		if(bean.getSearchPostValue()!=null && !bean.getSearchPostValue().equals("")) {
			
		
			if(bean.getSearchPostOption().equals("title")) {
				
				 result = inter.selectSearchTitle(bean);
				 
						 
			}else if(bean.getSearchPostOption().equals("name")) {
				
				result = inter.selectSearchName(bean);
			}
			
			for(BoardDto tmp:result) {
				System.out.println(tmp.getTitle());
				data = new HashMap<String, String>();
				data.put("title", tmp.getTitle());
				data.put("name",tmp.getName());
				data.put("postNo",Integer.toString(tmp.getPostNo()));
				data.put("views",Integer.toString(tmp.getViews()));
				data.put("postTime",tmp.getPostTime());
				datalist.add(data);
				
			}
			
			Map<String,Object> resultSearchBoard = new HashMap<String, Object>();
			resultSearchBoard.put("datalist",datalist);
			System.out.println(datalist);
			return resultSearchBoard;
		}
		else {
			return null;
		}
		
	}
}
