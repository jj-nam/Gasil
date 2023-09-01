package org.joonzis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.ApplyVO;
import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.MessageVO;
import org.joonzis.domain.UserAuthVO;
import org.joonzis.service.GoWithService;
import org.joonzis.service.MessageService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MessageController {

	@Autowired
	private MessageService service;

	@Autowired
	private UserService uservice;

	@Setter(onMethod_ = @Autowired)
	private GoWithService gservice;

	// 방만들기
	@PostMapping("/message/createRoom")
	public String createRoom(@RequestParam("wno") long wno, @RequestParam("user_id") String user_id,
			RedirectAttributes rttr, HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		// wno로 그 게시글의 이름 기간 등 정보 찾기
		GoWithFlagVO gvo = gservice.get(wno);
		// 방 생성시 문구
		String first = "[" + gvo.getDeparture() + "~" + gvo.getArrive() + "] " + gvo.getCity() + "\n "
				+ gvo.getWtitle();
		// 신청자 닉네임
		String propoUserNick = uservice.getNick(user_id);
		// 방 주인
		String nick = user.getUser_nick();
		MessageVO mvo = new MessageVO();
		mvo.setRecv_nick(propoUserNick);
		mvo.setSend_nick(nick);
		String no = wno + "";
		String profile = service.getOtherProfile(mvo);

		MessageVO vo = new MessageVO();
		vo.setSend_nick(nick);
		vo.setRecv_nick(propoUserNick);
		vo.setRoom(no + user_id);
		vo.setProfile(profile);
		vo.setContent(first);
		vo.setWno(wno);

		int chk = service.chkRoom(vo.getRoom());
		if (chk != 0) {

		} else {
			service.createRoom(vo);
		}
		rttr.addFlashAttribute("result", "ok");

		return "redirect: /message_list.do";
	}

	@RequestMapping(value = "/message_list.do")
	public String message_list(HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		String nick = user.getUser_nick();

		List<MessageVO> list = service.messageList(nick);

		for (MessageVO vo : list) {
			vo.setNick(nick);
			int unread = service.getUnread(vo);
			String profile = service.getOtherProfile(vo);
			System.out.println(vo.getOther_nick());
			vo.setUnread(unread);
			vo.setProfile(profile);
			// 로그인한 유저가 보낸 사람이면 ohter_nick은 받은 사람
			if (nick.equals(vo.getSend_nick())) {
				vo.setOther_nick(vo.getRecv_nick());
				// 로그인한 유저가 받은 사람이면 other_nick은 보낸 사람
			} else {
				vo.setOther_nick(vo.getSend_nick());
			}
		}
		System.out.println(list);

		req.setAttribute("list", list);

		return "message/message_list";

	}

	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");

		String nick = user.getUser_nick();

		List<MessageVO> list = service.messageList(nick);

		for (MessageVO vo : list) {
			vo.setNick(nick);
			int unread = service.getUnread(vo);
			String profile = service.getOtherProfile(vo);
			vo.setUnread(unread);
			vo.setProfile(profile);
			// 로그인한 유저가 보낸 사람이면 ohter_nick은 받은 사람
			if (nick.equals(vo.getSend_nick())) {
				vo.setOther_nick(vo.getRecv_nick());
				// 로그인한 유저가 받은 사람이면 other_nick은 보낸 사람
			} else {
				vo.setOther_nick(vo.getSend_nick());
			}
		}
		req.setAttribute("list", list);

		return "message/message_ajax_list";

	}

	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(@RequestParam String room, HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		String nick = user.getUser_nick();

		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setNick(nick);

		List<MessageVO> cList = service.roomContentList(vo);

		// 읽음 처리
		service.readChk(vo);
		req.setAttribute("cList", cList);

		return "message/message_content_list";
	}

	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam String room, @RequestParam String other_nick,
			@RequestParam String content, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		String nick = user.getUser_nick();

		String profile = service.getMyProfile(nick);

		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setSend_nick(nick);
		vo.setRecv_nick(other_nick);
		vo.setContent(content);
		vo.setProfile(profile);

		int insert = service.messageSendInlist(vo);
		return insert;
	}
	
	@DeleteMapping(value = "/message/delete/{room}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeRoom(@PathVariable("room") String room) {
		int result = service.removeRoom(room); 
		
		return result > 0 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
