@echo off
del /f loon.list >nul
copy /y ad.list loon.list
sed -i "s/host, /DOMAIN,/g" loon.list
sed -i "s/host-keyword, /DOMAIN-KEYWORD,/g" loon.list
sed -i "s/host-suffix, /DOMAIN-SUFFIX,/g" loon.list
sed -i "s/, reject/,REJECT/g" loon.list
rem 删除前x行注释内容
sed -i "1,6d" loon.list
rem 删除空行
sed -i "/^$/d" loon.list
rem 删除所有#注释行
sed -i "/^#/d" loon.list
echo OK
ping -n 3 127.0.0.1>nul
exit
