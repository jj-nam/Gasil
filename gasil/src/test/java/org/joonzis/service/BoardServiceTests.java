package org.joonzis.service;

import org.joonzis.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	@Autowired
	private BoardService service;
	private BoardVO vo;
	
	/*
	@Test
	public void testGetList() {
		service.getList();
	}
	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("서비스 제목");
		vo.setBcontent("서비스 내용");
		vo.setWriter("서비스 작성자");
		service.register(vo);
		log.info(vo);
	}

	@Test
	public void testGet() {
		service.get(6);
	}

	@Test
	public void testRemove() {
		service.remove(6);
	}
	
	@Test
	public void testModify() {
		BoardVO vo = new BoardVO();
		vo.setBno(5);
		vo.setCate_id(3);
		vo.setTitle("서비스 수정 제목");
		vo.setBcontent("서비스 수정 내용");
		vo.setWriter("서비스 수정 작성자");
		
		service.modify(vo);
		log.info(vo);
	}
	 */
	 
}