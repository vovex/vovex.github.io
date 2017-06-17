---
layout: post
title:  "oracle 常用查询脚本"
date:  2017-05-27 18:49:52 +0800
categories: web
---

1.查看锁表进程SQL语句1：

	select sess.sid, 
	   sess.serial#, 
	   lo.oracle_username, 
	   lo.os_user_name, 
	   ao.object_name, 
	   lo.locked_mode 
	   from v$locked_object lo, 
	   dba_objects ao, 
	   v$session sess 
	where ao.object_id = lo.object_id and lo.session_id = sess.sid; 


	select username,lockwait,status,machine,program from v$session where sid in
	(select session_id from v$locked_object)


	v$locked_object
	dba_objects
	v$session
	V$SQL
	V$SQLTEXT
	V$SQLAREA

	select sid,serial#,SQL_ADDRESS,SQL_HASH_VALUE,SQL_ID from v$session where sid=2964 and serial#=61437; 
	select SQL_TEXT,SQL_ID,ADDRESS,HASH_VALUE from V$SQL where ADDRESS='0700001201B4B260'; 


2.查看锁表进程SQL语句2： 

	select * from v$session t1, v$locked_object t2 where t1.sid = t2.SESSION_ID and t1.sid=2964 and t1.serial#=61437; 


3.杀掉进程

	alter system kill session '2964,61437'; 



4.如果还不行（系统层面干掉之）

	select pro.spid from v$session ses,
	v$process pro where ses.sid=XX and 
	ses.paddr=pro.addr;




5.查看消耗资源最多的 SQL：

	SELECT hash_value, executions, buffer_gets, disk_reads, parse_calls
	FROM V$SQLAREA
	WHERE buffer_gets > 10000000 OR disk_reads > 1000000
	ORDER BY buffer_gets + 100 * disk_reads DESC ;




6.查找前10条性能差的sql语句

	Sql代码

	SELECT * FROM (select PARSING_USER_ID,EXECUTIONS,SORTS,COMMAND_TYPE,DISK_READS,sql_text FROM v$sqlarea order BY disk_reads DESC )where ROWNUM<10 ;



参考文档：
http://www.cnblogs.com/ymj126/p/4501050.html
http://blog.csdn.net/paluo/article/details/6854200