package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.HeartBoardVO;
import org.joonzis.domain.HeartVO;

public interface HeartService {
	public List<HeartBoardVO> getLikeList(String writer);
	public int insert(HeartVO vo);
	public int deleteLike(HeartVO vo);
	public int totalLike(long bno);
	public int checkLike(HeartVO vo);
}
