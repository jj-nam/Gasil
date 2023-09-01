package org.joonzis.controller;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.ApplyVO;
import org.joonzis.domain.CountryVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.GoWithVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UserApplyVO;
import org.joonzis.domain.UserAuthVO;
import org.joonzis.service.GoWithService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String list(Model model, Criteria cri) {
		log.info("list...");
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
		
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
		// 나이 계산
		String birth = uservice.getBirth(vo.getUser_id());
		LocalDate now = LocalDate.now();
		LocalDate parseBirthDate = LocalDate.parse(birth, DateTimeFormatter.ofPattern("yyyyMMdd"));
		
		int age2 = now.minusYears(parseBirthDate.getYear()).getYear();
		if (parseBirthDate.plusYears(age2).isAfter(now)) { 
			age2 = age2 -1;
		}
		String age1 = age2 + "";
		int age = Integer.parseInt(age1.substring(0,1));
		
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
		int chkDate=1;
		if(format2.getTime() - format1.getTime() > 0) {
			diffSec = (format2.getTime() - format1.getTime()) / 1000;
		}else {
			diffSec = (format1.getTime() - format2.getTime()) / 1000;
			chkDate = 0;
		}
		period = diffSec / (24*60*60);
		
		GoWithVO gvo = new GoWithVO();
		gvo.setUser_id(vo.getUser_id());
		gvo.setWtitle(vo.getWtitle());
		gvo.setContent(vo.getContent());
		gvo.setStyle(vo.getStyle());
		gvo.setCity(vo.getCity());
		if(chkDate == 1) {
			gvo.setDeparture(vo.getDeparture());
			gvo.setArrive(vo.getArrive());
		}else {
			gvo.setDeparture(vo.getArrive());
			gvo.setArrive(vo.getDeparture());
		}
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
	
	// 모달
	@GetMapping(value = "/{wno}", produces = { MediaType.APPLICATION_XML_VALUE, 
												MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<GoWithFlagVO> get(@PathVariable("wno") long wno) {
		log.info("get..." + wno);

		return new ResponseEntity<>(service.get(wno), HttpStatus.OK);
	}
	
	// 신청자 수 변동
	@GetMapping(value = "/people/{wno}", produces = { MediaType.APPLICATION_XML_VALUE, 
													MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Integer> getPeople(@PathVariable("wno") long wno) {
		log.info("getPeople..." + wno);
		
		return new ResponseEntity<>(service.getPeople(wno), HttpStatus.OK);
	}
	 	 	
	// 신청 판별
	@GetMapping(value = "/appYN/{wno}", produces = { MediaType.APPLICATION_XML_VALUE, 
												MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Integer> getYN(@PathVariable("wno") long wno, HttpServletRequest req) {
		log.info("get..." + wno);

		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		if (user == null) {
			user = new UserAuthVO();
			user.setUser_id("noName");
		}
		
		ApplyVO vo = new ApplyVO();
		vo.setWno(wno);
		vo.setUser_id(user.getUser_id());
		System.out.println(vo);
		System.out.println("get application : " + service.checkApply(vo));
		return new ResponseEntity<>(service.checkApply(vo), HttpStatus.OK);
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("wno") long wno, RedirectAttributes rttr) {
		log.info("remove : " + wno);
		if (service.remove(wno)==1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/goWith/list";
	}
	
	// 마이페이지 동행 게시물 삭제
	@DeleteMapping(value = "/remove/{wno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("wno") long wno){
		log.info("remove..." + wno);
		return service.remove(wno) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 신청자 리스트
	@GetMapping(value = "apply/{wno}", produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<UserApplyVO>> getApply(@PathVariable("wno") long wno){
	log.info("getApply..." + wno);
	
	return new ResponseEntity<>(service.getApply(wno),HttpStatus.OK);
	}
	
	// 동행 신청
	@PostMapping("/appli")
	@ResponseBody
	public int applygoWith(@RequestBody ApplyVO avo,  HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		ApplyVO vo = new ApplyVO();
		vo.setWno(avo.getWno());
		vo.setUser_id(user.getUser_id());
		
		System.out.println("apply : " + vo);
		// 신청을 했으면 result=1, 안했으면 0
		int result = service.checkApply(vo);
		System.out.println(result);
		
		if(result == 0) {
			service.insertApply(vo);
		}else {
			service.deleteApply(vo);
		}
		return result;
	}
	
	@PostMapping("/confirmation")
	@ResponseBody
	public int applygoWith(@RequestBody ApplyVO vo) {
		
		long wno = vo.getWno();
		// 모집 인원 수
		int p_cntNum = service.getP_cnt(vo.getWno());
		// 신청 수락한 수
		int overCnt = service.getOver(vo.getWno());
		// 신청 수락을 했으면 result=1, 안했으면 0
		int result = service.checkConfirm(vo);
		
		if(result == 0) {
			if(p_cntNum > overCnt) {
				service.getConfirm(vo);
				service.incPeople(wno);
			}else{
				result = 2;
			}
		}else if(result == 1){
			service.deleteConfirm(vo);
			service.decPeople(wno);
		}
		return result;
	}
	
	
}
