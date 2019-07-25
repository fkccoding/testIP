#! /bin/bash
read -p "请输入起始IP地址：" ip0
ip1=${ip0%.*};ip2=${ip0##*.}
# echo ip1=$ip1 ip2=$ip2
read -p "请输入要测试的连续IP地址个数：" num
num=`expr $ip2 + $num`
echo =====================
for ((ip2;ip2<num;ip2++))
do
ping=`ping -c 1 $ip1.$ip2|grep loss|awk '{print $(NF-4)}'|awk -F "%" '{print $1}'`
if [ $ping -eq 100 ]; then
  echo -e $ip1.$ip2 is "\E[1;31mDOWN\E[0m"
else
  echo -e $ip1.$ip2 is "\E[1;32mUP\E[0m"
fi
done
