package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ApplyVO;
import org.joonzis.domain.MessageVO;
import org.joonzis.mapper.GoWithMapper;
import org.joonzis.mapper.MessageMapper;
import org.joonzis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	MessageMapper mapper;
	@Autowired
	GoWithMapper gmapper;
	@Autowired
	UserMapper umapper;
	
	@Override
	public List<MessageVO> messageList(String nick) {
		log.info("닉네임 : " + nick);
		return mapper.messageList(nick);
	}
	@Override
	public int getUnread(MessageVO vo) {
		return mapper.getUnread(vo);
	}
	@Override
	public String getOtherProfile(MessageVO vo) {
		return mapper.getOtherProfile(vo);
	}
	@Override
	public String getMyProfile(String nick) {
		return mapper.getMyProfile(nick);
	}
	@Override
	public List<MessageVO> roomContentList(MessageVO vo) {
		return mapper.roomContentList(vo);
	}
	@Override
	public void readChk(MessageVO vo) {
		mapper.readChk(vo);
	}
	@Override
	public int messageSendInlist(MessageVO vo) {
		return mapper.messageSendInlist(vo);
	}
	@Override
	public int createRoom(MessageVO vo) {
		return mapper.createRoom(vo);
	}
	@Override
	public int chkRoom(String room) {
		return mapper.chkRoom(room);
	}
	@Transactional
	@Override
	public int removeRoom(String room) {
		MessageVO vo = mapper.getRoomInfo(room);
		String recv_id = umapper.getId(vo.getRecv_nick());
		ApplyVO avo = new ApplyVO();
		avo.setUser_id(recv_id);
		avo.setWno(vo.getWno());
		
		int result = mapper.removeRoom(room);
		
		gmapper.removeProp(avo);
		gmapper.decPeople(avo.getWno());
		
		return result; 
	}
}
