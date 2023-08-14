package org.joonzis.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.joonzis.domain.CountryVO;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.GoWithVO;
import org.joonzis.service.GoWithService;
import org.joonzis.service.UserService;
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
	
	@Setter(onMethod_ = @Autowired)
	private UserService uservice;
	
	@GetMapping("/list")
	public String list(Model model) {
		log.info("list...");
		
		model.addAttribute("list", service.getList());
		return "goWith/list";
	}
	
	@GetMapping("/insert")
	public String register(Model model) {
		return "goWith/insert";
	}

	@GetMapping(value = "/getCountry/{continent}",  produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CountryVO>> getCountry(@PathVariable("continent") String continent){
		log.info("getContinent..." + continent);
		log.info(service.getCountry(continent));
		return new ResponseEntity<>(service.getCountry(continent),HttpStatus.OK);
	}
	
	@GetMapping(value = "/getCity/{country}",  produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CountryVO>> getCity(@PathVariable("country") String country){
		log.info("getCountry..." + country);
		log.info(service.getCity(country));
		return new ResponseEntity<>(service.getCity(country),HttpStatus.OK);
	}
	
	@PostMapping("/insert")
	public String register(GoWithVO vo, RedirectAttributes rttr) {
		log.info("insert..." + vo);
		
		String departure = vo.getDeparture(); 
		String arrive = vo.getArrive(); 
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date format1 = null;
		Date format2 = null;
		
		// 나이 구하기
		/*
		 * String birth = uservice.getBirth(vo.getUser_id()); Calendar now =
		 * Calendar.getInstance(); Integer currentYear = now.get(Calendar.YEAR);
		 * SimpleDateFormat format = new SimpleDateFormat("yyyy"); String bYear =
		 * format.format(birth); Integer birthYear = Integer.parseInt(bYear);
		 * 
		 * int age = (currentYear - birthYear + 1);
		 */
		String birth = uservice.getBirth(vo.getUser_id());
		LocalDate now = LocalDate.now();
		LocalDate parseBirthDate = LocalDate.parse(birth, DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		int age2 = now.minusYears(parseBirthDate.getYear()).getYear();
		if (parseBirthDate.plusYears(age2).isAfter(now)) { 
			age2 = age2 -1;
		}
		String age1 = age2 + "";
		int age = Integer.parseInt(age1.substring(0,1));
		
		System.out.println(age);
		
		// 여행 기간 구하기
		long diffSec = 0;
		long period = 0;
		// simpleDateFormat은 try catch문을 사용해야한다.
		try {
			format1 = dateFormat.parse(departure);
			format2 = dateFormat.parse(arrive);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		diffSec = (format2.getTime() - format1.getTime()) / 1000;
		period = diffSec / (24*60*60);
		
		System.out.println(period);
		
		GoWithVO gvo = new GoWithVO();
		gvo.setUser_id(vo.getUser_id());
		gvo.setWtitle(vo.getWtitle());
		gvo.setContent(vo.getContent());
		gvo.setStyle(vo.getStyle());
		gvo.setCity(vo.getCity());
		gvo.setDeparture(vo.getDeparture());
		gvo.setArrive(vo.getArrive());
		gvo.setR_cnt(vo.getR_cnt());
		gvo.setP_cnt(vo.getP_cnt());
		gvo.setPeople(vo.getPeople());
		gvo.setPeriod(period+1);
		gvo.setAge(age);
		
		service.insert(gvo);
		System.out.println(gvo);
		
		rttr.addFlashAttribute("result", "ok");
		return "redirect:/goWith/list";
	}
	
	@GetMapping(value = "/{wno}", produces = {MediaType.APPLICATION_XML_VALUE,
											MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<GoWithFlagVO> get(@PathVariable("wno") long wno){
	log.info("get..." + wno);
	
	return new ResponseEntity<>(service.get(wno),HttpStatus.OK);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("wno") long wno, RedirectAttributes rttr) {
		log.info("remove : " + wno);
		if (service.remove(wno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goWith/list";
	}
	
	
}
