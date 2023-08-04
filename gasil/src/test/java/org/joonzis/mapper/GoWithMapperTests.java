package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.GoWithVO;
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
public class GoWithMapperTests {

	@Setter(onMethod_ = @Autowired)
	GoWithMapper mapper;
	
	@Test
	public void testgetList() {
		List<GoWithVO> list = mapper.getList();
		for (GoWithVO vo : list) {
			log.info(vo);
		}
	}
}
