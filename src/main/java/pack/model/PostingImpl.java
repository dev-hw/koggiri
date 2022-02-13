package pack.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PostingImpl extends SqlSessionDaoSupport implements PostingInter{
	@Autowired
	public PostingImpl(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}

	@Override
	public PostDto getDetail(PostDto dto) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("postOne",dto);
	}

	@Override
	public boolean updatePostcnt(PostDto dto) {
		int re = getSqlSession().update("updatePostcnt", dto);
		if(re > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updatePost(PostDto dto) {
		
		int re = getSqlSession().update("updatePost", dto);
		if(re > 0)
			return true;
		else
			return false;
	}

	@Override
	public ArrayList<PostDto> selectNopost(int uNo) {
			if(getSqlSession().selectList("selectNopost",uNo)==null)return null;
		return (ArrayList)getSqlSession().selectList("selectNopost",uNo);
	}

	@Override
	public String selectNosTitle(PostDto dto) {
		return getSqlSession().selectOne("selectNosTitle", dto);
	}

	@Override
	public int selectNosUno(PostDto dto) {
		return getSqlSession().selectOne("selectNosUno", dto);
	}

}
