---
layout: post
title:  "kramdown Syntax"
date:  2017-05-17 16:42:09 +0800
categories: web
---
文档版本: 1.13.1


	    kramdown 的语法是在markdown的基础之上，同时又结合了其他markdown的特殊实现，
	 像：Maruku, PHP Markdown Extra 和 Pandoc.kramdown致力于固定规则的严格语法，所以完全不兼容
	 与 markdown,但是能解析大多数的markdown文档。文章中所有不同于markdown的地方都已经标记出来以
	 便于对比。
	    下面是kramdown支持的元素的完整语法定义，文档清楚说明了通过转换后你讲得到的结果。
	
	文本格式化
	   kramdown 文档可能有多种编码方式，比如ASCII, UTF-8 or ISO-8859-1,对应原始文档来说都是统一
	的编码输出的。
	文档由 block-level 和 span-level 两种元素组成。
		block-level 定义了内容的主体部分，比如段落、列表、块引用等待
		span-level 用于标记小文本部分，像强调文本和链接。
	span-level 只能用于 block-level里或者 其他span-level.
	在 block-level 元素中对一行的第一列和第一个字母 的参考引用是很常见的
	    
***参考文章***

	https://kramdown.gettalong.org/syntax.html