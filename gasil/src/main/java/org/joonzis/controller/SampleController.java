package org.joonzis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class SampleController {
	
	@GetMapping("/all")
	public String doAll() {
		log.info("do all can access everybody");
		return "sample/all";
	}
	@GetMapping("/member")
	public String doMember() {
		log.info("logined member");
		return "sample/member";
	}
	@GetMapping("/admin")
	public String doAdmin() {
		log.info("admin only");
		return "sample/admin";
	}
}