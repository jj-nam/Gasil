package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.BoardReplyVO;
import org.joonzis.domain.ReplyUserVO;
import org.joonzis.domain.ReplyVO;

public interface ReplyMapper {
	public List<ReplyUserVO> getList(long bno);
	public List<BoardReplyVO> getMyReplyList(String writer);
	public ReplyVO read(long rno);
	public int insert(ReplyVO rvo);
	public int insert_reply(ReplyVO rvo);
	public int delete(long no);
	public int update(ReplyVO rvo);
	public int removeAll(long bno);
}