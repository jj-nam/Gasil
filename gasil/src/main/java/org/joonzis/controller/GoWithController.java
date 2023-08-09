package org.joonzis.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.ReplyVO;
import org.joonzis.service.GoWithService;
import org.sonatype.inject.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/insert")
	public String register(Criteria cri, Model model) {
		model.addAttribute("cri", cri);
		return "goWith/insert";
	}

	/*
	 * @GetMapping("/getCountry/{continent}") public String
	 * getCity(@PathVariable("continent") String continent, Model model) {
	 * System.out.println("대륙 : " + continent); model.addAttribute("countries",
	 * service.getCountry(continent)); System.out.println("getCountry : " +
	 * service.getCountry(continent));
	 * 
	 * return "goWith/insert"; }
	 */
	 
	
	@GetMapping(value = "/getCountry/{continent}",  produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CountryVO>> getCity(@PathVariable("continent") String continent){
		log.info("get..." + continent);
		log.info(service.getCountry(continent));
		return new ResponseEntity<>(service.getCountry(continent),HttpStatus.OK);
	}
	
	@PostMapping("/insert")
	public String register(GoWithVO vo, RedirectAttributes rttr) {
		log.info("insert..." + vo);
		
		service.insert(vo);
		
		String departure = vo.getDeparture(); 
		String arrive = vo.getArrive(); 
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date format1 = null;
		Date format2 = null;
		long diffSec = 0;
		long diffDays = 0;
		// simpleDateFormat은 try catch문을 사용해야한다.
		try {
			format1 = dateFormat.parse(departure);
			format2 = dateFormat.parse(arrive);
			
			diffSec = (format2.getTime() - format1.getTime()) / 1000;
			diffDays = diffSec / (24*60*60);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(vo.getArrive());
		System.out.println(vo.getDeparture());
		System.out.println(diffDays);
		
		
		rttr.addFlashAttribute("result", "ok");
		return "redirect:/board/list"; // jsp가 아닌 url을 태울려면 redirect 사용
	}
}
