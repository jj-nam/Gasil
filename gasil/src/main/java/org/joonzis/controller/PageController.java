package org.joonzis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PageController {
	// 홈
	@RequestMapping("home")
	public String Home() {
		log.info("home");
		return "home";
	}
	// 회원가입
	@RequestMapping("user/joinPage")
	public String join() {
		log.info("joinPage");
		return "user/joinPage";
	}
	// 로그인
	@RequestMapping("user/loginPage")
	public String login() {
		log.info("loginPage");
		return "user/loginPage";
	}
	
	@RequestMapping("terms/gaein")
	public String gaein() {
		log.info("gaein");
		return "terms/gaein";
	}
	@RequestMapping("terms/goyou")
	public String goyou() {
		log.info("goyou");
		return "terms/goyou";
	}
	@RequestMapping("terms/tongxin")
	public String tongxin() {
		log.info("tongxin");
		return "terms/tongxin";
	}
	@RequestMapping("terms/inzeng")
	public String inzeng() {
		log.info("inzeng");
		return "terms/inzeng";
	}
	@RequestMapping("terms/gasilcc")
	public String gasilcc() {
		log.info("gasilcc");
		return "terms/gasilcc";
	}
}
