package org.joonzis.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserService service;
	// 아이디 중복 확인
	@RequestMapping("/idCheck.do")
	public @ResponseBody int idCheck(String user_id) {
		int result = mapper.idCheck(user_id);
		return result;
	}
	
	// 핸드폰 인증
	@ResponseBody
	@RequestMapping(value = "user/phoneCheck", method = RequestMethod.GET)
	public String sendSMS(@RequestParam("user_phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber1 = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		String randomNumber = Integer.toString(randomNumber1);
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return randomNumber;
		}
	
	// 회원가입
	@PostMapping("user/joinUser")
	public String join(UserVO vo, RedirectAttributes rttr) {
		log.info("joinUser : " + vo);
		service.join(vo);
		service.addAuth(vo.getUser_id());
		log.info("create auth");
		rttr.addFlashAttribute("result", "ok");
		return "user/loginPage";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("login : " + vo);
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		log.info(login);
		if(login != null) {
			session.setAttribute("user", login);
		}
		return "/home";
	}
	
}
