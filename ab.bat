@echo off
del /f adls.list >nul
copy /y ad.list adls.list
sed -i "s/host, /DOMAIN,/g" adls.list
sed -i "s/host-keyword, /DOMAIN-KEYWORD,/g" adls.list
sed -i "s/host-suffix, /DOMAIN-SUFFIX,/g" adls.list
sed -i "s/, reject/,REJECT/g" adls.list
rem 删除前x行注释内容
sed -i "1,6d" adls.list
rem 删除空行
sed -i "/^$/d" adls.list
rem 删除所有#注释行
sed -i "/^#/d" adls.list
echo OK
ping -n 3 127.0.0.1>nul

del /f prls.list >nul
copy /y pr.list prls.list
sed -i "s/host, /DOMAIN,/g" prls.list
sed -i "s/host-keyword, /DOMAIN-KEYWORD,/g" prls.list
sed -i "s/host-suffix, /DOMAIN-SUFFIX,/g" prls.list
sed -i "s/User-Agent, /USER-AGENT,/g" prls.list
sed -i "s/, proxy/,PROXY/g" prls.list
rem 删除空行
sed -i "/^$/d" prls.list
echo OK
ping -n 3 127.0.0.1>nul

del /f b.txt ab.txt >nul
copy /y ad.list b.txt
sed -i "s/host, /||/g" b.txt
sed -i "s/host-keyword, /||/g" b.txt
sed -i "s/host-suffix, /||/g" b.txt
sed -i "s/, reject/^/g" b.txt
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
