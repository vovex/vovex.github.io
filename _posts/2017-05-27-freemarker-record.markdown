---
layout: post
title:  "freemarker record"
date:  2017-05-27 18:40:08 +0800
categories: web
---
freemark

 1.自定义指令 	macro 
 
 
	也可使用 freemarker.template.TemplateDirectiveModel 类来扩展
	语法	
	<#macro>
	</#macro>

	实例
	<#macro greet>
	<font size="+2">Hello Joe!</font>
	</#macro>

	<#macro greet person color>
	<font size="+2" color="${color}">Hello ${person}!</font>
	</#macro>
	
	带有初始化值
	<#macro greet person color="black">
	<font size="+2" color="${color}">Hello ${person}!</font>
	</#macro>

	使用宏
	<@greet></@greet>
	<@greet />

	<@greet person="Fred" color="black"/>
 
 
 2.嵌套	
 
 
	<#macro test>
		this is test.
		<#nested>
	</#macro>
	
	<@test> i am nested </@test>
	
	在自定义中使用嵌套
	
