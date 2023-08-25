package org.joonzis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joonzis.domain.ReplyUserVO;
import org.joonzis.domain.ReplyVO;
import org.joonzis.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/replies/*")
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	// 댓글 추가
	@PostMapping(value = "/new", consumes = "application/json; charset=utf-8", 
								produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO rvo){
		log.info("ReplyVO...." + rvo);
		
		int insertCount = service.register(rvo);
		
		log.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 대댓글 추가
	@PostMapping(value = "/renew", consumes = "application/json; charset=utf-8", 
			produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> insert(@RequestBody ReplyVO rvo){
		log.info("ReplyVO...." + rvo);
		
		int insertCount = service.reply_register(rvo);
		
		log.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 2. 목록
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<ReplyUserVO>> getList(@PathVariable("bno") long bno,
												@PathVariable("page") int page){
		log.info("getReList...");
		
		return new ResponseEntity<>(service.getList(bno),HttpStatus.OK);
	}
	
	// 3. 삭제
	@DeleteMapping(value = "/{no}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> remove(@PathVariable("no") long no){
		log.info("remove..." + no);
		
		return service.remove(no) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/remove/{bno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeAll(@PathVariable("bno") long bno){
		log.info("removeAll..." + bno);
		
		return service.removeAll(bno) > 0 ?
				new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@PostMapping("/replyupdate/{no}/{content}")
	public Map<String, Object> replyupdate(@PathVariable long no, 
										@PathVariable String content){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ReplyVO rvo = new ReplyVO();
			rvo.setNo(no);
			rvo.setContent(content);
			service.modify(rvo);
			
			map.put("result", "success");
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
	
}