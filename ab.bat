@echo off
del /f b.txt ab.txt >nul
copy /y ad.list b.txt
sed -i "s/HOST, /||/g" b.txt
sed -i "s/HOST-KEYWORD, /||/g" b.txt
sed -i "s/HOST-SUFFIX, /||/g" b.txt
sed -i "s/, REJECT/^/g" b.txt
rem 删除前x行注释内容
sed -i "1,6d" b.txt
rem 删除空行
sed -i "/^$/d" b.txt
rem 删除所有#注释行
sed -i "/^#/d" b.txt
rem 合并
copy /y a.txt + b.txt ab.txt
del /f b.txt >nul
echo OK
ping -n 3 127.0.0.1>nul
exit