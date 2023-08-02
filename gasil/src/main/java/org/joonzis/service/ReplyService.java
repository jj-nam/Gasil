package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getList(long bno);
	public ReplyVO get(long rno);
	public int register(ReplyVO rvo);
	public int reply_register(ReplyVO rvo);
	public int remove(long no);
	public int modify(ReplyVO rvo);
	public int removeAll(long bno);
}