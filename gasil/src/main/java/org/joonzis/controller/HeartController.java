package org.joonzis.controller;

import org.joonzis.domain.HeartVO;
import org.joonzis.service.BoardService;
import org.joonzis.service.HeartService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/heart/*")
@RequiredArgsConstructor
public class HeartController {
	
	private final HeartService service;
	private final BoardService bservice;
	
	@PostMapping("/like")
	@ResponseBody
	public int likeConfirm(@RequestBody HeartVO vo) {
		// JSON으로 값이 들어오기 때문에 @RequestBody와 커맨드 객체를 사용해서 JSON 타입을 객첼 변경 
		System.out.println("좋아요 기능 값을 가져오는지 확인 : " + vo);
		
		service.insert(vo);
		return bservice.upHeart(vo.getBno());
	}
		@PostMapping("/unlike")
		@ResponseBody
		public int unlikeConfirm(@RequestBody HeartVO vo) {
			System.out.println("좋아요 취소 기능 값을 가져오는지 확인 : " + vo);
			
			service.deleteLike(vo);
			return bservice.downHeart(vo.getBno());
		}
	}
	
	
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("/likeUp") public void likeUp(@RequestBody HeartVO vo) {
	 * System.out.println(vo.getBno()); System.out.println(vo.getUser_id());
	 * 
	 * service.likeUp(vo); }
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping("/likeDown") public void likeDown(@RequestParam ("bno") long
	 * bno, @RequestParam("user_id") String user_id) {
	 * System.out.println("좋아요 취소 : " + bno); System.out.println("좋아요 취소 : " +
	 * user_id);
	 * 
	 * HeartVO vo = new HeartVO(); vo.setBno(bno); vo.setUser_id(user_id);
	 * service.likeDown(vo); }
	 */