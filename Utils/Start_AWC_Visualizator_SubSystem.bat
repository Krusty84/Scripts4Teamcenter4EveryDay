@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT=C:\Siemens\Teamcenter12
set TC_DATA=C:\Siemens\tcdata
call %TC_DATA%\tc_profilevars
@ECHO ================================

taskkill /F /IM visview.exe
TIMEOUT 10

start cmd /k "%TC_ROOT%\vispoolmanager\run_visservermgr.cmd"
start cmd /k "%TC_ROOT%\visassigner\run_visassigner.cmd"
