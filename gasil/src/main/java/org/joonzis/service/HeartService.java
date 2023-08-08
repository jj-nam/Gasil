package org.joonzis.service;

import org.joonzis.domain.HeartVO;

public interface HeartService {
	public int insert(HeartVO vo);
	public int deleteLike(HeartVO vo);
	public int totalLike(long bno);
	/*
	 * public int likeUp(HeartVO vo); public int likeDown(HeartVO vo);
	 */
}
