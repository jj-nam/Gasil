package org.joonzis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.GoWithFlagVO;
import org.joonzis.domain.MessageVO;
import org.joonzis.domain.UserAuthVO;
import org.joonzis.service.GoWithService;
import org.joonzis.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@Setter(onMethod_ = @Autowired)
	private GoWithService gservice;
	
	// 방만들기
	@PostMapping("/message/createRoom")
	public String createRoom(@RequestParam("wno") long wno, @RequestParam("user_id") String user_id, 
						RedirectAttributes rttr, HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		// wno로 그 게시글의 이름 기간 등 정보 찾기
		GoWithFlagVO gvo = gservice.get(wno);
		
		String first = "[" + gvo.getDeparture() + "~" + gvo.getArrive() + "] " + gvo.getCity() + "\n " + gvo.getWtitle();
		// 방 주인
		String nick = user.getUser_nick();
		MessageVO mvo = new MessageVO();
		mvo.setRecv_nick(user_id);
		mvo.setSend_nick(nick);
		String no = wno+"";
		System.out.println(mvo);
		String profile = service.getOtherProfile(mvo);
		
		System.out.println(profile);
		MessageVO vo = new MessageVO();
		vo.setSend_nick(nick);
		vo.setRecv_nick(user_id);
		vo.setRoom(no + user_id);
		vo.setProfile(profile);
		vo.setContent(first);
		vo.setWno(wno);
		
		int chk = service.chkRoom(vo.getRoom());
		if(chk != 0) {
			
		}else {
			service.createRoom(vo);
			
		}
		rttr.addFlashAttribute("result", "ok");
		
		return "redirect: /message_list.do";
	}
	
	
	@RequestMapping(value="/message_list.do")
	public String message_list(HttpServletRequest req, HttpSession session) {
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		
		String nick = user.getUser_nick();
		
		List<MessageVO> list = service.messageList(nick);
		
		for(MessageVO vo : list) {
			vo.setNick(nick);
			int unread = service.getUnread(vo);
			String profile = service.getOtherProfile(vo);
			vo.setUnread(unread);
			vo.setProfile(profile);
			if(nick.equals(vo.getSend_nick())) {
				vo.setOther_nick(vo.getRecv_nick());
			}else {
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
		
		for(MessageVO vo : list) {
			vo.setNick(nick);
			int unread = service.getUnread(vo);
			String profile = service.getOtherProfile(vo);
			vo.setUnread(unread);
			vo.setProfile(profile);
			if(nick.equals(vo.getSend_nick())) {
				vo.setOther_nick(vo.getRecv_nick());
			}else {
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
		
		System.out.println("room" + room);
		
		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setNick(nick);
		
		List<MessageVO> cList = service.roomContentList(vo);
		
		
		// 읽음 처리
		service.readChk(vo);
		System.out.println(cList);
		req.setAttribute("cList", cList);
		
		return "message/message_content_list";
	}
	
	@ResponseBody
	@RequestMapping(value="/message_send_inlist.do")
	public int message_send_inlist(@RequestParam String room, @RequestParam String other_nick,
								@RequestParam String content, HttpSession session) {		
		UserAuthVO user = (UserAuthVO) session.getAttribute("user");
		String nick = user.getUser_nick();
		
		String profile = service.getMyProfile(nick);
		
		System.out.println(profile);
		
		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setSend_nick(nick);
		vo.setRecv_nick(other_nick);
		vo.setContent(content);
		vo.setProfile(profile);
		System.out.println("vo : " + vo);
	
		int insert = service.messageSendInlist(vo);
		return insert;
	}
}
