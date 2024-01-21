@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT=C:\Siemens\Teamcenter12
set TC_DATA=C:\Siemens\tcdata
set ADMIN_USER_NAME=infodba
set ADMIN_USER_PASSWORD=infodba
set ADMIN_USER_GROUP=dba
call %TC_DATA%\tc_profilevars
@ECHO ================================

qsearch_process_queue.exe  -u=%ADMIN_USER_NAME% -p=%ADMIN_USER_PASSWORD% -g=%ADMIN_USER_GROUP% -clear_all_indexes
qsearch_process_queue.exe  -u=%ADMIN_USER_NAME% -p=%ADMIN_USER_PASSWORD% -g=%ADMIN_USER_GROUP% -clear_all_queue
create_or_update_bbox_and_tso -u=%ADMIN_USER_NAME% -p=%ADMIN_USER_PASSWORD% -g=%ADMIN_USER_GROUP% -delete_all_bboxes