@ECHO OFF
SETLOCAL enabledelayedexpansion
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
SET MSDEV_HOME=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build
set SDIS_ROOT_FOLDER=C:\Siemens
SET TC_BIN=C:\Siemens\Teamcenter13\bin
SET TC_ROOT=C:\Siemens\Teamcenter13
SET TC_ROOT_X64=C:\Siemens\Teamcenter13
SET TC_DATA=C:\Siemens\tcdata
SET FMS_HOME=C:\Siemens\Teamcenter13\tccs

SET TEAMCENTER_STRING_VERSION=13000.3.0.0
SET TEAMCENTER_MAJOR_VERSION=13
SET TEAMCENTER_MINOR_VERSION=3
SET TEAMCENTER_SUBMINOR_VERSION=0
SET TEAMCENTER_SUBSUBMINOR_VERSION=0

SET JDK_HOME=C:\Java\jdk180202
SET JRE_HOME=C:\Java\jre180202
SET JAVA_HOME=!JDK_HOME!

SET PATH=!PATH!;!JDK_HOME!\bin;!JRE_HOME!\bin
::SET TC_SOA_CLIENT=C:\Siemens\soa_client
@ECHO ================================

SET PATH=!TC_ROOT!\bin;!FMS_HOME!\bin;!FMS_HOME!\lib;!PATH!
SET INCLUDE_X86=!TC_ROOT!\include;!TC_ROOT!\include_cpp;!TC_ROOT!\include_meta
SET INCLUDE_X64=!TC_ROOT_X64!\include;!TC_ROOT_X64!\include_cpp;!TC_ROOT_X64!\include_meta
SET LIB_X86=!TC_ROOT!\lib
SET LIB_X64=!TC_ROOT_X64!\lib
FOR %%I IN ("!LIB_X86!\*.lib") DO SET LIBS_X86=!LIBS_X86! "%%~nI%%~xI"
FOR %%I IN ("!LIB_X64!\*.lib") DO SET LIBS_X64=!LIBS_X64! "%%~nI%%~xI"
::
:: WARNING !!! copy !MSDEV_HOME!\Auxiliary\Build\vcvarsall.bat and other files into
:: !MSDEV_HOME!
:: and edit paths in vcvarsall.bat
::
CALL "!MSDEV_HOME!\vcvarsall.bat" x86_amd64
IF NOT EXIST "!JDK_HOME!" ECHO Invalid JDK_HOME & EXIT 1
IF NOT EXIST "!JRE_HOME!" ECHO Invalid JRE_HOME & EXIT 1

START "" "%SDIS_ROOT_FOLDER%\Eclipse\eclipse.exe" -vm "C:\java\jdk-11.0.7.10-hotspot\bin\server\jvm.dll" -nl en_US -clean -data ./test_tc_projects.tc.1