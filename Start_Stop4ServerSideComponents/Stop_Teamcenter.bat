@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set SDIS_ROOT_FOLDER=C:\Siemens
set TC_ROOT=C:\Siemens\Teamcenter12

@ECHO Teamcenter 11 - V11, Teamcetner 12 - V12, etc.
set TC_VER=V12

@ECHO Configuration ID (you can take it from configuration.xml)
set TC_TEM_CONF_ID=TC123

@ECHO Please to use Service Name, don't use Diplay Name of the services!
@ECHO License Server
set SDIS_LICENSE_SERVICE_NAME="Siemens PLM License Server"

@ECHO FSC SERVICE
set FSC_SERVICE_NAME="Teamcenter FSC Service FSC_D7J4S88K_Administrator"

@ECHO TC PROCESS MANAGER
set TCPROCESSMGR_SERVICE_NAME="Teamcenter Process Manager"

@ECHO ACTIVE WORKSPACE INDEXING SERVICE
set AWCINDEXER_SERVICE_NAME="Active Workspace Indexing Service"

@ECHO ACTION MANAGER SERVICE
set ACTIONMGR_SERVICE_NAME="actionmgrd"

@ECHO SUBSCRIPTION MANAGER SERVICE
set SUBSCRIBEMGR_SERVICE_NAME="subscripmgrd"

@ECHO TASK MONITOR SERVICE
set TASKMONITOR_SERVICE_NAME="taskmonitor"
@ECHO ================================

call %SDIS_ROOT_FOLDER%\Dispatcher\Scheduler\bin\runscheduler.bat -stop
TIMEOUT 10

call %SDIS_ROOT_FOLDER%\Dispatcher\Module\bin\runmodule.bat -stop
TIMEOUT 10

call %SDIS_ROOT_FOLDER%\Dispatcher\DispatcherClient\bin\runDispatcherClient.bat -stop
TIMEOUT 10

start cmd /k "%TC_ROOT%\pool_manager\confs\%TC_TEM_CONF_ID%\mgrstop.bat"
TIMEOUT 10

@ECHO FOR THE CASE WHEN WEBLOGIС IS USED AS AN APPLICATION SERVER
start cmd /k "%SDIS_ROOT_FOLDER%\weblogic122110\user_projects\domains\tc_domain\bin\stopWebLogic.cmd"
TIMEOUT 10

net stop %SUBSCRIBEMGR_SERVICE_NAME%
net stop %AWCINDEXER_SERVICE_NAME%
net stop %ACTIONMGR_SERVICE_NAME%
net stop %TASKMONITOR_SERVICE_NAME%
net stop %TCPROCESSMGR_SERVICE_NAME%

%TC_ROOT%\tccs\bin\fccstat.exe -stop
%TC_ROOT%\Teamcenter12\tccs\bin\fccstat.exe -kill
TIMEOUT 10

rem taskkill /F /IM node.exe
rem taskkill /F /IM ReqImportServices.exe
rem taskkill /F /IM ReqExportServices.exe

del /s /q /f %TC_ROOT%\TcFTSIndexer\logs\*.*
taskkill /im java.exe /t /f
taskkill /im javaw.exe /t /f
taskkill /im Teamcenter.exe /t /f
taskkill /im tcserver.exe /t /f
TIMEOUT 10

cd %TEMP%
for /d %%n in (%TC_VER%*) do rd /S /Q "%%n"
del /s /q /f %TEMP%\*.syslog
del /s /q /f %TEMP%\*.fscproxylog
del /s /q /f %TEMP%\*.tmp
del /s /q /f %TEMP%\*.jnl
rd /S /Q %USERPROFILE%\Teamcenter
rd /S /Q %USERPROFILE%\Siemens
rd /S /Q %USERPROFILE%\FCCCache
rd /S /Q %USERPROFILE%\.Administrator_lock_T113AI
del /s /q /f %USERPROFILE%\*.log
del /s /q /f C:\Temp\*.log
del /s /q /f %USERPROFILE%\*.lck
