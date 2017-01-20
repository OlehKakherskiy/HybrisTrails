@echo off

rem setups path variables
SET HYBRIS_DIR=d:\hybris_trails
SET HYBRIS_CONFIG=%HYBRIS_DIR%\hybris\config
SET HYBRIS_EXTENSIONS=%HYBRIS_DIR%\hybris\bin\custom
SET CONFIG=%HYBRIS_DIR%\config
SET EXTENSIONS=%HYBRIS_DIR%\extensions

rem removing localextensions.xml and local.properties from hybris folder
if exist "%HYBRIS_CONFIG%\localextensions.xml" (
	del /F %HYBRIS_CONFIG%\localextensions.xml
) else (
	echo localextensions.xml DOES NOT EXIST
)
if exist "%HYBRIS_CONFIG%\local.properties" (
	del /F %HYBRIS_CONFIG%\local.properties
) else (
	echo local.properties DOES NOT EXIST
)

rem creating hardlinks from hybris folder to external config resources 
MKLINK /H "%HYBRIS_CONFIG%\localextensions.xml" "%CONFIG%\localextensions.xml"
MKLINK /H "%HYBRIS_CONFIG%\local.properties" "%CONFIG%\local.properties"

rem relinking hybris custom extensions to external custom extensions folders
if exist "%HYBRIS_EXTENSIONS%" (
	RMDIR /Q /S "%HYBRIS_EXTENSIONS%"
	MKLINK /J "%HYBRIS_EXTENSIONS%" "%EXTENSIONS%"
) else (
	MKLINK /J "%HYBRIS_EXTENSIONS%" "%EXTENSIONS%"
)
pause