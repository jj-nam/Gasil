package org.joonzis.service;

import org.joonzis.domain.HeartVO;

public interface HeartService {
	public int get(HeartVO vo);
	public int searchLike(HeartVO vo);
	public int insert(HeartVO vo);
	public int deleteLike(HeartVO vo);
	/*
	 * public int likeUp(HeartVO vo); public int likeDown(HeartVO vo);
	 */
}
