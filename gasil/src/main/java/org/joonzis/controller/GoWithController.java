package org.joonzis.controller;

import java.util.List;
import java.util.Map;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.service.GoWithService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/goWith/*")
public class GoWithController {
	
	@Setter(onMethod_ = @Autowired)
	private GoWithService service;
	
	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		log.info("list...");
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
		log.info(service.getList(cri));
		return "goWith/list";
	}
}
