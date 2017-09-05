--数据库初始化脚本

--创建数据库
CREATE DATABASE seckill;
--使用数据库
use ceckill;
--创建秒杀库存表
CREATE TABLE seckill (
  `seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存ID',
  `name` varchar(120) NOT NULL COMMENT '商品名称',
  `number` int NOT NULL COMMENT '库存数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_time` timestamp NOT NULL  COMMENT '秒杀开启时间',
  `end_time` timestamp NOT NULL  COMMENT '秒杀结束时间',
 --建立索引，优化查询
  PRIMARY KEY (`seckill_id`),
  KEY idx_start_time (start_time),
  KEY idx_end_time (end_time),
  KEY idx_create_time (create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

--初始化数据
insert into 
	seckill(name,number,start_time,end_time)
values
	('1000元秒杀iphone7',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('800元秒杀华为p9',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('500元秒杀小米6',100,'2017-7-13 00:00:00','2017-7-14 00:00:00'),
	('600元秒杀vivox9',100,'2017-7-13 00:00:00','2017-7-14 00:00:00');
	
--秒杀成功明细表
--用户登录认证相关的信息
create table success_killed(
	`seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
	`user_phone` bigint NOT NULL COMMENT '用户手机号',
	`state` tinyint NOT NULL DEFAULT -1 COMMENT '状态表示:-1:无效  0:成功  1:已付款 2:已发货',
	`create_time` timestamp NOT NULL COMMENT '创建时间',
	PRIMARY KEY(seckill_id,user_phone),/* 联合主键 */
	key idx_create_time(create_time)
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

--连接数据库控制台
mysql -uroot -p3321521

--为什么手写DDL
--记录每次上线的DDL修改

