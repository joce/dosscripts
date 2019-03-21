@ECHO OFF

IF NOT DEFINED UNITY_DEV_PATH (
    ECHO UNITY_DEV_PATH is not set
    GOTO :EOF
)

PUSHD %UNITY_DEV_PATH%\Projects\CSharp
FOR %%f IN (%UNITY_DEV_PATH%) DO SET UNITY_ROOT=%%~nxf

SET CSHARP_PROJECT_NAME=%UNITY_ROOT%.CSharpProjects.gen.sln
IF NOT EXIST "%cd%\%CSHARP_PROJECT_NAME%" (
    touch %CSHARP_PROJECT_NAME%
)

FOR /f %%i IN ('diff Unity.CSharpProjects.gen.sln %CSHARP_PROJECT_NAME% ^| wc -c') DO SET PROJ_DIFF=%%i

IF /I %PROJ_DIFF% NEQ 0 (
    rm -f %CSHARP_PROJECT_NAME%
)

cp Unity.CSharpProjects.gen.sln %CSHARP_PROJECT_NAME%

SET CSHARP_PROJECT_NAME=
SET UNITY_ROOT=
SET PROJ_DIFF=

POPD
