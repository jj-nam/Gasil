package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.HeartVO;

public interface BoardService {
	public List<BoardVO> getList(Criteria cri);
	public void register(BoardVO vo);
	public BoardVO get(long bno);
	public boolean remove(long bno);
	public boolean modify(BoardVO vo);
	public int getTotal();
	public BoardVO movePage(long bno);
	public void updateHeart(long bno);
	/* public int findlike(HeartVO vo); */
}