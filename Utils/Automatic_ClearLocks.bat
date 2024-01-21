@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT=C:\Siemens\Teamcenter12
set TC_DATA=C:\Siemens\tcdata
call %TC_DATA%\tc_profilevars
@ECHO ================================

Title Clearlocks Automatically every 15 Minutes

set TC_JOURNAL=OFF
set TC_POM_JOURNALLING=N

:loop
clearlocks -verbose
list_users
@ECHO "Waiting for 15 min..."

cd /d %TEMP%
del /Q /S *.jnl
del /Q /S list_users*.log
choice /C:YN /D:Y /T:900


goto loop