package org.seckill.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class SeckillServiceTest {
	
	private final Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SeckillService seckillService;

	@Test
	public void testGetSeckillList() {
		List<Seckill> list=seckillService.getSeckillList();
		logger.info("list={}",list);
	}

	@Test
	public void testGetSeckillById() {
		long id=1000;
		Seckill seckill=seckillService.getSeckillById(id);
		logger.info("seckill={}",seckill);
	}
	
	//测试代码完整逻辑，注意可重复执行
	@Test
	public void testSeckillLogic() {
		long id=1001;
		Exposer exposer=seckillService.exportSeckillUrl(id);
		if(exposer.isExposed()){
			logger.info("exposer={}",exposer);
			long phone=18279185595L;
			String md5=exposer.getMd5();
			try {
				SeckillExecution execution=seckillService.executeSeckill(id, phone, md5);
				logger.info("result={}",execution);
			} catch (RepeatKillException e) {
				logger.error(e.getMessage());
			} catch (SeckillException e) {
				logger.error(e.getMessage());
			}
		}else {
			//秒杀未开启
			logger.warn("exposer={}",exposer);
		}
		
		/**
		 * [exposed=true, md5=0fe9372d66ebcddef53d69c07bebb33e, seckillId=1000, now=0, start=0, end=0]
		 */
	}
	
	@Test
	public void testExecuteSeckillProcedure() {
		long seckillId=1000;
		long phone=12345678900L;
		Exposer exposer=seckillService.exportSeckillUrl(seckillId);
		if(exposer.isExposed()){
			String md5=exposer.getMd5();
			SeckillExecution execution=seckillService.executeSeckillProcedure(seckillId, phone, md5);
			logger.info(execution.getStateInfo());
		}
	}
	
}
