package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReplycVO;
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
public class ReplycMapperTests {
	@Setter(onMethod_ = @Autowired)
	ReplycMapper mapper;
	
	/*
	 * @Test public void testGetList() { List<ReplycVO> list = mapper.getList(64);
	 * for (ReplycVO vo : list) { log.info(vo); } }
	 * 
	 * @Test public void testInsert() { ReplycVO vo = new ReplycVO(); vo.setRno(64);
	 * vo.setReply_c("대댓글"); vo.setUser_id("test_id");
	 * 
	 * mapper.insert(vo); log.info(vo); }
	 */
}
