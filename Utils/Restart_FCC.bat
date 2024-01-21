@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT_CLIENT=C:\Siemens\Teamcenter12
@ECHO ================================
%TC_ROOT_CLIENT%\tccs\bin\fccstat.exe -purge
TIMEOUT 5
%TC_ROOT_CLIENT%\tccs\bin\fccstat.exe -stop
TIMEOUT 5
%TC_ROOT_CLIENT%\tccs\bin\fccstat.exe -kill
TIMEOUT 5
%TC_ROOT_CLIENT%\tccs\bin\fccstat.exe -start