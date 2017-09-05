package org.seckill.service;

import java.util.List;

import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillColseException;
import org.seckill.exception.SeckillException;

/**
 * ҵ��ӿڣ�վ�� ��ʹ���ߡ� �Ƕ���ƽӿ�
 * �������棺�����������ȣ���������������(return ����/�쳣)
 */
public interface SeckillService {
	
	/**
	 * ��ѯ������ɱ��¼
	 */
	List<Seckill> getSeckillList();
	
	/**
	 * ��ѯ������ɱ��¼
	 */
	Seckill getSeckillById(long seckillId);
	
	/**
	 * ��ɱ����ʱ�����ɱ�ӿڵ�ַ���������ϵͳʱ�����ɱʱ��
	 */
	Exposer exportSeckillUrl(long seckillId);
	
	/**
	 * ִ����ɱ����
	 */
	SeckillExecution executeSeckill(long seckillId,long userPhone,String md5)
	throws SeckillException,RepeatKillException,SeckillColseException;
	
	/**
	 * ִ����ɱ����	ͨ���洢����
	 */
	SeckillExecution executeSeckillProcedure(long seckillId,long userPhone,String md5)
	throws SeckillException,RepeatKillException,SeckillColseException;
	
}
