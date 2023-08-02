
package org.joonzis.service;

import java.util.HashMap;

import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Override
	public void certifiedPhoneNumber(String userPhoneNumber, String randomNumber) {
	String api_key = "NCSFAESODWJBGE9Z";
    String api_secret = "EMJVUGFZPWQ6TM51BZ6LZUVSW3TTPLKS";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<>();
    params.put("to", userPhoneNumber);    // 수신전화번호
    params.put("from", "01046993963");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    params.put("type", "SMS");
    params.put("text", "[Gasil] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
    params.put("app_version", "test app 1.2"); // application name and version

    try {
        JSONObject obj = coolsms.send(params);
        System.out.println(obj.toString());
      } catch (CoolsmsException e) {
        System.out.println(e.getMessage());
        System.out.println(e.getCode());
      }
	}
	// 회원가입
	@Override
	public void join(UserVO vo) {
		log.info("getJoin...");
		mapper.insert(vo);
	}
	
	// 로그인
	public UserVO login(UserVO vo) {
		log.info("login...");
		return mapper.login(vo);
		
	}
}
