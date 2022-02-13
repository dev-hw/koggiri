package pack.model;

import java.util.ArrayList;

public interface PostingInter {

	PostDto getDetail(PostDto dto);
	
	boolean updatePostcnt(PostDto dto);
	boolean updatePost(PostDto dto);
	ArrayList<PostDto> selectNopost(int uNo);
	
	String selectNosTitle(PostDto dto);
	int selectNosUno(PostDto dto);
	
}
