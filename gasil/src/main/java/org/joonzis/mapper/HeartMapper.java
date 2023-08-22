package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.HeartBoardVO;
import org.joonzis.domain.HeartVO;

public interface HeartMapper {
	public List<HeartBoardVO> getLikeList(String writer);
	public int insert(HeartVO vo);
	public int deleteLike(HeartVO vo);
	public int totalLike(long bno);
	public long findhno(HeartVO vo);
	public int checkLike(HeartVO vo);
}
