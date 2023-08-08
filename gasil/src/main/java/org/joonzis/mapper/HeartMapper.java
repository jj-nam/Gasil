package org.joonzis.mapper;

import org.joonzis.domain.HeartVO;

public interface HeartMapper {
	public int insert(HeartVO vo);
	public int deleteLike(HeartVO vo);
	public int totalLike(long bno);
	public long findhno(HeartVO vo);
	
	/*
	 * public int likeUp(HeartVO vo); public int likeDown(HeartVO vo);
	 */
}
