package org.seckill.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.seckill.entity.Seckill;

public interface SeckillDao {
	
	/**
	 * 减库存
	 * return 如果影响行数>1，表示更新的记录行数
	 */
	int reduceNumber(@Param("seckillId") long seckillId,@Param("killTime") Date killTime);
	
	/**
	 * 根据商品id查询秒杀信息
	 */
	Seckill queryById(long seckillId);
	
	/**
	 * 根据偏移量查询秒杀商品列表
	 */
	List<Seckill> queryAll(@Param("offset") int offset,@Param("limit") int limit);
	
	/**
	 * 
	 */
	void killByProcedure(Map<String, Object> param);
	
}
