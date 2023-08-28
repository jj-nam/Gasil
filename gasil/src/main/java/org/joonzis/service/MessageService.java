package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.MessageVO;

public interface MessageService {
	public List<MessageVO> messageList(String nick);
	public int getUnread(MessageVO vo);
	public String getOtherProfile(MessageVO vo);
	public String getMyProfile(String nick);
	public List<MessageVO> roomContentList(MessageVO vo);
	public void readChk(MessageVO vo);
	public int messageSendInlist(MessageVO vo);
	public int createRoom(MessageVO vo);
	public int chkRoom(String room);
}
