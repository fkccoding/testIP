@echo off
set /p ip=请输入起始IP地址：
set /p num=请输入要测试的连续IP地址个数：
for /f "delims=. tokens=1,2,3" %%a in ("%ip%") do (set ip1=%%a.%%b.%%c)
for /f "delims=. tokens=4" %%a in ("%ip%") do (set ip2=%%a)
::延迟变量扩展
setlocal enabledelayedexpansion
echo ====================
for /l %%i in (1,1,!num!) do (
	ping -n 1 %ip1%.!ip2! |find "丢失">result.txt
	set /p a=<result.txt
	ping -n 1 %ip1%.!ip2! |find "无法访问目标主机">result.txt
	set /p b=<result.txt
::	echo b=!b!
	set b=!b:~22,8!
::	echo b=!b!
	set b1="无法访问目标主机"
::	echo b1=!b1!
	set a=!a:~30,1!
::	echo 丢包率=!a!
	if !a! GEQ 1 (
		echo %ip1%.!ip2! is DOWN
		echo %ip1%.!ip2! is DOWN>>IP.txt
	) else (
		if "!b!" == !b1! (
			echo %ip1%.!ip2! is DOWN
			echo %ip1%.!ip2! is DOWN>>IP.txt
		) else (
			echo %ip1%.!ip2! is UP
			echo %ip1%.!ip2! is UP>>IP.txt
		)
	)
	set /a ip2=!ip2! + 1
)
del /q result.txt
pause
