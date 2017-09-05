--���ݿ��ʼ���ű�

--�������ݿ�
CREATE DATABASE seckill;
--ʹ�����ݿ�
use ceckill;
--������ɱ����
CREATE TABLE seckill (
  `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '��Ʒ���ID',
  `name` varchar(120) NOT NULL COMMENT '��Ʒ����',
  `number` int NOT NULL COMMENT '�������',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `start_time` timestamp NOT NULL  COMMENT '��ɱ����ʱ��',
  `end_time` timestamp NOT NULL  COMMENT '��ɱ����ʱ��',
 --�����������Ż���ѯ
  PRIMARY KEY (`seckill_id`),
  KEY idx_start_time (start_time),
  KEY idx_end_time (end_time),
  KEY idx_create_time (create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='��ɱ����';

--��ʼ������
insert into 
	seckill(name,number,start_time,end_time)
values
	('1000Ԫ��ɱiphone7',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('800Ԫ��ɱ��Ϊp9',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('500Ԫ��ɱС��6',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('600Ԫ��ɱvivox9',100,'2017-7-13 00:00:00','2017-7-14 00:00:00');
	
--��ɱ�ɹ���ϸ��
--�û���¼��֤��ص���Ϣ
create table success_killed(
	`seckill_id` bigint NOT NULL COMMENT '��ɱ��Ʒid',
	`user_phone` bigint NOT NULL COMMENT '�û��ֻ���',
	`state` tinyint NOT NULL DEFAULT -1 COMMENT '״̬��ʾ:-1:��Ч  0:�ɹ�  1:�Ѹ��� 2:�ѷ���',
	`create_time` timestamp NOT NULL COMMENT '����ʱ��',
	PRIMARY KEY(seckill_id,user_phone),/* �������� */
	key idx_create_time(create_time)
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ɱ�ɹ���ϸ��';

--�������ݿ����̨
mysql -uroot -p3321521

--Ϊʲô��дDDL
--��¼ÿ�����ߵ�DDL�޸�

