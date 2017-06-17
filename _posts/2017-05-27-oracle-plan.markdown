---
layout: post
title:  "oracle 执行计划"
date:  2017-05-27 18:32:56 +0800
categories: web
---
+++
Oralce 执行计划
+++
1. 执行计划
  --相关的概念
	rowid 伪列
	Predicate（谓词）：一个查询中的WHERE限制条件
	Driving Table（驱动表）：该表又称为外层表（OUTER TABLE）。一般 缩小结果集的范围 。 row source (符合条件的行的集合)
	Probed Table（被探查表）：该表又称为内层表（INNER TABLE）。一般为 大表
	只有使用到 索引的 引导列 才会走组合索引
	可选择性，唯一键的数量和行数的比值。若为1 ，则 类似主键，选择性就很高吧
	
  --数据的存取方法
	全表扫描（Full Table Scans， FTS）
	通过ROWID的表存取（Table Access by ROWID或rowid lookup）
	索引扫描（Index Scan或index lookup）
		（1） 扫描索引得到对应的rowid值。
		（2） 通过找到的rowid从表中读出具体的数据。
		每步都是单独的一次I/O，但是对于索引，由于经常使用，绝大多数都已经CACHE到内存中，所以第1步的 I/O经常是逻辑I/O，即数据可以从内存中得到。
		但是对于第2步来说，如果表比较大，则其数据不可能全在内存中，所以其I/O很有可能是物理I/O，这 是一个机械操作，相对逻辑I/O来说，是极其费时间的。
		数据量达到 %5-%10 是个坎
		
  --表之间的连接
	 排序 - - 合并连接（Sort Merge Join （SMJ） ）	两个数据 -》排序 -》 合并
　　嵌套循环（Nested Loops （NL） ）	快速响应
　　哈希连接（Hash Join）	唯一性索引？、

 如何查看执行计划： 
	SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY); 
	
 SQL语句优化方式：
	1. 索引
	2. 分区分表
	


2.set autotrace
	比只查询执行计划方便多了，毕竟就 SET 下就行了，但是，但是，但是 真的会执行你的SQL语句，不管你是显示还是不显示。
	所以如果你不清楚多长时间才能执行完，还是老老实实看执行计划吧，省的 一次等半年。
	
	SET AUTOT[RACE] {OFF | ON | TRACE[ONLY]} [EXP[LAIN]] [STAT[ISTICS]]
		OFF 就不说了，默认就是OFF的 主要是ＯＮ　
		
	set autotrace on;
		显示执行结果　及　执行计划　explain 和 统计信息 statistics
	set autotrace on explain
		记录集+explain
	set autotrace on statistic
		记录集+statistics
	set autotrace traceonly
		expain+statistics
	set autotrace traceonly statistics
		statistics
	set autotrace traceonly explain
		explain
		


		

参考文档：

http://blog.itpub.net/24478467/viewspace-705754/
http://blog.itpub.net/67798/viewspace-1021585/
