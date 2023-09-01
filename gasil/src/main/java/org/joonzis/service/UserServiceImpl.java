
package org.joonzis.service;

import org.joonzis.domain.UserAuthVO;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserAuthVO getPersonInfo(String writer) {
		return mapper.getPersonInfo(writer);
	}
	// 회원가입
	@Override
	public void join(UserVO uvo) {
		log.info("getJoin...");
		mapper.insert(uvo);
	}
	@Override
	public void addAuth(String user_id) {
		log.info("getAuth...");
		mapper.addAuth(user_id);
	}
	
	// 로그인
	public UserAuthVO login(UserAuthVO vo) {
		log.info("login...");
		return mapper.login(vo);
	}
	@Override
	public String getBirth(String user_id) {
		return mapper.getBirth(user_id);
	}
	
	@Override
	public boolean modify(UserAuthVO vo) {
		log.info("getModify...");
		
		return mapper.modify(vo);
	}
	@Override
	public void updateImage(UserVO vo){
		mapper.updateImage(vo);
	}
	@Override
	public String getNick(String user_id) {
		return mapper.getNick(user_id);
	}
	
	
	@Override
	public String getId(String recv_nick) {
		return mapper.getId(recv_nick);
	}
}
