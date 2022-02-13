package pack.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xpath.internal.axes.HasPositionalPredChecker;

import pack.model.UserDaoInter;
import pack.model.UserDto;

@Controller
public class LoginController {

	@Autowired
	private UserDaoInter udinter;
	
	//로그인 페이지 이동
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		return "loginform";
	}
	
	//로그인하기
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginsubmit(HttpSession session,
		@RequestParam("id")String id,
		@RequestParam("password")String password) {
		
		UserBean bean=new UserBean();
		bean.setId(id);
		bean.setPassword(password);
		
		boolean b=udinter.login(bean);
		if(b) {
			UserBean bean2=udinter.selectidUser(id);
			System.out.println(bean2);
			String name=udinter.selectName(bean2);
			System.out.println(name);
			//id로 userNo 찾기 
			int userNo=bean2.getUserNo();
			
			
			session.setAttribute("namekey",name);
			session.setAttribute("userNo",userNo);
			return "../../index";
		}
		else {
			
			return "error";
		}
	}
	
	//로그아웃하기
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("namekey");
		return "../../index";
	}
	@RequestMapping(value="find_id", method=RequestMethod.GET)
	public String find_id() {
		return "find_id";
	}
	
	
	//아이디 찾기 페이지 이동
	@RequestMapping(value="find_id", method=RequestMethod.POST)
	public ModelAndView find_id2(UserBean bean) {
		String name=bean.getName();
		
		String id=udinter.selectNameUser(name).getId();
		
		if(id!=null) {

			ModelAndView andView=new ModelAndView("find_id_success");
			andView.addObject("name", name);
			andView.addObject("id", id);
			return andView;
		}else {
			
			ModelAndView andView=new ModelAndView("error2");
			return andView;
		}
		
		
		
	}
	
	//존재하는 닉네임인지 확인하기
	@RequestMapping(value="nameOk", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> nameOk(@RequestParam("nameOk")String nameOk){
		
		
		boolean b=udinter.selectNameUser2(nameOk);
		Map<String, String> map=new HashMap<String, String>();
		
		if(b) {
			System.out.println("존재하는 닉네임");
			map.put("result", "y");
			System.out.println(map);
			return map;
		}else {
			System.out.println("없는 닉네임");
			map.put("result", "n");
			System.out.println(map);
			return map;
		}
		
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping(value="find_pwd", method=RequestMethod.GET)
	public String find_pwd() {
		return "find_pwd";
	}
	
	@RequestMapping(value="find_pwd", method=RequestMethod.POST)
	public ModelAndView find_pwd2(UserBean ubean) {
		Random random=new Random();
		int i=random.nextInt(1000000000);
		i+=100000;
		String pwd=i+"2";
		UserBean bean=udinter.selectidUser(ubean.getId());
		bean.setPassword(pwd);
		udinter.updateUinfo(bean);
		
		ModelAndView andView=new ModelAndView("find_pwd_success");
		andView.addObject("pwd",pwd);
		andView.addObject("name", bean.getName());
		
		return andView;
	}
	
	//비밀번호 확인 답변 확인
	@RequestMapping(value="chkAnswer", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> chkAnswer(
			@RequestParam("hint")String hint,
			@RequestParam("answer")String answer,
			@RequestParam("id")String id){
		UserBean ubean=new UserBean();
		ubean.setId(id);
		boolean b=udinter.useId(ubean);
		
		Map<String, String> map=new HashMap<String, String>();
		
		if(!b) {
			String uhint=udinter.selectidhint(id);
			String uanswer=udinter.selectidanswer(id);
			
			if(uhint.equals(hint)) {
				if(uanswer.equals(answer)) {
					map.put("result", "y");
					return map;
				}else {
					map.put("result", "n");
				}
			}else {
				map.put("result", "n");
			}
		}else {
			map.put("result", "n");
		}
		return map;
	}
	
	
	//회원 가입 페이지 이동
	@RequestMapping(value="signup", method=RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	
	//회원 가입 처리하기
	@RequestMapping(value="signup", method=RequestMethod.POST)
	public ModelAndView signupSubmit(UserBean bean) {
		//signup.jsp 페이지에서 값을 받아옴
		int num=udinter.currentMaxnum()+1; 
		bean.setUserNo(num);
		boolean b=udinter.insert(bean);
		
		String name=bean.getName();
		String id=bean.getId();
		ModelAndView andView=new ModelAndView("signsuccess");
		andView.addObject("name", name);
		andView.addObject("id", id);
		
		return andView;
	}
	
	//사용 가능한 아이디인지 확인하기
	@RequestMapping(value="useId", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useId(@RequestParam("useId")String useId){
		UserBean bean=new UserBean();
		bean.setId(useId);
		
		boolean b=udinter.useId(bean);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 아이디입니다.");
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
	
	//사용 가능한 닉네임인지 확인하기
	@RequestMapping(value="useName", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> useName(@RequestParam("useName")String useName){
		UserBean bean=new UserBean();
		bean.setName(useName);
		
		boolean b=udinter.useName(bean);
		Map<String, String> map=new HashMap<String, String>();

		if(b) {
			System.out.println("사용할 수 있는 닉네임입니다.");
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
	
	//로그인 아이디 혹은 비밀번호가 틀렸을 때
	@RequestMapping("error")
	public String err() {
		
		return "error";
	}
}
