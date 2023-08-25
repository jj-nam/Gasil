package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardUserVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;

public interface BoardService {
	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO> getMyList(String writer);
	public void register(BoardVO vo);
	public BoardUserVO get(long bno);
	public boolean remove(long bno);
	public boolean modify(BoardVO vo);
	public int getTotal();
	public BoardUserVO movePage(long bno);
	public int upHeart(long bno);
	public int downHeart(long bno);
}