package org.joonzis.controller;


import org.joonzis.domain.HeartVO;
import org.joonzis.domain.ReplyVO;
import org.joonzis.service.BoardService;
import org.joonzis.service.HeartService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String likeConfirm(@RequestBody HeartVO vo) {
		// JSON으로 값이 들어오기 때문에 @RequestBody와 커맨드 객체를 사용해서 JSON 타입을 객첼 변경 
		System.out.println("좋아요 기능 값을 가져오는지 확인 : " + vo);
		
		// 좋아요 버튼은 버튼이 하나임으로 버튼을 클릭 유무에 따라 좋아요 선택 및 취소를 뜻
		
		int result = service.searchLike(vo);
		// 좋아요를 눌렀다면 1이 오고 좋아요를 누르지 않았다면 0이 옴 
		System.out.println("result : " + result);
		if(result == 0) {
			// 좋아요를 누르지 않았다면 해당 정보를 db에 저장 
			int increaseHeart = service.insert(vo);
			  
			if(increaseHeart == 1) { 
				bservice.updateHeart(vo.getBno()); 
			}
			return "like";
		}
		else {
			// 좋아요를 눌렀으므로 db에서 해당 값 삭제 
			int decreaseHeart = service.deleteLike(vo);
			
			if(decreaseHeart == 1) {
				bservice.updateHeart(vo.getBno());
			}
			return "delete";
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
	
	
	
}
