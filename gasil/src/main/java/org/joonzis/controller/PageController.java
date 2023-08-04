package org.joonzis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PageController {
	
	@RequestMapping("home")
	public String Home() {
		log.info("home");
		return "home";
	}
	
	@RequestMapping("user/joinPage")
	public String join() {
		log.info("joinPage");
		return "user/joinPage";
	}
	
	@RequestMapping("user/loginPage")
	public String login() {
		log.info("loginPage");
		return "user/loginPage";
	}
	
	@RequestMapping("myInfo/personal_info")
	public String personal_info() {
		log.info("personal_info");
		return "myInfo/personal_info";
	}
	
	@RequestMapping("myInfo/w_board")
	public String w_board() {
		log.info("w_board");
		return "myInfo/w_board";
	}
	
	@RequestMapping("myInfo/w_reply")
	public String w_reply() {
		log.info("w_reply");
		return "myInfo/w_reply";
	}
	
	@RequestMapping("myInfo/likes")
	public String likes() {
		log.info("likes");
		return "myInfo/likes";
	}
	
	@RequestMapping("myInfo/proposal")
	public String proposal() {
		log.info("proposal");
		return "myInfo/proposal";
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
