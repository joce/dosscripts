@ECHO OFF
IF DEFINED UNITY_DEV_PATH (
    PUSHD %UNITY_DEV_PATH%\Tools\DocTools\
    verify.pl
    POPD
    TITLE %UNITY_DISPLAY_BRANCH_NAME%
) ELSE (
    ECHO UNITY_DEV_PATH is not set
)
