#!/usr/bin/bash
#PROGRAME
#	this is programe is to product a new blog markdown file. you need to input the title of this blog!
#HISTORY
#	201700517 VESION 1
echo `date "+%F %X %z"`
Vdate=`date "+%F %X %z"`
title_date=`date +%F-`
if [ "$#" != 0 ] && [ "$#" != 2 ]; then
 echo 'usage : sh newmarkdown "titlename" "filename" , or directly sh newmarkdown .'
 exit 0
fi
if [ "$#" == 0 ]; then
 read -p "please input titlename : " titlename
 read -p "please input filename : " filename
else
 titlename="$1"
 filename="$2"
fi
echo "----------------------"
echo "$titlename"
echo "$filename"
echo "----------------------"

test -e ./_posts/"$title_date""$filename".markdown && echo "file has been created and will update"
test ! -e ./_posts/"$title_date""$filename".markdown && echo "not exists and now create..." && touch ./_posts/"$title_date""$filename".markdown
echo "---
layout: post
title:  \"$titlename\"
date:  $Vdate
categories: web
---
" > ./_posts/"$title_date""$filename".markdown
