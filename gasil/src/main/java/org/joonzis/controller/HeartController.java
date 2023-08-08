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
	
	/*
	 * @PostMapping("/like")
	 * 
	 * @ResponseBody public int likeConfirm(@RequestBody HeartVO vo) { // JSON으로 값이
	 * 들어오기 때문에 @RequestBody와 커맨드 객체를 사용해서 JSON 타입을 객첼 변경
	 * System.out.println("좋아요 기능 값을 가져오는지 확인 : " + vo);
	 * 
	 * service.insert(vo); return bservice.upHeart(vo.getBno()); }
	 * 
	 * @PostMapping("/unlike")
	 * 
	 * @ResponseBody public int unlikeConfirm(@RequestBody HeartVO vo) {
	 * System.out.println("좋아요 취소 기능 값을 가져오는지 확인 : " + vo);
	 * 
	 * service.deleteLike(vo); return bservice.downHeart(vo.getBno()); }
	 */
	
	
	@PostMapping("/like")
	@ResponseBody
	public int heartConfirm(@RequestBody HeartVO vo) {
		System.out.println("좋아요 기능 값을 가져오는지 확인 : " + vo);
		// 하트를 누른 상태면 result는 1, 아니면 0
		int result = service.checkLike(vo);
		if(result == 0) {
			service.insert(vo);
			bservice.upHeart(vo.getBno());
		}else {
			service.deleteLike(vo);
			bservice.downHeart(vo.getBno());
		}
		return service.totalLike(vo.getBno());
	}
	
}