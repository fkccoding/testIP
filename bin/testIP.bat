@echo off
set /p ip=��������ʼIP��ַ��
set /p num=������Ҫ���Ե�����IP��ַ������
for /f "delims=. tokens=1,2,3" %%a in ("%ip%") do (set ip1=%%a.%%b.%%c)
for /f "delims=. tokens=4" %%a in ("%ip%") do (set ip2=%%a)
::�ӳٱ�����չ
setlocal enabledelayedexpansion
echo ====================
for /l %%i in (1,1,!num!) do (
	ping -n 1 %ip1%.!ip2! |find "��ʧ">result.txt
	set /p a=<result.txt
	ping -n 1 %ip1%.!ip2! |find "�޷�����Ŀ������">result.txt
	set /p b=<result.txt
::	echo b=!b!
	set b=!b:~22,8!
::	echo b=!b!
	set b1="�޷�����Ŀ������"
::	echo b1=!b1!
	set a=!a:~30,1!
::	echo ������=!a!
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