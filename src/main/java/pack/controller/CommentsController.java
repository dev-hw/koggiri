package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.CommDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyDaoInter;
import pack.model.UserDaoInter;

@Controller
public class CommentsController {

	@Autowired
	private BoardDaoInter bdinter;
	
	@Autowired
	private CommDaoInter cdinter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	@Autowired
	private PostingInter pinter;
	

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
	
	
	
	@RequestMapping(value="comments")
	public ModelAndView board(
			@RequestParam("userNo") int userNo,
			@RequestParam("cpage") int cpage) {
		
		ModelAndView andView=new ModelAndView();
		String name=bdinter.selectName(userNo);
		System.out.println("닉네임 : "+name);
		ArrayList<CommentDto> clist=cdinter.selectUsercom(name);
		
		ArrayList<String> slist=new ArrayList<String>();
		 
		//스터디이름 찾기
		 for(int i=0; i<clist.size(); i++) {
			 slist.add(sdinter.selectSnoName(clist.get(i).getStudyNo()));
		 }
		 
		 
		 ArrayList<String> tlist=new ArrayList<String>();
		 ArrayList<Integer> ulist=new ArrayList<Integer>();
		 
		 //타이틀 리스트
		 for(int i=0; i<clist.size(); i++) {
			 PostDto pdto=new PostDto();
			 pdto.setPostNo(clist.get(i).getPostNo());
			 pdto.setsNo(clist.get(i).getStudyNo());
			 
			 tlist.add(pinter.selectNosTitle(pdto));
			 ulist.add(pinter.selectNosUno(pdto));
		 }
		 
		 
		//게시글 불러오기(postDetail.jsp에서 댓글 출력하기 위함) - clist
			
		//게시글 페이징 처리
		tot=clist.size();
		//페이지 값 넘겨주기
		
		if(cpage<=0) cpage=1;
		
		ArrayList<CommentDto> result=getcListData(clist, cpage);
		 
		 
		andView.addObject("clist", result);
		andView.addObject("cpage", cpage);
		andView.addObject("cpageSu",getCpageSu()); 
		
		andView.addObject("slist",slist);
		andView.addObject("tlist",tlist);
		andView.addObject("ulist",ulist);
		return andView;
	}
}
