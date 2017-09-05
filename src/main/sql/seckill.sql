--��ɱִ�д洢����
DELIMITER $$ -- console; ת��Ϊ$$
--����洢����
--���� 	in���������	out���������
--row_count:������һ���޸�SQL��Ӱ������	0:δ�޸�����  >0:��ʾ�޸ĵĺ���  <0:sql����/δִ���޸�sql
CREATE PROCEDURE `seckill`.`execute_seckill`    
(in v_seckill_id bigint,in v_phone bigint,    
in v_kill_time timestamp,out r_result int)    
BEGIN    
    DECLARE insert_count int default 0;    
    	START TRANSACTION;    
    	insert ignore into success_killed    
   			(seckill_id,user_phone,create_time,state)    
    		values (v_seckill_id,v_phone,v_kill_time,0);    
    	select row_count() into insert_count;    
    IF (insert_count = 0) THEN    
    	ROLLBACK;    
    	set r_result = -1;    
    ELSEIF (insert_count < 0) THEN    
    	ROLLBACK;    
    	set r_result = -2;    
    ELSE    
    	update seckill    
    	set number = number -1    
    	where seckill_id = v_seckill_id    
    		and start_time < v_kill_time    
    		and end_time > v_kill_time    
    		and number > 0;    
    	select row_count() into insert_count;    
    	IF (insert_count = 0) THEN    
    		ROLLBACK;    
    		set r_result = 0;    
    	ELSEIF (insert_count < 0) THEN    
    		ROLLBACK;    
    		set r_result = -2;    
    	ELSE    
   			 COMMIT;    
 		   set r_result = 1;    
    	END IF;    
    END IF;    
END;    
$$
--�洢���̶������

DELIMITER ;
set @r_result=-3;
--ִ�д洢����
call execute_seckill(1003,15879040664,now(),@r_result);
--��ȡ���
select @r_result

--�洢����
--1���洢�����Ż������������м����ĳ���ʱ��
--2����Ҫ���������洢����
--3���򵥵��߼�����Ӧ�ô洢����
--4��QPS/6000