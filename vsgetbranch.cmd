@ECHO OFF

SET TEMPFILENAME=%TEMP%\broutput.txt

git rev-parse --abbrev-ref HEAD > %TEMPFILENAME% 2> nul
IF %ERRORLEVEL% NEQ 0 (
    GOTO :CLEANUP
)

SET TEMP_VISSCRIPT_BRANCH_NAME=
FOR /F %%I IN (%TEMPFILENAME%) DO SET TEMP_VISSCRIPT_BRANCH_NAME=%%I

SET VISSCRIPT_BRANCH_NAME=%TEMP_VISSCRIPT_BRANCH_NAME%
ECHO Current [94mVS[0m branch is [91m%VISSCRIPT_BRANCH_NAME%[0m

SET VSPREFIX=VS:

IF /i "%VISSCRIPT_BRANCH_NAME:~0,8%"=="feature/" GOTO :CASE1
IF /i "%VISSCRIPT_BRANCH_NAME:~0,27%"=="visualscripting/sebastiend/" GOTO :CASE2
IF /i "%VISSCRIPT_BRANCH_NAME:~0,24%"=="visualscripting/release/" GOTO :CASE3
IF /i "%VISSCRIPT_BRANCH_NAME:~0,16%"=="visualscripting/" GOTO :CASE4
IF /i "%VISSCRIPT_BRANCH_NAME:~0,9%"=="refactor/" GOTO :CASE5

:CASE1
    SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME:feature/=F/%
    GOTO :SETTITLE

:CASE2
    SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME:visualscripting/sebastiend/=SEB/%
    GOTO :SETTITLE

:CASE3
    SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME:visualscripting/release/=REL/%
    GOTO :SETTITLE

:CASE4
    SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME:visualscripting/=VS/%
    GOTO :SETTITLE

:CASE5
    SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME:refactor/=RF/%
    GOTO :SETTITLE

SET VISSCRIPT_DISPLAY_BRANCH_NAME=%VSPREFIX% %VISSCRIPT_BRANCH_NAME%

:SETTITLE
TITLE %VISSCRIPT_DISPLAY_BRANCH_NAME%

:CLEANUP
IF EXIST %TEMPFILENAME% (
    DEL %TEMPFILENAME%
)
SET TEMP_VISSCRIPT_BRANCH_NAME=
SET TEMPFILENAME=