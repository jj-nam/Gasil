package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	BoardMapper mapper;

	/*
	@Test
	public void testGetList() {
		List<BoardVO> list = mapper.getList();
		for (BoardVO vo : list) {
			log.info(vo);
		}
	}
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목제목");
		vo.setBcontent("내용내용");
		vo.setWriter("작가작가");
		
		mapper.insert(vo);
		log.info(vo);
		
	}
	*/
	
	/*
	 @Test 
	 public void testRead() { 
		 log.info(mapper.read(4)); 
	}
	 @Test
		public void testDelete() {
			mapper.delete(4);
			log.info(vo);
		}
	 @Test
	 public void testUpdate() {
 		BoardVO vo = new BoardVO();

 		vo.setBno(5);
 		vo.setCate_id(2);
 		vo.setTitle("수정 제목");
 		vo.setBcontent("수정 내용");
 		vo.setWriter("수정 작성자");

 		mapper.update(vo);
 		log.info(vo);
 	}
	
	 */
}
