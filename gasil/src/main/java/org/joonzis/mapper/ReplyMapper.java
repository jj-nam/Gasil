package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList(long bno);
	public ReplyVO read(long rno);
	public int insert(ReplyVO rvo);
	public int delete(long no);
	public int update(ReplyVO rvo);
	public int removeAll(long bno);
}