package org.joonzis.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.UserAuthVO;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.joonzis.service.BoardService;
import org.joonzis.service.GoWithService;
import org.joonzis.service.HeartService;
import org.joonzis.service.ReplyService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {
	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserService service;
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private ReplyService rservice;
	
	@Autowired
	private HeartService hservice;
	
	@Autowired
	private GoWithService gservice;
	
	/*
	 * @Setter(onMethod_ = @Autowired) private PasswordEncoder pwencoder;
	 */
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
	@PostMapping("/user/joinUser")
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
	public String login(UserAuthVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("login : " + vo);
		HttpSession session = req.getSession();
		UserAuthVO login = service.login(vo);
		log.info(login);
		
		if(login != null) {
			session.setAttribute("user", login);
		}
		return "redirect:/home";
	}
	
	@RequestMapping(value="/logoutPage", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		log.info("로그아웃");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	        
	    return "redirect:/home"; 
    }
	
	
	// 개인 정보 페이지
	@RequestMapping("myInfo/personal_info")
	public String personal_info(Model model, HttpServletRequest req) {
		log.info("personal_info");
		
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		String writer = user.getUser_id();
		log.info(writer);
		
		model.addAttribute("user", service.getPersonInfo(writer));
		
		return "myInfo/personal_info";
	}
	
	// 프사 수정 페이지 이동
	@GetMapping("myInfo/update_profile")
	public String modifyPic(Model model, HttpServletRequest req) {
		log.info("modifyPic");
		
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_id();
		log.info(writer);
		
		model.addAttribute("user", service.getPersonInfo(writer));
		return "myInfo/update_profile";
	}
	
	@PostMapping("//myInfo/update_profile")
	public String upload(@RequestParam("user_pic") MultipartFile file , HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		String user_id = user.getUser_id();
		
		
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		
		System.out.println("파일명 : "  + fileRealName);
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "C:\\Users\\gitah\\git\\Gasil\\gasil\\src\\main\\webapp\\resources\\images\\profile";
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		String user_pic = uniqueName + fileExtension;
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		UserVO vo = new UserVO();
		vo.setUser_pic(user_pic);
		vo.setUser_id(user_id);
		
		System.out.println(user_pic);
		
		service.updateImage(vo);
		
		return "redirect:/myInfo/personal_info";
	}
	
	// 개인정보 수정 페이지 이동
	@GetMapping("myInfo/update_info")
	public String modify(Model model, HttpServletRequest req) {
		log.info("modify");
		
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		String writer = user.getUser_id();
		log.info(writer);
		
		model.addAttribute("user", service.getPersonInfo(writer));
		return "myInfo/update_info";
	}
	
	// 개인정보 수정
	@PostMapping("myInfo/update_info")
	public String modify(UserAuthVO vo, RedirectAttributes rttr) {
		log.info("modify : " + vo);
		
		if (service.modify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/myInfo/personal_info";
	}
	
	// 작성한 글 페이지
	@RequestMapping("myInfo/w_board")
	public String personal_infoList() {
		log.info("personal_infoList");
		return "myInfo/w_board";
	}
	
	// 작성한 글 리스트
	@GetMapping(value = "/myInfo/list",	produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<BoardVO>> getList(HttpServletRequest req){
		log.info("boardList...");
		
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_id();
		log.info(writer);
		log.info(bservice.getMyList(writer));
		return new ResponseEntity<>(bservice.getMyList(writer),HttpStatus.OK);
	}
	
	// 작성한 동행글
	@GetMapping(value = "/myInfo/goWith",	produces = {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<GoWithFlagVO>> getGoWithList(HttpServletRequest req){
		log.info("goWithList...");
		
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_id();
		log.info(writer);
		log.info(gservice.getGoWithList(writer));
		
		return new ResponseEntity<>(gservice.getGoWithList(writer),HttpStatus.OK);
	}
	
	
	// 작성한 댓글
	@GetMapping("/myInfo/replyList")
	public String replyList(Model model, HttpServletRequest req) {
		log.info("replyList...");
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_nick();
		
		model.addAttribute("list", rservice.getMyReplyList(writer));
		return "myInfo/w_reply";
	}
	
	// 좋아요한 글
	@GetMapping("/myInfo/likes")
	public String likeList(Model model, HttpServletRequest req) {
		log.info("likeList...");
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_id();
		log.info(writer);
		model.addAttribute("list", hservice.getLikeList(writer));
		return "myInfo/likes";
	}
	
	
	// 신청한 글
	@GetMapping("/myInfo/proposal")
	public String proposalList(Model model, HttpServletRequest req) {
		log.info("proposalList...");
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		String writer = user.getUser_id();
		log.info(writer);
		model.addAttribute("list", gservice.getProposalList(writer));
		return "myInfo/proposal";
	}

	// input으로 받은 닉네임으로
	// 닉네임 수정할 때 해당 이전 닉네임을 가지고 있는 
	// 게시물, 댓글, 대댓글 등 모든 것에 대한 닉네임을 먼저 수정
	// 그 후 닉네임을 수정
}
