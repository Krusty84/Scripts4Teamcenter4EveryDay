@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT=C:\Siemens\Teamcenter12
set TC_DATA=C:\Siemens\tcdata
set ADMIN_USER_NAME=infodba
set ADMIN_USER_PASSWORD=infodba
set ADMIN_USER_GROUP=dba
call %TC_DATA%\tc_profilevars
@ECHO ================================

call %TC_ROOT%\bin\clear_old_newsfeed_messages -u=%ADMIN_USER_NAME% -p=%ADMIN_USER_PASSWORD% -g=%ADMIN_USER_GROUP% -process_only_read_messages
