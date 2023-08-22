package org.joonzis.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.UserAuthVO;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.UserMapper;
import org.joonzis.service.BoardService;
import org.joonzis.service.GoWithService;
import org.joonzis.service.HeartService;
import org.joonzis.service.ReplyService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "/home";
	}
	
	@RequestMapping(value="/logoutPage", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		log.info("로그아웃");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	        
	    return "redirect:/home"; 
    }
	
	// 작성한 글
	@GetMapping("/myInfo/list")
	public String list(Model model, HttpServletRequest req) {
		log.info("list...");
		HttpSession session = req.getSession();
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String writer = user.getUser_id();
		
		model.addAttribute("list", bservice.getMyList(writer));
		return "myInfo/w_board";
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
	
	/*
	 * // 신청한 글
	 * 
	 * @GetMapping("/myInfo/proposal") public String proposalList(Model model,
	 * HttpServletRequest req) { log.info("proposalList..."); HttpSession session =
	 * req.getSession(); UserAuthVO user = (UserAuthVO)
	 * session.getAttribute("user");
	 * 
	 * String writer = user.getUser_id(); log.info(writer);
	 * model.addAttribute("list", gservice.getProposalList(writer)); return
	 * "myInfo/proposal"; }
	 */
	
	// input으로 받은 닉네임으로
	// 닉네임 수정할 때 해당 이전 닉네임을 가지고 있는 
	// 게시물, 댓글, 대댓글 등 모든 것에 대한 닉네임을 먼저 수정
	// 그 후 닉네임을 수정
}
