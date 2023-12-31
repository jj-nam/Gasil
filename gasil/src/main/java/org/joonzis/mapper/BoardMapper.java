package org.joonzis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.joonzis.domain.BoardUserVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getListWithPaging(Criteria cri);
	public List<BoardVO> getMyList(String writer);
	public List<BoardVO> getLikeList(String writer);
	public void insert(BoardVO vo);
	public BoardUserVO read(long bno);
	public boolean delete(long bno);
	public boolean update(BoardVO vo);
	public int getTotalcount();	
	public void updateReplyCnt(@Param("bno") long bno, @Param("amount") int amount);	
	public long selectMax();
	public BoardUserVO movePage(long bno);
	public int upView(long bno);
	public int upHeart(long bno);
	public int downHeart(long bno);
	
}
