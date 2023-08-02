package org.joonzis.mapper;

import org.joonzis.domain.UserVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {
	/*
	@Setter(onMethod_ = @Autowired)
	UserMapper mapper;

	
	@Test
	public void testInsert() {
		UserVO vo = new UserVO();
		vo.setUser_id("abcde123");
		vo.setUser_pw("123123123");
		vo.setUser_email("abcde123@naver.com");
		vo.setUser_name("김씨");
		vo.setUser_birth("19991212");
		vo.setGender("남");
		vo.setUser_nick("abcde123");
		vo.setUser_phone("01012341234");

		mapper.insert(vo);
		log.info(vo);
	}
	 
	@Test
	public void TestLogin() {
		UserVO vo = new UserVO();
		vo.setUser_id("user0001");
		vo.setUser_pw("123123123");

		mapper.login(vo);
		log.info(vo);
	}
	 */

}
