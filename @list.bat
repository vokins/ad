@echo off
del /f qx.list >nul
copy /y ad.list qx.list
sed -i "s/DOMAIN,/host, /g" qx.list
sed -i "s/DOMAIN-SUFFIX,/host-suffix, /g" qx.list
sed -i "s/DOMAIN-KEYWORD,/host-keyword, /g" qx.list
sed -i "s/,REJECT/, reject/g" qx.list
rem 删除前x行注释内容
sed -i "1,6d" qx.list
rem 删除空行
sed -i "/^$/d" qx.list
rem 删除所有#注释行
sed -i "/^#/d" qx.list
echo OK
ping -n 3 127.0.0.1>nul
exit
