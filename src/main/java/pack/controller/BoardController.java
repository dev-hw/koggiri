package pack.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.BoardDaoInter;
import pack.model.CommentDto;
import pack.model.PostDto;
import pack.model.PostingInter;
import pack.model.StudyDaoInter;

@Controller
public class BoardController {

	@Autowired
	private PostingInter pinter;
	
	@Autowired
	private BoardDaoInter bdinter;
	
	@Autowired
	private StudyDaoInter sdinter;
	
	//게시글 페이징 처리 준비
	private int tot;		//전체 레코드 수
	private int plist=5;	//한 페이지 당 출력 행 수
	private int cpageSu;		//전체 페이지 수
	
	public ArrayList<PostDto> getcListData(ArrayList<PostDto> clist, int cpage){
		ArrayList<PostDto> result=new ArrayList<PostDto>();
		
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
	
	
	@RequestMapping(value="board")
	public ModelAndView board(
			@RequestParam("userNo") int userNo,
			@RequestParam("cpage") int cpage) {
		
		 ArrayList<PostDto> plist= pinter.selectNopost(userNo);
		 
		 ArrayList<String> slist=new ArrayList<String>();
				 
		 for(int i=0; i<plist.size(); i++) {
			 slist.add(sdinter.selectSnoName(plist.get(i).getsNo()));
		 }
		
		 
		String name=bdinter.selectName(userNo);
		
		//게시글 불러오기(postDetail.jsp에서 댓글 출력하기 위함) - plist
		
		//게시글 페이징 처리
		tot=plist.size();
		//페이지 값 넘겨주기
		
		if(cpage<=0) cpage=1;
		
		ArrayList<PostDto> result=getcListData(plist, cpage);
		
		ModelAndView andView= new ModelAndView();
		
		andView.addObject("plist", result);
		andView.addObject("cpage", cpage);
		andView.addObject("cpageSu",getCpageSu());
		

		andView.addObject("name",name);
		andView.addObject("slist",slist);
		return andView;
	}
	
}
