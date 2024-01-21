@ECHO ON
@ECHO ===@ UPDATE IT FOR YOUR CASE @===
set TC_ROOT=C:\Siemens\Teamcenter12
set TC_DATA=C:\Siemens\tcdata
call %TC_DATA%\tc_profilevars
@ECHO ================================

%TC_ROOT%\solr-8.6.3\TcSchemaToSolrSchemaTransform.bat %TC_DATA%\ftsi\solr_schema_files