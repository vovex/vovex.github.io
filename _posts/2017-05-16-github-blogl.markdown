---
layout: post
title:  "使用github和jekyll搭建静态blog"
date:   2017-05-16 18:56:30 +0800
categories: jekyll update
---


1.git简介

	进行版本控制的文件目录叫做一个仓库（repository）每个仓库可以简单理解成一个目录
	Directory：使用Git管理的一个目录，也就是一个仓库
	WorkSpace：需要通过Git进行版本控制的目录和文件
	.git：存放Git管理信息的目录，初始化仓库的时候自动创建
	Index/Stage：暂存区，或者叫待提交更新区
	Local Repo：本地仓库，一个存放在本地的版本库
	Stash：是一个工作状态保存栈，用于保存/恢复WorkSpace中的临时状态。
	
2.本地具体使用

	创建测试文件夹 d:/mygit/
	cd d:/mygit/
	
	提供身份标识
	
	git config --global user.name "sheng"
	git config --global user.email "xxx@qq.com"

	
	1)git init
		自动生成 .git	Git管理信息的目录
		$ git init
		 Initialized empty Git repository in D:/mygit/.git/
		 
		 /d/mygit (master)
		 
	2)添加 资源
		新建个 test.txt
		$ git status
			On branch master

			Initial commit

	3)git add test.txt"或者"git add .
	
	4) git commit -m
		git commit -m "haha okey commit"
		
	5)git diff 找不同
	
	6)撤销更新
		workspace 恢复
			git checkout -- <filename>
		"git add"把这个更新提交到了暂存区
			git reset HEAD <file>
		撤销repo中的更新
			git log
			HEAD指针和使用commit id
			HEAD^=HEAD~1，HEAD^^=HEAD~2
			git rest --hard HEAD~1
			git rest --c2760c5512bc67a8b990c1da508d40cca623f23
			
			git reflog
			git reset --hard HEAD@{1}
			git reset --hard f752570
			
			
			--head：撤销并删除相应的更新
			--soft：撤销相应的更新，把这些更新的内容放到Stage中
			
			rm <file>
			git rm <file>
			
			"git rm"相比"rm"只是多了一步，把这次删除的更新发到Stage中
			
3.链接github

	生成ssh key
	ssh-keygen -t rsa -C "xxx@126.com"
	
	测试 
		ssh git@github.com
		
	登录GitHub 填入项目名称	https://github.com/vovex/test.git	git@github.com:vovex/test.git
	
	git remote add origin git@github.com:vovex/test.git
	git push -u origin master
			
	
			
参考文档：

http://www.cnblogs.com/zhongxinWang/p/4205339.html
http://www.cnblogs.com/zcynine/p/5558846.html
http://blog.csdn.net/wh_19910525/article/details/8128916
