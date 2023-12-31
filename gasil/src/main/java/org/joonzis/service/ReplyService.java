package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardReplyVO;
import org.joonzis.domain.ReplyUserVO;
import org.joonzis.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyUserVO> getList(long bno);
	public List<BoardReplyVO> getMyReplyList(String writer);
	public int register(ReplyVO rvo);
	public int reply_register(ReplyVO rvo);
	public int remove(long no);
	public int modify(ReplyVO rvo);
	public int removeAll(long bno);
}