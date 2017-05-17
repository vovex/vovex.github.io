---
layout: post
title:  "Linux和Windows Hash值计算"
date:   2017-05-16 19:19:30 +0800
categories: web
---
**Windows**

	certutil -hashfile D:\1.exe MD5
	certutil -hashfile D:\1.exe SHA1
	certutil -hashfile D:\1.exe SHA256
	


**Linux**

	md5sum download.iso
	sha1sum download.iso


***参考文档***

	<a href="http://photo.blog.sina.com.cn/jianpengqi">图片</a></span>